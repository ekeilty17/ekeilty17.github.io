---
layout:     series
title:      "Beta Distribution"
date:       2024-12-05
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       34
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $\alpha, \beta > 0$ be parameters
- Let $X \sim \text{Beta}(\alpha, \beta)$ be a random variable such that $X \in (0, 1)$
- Let $f_X(x)$ be the corresponding probability mass function define by the following

$$
f_{X}(x)
\ = \
\frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha, \beta)}
\qquad
\text{where}
\qquad
B(\alpha, \beta) = \frac{\Gamma(\alpha)\Gamma(\beta)}{\Gamma(\alpha + \beta)}
$$

## Validate

This is not a trivial proof. The easiest proof is the following

$$
\begin{align}
    \Gamma(\alpha) \Gamma(\beta)
    &= \left ( \int_{0}^{\infty} x^{\alpha-1} e^{-x} \; dx \right ) \left ( \int_{0}^{\infty} y^{\beta-1} e^{-y} \; dy \right ) \\[10pt]
    &= \int_{0}^{\infty} \int_{0}^{\infty} x^{\alpha-1} y^{\beta-1} e^{-(x+y)} \; dx \; dy \\[10pt]
    &= \int_{0}^{\infty} e^{-t} \left ( \int_{0}^{t} x^{\alpha-1} (t-x)^{\beta-1} \; dx \right ) \; dt \\[10pt]
    &= \int_{0}^{\infty} e^{-t} \left ( \int_{0}^{1} (ut)^{\alpha-1} (t-ut)^{\beta-1} \; t \; du \right ) \; dt \\[10pt]
    &= \int_{0}^{\infty} t^{\alpha + \beta - 1} e^{-t} \left ( \int_{0}^{1} u^{\alpha-1} (1-u)^{\beta-1} \; du \right ) \; dt \\[10pt]
    &= \left ( \int_{0}^{\infty} t^{\alpha + \beta - 1} e^{-t} \; dt \right ) \left ( \int_{0}^{1} u^{\alpha-1} (1-u)^{\beta-1} \; du \right ) \\[10pt]
    &= \Gamma(\alpha + \beta) \left ( \int_{0}^{1} f_X(u) \; du \right ) \\[10pt]
\end{align}
$$

## Expectation

$$
\begin{align}
    \int_{0}^{\infty} x \; f_{X}(x) \; dx 
    &= \int_{0}^{1} x \; \frac{x^{\alpha-1} (1-x)^{\beta-1}}{B(\alpha, \beta)} \; dx \\[10pt]
    &= \frac{1}{B(\alpha, \beta)} \int_{0}^{1} x^{\alpha} (1-x)^{\beta-1} \; dx \\[10pt]
    &= \frac{1}{B(\alpha, \beta)} \cdot B(\alpha+1, \beta) \\[10pt]
    &= \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha) \Gamma(\beta)} \cdot \frac{\Gamma(\alpha + 1) \Gamma(\beta)}{\Gamma(\alpha + \beta + 1)} \\[10pt]
    &= \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha) \Gamma(\beta)} \cdot \frac{\Gamma(\alpha) \Gamma(\beta)}{\Gamma(\alpha + \beta)} \cdot \frac{\alpha}{\alpha + \beta} \\[10pt]
    &= \frac{\alpha}{\alpha + \beta}
\end{align}
$$


## Variance

$$
\begin{align}
    \int_{0}^{\infty} x^2 \; f_{X}(x) \; dx 
    &= \int_{0}^{1} x^2 \; \frac{x^{\alpha-1} (1-x)^{\beta-1}}{B(\alpha, \beta)} \; dx \\[10pt]
    &= \frac{1}{B(\alpha, \beta)} \int_{0}^{1} x^{\alpha+1} (1-x)^{\beta-1} \; dx \\[10pt]
    &= \frac{1}{B(\alpha, \beta)} \cdot B(\alpha+2, \beta) \\[10pt]
    &= \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha) \Gamma(\beta)} \cdot \frac{\Gamma(\alpha + 2) \Gamma(\beta)}{\Gamma(\alpha + \beta + 2)} \\[10pt]
    &= \frac{\Gamma(\alpha + \beta)}{\Gamma(\alpha) \Gamma(\beta)} \cdot \frac{\Gamma(\alpha) \Gamma(\beta)}{\Gamma(\alpha + \beta)} \cdot \frac{\alpha (\alpha + a)}{(\alpha + \beta)(\alpha + \beta + 1)} \\[10pt]
    &= \frac{\alpha (\alpha + 1)}{(\alpha + \beta)(\alpha + \beta + 1)}
\end{align}
$$

Therefore, 

$$
\begin{align}
    \mathrm{Var}[X] 
    &= \mathrm{E}[X^2] - \mathrm{E}[X]^2 \\[10pt]
    &= \left ( \frac{\alpha (\alpha + 1)}{(\alpha + \beta)(\alpha + \beta + 1)} \right ) - \left ( \frac{\alpha}{\alpha + \beta} \right)^2 \\[10pt]
    &= \frac{\alpha (\alpha + 1)(\alpha + \beta)}{(\alpha + \beta)^2(\alpha + \beta + 1)} - \frac{\alpha^2 (\alpha + \beta + 1)}{(\alpha + \beta)^2 (\alpha + \beta + 1)} \\[10pt]
    &= \frac{\alpha^3 + \alpha^2 + \alpha^2\beta + \alpha\beta}{(\alpha + \beta)^2(\alpha + \beta + 1)} - \frac{\alpha^3 + \alpha^2\beta + \alpha^2}{(\alpha + \beta)^2 (\alpha + \beta + 1)} \\[10pt]
    &= \frac{\alpha\beta}{(\alpha + \beta)^2(\alpha + \beta + 1)}
\end{align}
$$

