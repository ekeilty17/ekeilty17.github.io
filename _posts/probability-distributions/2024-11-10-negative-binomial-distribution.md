---
layout:     series
title:      "Negative Binomial Distribution"
date:       2024-11-10
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       19
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $p \in [0, 1]$ be a parameter
- Let $r > 0$ be a parameter
- Let $X \sim \text{NegativeBinomial}(p)$ be a random variable such that $$X \in \{ 0, 1, 2, \ldots, \}$$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
\binom{x + r - 1}{x} p^r (1 - p)^x
$$

## Validate

$$
\begin{align}
    \sum_{x=1}^{\infty} p_{X}(x)
    &= 
\end{align}
$$

## Expectation

$$,
\begin{align}
    \mathrm{E}[X]
    &= 
\end{align}
$$


## Variance

$$,
\begin{align}
    \mathrm{E}[X^2]
    &= 
\end{align}
$$

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= 
\end{align}
$$

