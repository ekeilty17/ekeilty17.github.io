---
layout:     series
title:      "Bernoulli Distribution"
date:       2024-11-01
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       10
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $p \in [0, 1]$ be a parameter
- Let $X \sim \text{Bernoulli}(p)$ be a random variable such that $$X \in \{ 0, 1 \}$$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_X(x)
\ = \ 
\begin{cases}
    p &\text{if } x = 1 \\
    1 - p &\text{if } x = 0
\end{cases} 
\ = \
p^x (1 - p)^{1-x}
\ = \
xp + (1-x)(1-p)
$$

## Validate

$$
\sum_{x = 0}^{1} p(x) = p(0) + p(1) = p + (1 - p) = 1
$$

## Expectation

$$
\mathrm{E}[X] = \sum_{x = 0}^{1} x \ p(x) = 0 \cdot (1 - p) + 1 \cdot p = p
$$


## Variance

$$
\mathrm{E}[X^2] = \sum_{x = 0}^{1} x^2 \ p(x) = 0^2 \cdot (1 - p) + 1^2 \cdot p = p
$$

Therefore,

$$
\mathrm{Var}[X] = \mathrm{E}[X^2] - \mathrm{E}[X]^2 = (p) - (p)^2 = p(1 - p)
$$

