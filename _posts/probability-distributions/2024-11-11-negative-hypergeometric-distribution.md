---
layout:     series
title:      "Negative Hypergeometric Distribution"
date:       2024-11-11
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       20
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $N \in \mathbb{N}$ be a parameter
- Let $$K, r \in \{ 0, 1, 2, \ldots, N \}$$ be a parameter
- Let $X \sim \text{NegativeHypergeometric}(N, K, r)$ be a random variable such that $$X \in \{ 0, 1, 2, \ldots, K \}$$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
\frac{\binom{x+r-1}{x} \binom{N-r-x}{K-x}}{\binom{N}{K}}
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

