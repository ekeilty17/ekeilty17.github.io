---
layout:     series
title:      "Poisson Distribution"
date:       2024-11-04
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       13
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $\lambda > 0$ be a parameter
- Let $X \sim \text{Poisson}(\lambda)$ be a random variable such that $X \in \mathbb{N}$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
e^{-\lambda} \frac{\lambda^x}{x!}
$$

## Validate

This uses the power series of $e^x$.

$$
\sum_{x=0}^{\infty} p_{X}(x) = \sum_{x=0}^{\infty} e^{-\lambda} \frac{\lambda^x}{x!} = e^{-\lambda} \sum_{x=0}^{\infty} \frac{\lambda^x}{x!} = e^{-\lambda} e^{\lambda} = 1
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \sum_{x=0}^{\infty} x \ p_{X}(x) \\[10pt]
    &= \sum_{x=0}^{\infty} x \ e^{-\lambda} \frac{\lambda^x}{x!} \\[10pt]
    &= \sum_{x=1}^{\infty} x \ e^{-\lambda} \frac{\lambda^x}{x!} \\[10pt]
    &= \lambda \sum_{x=1}^{\infty} e^{-\lambda} \frac{\lambda^{x-1}}{(x-1)!} \\[10pt]
    &= \lambda \sum_{y=0}^{\infty} e^{-\lambda} \frac{\lambda^{y}}{y!} \\[10pt]
    &= \lambda \sum_{y=0}^{\infty} p_Y(y) \\[10pt]
    &= \lambda \\[10pt]
\end{align}
$$


## Variance

TODO

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \sum_{x=0}^{\infty} x^2 \ p_{X}(x) \\[10pt]
    &= \lambda \sum_{y=0}^{\infty} (y+1) \ p_{Y}(y) \\[10pt]
    &= \lambda \left ( \sum_{y=0}^{\infty} y \ p_{Y}(y) + \sum_{y=0}^{\infty} p_{Y}(y) \right ) \\[10pt]
    &= \lambda \left ( \mathrm{E}[Y] + 1 \right ) \\[10pt]
    &= \lambda \left ( \lambda + 1 \right ) \\[10pt]
    &= \lambda^2 + \lambda
\end{align}
$$

Therefore, 

$$
\mathrm{Var}[X] = \mathrm{E}[X^2] - \mathrm{E}[X]^2 = (\lambda^2 + \lambda) - (\lambda)^2 = \lambda
$$

