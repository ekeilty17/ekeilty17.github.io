---
layout:     series
title:      "Gamma Distribution"
date:       2024-12-04
categories: blog probability-distributions
permalink:  ":categories/:title/"
part:       33
series:     probability-distributions
tags:       probability-distributions
---

## Formula

Definitions
- Let $\alpha, \lambda > 0$ be parameters
- Let $X \sim \text{Gamma}(\alpha, \lambda)$ be a random variable such that $X > 0$
- Let $f_X(x)$ be the corresponding probability mass function define by the following

$$
f_{X}(x)
\ = \
\frac{\lambda^{\alpha}}{\Gamma(\alpha)} x^{\alpha-1}e^{-\lambda x}
\qquad
\text{where}
\qquad
\Gamma(\alpha) = \int_{0}^{\infty} t^{\alpha-1} e^{-t} \; dt
$$

## Validate

This utilizes the fundamental property of the gamma function, i.e. $\displaystyle \Gamma(z + 1) = z \cdot \Gamma(z)$.

$$
\begin{align}
    \int_{0}^{\infty} f_{X}(x) \; dx 
    &= \int_{0}^{\infty} \frac{\lambda^{\alpha}}{\Gamma(\alpha)} x^{\alpha-1} e^{-\lambda x} \; dx \\[10pt]
    &= \frac{\lambda^{\alpha}}{\Gamma(\alpha)} \int_{0}^{\infty} \left ( \frac{t}{\lambda} \right )^{\alpha-1} e^{-t} \; \left ( \frac{dt}{\lambda} \right ) \\[10pt]
    &= \frac{1}{\Gamma(\alpha)} \int_{0}^{\infty} t^{\alpha-1} \; e^{-t} \; dt \\[10pt]
    &= \frac{1}{\Gamma(\alpha)} \cdot\Gamma(\alpha) \\[10pt]
    &= 1
\end{align}
$$

## Expectation

$$
\begin{align}
    \int_{0}^{\infty} x \; f_{X}(x) \; dx 
    &= \int_{0}^{\infty} x \; \frac{\lambda^{\alpha}}{\Gamma(\alpha)} x^{\alpha-1} e^{-\lambda x} \; dx \\[10pt]
    &= \frac{\lambda^{\alpha}}{\Gamma(\alpha)} \int_{0}^{\infty} x^{\alpha} e^{-\lambda x} \; dx \\[10pt]
    &= \frac{\lambda^{\alpha}}{\Gamma(\alpha)} \int_{0}^{\infty} \left ( \frac{t}{\lambda} \right )^{\alpha} e^{-t} \; \left ( \frac{dt}{\lambda} \right ) \\[10pt]
    &= \frac{1}{\lambda} \cdot \frac{1}{\Gamma(\alpha)} \int_{0}^{\infty} t^{\alpha} \; e^{-t} \; dt \\[10pt]
    &= \frac{1}{\lambda} \cdot \frac{1}{\Gamma(\alpha)} \cdot \Gamma(\alpha+1) \\[10pt]
    &= \frac{1}{\lambda} \cdot \frac{1}{\Gamma(\alpha)} \cdot \alpha \cdot \Gamma(\alpha) \\[10pt]
    &= \frac{\alpha}{\lambda}
\end{align}
$$


## Variance

$$
\begin{align}
    \int_{0}^{\infty} x^2 \; f_{X}(x) \; dx 
    &= \int_{0}^{\infty} x^2 \; \frac{\lambda^{\alpha}}{\Gamma(\alpha)} x^{\alpha-1} e^{-\lambda x} \; dx \\[10pt]
    &= \frac{\lambda^{\alpha}}{\Gamma(\alpha)} \int_{0}^{\infty} x^{\alpha+1} e^{-\lambda x} \; dx \\[10pt]
    &= \frac{\lambda^{\alpha}}{\Gamma(\alpha)} \int_{0}^{\infty} \left ( \frac{t}{\lambda} \right )^{\alpha+1} e^{-t} \; \left ( \frac{dt}{\lambda} \right ) \\[10pt]
    &= \frac{1}{\lambda^2} \cdot \frac{1}{\Gamma(\alpha)} \int_{0}^{\infty} t^{\alpha+1} \; e^{-t} \; dt \\[10pt]
    &= \frac{1}{\lambda^2} \cdot \frac{1}{\Gamma(\alpha)} \cdot \Gamma(\alpha+2) \\[10pt]
    &= \frac{1}{\lambda^2} \cdot \frac{1}{\Gamma(\alpha)} \cdot \alpha \cdot (\alpha + 1) \cdot \Gamma(\alpha) \\[10pt]
    &= \frac{\alpha^2 + \alpha}{\lambda^2}
\end{align}
$$

Therefore, 

$$
\mathrm{Var}[X] = \mathrm{E}[X^2] - \mathrm{E}[X]^2 = \left ( \frac{\alpha^2 + \alpha}{\lambda^2} \right ) - \left ( \frac{\alpha}{\lambda} \right)^2 = \frac{\alpha}{\lambda^2}
$$

