---
layout:     series
title:      "Binomial Distribution"
date:       2024-11-02
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       11
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $n \in \mathbb{N}$ be a parameter
- Let $p \in [0, 1]$ be a parameter
- Let $X \sim \text{Binomial}(n, p)$ be a random variable such that $X \in \{ 0, 1, 2, \ldots, n \}$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_X(x)
\ = \
\binom{n}{x} p^x (1 - p)^{n-x}
\ = \
\frac{n!}{x!(n-x)!} p^x (1 - p)^{n-x}
$$

## Validate

This a simple application of the <span class="tooltip">binomial theorem
    <span class="tooltiptext"> 
        $$\displaystyle
        (a + b)^m = \sum_{k=0}^{m} \binom{m}{k} a^k b^{m-k}
        $$
    </span>
</span>.

$$
\sum_{x=0}^{n} p_X(x) = \sum_{x=0}^{n} \binom{n}{x} p^x (1 - p)^{n-x} = (p + (1-p))^n = 1^n = 1
$$

## Expectation

Let $Y \sim \text{Binomial}(n-1, p)$ be a random variable such that $$Y \in \{ 0, 1, 2, \ldots, n-1 \}$$ with probability mass function $p_Y(y)$.

$$
\begin{align}
    \mathrm{E}[X]
    &= \sum_{x=0}^{n} x \ p_X(x) \\[10pt]
    &= \sum_{x=0}^{n} x \cdot \frac{n!}{x!(n-x)!} p^x (1 - p)^{n-x} \\[10pt]
    &= \sum_{x=1}^{n} x \cdot \frac{n!}{x!(n-x)!} p^x (1 - p)^{n-x} \\[10pt]
    &= np \cdot \sum_{x=1}^{n} \frac{(n-1)!}{(x-1)!((n-1)-(x-1))!} p^{x-1} (1 - p)^{(n-1)-(x-1)} \\[10pt]
    &= np \cdot \sum_{y=0}^{n-1} \frac{(n-1)!}{y!((n-1)-y)!} p^y (1 - p)^{(n-1)-y} \\[10pt]
    &= np \cdot \sum_{y=0}^{n-1} p_Y(y) \\[10pt]
    &= np
\end{align}
$$


## Variance

Let $Y \sim \text{Binomial}(n-1, p)$ be a random variable such that $$Y \in \{ 0, 1, 2, \ldots, n-1 \}$$ with probability mass function $p_Y(y)$.

$$
\begin{align}
    \mathrm{E}[X^2] 
    &= \sum_{x=0}^{n} x^2 \ p_X(x) \\[10pt]
    &= np \cdot \sum_{y=0}^{n-1} (y+1) p_Y(y) \\[10pt]
    &= np \left ( \sum_{y=0}^{n-1} y \ p_Y(y)  + \sum_{y=0}^{n-1} p_Y(y) \right ) \\[10pt]
    &= np \left ( \mathrm{E}[Y] + 1 \right ) \\[10pt]
    &= np \left ( (n-1)p  + 1 \right ) \\[10pt]
    &= n^2p^2 - np^2 + np
\end{align}
$$

Therefore, 

$$
\mathrm{Var}[X] = \mathrm{E}[X^2] - \mathrm{E}[X]^2 = (n^2p^2 - np^2 + np) - (np)^2 = np(1 - p)
$$

