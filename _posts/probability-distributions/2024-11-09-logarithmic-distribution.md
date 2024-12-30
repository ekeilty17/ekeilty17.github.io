---
layout:     series
title:      "Logarithmic Distribution"
date:       2024-11-09
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       18
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $p \in [0, 1]$ be a parameters
- Let $X \sim \text{Logarithmic}(p)$ be a random variable such that $$X \in \{ 1, 2, 3, \ldots, \}$$
- Let $p_X(x)$ be the corresponding probability mass function define by the following

$$
p_{X}(x)
\ = \
- \frac{1}{\ln (1 - p)} \frac{p^x}{x}
$$

## Validate

$$
\begin{align}
    \sum_{x=1}^{\infty} p_{X}(x)
    &= \sum_{x=1}^{\infty} - \frac{1}{\ln (1 - p)} \frac{p^x}{x} \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \sum_{x=1}^{\infty} \left ( \int_{0}^{p} t^{x-1} \; dt \right ) \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \int_{0}^{p} \left( \sum_{x=1}^{\infty} t^{x-1} \right )\; dt \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \int_{0}^{p} \left( \sum_{x=0}^{\infty} t^{x} \right )\; dt \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \int_{0}^{p} \frac{1}{1-t} \; dt \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \cdot \left . \left ( - \ln (1-t) \right ) \right \rvert_{0}^{p} \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \cdot \left ( - \ln (1-p) \right ) \\[10pt]
    &= 1
\end{align}
$$

## Expectation

$$,
\begin{align}
    \mathrm{E}[X]
    &= \sum_{x=1}^{\infty} x \; p_{X}(x) \\[10pt]
    &= \sum_{x=1}^{\infty} x \; \left ( - \frac{1}{\ln (1 - p)} \frac{p^x}{x} \right ) \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \sum_{x=1}^{\infty} p^x \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \sum_{x=0}^{\infty} p^{x+1} \\[10pt]
    &= - \frac{p}{\ln (1 - p)} \sum_{x=0}^{\infty} p^{x} \\[10pt]
    &= - \frac{p}{\ln (1 - p)} \left ( \frac{1}{1-p} \right ) \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \cdot \frac{p}{1-p}
\end{align}
$$


## Variance

$$,
\begin{align}
    \mathrm{E}[X^2]
    &= \sum_{x=1}^{\infty} x^2 \; p_{X}(x) \\[10pt]
    &= \sum_{x=1}^{\infty} x^2 \; \left ( - \frac{1}{\ln (1 - p)} \frac{p^x}{x} \right ) \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \sum_{x=1}^{\infty} x \; p^x \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \sum_{x=0}^{\infty} (x+1) \; p^{x+1} \\[10pt]
    &= - \frac{p}{\ln (1 - p)} \left ( \sum_{x=0}^{\infty} x \; p^{x} + \sum_{x=0}^{\infty} p^{x} \right ) \\[10pt]
    &= - \frac{p}{\ln (1 - p)} \left ( \frac{p}{(1-p)^2} + \frac{1}{1-p} \right ) \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \cdot \frac{p}{(1-p)^2}
\end{align}
$$

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= \left ( - \frac{1}{\ln (1 - p)} \cdot \frac{p}{(1-p)^2} \right ) - \left ( - \frac{1}{\ln (1 - p)} \cdot \frac{p}{1-p} \right)^2 \\[10pt]
    &= - \frac{1}{\ln (1 - p)} \cdot \frac{p}{(1-p)^2} - \frac{1}{(\ln (1 - p))^2} \cdot \frac{p^2}{(1-p)^2} \\[10pt]
    &= - \frac{p^2 + p \ln (1-p)}{(1-p)^2 (\ln (1 - p))^2}
\end{align}
$$

