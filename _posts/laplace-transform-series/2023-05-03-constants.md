---
layout:     series
title:      "Constants"
date:       2023-05-03
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       2
series:     laplace-transforms
tags:       laplace-transform, zero, one, constants
---

## Zero

Given $f(t) = 0$

$$
\begin{align}
    \mathcal{L}\{ 0 \} = F(s) 
    &= \int_{0}^{\infty} 0 \cdot e^{-st} \; dt \\[10pt]
    &= \int_{0}^{\infty} 0 \; dt \\[10pt]
    &= 0
\end{align}
$$

**Condition**: $s \in \mathbb{C}$

## One

Given $f(t) = 1$

$$
\begin{align}
    \mathcal{L}\{ 1 \} = F(s) 
    &= \int_{0}^{\infty} 1 \cdot e^{-st} \; dt \\[10pt]
    &= \int_{0}^{\infty} e^{-st} \; dt \\[10pt]
    &= -\frac{1}{s} e^{-st} \biggr\rvert_{0}^{\infty} \\[10pt]
    &=  \left ( \lim_{t \rightarrow \infty} -\frac{1}{s} e^{-st} \right ) - \left ( - \frac{1}{s} e^{0} \right ) \\[10pt]
    &\text{We must assume } \lvert s \rvert > 0 \text{ otherwise the limit goes to } -\infty \\[10pt]
    &= -\frac{1}{s} \cdot 0 + \frac{1}{s} \cdot 1 \\[10pt]
    &= \frac{1}{s}
\end{align}
$$

## Any Constant

Given $f(t) = \alpha$ for any constant $\alpha \in \mathbb{R}$

$$
\begin{align}
    \mathcal{L}\{ \alpha \} = F(s) 
    &= \int_{0}^{\infty} \alpha \ e^{-st} \; dt \\[10pt]
    &= \alpha \ \int_{0}^{\infty} e^{-st} \; dt \\[10pt]
    &\text{assume } \lvert s \rvert > 0 \text{ as part of the condition on } \mathcal{L}\{ 1 \}\\[10pt]
    &= \alpha \cdot \mathcal{L}\{ 1 \} \\[10pt]
    &= \frac{\alpha}{s}
\end{align}
$$
