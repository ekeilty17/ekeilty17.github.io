---
layout:     series
title:      "Introduction"
date:       2023-07-01
categories: blog nonstandard-analysis
permalink:  ":categories/:title/"
part:       0
series:     nonstandard-analysis
tags:       nonstandard-analysis, hyperreal-numbers
---

**TODO**

## Motivation

Nonstandard analysis is just really cool, and I want to spread it. 

## What I Will Cover

Constructing the hyperreals. You can do this by assuming you have already constructed the reals, however this relies on ideas that are very standard-analysis-y. So I would prefer to first construct $^* \mathbb{Q}$ and then use this to construct the reals, and then construct the hyperreals. Do an optional post on Filters. It's rigor does not really add to the intuition of it's interpretation. Then, we can define a limit at 

$$
\lim_{x \rightarrow a} f(x) = st( f(\text{halo}(a)) )
$$

Then, we can prove all of the limit laws just by analyzing the $st(\cdot)$ function. These proofs tend to be very simple.

We can define continuity as 

$$
f(\text{halo}(a)) = \text{halo}(f(a))
$$ 

or more simply as

$$
st( f(\text{halo}(a)) ) = f(a)
$$

Derivatives pretty much don't change, since in my derivative series, we proved them assuming the limit laws. 

## Some History

Talk about Leibeniz and Newton, how this is the typical way of thinking. Maybe give the circle proof using infinitesimals, etc.