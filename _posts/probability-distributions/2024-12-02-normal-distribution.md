---
layout:     series
title:      "Normal Distribution"
date:       2024-12-02
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       31
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $\mu, \sigma \in \mathbb{R}$ be parameters
- Let $X \sim \text{Normal}(\mu, \sigma)$ be a random variable such that $X \in \mathbb{R}$
- Let $f_X(x)$ be the corresponding probability mass function define by the following

$$
f_{X}(x)
\ = \
\tfrac{1}{\sqrt{2\pi}\sigma} e^{- \frac{1}{2} \left( \frac{x-\mu}{\sigma}\right)^2}
$$

## Validate

This utilizes the evaluation of the <span class="tooltip">Gaussian Integral
    <span class="tooltiptext"> 
        $$\displaystyle
        \int_{-\infty}^{\infty} e^{- \frac{1}{2} t^2} \; dt = \sqrt{2\pi}
        $$
    </span>
</span>. This is a famously hard integral to calculate, requiring some clever tricks.

$$
\begin{align}
    \int_{-\infty}^{\infty} f_{X}(x) \; dx = \int_{-\infty}^{\infty} \tfrac{1}{\sqrt{2\pi}\sigma} e^{- \frac{1}{2} \left( \frac{x-\mu}{\sigma}\right)^2} \; dx = \tfrac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} e^{- \frac{1}{2} t^2} \; dt = \tfrac{1}{\sqrt{2\pi}} \cdot \sqrt{2\pi} = 1
\end{align}
$$

## Expectation

$$
\begin{align}
    \mathrm{E}[X]
    &= \int_{-\infty}^{\infty} x \; f_{X}(x) \; dx \\[10pt]
    &= \int_{-\infty}^{\infty} x \; \tfrac{1}{\sqrt{2\pi}\sigma} e^{- \frac{1}{2} \left( \frac{x-\mu}{\sigma}\right)^2} \; dx \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} (\sigma t + \mu) \;  e^{- \frac{1}{2} t^2} \; dt \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \left ( \sigma \int_{-\infty}^{\infty} t \; e^{- \frac{1}{2} t^2} \; dt + \mu \int_{-\infty}^{\infty} e^{- \frac{1}{2} t^2} \; dt \right ) \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \left ( \sigma \cdot 0 + \mu \cdot \sqrt{2\pi} \right ) \\[10pt]
    &= \mu
\end{align}
$$


## Variance

$$
\begin{align}
    \mathrm{E}[X^2]
    &= \int_{-\infty}^{\infty} x^2 \; f_{X}(x) \; dx \\[10pt]
    &= \int_{-\infty}^{\infty} x^2 \; \tfrac{1}{\sqrt{2\pi}\sigma} e^{- \frac{1}{2} \left( \frac{x-\mu}{\sigma}\right)^2} \; dx \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \int_{-\infty}^{\infty} (\sigma t + \mu)^2 \;  e^{- \frac{1}{2} t^2} \; dt \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \left ( \sigma^2 \int_{-\infty}^{\infty} t^2 \; e^{- \frac{1}{2} t^2} \; dt + 2\mu \int_{-\infty}^{\infty} t \; e^{- \frac{1}{2} t^2} \; dt + \mu^2 \int_{-\infty}^{\infty} e^{- \frac{1}{2} t^2} \; dt \right ) \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \left ( \left . - \sigma^2 t \; e^{- \frac{1}{2} t^2} \right \rvert_{-\infty}^{\infty} + \sigma^2 \int_{-\infty}^{\infty} e^{- \frac{1}{2} t^2} \; dt + 2\mu \int_{-\infty}^{\infty} t \; e^{- \frac{1}{2} t^2} \; dt + \mu^2 \int_{-\infty}^{\infty} e^{- \frac{1}{2} t^2} \; dt \right ) \\[10pt]
    &= \tfrac{1}{\sqrt{2\pi}} \left ( \sigma^2 \cdot 0 + \sigma^2 \cdot \sqrt{2\pi} + 2\mu \cdot 0 + \mu^2 \cdot \sqrt{2\pi} \right ) \\[10pt]
    &= \sigma^2 + \mu^2
\end{align}
$$

Therefore, 

$$
\mathrm{Var}[X] = \mathrm{E}[X^2] - \mathrm{E}[X]^2 = \left ( \sigma^2 + \mu^2 \right ) - \left ( \mu \right)^2 = \sigma^2
$$

