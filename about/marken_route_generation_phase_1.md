---
layout: page
title: Marken Route Generation - Phase 1
permalink: /about/professional-career/marken-route-generation-phase-1
---

I cannot provide all of the implementation details due to IP restrictions. However, I would like to share some of the high-level ideas and key concepts that went into this solution. From a theoretical perspective, it's a pretty interesting problem.

## Problem Statement

Given a shipment and its associated metadata - such as the customer account, shipment contents, origin, destination, pickup time, required delivery time, and other business constraints - the objective of the route generation engine was to produce an optimal end-to-end route, along with its estimated delivery time and total transportation cost.

## Similar Historical Shipments

A key component of the solution was identifying historical shipments that could serve as the foundation for generating candidate routes. These were referred to as **similar historical shipments**.

The concept of "similarity" was intentionally flexible and context-dependent. Shipments that occur frequently within a particular region or lane could have a stricter definition of similarity, while rare shipments required a broader definition to retrieve enough relevant historical examples.

Given a shipment, relevant metadata was extracted, including sender, recipient, account, contents, temperature requirements, and other operational attributes. This metadata was then used to query historical shipment data for similar examples.

Some fields required an exact match, while others supported a fuzzy match. Fuzzy matching was implemented by assigning weighted scores to individual attributes, allowing the system to rank historical shipments based on overall similarity. If a large number of historical shipments matched the query shipment, the top N highest-scoring results were selected.

The output of this process was a collection of historical shipments and their associated routing data, which served as the foundation for constructing the routing network.

## Routing Network

The foundation of the solution was a **Routing Network**, represented as a directed graph in the computer science sense. Each node represented a physical location (e.g., airport, warehouse, distribution center, or customer site), while each edge represented a transportation leg connecting two locations (e.g., commercial flights, long-haul trucking, Marken-operated vehicles, third-party carriers, and ocean freight). Note that in general the routing network is a _multi-graph_ since multiple transportation modes can fulfill the same route leg.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/img/about/routing_graph.png" alt="Routing Graph" width="600px" />
</div>
</div>
</center>

The routing graph was dynamically constructed from several sources, including:

* Historical shipment routing data
* Real-time flight schedules
* Truck and carrier availability
* Business rules and operational constraints

A significant portion of the engineering effort focused on constructing this graph correctly. Real-world logistics data is inherently complex, with many exceptions, special cases, and operational constraints that must be represented accurately. Due to IP restrictions I have omitted these finer details.

After the graph was constructed and validated, it became the input to the optimization engine.

## Temporal Path Optimization

Although classical shortest-path algorithms such as Dijkstra's algorithm are well suited for static weighted graphs, shipment routing introduces an important temporal dimension. A transportation leg can only be used if its departure occurs after the shipment has arrived at the corresponding location. Consequently, route feasibility depends not only on the sequence of nodes, but also on the timing of every connection.

The optimization engine therefore operated on **time-valid end-to-end routes**, evaluating only paths that satisfied all temporal and business constraints. The precise details of the optimizer has been omitted due to IP restrictions. Different optimization metrics were then applied depending on the desired objective.

---

## Optimization Objectives

### Most Frequent Historical Route

Defining the frequency of an entire route is more subtle than it first appears. A naive approach would be to define the frequency of a path as the sum of the frequencies of its constituent edges and then choose the path with the largest total. Unfortunately, this produces unintuitive results.

The figure below provides a simple counterexample.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/img/about/sum_frequencies_counter_example.png" alt="Sum Frequencies Counter Example" width="500px" />
</div>
</div>
</center>

Clearly, the bottom path is the "most frequent" route. However, summing edge frequencies assigns a higher score to the upper path simply because it contains more edges, even though some of those individual legs are comparatively uncommon.

A better definition is to measure a route by its weakest (least frequently observed) transportation leg. Intuitively, a route can only be considered as common as its rarest segment. This leads to the following optimization objective.

**Definition**

The route whose weakest (least frequently observed) transportation leg has the highest historical frequency.

**Edge Metric**

For each edge, compute its historical frequency by counting how many times that transportation leg occurred in historical routing data.

**Optimization**

Maximize the bottleneck frequency of the route.

```python
max(
    all_paths,
    key=lambda path: min(edge.frequency for edge in path)
)
```

This bottleneck formulation favors routes whose least-common segment is still well represented historically, avoiding routes that rely on rarely used transportation legs.

---

### Most Recent Historical Route

Defining route recency is similar to defining route frequency, but instead of measuring how often a route has been observed, we measure how recently its transportation legs have been used. A route is only as current as its least recent segment, meaning that a route containing one outdated transportation leg may not accurately represent the current state of the network.

Therefore, rather than selecting the route with the newest individual edge timestamps, we define recency using a bottleneck approach: the route is evaluated based on its oldest transportation leg.

**Definition**

The route whose transportation legs represent the most recent historical usage.

**Edge Metric**

For each edge, the most recent historical usage timestamp was recorded. To prevent the optimization from becoming overly sensitive to small timestamp differences, the timestamp was truncated to the date level by removing the hour, minute, and second components.

Using the exact timestamp introduced unnecessary volatility, where a route used a few seconds more recently could be favored over another route despite both representing the same operational pattern. By reducing timestamps to the date level, the optimization captures meaningful recency trends while avoiding instability caused by high-fidelity timestamp noise.

**Optimization**

Minimize the bottleneck age of the route.

```python
min(
    all_paths,
    key=lambda path: max(edge.timestamp.date() for edge in path)
)
```

A route is only as current as its least recent segment. Therefore, the optimization is driven by the oldest edge in the path, ensuring that all segments of the route have relatively recent historical usage.

---

### Cheapest Route

**Definition**

The route with the lowest total transportation cost.

**Edge Metric**

Edge costs were derived from a combination of historical shipment data, real-time pricing APIs, and business rules.

**Optimization**

Minimize the total cost.

```python
min(
    all_paths,
    key=lambda path: sum(edge.cost for edge in path)
)
```

---

### Shortest Route

**Definition**

The route with the shortest end-to-end transit time.

Unlike a simple sum of transportation durations, total transit time includes waiting time between connecting transportation legs.

**Edge Metric**

Departure and arrival times were calculated using real-time schedules together with estimated travel durations.

**Optimization**

Minimize the elapsed time between the shipment's initial departure and final arrival.

```python
min(
    all_paths,
    key=lambda path:
        (path[-1].arrival_datetime - path[0].departure_datetime).total_seconds() / 3600
)
```

---

### Most Reliable Route

**Definition**

The route with the highest probability of arriving on time.

**Edge Metric**

Each edge was assigned an on-time probability derived from historical performance and real-time operational data.

Assuming independence between transportation legs, the reliability of an entire route is the product of the individual edge probabilities.

**Optimization**

Maximize the product of edge reliabilities.

```python
max(
    all_paths,
    key=lambda path: math.prod(edge.on_time_percentage for edge in path)
)
```

For graph-based optimization algorithms, this multiplicative objective can be transformed into an additive one by taking the negative logarithm of each edge reliability. Since the negative logarithm is a monotonic transformation, minimizing the sum of negative log probabilities produces the same ordering of candidate routes as maximizing the original product.

This transformation also allows reliability optimization to be solved using standard shortest-path techniques.

```python
min(
    all_paths,
    key=lambda path: sum(-math.log(max(edge.on_time_percentage, epsilon)) for edge in path)
)
```

The `epsilon` term prevents undefined values when an edge has a reliability of zero.

---

### Most Sustainable Route

**Definition**

The route with the lowest estimated carbon footprint.

**Edge Metric**

Each transportation leg was assigned an estimated CO<sub>2</sub> emission value based on transportation mode and travel distance.

**Optimization**

Minimize total emissions.

```python
min(
    all_paths,
    key=lambda path: sum(edge.co2_emissions for edge in path)
)
```

## Summary

By constructing a temporally valid routing network rooted in Marken's historical routing data and optimizing it across multiple independent objectives, the system produced a diverse shortlist of candidate routes rather than a single "best" answer.

This approach balanced automation with human expertise, allowing operators to make informed routing decisions based on the specific priorities of each shipment while leveraging historical data, real-time operational information, and graph-based optimization techniques.
