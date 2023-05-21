---
layout:     series
title:      "Constants"
date:       2023-05-03
categories: blog laplace-transform
permalink:  ":categories/:title/"
part:       2
series:     laplace-transform
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
    &\text{We must assume } s > 0 \text{ otherwise the limit goes to } -\infty \\[10pt]
    &= -\frac{1}{s} \cdot 0 + \frac{1}{s} \cdot 1 \\[10pt]
    &= \frac{1}{s}
\end{align}
$$

**Condition**: $s > 0$

## Any Constant

Given $f(t) = c$ for any constant $c \in \mathbb{R}$

$$
\begin{align}
    \mathcal{L}\{ c \} = F(s) 
    &= \int_{0}^{\infty} c \ e^{-st} \; dt \\[10pt]
    &= c \ \int_{0}^{\infty} e^{-st} \; dt \\[10pt]
    &= c \cdot \mathcal{L}\{ 1 \} \\[10pt]
    &= \frac{c}{s}
\end{align}
$$

**Condition**: $s > 0$ if $c \neq 0$ otherwise any $s \in \mathbb{C}$
