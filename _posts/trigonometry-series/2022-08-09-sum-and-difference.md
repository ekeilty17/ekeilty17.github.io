---
layout:     series
title:      "Sum and Difference Identities"
date:       2022-08-09
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       8
series:     trigonometry
tags:       trigonometry, sum, difference
---

## Cosine

In a [previous post](/blog/trigonometry/difference-identity-for-cosine/), we proved the difference identity for cosine. Using the opposite angle identities, we prove the sum identity.

$$
\begin{align}
    \cos(\alpha + \beta)
    &= \cos(\alpha - (- \beta)) \\[10pt]
    &= \cos(\alpha)\cos(- \beta) + \sin(\alpha)\sin(- \beta) \\[10pt]
    &= \cos(\alpha)\cos(\beta) - \sin(\alpha)\sin(\beta)
\end{align}
$$

Thus, we can summarize both identities as

$$
\cos(\alpha \pm \beta) = \cos(\alpha)\cos(\beta) \mp \sin(\alpha)\sin(\beta)
$$

The $\pm$ and $\mp$ notation means that if one is positive, then the other is negative, and vice versa.

<br>

## Sine

$$
\begin{align}
    \sin(\alpha \pm \beta)
    &= \cos(\pi/2 - (\alpha \pm \beta)) \\[10pt]
    &= \cos((\pi/2 - \alpha) \mp \beta) \\[10pt]
    &= \cos(\pi/2 - \alpha)\cos(\beta) \pm \sin(\pi/2 - \alpha)\sin(\beta) \\[10pt]
    &= \sin(\alpha)\cos(\beta) \pm \cos(\alpha)\sin(\beta)
\end{align}
$$

<br>

## Tangent

$$
\begin{align}
    \tan(\alpha \pm \beta)
    &= \frac{\sin(\alpha \pm \beta)}{\cos(\alpha \pm \beta)} \\[10pt]
    &= \frac{\sin(\alpha)\cos(\beta) \pm \cos(\alpha)\sin(\beta)}{\cos(\alpha)\cos(\beta) \mp \sin(\alpha)\sin(\beta)} \\[10pt]
    &\text{divide both numerator and demoninator by } \cos(\alpha)\cos(\beta) \\[10pt]
    &= \frac{\frac{\sin(\alpha)}{\cos(\alpha)} \frac{\cos(\beta)}{\cos(\beta)} \pm \frac{\cos(\alpha)}{\cos(\alpha)} \frac{\sin(\beta)}{\cos(\beta)}}{\frac{\cos(\alpha)}{\cos(\alpha)} \frac{\cos(\beta)}{\cos(\beta)} \mp \frac{\sin(\alpha)}{\cos(\alpha)} \frac{\sin(\beta)}{\cos(\beta)}} \\[10pt]
    &= \frac{\tan(\alpha) \cdot 1 \pm 1 \cdot \tan(\beta)}{1 \cdot 1 \mp \tan(\alpha)\tan(\beta)} \\[10pt]
    &= \frac{\tan(\alpha) \pm \tan(\beta)}{1 \mp \tan(\alpha)\tan(\beta)} 
\end{align}
$$

## Secant

The sum/difference formulas for secant are a bit messy and probably not useful, but we can derive them.

$$
\begin{align}
    \sec(\alpha \pm \beta)
    &= \frac{1}{\cos(\alpha \pm \beta)} \\[10pt]
    &= \frac{1}{\cos(\alpha)\cos(\beta) \mp \sin(\alpha)\sin(\beta)} \\[10pt]
    &= \frac{1}{\frac{1}{\sec(\alpha)\sec(\beta)} \mp \frac{1}{\csc(\alpha)\csc(\beta)}} \\[10pt]
    &= \frac{1}{\frac{\csc(\alpha)\csc(\beta) \mp \sec(\alpha)\sec(\beta)}{\sec(\alpha)\sec(\beta)\csc(\alpha)\csc(\beta)}} \\[10pt]
    &= \frac{\sec(\alpha)\sec(\beta)\csc(\alpha)\csc(\beta)}{\csc(\alpha)\csc(\beta) \mp \sec(\alpha)\sec(\beta)}
\end{align}
$$

## Cosecent

The sum/difference formulas for cosecant are a bit messy and probably not useful, but we can derive them.

$$
\begin{align}
    \csc(\alpha \pm \beta)
    &= \frac{1}{\sin(\alpha \pm \beta)} \\[10pt]
    &= \frac{1}{\sin(\alpha)\cos(\beta) \pm \cos(\alpha)\sin(\beta)} \\[10pt]
    &= \frac{1}{\frac{1}{\csc(\alpha)\sec(\beta)} \pm \frac{1}{\sec(\alpha)\csc(\beta)}} \\[10pt]
    &= \frac{1}{\frac{\sec(\alpha)\csc(\beta) \pm \csc(\alpha)\sec(\beta)}{\sec(\alpha)\sec(\beta)\csc(\alpha)\csc(\beta)}} \\[10pt]
    &= \frac{\sec(\alpha)\sec(\beta)\csc(\alpha)\csc(\beta)}{\sec(\alpha)\csc(\beta) \pm \csc(\alpha)\sec(\beta)}
\end{align}
$$

## Cotangent

This derivation is almost exactly the same as the one for tangent.

$$
\begin{align}
    \cot(\alpha \pm \beta)
    &= \frac{\cos(\alpha \pm \beta)}{\sin(\alpha \pm \beta)} \\[10pt]
    &= \frac{\cos(\alpha)\cos(\beta) \mp \sin(\alpha)\sin(\beta)}{\sin(\alpha)\cos(\beta) \pm \cos(\alpha)\sin(\beta)} \\[10pt]
    &\text{divide both numerator and demoninator by } \sin(\alpha)\sin(\beta) \\[10pt]
    &= \frac{\frac{\cos(\alpha)}{\sin(\alpha)} \frac{\cos(\beta)}{\sin(\beta)} \mp \frac{\sin(\alpha)}{\sin(\alpha)} \frac{\sin(\beta)}{\sin(\beta)}}{\frac{\sin(\alpha)}{\sin(\alpha)} \frac{\cos(\beta)}{\sin(\beta)} \pm \frac{\cos(\alpha)}{\sin(\alpha)} \frac{\sin(\beta)}{\sin(\beta)}} \\[10pt]
    &= \frac{\cot(\alpha) \cot(\beta) \mp 1 \cdot 1}{1 \cdot \cot(\beta) \pm \cot(\alpha) \cdot 1} \\[10pt]
    &= \frac{\cot(\alpha) \cot(\beta) \mp 1}{\cot(\beta) \pm \cot(\alpha)}
\end{align}
$$