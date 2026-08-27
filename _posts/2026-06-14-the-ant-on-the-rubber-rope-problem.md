---
layout:     post
title:      "The Ant on a Rubber Rope Problem"
date:       2026-06-14
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       harmonic series, physics
---

## The Problem Statement

### Original Problem Statement

This puzzle originals from none other than [Martin Gardiner](https://en.wikipedia.org/wiki/Martin_Gardner). Here is the original problem statement and original diagrams from [Aha! Gotcha: Paradoxes to Puzzle and Delight](https://archive.org/details/ahagotchaparadox00gard/page/144/mode/2up) published in 1982.

> A worm is at one end of a rubber rope. The rope is 1 kilometer long. The worm crawls along the rope at a steady pace of 1 centimeter second. After the first second, the rope stretches like a rubber band to 2 kilometers. After the next second, it stretches to 3 kilometers, and so on. Will the worm ever reach the end of its rope? Your intuition tells you that the worm will never reach the end. But does it! How long does it take?

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/aha_gotcha_paradoxes_to_puzzle_and_delight_1.png" alt="Aha! Gotcha: Paradoxes to Puzzle and Delight - 1" width="200px" />
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/aha_gotcha_paradoxes_to_puzzle_and_delight_2.png" alt="Aha! Gotcha: Paradoxes to Puzzle and Delight - 2" width="200px" />
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/aha_gotcha_paradoxes_to_puzzle_and_delight_3.png" alt="Aha! Gotcha: Paradoxes to Puzzle and Delight - 3" width="200px" />
</div>
</div>
</center>

### Generalized Problem Statement

For whatever reason the worm became an ant in the modern version of the problem.

Consider an ideally elastic rope of length $L_0 > 0$ (its endpoints at $x = 0$ and $x = L_0$). With the left end of the rope fixed in place, suppose at time $t = 0$ the right end of the rope is "pulled" with a constant velocity of $u > 0$ such that the rope uniformly stretches rightward. At time $t = 0$ an ant is located at $x_0 \in [0, L_0]$ on the rope and travels rightward at a constant speed of $\alpha > 0$ (relative to its position on the rope). Is there a time $t$ at which the ant meets reaches the end of the rope?

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/problem_statement.png" alt="Aha! Gotcha: Paradoxes to Puzzle and Delight - 1" width="800px" />
</div>
</div>
</center>

In the original problem statement we have these values.
- $L_0 = 1 \ \text{km}$
- $u = 1 \ \frac{\text{km}}{\text{s}}$
- $x_0 = 0 \ \text{km}$
- $\alpha = 1 \ \frac{\text{cm}}{\text{s}} = 1/100000 \ \frac{\text{km}}{\text{s}}$

In this post I will both solve the problem in general and also for the original parameters.

<br>

## The Intuitive Explanation

This problem is sometimes called a paradox; it's actually not a paradox it's just unintuitive. Since the end of the rope is stretching much faster than the ant is moving, it seems impossible to suggest the ant will ever reach the end. But as you've probably guessed, it actually can.

This [video](https://www.youtube.com/watch?v=lbjTGqZspjE) gives a great non-mathematical intuition. I will give my version here. It comes down to five key facts.

1. The velocity of a segment of the rope is proportional to its initial position, i.e. leftward segments have a smaller velocity than rightward segments
2. The velocity of a segment of the rope is constant (with respect to time)
3. If the ant is moving faster than a segment of the rope, it will eventually overtake that segment
4. As the rope expands, the ant also moves along with the segment it's on
5. The absolute velocity of the ant increases as it moves rightward down the rope

These facts are illustrated in this diagram.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/intuitive_explanation.png" alt="Intuitive Explanation" width="800px" />
</div>
</div>
</center>

The first fact describe the behavior of the _uniformly expanding rubber rope_. As the rope is pulled rightward, its rightmost edge is moving at velocity $u$ and its leftmost edge at velocity $0$. So intuitively all of the points in-between must linearly and continuously fill in that gap, i.e. the velocity of a point on the rope is proportional to its _initial_ displacement. In the diagram, this is represented by the growing length of the blue arrows.

The second fact is consequence of the fact that the end of the rope is being pulled with constant velocity. Thus, every point on the rope is moving at a constant velocity. This is represented in the diagram by the fact that the length of the blue arrows associated with a segment do not change.

The third fact should be obvious. Suppose an ant is traveling at $1 \ \text{cm/s}$ and the end of the rope expanding at $0.5 \ \text{cm/s}$. Then obviously the ant will eventually reach the end of the rope. Analogously, we can segment the rope into small enough chunks such that the ant is moving faster than the first segment. Thus, the ant will eventually overtake that segment. In the diagram, the ant's red arrow is larger than the first blue arrow, and therefore it can eventually reach the end of that segment.

The fourth fact describes the interaction between the rope and the ant. Since the ant is standing on the rope, as the rope expands all points on the rope are moving rightwards. Thus, the ant is also moved rightwards.

The fifth fact is the consequence of the fourth. The problem says that the ant moves at a velocity $\alpha$ _relative_ to the rope. So its absolute velocity is $\alpha$ plus the velocity of the segment of the rope at ant is currently on.

Now let's put everything together. Segment the rope into small enough chunks such that the first segment is moving slower than the ant's velocity. Then obviously the ant will eventually overtake that segment. Once the ant gets to the end of that segment, its absolute velocity increases by the speed of that segment. Now, the ant is moving faster than the second segment, thus it will eventually overtake it. We can continue this reasoning to conclude that the ant will eventually get to the end of the rope.

<br>

## An Induction Proof

Here I formalize the intuitive explanation using induction. 

### Rope Segments

First, suppose we chunk the rope into $N$ equal segments.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/rope_segments.png" alt="Intuitive Explanation" width="900px" />
</div>
</div>
</center>

Since the rope is expanding uniformly, the velocity of the right edge of each segment is constant over time and proportional to its fractional displacement. I prove this more rigorously when solving for the exact solution. The velocity of the right edge of the $n\text{th}$ segment is given by

$$
v_n = \frac{n}{N} u
$$

Notice that

$$
v_n = \frac{n}{N} u = \sum_{k=1}^n \frac{u}{N} = \sum_{k=1}^n v_1
$$

We will use this later.

### Proof

Now, we will use induction on $N$ (the number of rope segments) to show that the ant will eventually reach the end of the $N\text{th}$ segment. In particular, we will show there exists some time such that $\alpha > v_n$ for all $n$. And since the ant's speed was larger than the speed of the segment, the ant must have overtaken that segment at some point.

**Base Case**: The ant will eventually reach the end of the first segment

We require that $\alpha > v_1 = \frac{u}{N}$. If this is not the case, we can increase $N$ until it is sufficiently large for $\frac{u}{N}$ to be less than $\alpha$. To give an explicit formula, choose an $N$ such that $N > \left \lceil \frac{u}{\alpha} \right \rceil$

Now, since $\alpha > v_1$, the ant is moving faster than the right edge of the first segment, and therefore will eventually reach it.

**Induction Step**: Suppose the ant eventually reach the end of the $n\text{th}$ segment.

The right edge of the $n\text{th}$ rope segment traveling at velocity $v_n$. Therefore, the absolute speed of the ant is at least is $\alpha + v_n$. Therefore

$$
\alpha + v_n > v_1 + v_n = v_1 + \sum_{k=1}^n v_1 = \sum_{k=1}^{n+1} v_1 = v_{n+1}
$$

Thus, $\alpha + v_n > v_{n+1}$. In other words, the ant's absolute speed at the $n\text{th}$ segment is sufficient to eventually reach the end of the $(n+1)\text{th}$ segment.

Therefore, by induction, the ant will eventually reach the end of the $N\text{th}$ segment, i.e. the end of the rope.

<br>

## A Discrete Solution

Here I provide the original solution to the problem. Like the induction proof we are just showing that the ant will eventually reach the end of the rope.

Consider a discrete version of this problem where every $\Delta t$ seconds, the rope first expands by $u$ and then the ant moves by $\alpha$. Compared to the continuous problem, we are disadvantaging the ant by giving the rope more time to expand. So if it can reach the end of the rope in this modification, it can also do so in the original formulation.

### The Solution to the Original Problem Statement

This is a modified version of Martin Gardiner's solution using the parameters $L_0 = 1 \ \text{km}$, $u = 1 \ \frac{\text{km}}{\text{s}}$, $x_0 = 0 \ \text{km}$, and $\alpha = 1 \ \frac{\text{cm}}{\text{s}} = 1/100000 \ \frac{\text{km}}{\text{s}}$.

Consider what happens at each time step.
- $t = 0$ - the rope is length $1 \ \text{km}$ and the ant has traversed $0 \ \text{cm}$ of the rope
- $t = 1$ - the rope is length $2 \ \text{km}$ and the ant has traversed $1 \ \text{cm}$ of it, which is $(1/200000)\text{th}$ of the rope

Time $t = 2$ is the first interesting moment. As the rope expands, it takes the ant with it and the percentage of the rope traversed does not change. Thus, it is still at $(1/200000)\text{th}$ of the rope. Then, the ant traverses another $1 \ \text{cm}$ which is  $(1/300000)\text{th}$ of the rope. In total, the ant is now $(1/200000 + 1/300000)\text{th}$ of the rope.

- $t = 2$ - the rope is length $3 \ \text{km}$ and the ant has traversed $(1/200000 + 1/300000)\text{th}$ of the rope.
- $t = 3$ - the rope is length $3 \ \text{km}$ and the ant has traversed $(1/200000 + 1/300000 + 1/400000)\text{th}$ of the rope.
- And so on

Let $\theta(t)$ denote the fraction of the rope that the ant has traversed. Based on the above reasoning, it is equal to

$$
\theta(t) = \frac{1}{100000} \sum_{k = 2}^t \frac{1}{k}
$$

The sum $\sum_{k = 2}^t \frac{1}{k}$ is called the [Harmonic Series](https://en.wikipedia.org/wiki/Harmonic_series_(mathematics)) and famously diverges [[source](https://proofwiki.org/wiki/Harmonic_Series_is_Divergent)], which means

$$
\lim_{t \rightarrow \infty} \theta(t) = \infty
$$

Thus, there is some $t = T$ for which $\theta(T) > 1$, and therefore the ant reaches the end of the rope. Later, we will solve this problem exactly so we can compute the value of $T$.

### Generalized Proof

Now for the generalized version of the above argument. First, let $t = n \Delta t$ where $\Delta t$ is the time steps and $n$ is the number of time steps. In each time step, the rope expands by $u \Delta t$ and afterwards the ant moves by $\alpha \Delta t$.


Let $L_n$ denote the ant's distance and the rope's length after $n$ time steps. Per the problem statement, this moves at a constant velocity and thus

$$
L_n = L_0 + (u \Delta t) n
$$

Let $\theta_n$ denote the fraction of the rope that the ant has traversed after $n$ time steps. At each time-step the rope stretches and then the ant increments. As the rope stretches, $\theta_n$ does not change. Thus, $\theta_n = \theta_{n-1} + (\text{ant's increment})$. More precisely,

$$
\theta_n = \begin{cases}
    &\frac{x_0}{L_0} &\qquad \text{if } n = 0 \\[7pt]
    &\theta_{n-1} + \frac{\alpha \Delta t}{L_n} &\qquad \text{if } n > 0
\end{cases}
$$

Therefore

$$
\theta_n = \frac{x_0}{L_0} + \sum_{k=1}^n \frac{\alpha \Delta t}{L_0 + (u \Delta t) k}
$$

Notice that $\frac{1}{L_0 + (u \Delta t) k} \geq \frac{1}{L_0 k + (u \Delta t) k}$ for $k \geq 1$ (since $L_0 > 0$ and $u \Delta t > 0$). Therefore

$$
\theta_n \geq \frac{x_0}{L_0} + \frac{\alpha \Delta t}{L_0 + (u \Delta t)}\sum_{k=1}^n \frac{1}{k}
$$

We can disregard the $\frac{x_0}{L_0}$ since it's always positive. Also, the harmonic series is lower-bounded by $\ln(n + 1)$ [[source](https://math.stackexchange.com/questions/3883581/finding-upper-and-lower-bounds-of-the-harmonic-series)]. Therefore

$$
\theta_n \geq \frac{\alpha \Delta t}{L_0 + (u \Delta t)} \ln(n + 1)
$$

Notice that $\frac{\alpha \Delta t}{L_0 + (u \Delta t)}$ is just some constant. Since $\ln(n + 1)$ grows without bound, there will exist some $N$ such that $\ln(N + 1)$ is larger than the inverse of that constant, and therefore 

$$
\exists N \text{ s.t. } \theta_N \geq 1
$$

which means at time $T = N \Delta t$ the ant will reach the end of the rope.

<br>

## The Exact Solution

In this section, we compute the exact time and distance required to reach the end of the rope.

### The Motion of the Rope

Let $L(t)$ be the length of the rope at time $t$. Therefore $L(0) = L_0$. The rope moves at a constant velocity of $u$. Therefore

$$
L(t) = L_0 + ut
$$

Now, consider $x^{(\ell_0)}(t)$ the position of a point on the rope at time $t$ whose initial position was $\ell_0$. Therefore, $x^{(L_0)}(t) = L(t)$. I'm using the notation $\ell_0$ to emphasize that $\ell_0$ is the _original position_ on the rope pre-expansion at time $t = 0$. The expansion of the rope is described by an infinite family of position functions indexed by $\ell_0 \in [0, L_0]$. This notation is a bit awkward, but we will fix that shortly.

Since the rope expands uniformly, the proportion of of the rope must remain constant. Therefore

$$
\frac{x^{(\ell_{0,1})}(t_1)}{x^{(\ell_{0,2})}(t_1)} = \frac{x^{(\ell_{0,1})}(t_2)}{x^{(\ell_{0,2})}(t_2)} \quad \forall t_1, t_2, \ell_{0,1}, \ell_{0,2}
$$

In particular for all $\ell_0 \in [0, L_0]$,

$$
\frac{x^{(\ell_0)}(0)}{x^{(L_0)}(0)} = \frac{x^{(\ell_0)}(t)}{x^{(L_0)}(t)} \quad\implies\quad 
\frac{\ell_0}{L_0} = \frac{x^{(\ell_0)}(t)}{L_0 + ut} \quad\implies\quad 
x^{(\ell_0)}(t) = \ell_0 + \left ( \frac{\ell_0}{L_0} u \right )t
$$

Now, we can compute the velocity of each point on the rope as it expands over time.

$$
v^{(\ell_0)}(t) = \frac{d}{dt} \left [ x^{(\ell_0)}(t) \right ] = \frac{\ell_0}{L_0} u
$$


These results are summarized as the following diagram.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/motion_of_the_rope.png" alt="Motion of the Rope" width="900px" />
</div>
</div>
</center>



The above formulation is a bit awkward to work with because the parameter $\ell_0$ is referring to the original position on the rope at $t = 0$. But ideally, we want to be able to reference the rope's relative to any point in time $t$. 

Notice that

$$
x^{(\ell_0)}(t) = \frac{\ell_0}{L_0} (L_0 + ut) \quad\implies\quad
\frac{\ell_0}{L_0} = \frac{x^{(\ell_0)}(t)}{L_0 + ut}
$$

Therefore,

$$
v^{(\ell_0)}(t) = \frac{u \ x^{(\ell_0)}(t)}{L_0 + ut}
$$

Now we can re-parameterize.

$$
v_{\text{rope}}(x, t) = \frac{u x}{L_0 + ut}
$$

Instead of picking an initial position and a arbitrary time, this formulation lets us pick an arbitrary position and an arbitrary time, which is much nicer to work with.

### The Motion of the Ant

Finally, we have the tools to model the ant's motion on the rope.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/motion_of_the_ant.png" alt="Motion of the Ant" width="800px" />
</div>
</div>
</center>

The absolute velocity of the ant is the sum of the velocity of the rope and the ant's constant (relative) velocity of $\alpha$ 

$$
v_{\text{ant}}(t) = \alpha + v_{\text{rope}}(x_{\text{ant}}, t)
$$

Therefore, we get the following first-order linear differential equation

$$
\frac{d}{dt} \left [ x_{\text{ant}}(t) \right ] = \alpha + \frac{u \ x_{\text{ant}}(t)}{L_0 + ut}
$$

which has a well-known solution [[source](https://tutorial.math.lamar.edu/classes/de/Linear.aspx)]. If you work through it using the boundary condition that $x_{\text{ant}}(0) = x_0$, you will get that

$$
\boxed{
x_{\text{ant}}(t) = (L_0 + ut)\left (\frac{x_0}{L_0} + \frac{\alpha}{u} \ln \left ( \frac{L_0 + ut}{L_0} \right ) \right )
}
$$

Using the parameters from the original problem formulation ($L_0 = 1 \ \text{km}$, $u = 1 \ \frac{\text{km}}{\text{s}}$, $x_0 = 0 \ \text{km}$, and $\alpha = 1 \ \frac{\text{cm}}{\text{s}} = 1/100000 \ \frac{\text{km}}{\text{s}}$), we get

$$
x_{\text{ant}}(t) = \frac{1}{100000} (t + 1) \ln (t + 1)
$$

Now we can precisely graph the motion of the ant (red line) on its journey to the end of the expanding rope.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/blog-assets/the-ant-on-the-rubber-rope-problem/rope_expansion.png" alt="Rope Expansion" width="700px" />
</div>
</div>
</center>

### Solving for the Time the Ant Reaches the End of the Rope

We have two functions. $L(t)$ describes the position of the end of the rope, and $x_{\text{ant}}(t)$ describes the position of the ant. We want to find a $T$ such that $L(T) = x_{\text{ant}}(T)$

$$
L_0 + uT = (L_0 + uT)\left (\frac{x_0}{L_0} + \frac{\alpha}{u} \ln \left ( \frac{L_0 + uT}{L_0} \right ) \right ) 
\quad\implies\quad
\boxed{
T = \frac{L_0}{u}\left( e^{\frac{u}{\alpha}\left (1 - \frac{x_0}{L_0} \right)} - 1 \right)
}
$$

and the distance traveled by the ant wil have been

$$
X = L(T) = L_0 + uT \quad\implies\quad
\boxed{ X = L_0 e^{\frac{u}{\alpha}\left (1 - \frac{x_0}{L_0} \right)} }
$$

Again using the parameters from the original problem formulation ($L_0 = 1 \ \text{km}$, $u = 1 \ \frac{\text{km}}{\text{s}}$, $x_0 = 0 \ \text{km}$, and $\alpha = 1 \ \frac{\text{cm}}{\text{s}} = 1/100000 \ \frac{\text{km}}{\text{s}}$), we get

$$
T = e^{100000} - 1 \text{ sec} \approx 10^{10^{4.6}} \text{ sec} \\[10pt]
X = e^{100000} \text{ km} \approx 10^{10^{4.6}} \text{ km}
$$

For some perspective, the current age of the universe is $\approx 10^{17} \text{ sec}$ and the length of the observable universe is $\approx 10^{23} \text{ km}$. These numbers might as well be $0$ compared to $T$ and $X$. That poor ant.