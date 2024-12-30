---
layout:     series
title:      "Discrete Uniform Distribution"
date:       2024-11-05
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       14
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $a, b \in \mathbb{Z}$ be parameters such that $a \leq b$
- Let $X \sim \text{DiscreteUniform}(a, b)$ be a random variable such that $X \in \{ a, a+1, \ldots, b-1, b \}$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
\frac{1}{b-a+1}
$$

## Validate

$$
\sum_{x=a}^{b} p_{X}(x) = \sum_{x=a}^{b} \frac{1}{b-a+1} = \frac{1}{b-a+1} \cdot (b-a+1) = 1
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \sum_{x=a}^{b} x \ p_{X}(x) \\[10pt]
    &= \sum_{x=a}^{b} x \ \frac{1}{b-a+1} \\[10pt]
    &= \frac{1}{b-a+1} \sum_{i=0}^{b-a} (i+a) \\[10pt]
    &= \frac{1}{b-a+1} \left ( \sum_{i=0}^{b-a} i + \sum_{i=0}^{b-a} a \right ) \\[10pt]
    &= \frac{1}{b-a+1} \left ( \frac{(b-a)((b-a)+1)}{2} + a (b-a + 1)\right) \\[10pt]
    &= \frac{b-a}{2} + a \\[10pt]
    &= \frac{b+a}{2}
\end{align}
$$


## Variance

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \sum_{x=a}^{b} x^2 \ p_{X}(x) \\[10pt]
    &= \sum_{x=a}^{b} x^2 \ \frac{1}{b-a+1} \\[10pt]
    &= \frac{1}{b-a+1} \sum_{i=0}^{b-a} (i+a)^2 \\[10pt]
    &= \frac{1}{b-a+1} \left ( \sum_{i=0}^{b-a} i^2 + \sum_{i=0}^{b-a} 2ai + \sum_{i=0}^{b-a} a^2 \right )\\[10pt]
    &= \frac{1}{b-a+1} \left ( \frac{(b-a)((b-a)+1)(2(b-a)+1)}{6} + 2a\frac{(b-a)((b-a)+1)}{2} + a^2 (b-a + 1) \right )\\[10pt]
    &= \frac{(b-a)(2(b-a)+1)}{6} + 2a\frac{b-a}{2} + a^2 \\[10pt]
    &= \tfrac{1}{6} ( 2b^2 + 2ab + 2a^2 - a + b)
\end{align}
$$

I can't find a nicer form to write the final expression of $\mathrm{E}[X^2]$.

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= \tfrac{1}{6} (2b^2 + 2ab + 2a^2 - a + b) - \left ( \frac{b+a}{2} \right)^2 \\[10pt]
    &= \tfrac{1}{6} (2b^2 + 2ab + 2a^2 - a + b) - \tfrac{1}{4}(b^2 + 2ab + a^2) \\[10pt]
    &= \tfrac{1}{12} (4b^2 + 4ab + 4a^2 - 2a + 2b) - \tfrac{1}{12}(3b^2 + 6ab + 3a^2) \\[10pt]
    &= \tfrac{1}{12} (b^2 - 2ab + a^2 - 2a + 2b) \\[10pt]
    &= \tfrac{1}{12} (b^2 + a^2 + 1 + 2b - 2ab - 2a - 1) \\[10pt]
    &= \frac{(b - a + 1)^2 - 1}{12}
\end{align}
$$

