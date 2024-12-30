---
layout:     series
title:      "Geometric Distribution"
date:       2024-11-06
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       15
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $p \in [0, 1]$ be a parameter
- Let $X \sim \text{Geometric}(p)$ be a random variable such that $X \in \mathbb{N}$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
(1 - p)^{x} p
$$

## Validate

This is a simple application of the <span class="tooltip">infinite geometric series
    <span class="tooltiptext"> 
        $$\displaystyle
        \sum_{k=0}^{\infty} a r^k = \frac{a}{1-r}
        \qquad
        \text{assuming } \ \lvert r \rvert < 1
        $$
    </span>
</span>.

$$
\sum_{x=0}^{\infty} p_{X}(x) = \sum_{x=0}^{\infty} (1 - p)^{x} p = \frac{p}{1-(1-p)} = 1
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \sum_{x=0}^{\infty} x \ p_{X}(x) \\[10pt]
    &= \sum_{x=0}^{\infty} x \ (1 - p)^{x} p \\[10pt]
    &= \sum_{x=1}^{\infty} x \ (1 - p)^{x} p \\[10pt]
    &= p (1-p) \sum_{x=1}^{\infty} x \ (1 - p)^{x-1} \\[10pt]
    &= p (1-p) \sum_{x=1}^{\infty} \tfrac{d}{dp} \left [ - (1 - p)^{x} \right ] \\[10pt]
    &= p (1-p) \frac{d}{dp} \left [ \sum_{x=1}^{\infty} - (1 - p)^{x} \right ] \\[10pt]
    &= p (1-p) \frac{d}{dp} \left [1 + \sum_{x=0}^{\infty} - (1 - p)^{x} \right ] \\[10pt]
    &= p (1-p) \frac{d}{dp} \left [1 - \frac{1}{p} \right ] \\[10pt]
    &= p (1-p) \left [ \frac{1}{p^2} \right ] \\[10pt]
    &= \frac{1-p}{p}
\end{align}
$$


## Variance

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \sum_{x=0}^{\infty} x^2 \ p_{X}(x) \\[10pt]
    &= \sum_{x=0}^{\infty} x^2 \ (1 - p)^{x} p \\[10pt]
    &= \sum_{x=1}^{\infty} x^2 \ (1 - p)^{x} p \\[10pt]
    &= p (1-p) \sum_{x=1}^{\infty} x^2 \ (1 - p)^{x-1} \\[10pt]
    &= p (1-p) \sum_{x=1}^{\infty} \tfrac{d}{dp} \left [ - x \ (1 - p)^{x} \right ] \\[10pt]
    &= p (1-p) \frac{d}{dp} \left [ - \sum_{x=1}^{\infty} x \ (1 - p)^{x} \right ] \\[10pt]
    &= p (1-p) \frac{d}{dp} \left [ - \sum_{x=1}^{\infty} x \ (1 - p)^{x} \right ] \\[10pt]
    &= p (1-p) \frac{d}{dp} \left [ - \frac{1-p}{p^2} \right ] \\[10pt]
    &= p (1-p) \left ( \frac{2-p}{p^3} \right ) \\[10pt]
    &= \frac{(2-p)(1-p)}{p^2}
\end{align}
$$

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= \left ( \frac{(2-p)(1-p)}{p^2} \right ) - \left ( \frac{1-p}{p} \right)^2 \\[10pt]
    &= \frac{(2-p)(1-p) - (1-p)^2}{p^2} \\[10pt]
    &= \frac{(1-p)((2-p) - (1-p))}{p^2} \\[10pt]
    &= \frac{1-p}{p^2}
\end{align}
$$

