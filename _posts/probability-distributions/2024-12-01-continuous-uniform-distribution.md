---
layout:     series
title:      "Continuous Uniform Distribution"
date:       2024-12-01
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       30
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $a, b \in \mathbb{R}$ be parameters such that $a \leq b$
- Let $X \sim \text{ContinuousUniform}(a, b)$ be a random variable such that $X \in [a, b]$
- Let $f_X(x)$ be the corresponding probability mass function define by the following

$$
f_{X}(x)
\ = \
\frac{1}{b-a}
$$

## Validate

$$
\int_{a}^{b} f_{X}(x) \; dx = \int_{a}^{b} \frac{1}{b-a} \; dx = \frac{1}{b-a} \left . x \right \rvert_a^b = \frac{1}{b-a} (b - a) = 1
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \int_{a}^{b} x \; f_{X}(x) \; dx \\[10pt]
    &= \int_{a}^{b} x \; \frac{1}{b-a} \; dx \\[10pt]
    &= \frac{1}{b-a} \left . \tfrac{1}{2} x^2 \right \rvert_a^b \\[10pt]
    &= \frac{1}{b-a} \left ( \tfrac{1}{2} b^2 - \tfrac{1}{2} a^2 \right ) \\[10pt]
    &= \frac{b+a}{2}
\end{align}
$$


## Variance

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \int_{a}^{b} x^2 \; f_{X}(x) \; dx \\[10pt]
    &= \int_{a}^{b} x^2 \; \frac{1}{b-a} \; dx \\[10pt]
    &= \frac{1}{b-a} \left . \tfrac{1}{3} x^3 \right \rvert_a^b \\[10pt]
    &= \frac{1}{b-a} \left ( \tfrac{1}{3} b^3 - \tfrac{1}{3} a^3 \right ) \\[10pt]
    &= \frac{b^2 + ab + a^2}{3}
\end{align}
$$

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= \left ( \frac{b^2 + ab + a^2}{3} \right ) - \left ( \frac{b+a}{2} \right)^2 \\[10pt]
    &= \frac{b^2 - 2ab + a^2}{12} \\[10pt]
    &= \frac{(b-a)^2}{12}
\end{align}
$$

