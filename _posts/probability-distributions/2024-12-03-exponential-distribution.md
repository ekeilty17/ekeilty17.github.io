---
layout:     series
title:      "Exponential Distribution"
date:       2024-12-03
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       32
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $\lambda > 0$ be a parameter
- Let $X \sim \text{Exponential}(\lambda)$ be a random variable such that $X \geq 0$
- Let $f_X(x)$ be the corresponding probability mass function define by the following

$$
f_{X}(x)
\ = \
\lambda e^{-\lambda x}
$$

## Validate

$$
\int_{0}^{\infty} f_{X}(x) \; dx = \int_{0}^{\infty} \lambda e^{-\lambda x} \; dx = \left . -e^{-\lambda x} \right \rvert_{0}^{\infty} = 0 - (-1) = 1
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \int_{0}^{\infty} x \; f_{X}(x) \; dx \\[10pt]
    &= \int_{0}^{\infty} x \; \lambda e^{-\lambda x} \; dx \\[10pt]
    &= \left . -xe^{-\lambda x} \right \rvert_{0}^{\infty} + \int_{0}^{\infty} e^{-\lambda x} \; dx \\[10pt]
    &= (0 - 0) + \left . -\tfrac{1}{\lambda} e^{-\lambda x} \right \rvert_{0}^{\infty} \\[10pt]
    &= 0 - \left ( -\frac{1}{\lambda} \right ) \\[10pt]
    &= \frac{1}{\lambda}
\end{align}
$$


## Variance

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \int_{-\infty}^{\infty} x^2 \; f_{X}(x) \; dx \\[10pt]
    &= \int_{0}^{\infty} x^2 \; \lambda e^{-\lambda x} \; dx \\[10pt]
    &= \left . -x^2e^{-\lambda x} \right \rvert_{0}^{\infty} + \int_{0}^{\infty} 2x \; e^{-\lambda x} \; dx \\[10pt]
    &= (0 - 0) + \frac{2}{\lambda} \int_{0}^{\infty} x \; \lambda e^{-\lambda x} \; dx \\[10pt]
    &= (0 - 0) + \frac{2}{\lambda} \cdot \frac{1}{\lambda} \\[10pt]
    &= \frac{2}{\lambda^2}
\end{align}
$$

Therefore, 

$$
\mathrm{Var}[X] = \mathrm{E}[X^2] - \mathrm{E}[X]^2 = \left ( \frac{2}{\lambda^2} \right ) - \left ( \frac{1}{\lambda} \right)^2 = \frac{1}{\lambda^2}
$$

