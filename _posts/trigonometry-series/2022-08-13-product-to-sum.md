---
layout:     series
title:      "Product to Sum Identities"
date:       2022-08-13
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       12
series:     trigonometry
tags:       trigonometry, product-to-sum
---

These identities are rarely used, but can be life-savers when they are applicable. There are four identities.

Here is the first identity.

$$
\begin{align}
    \cos \alpha \cos \beta 
    &= \frac{1}{2} \cdot 2 \cos \alpha \cos \beta \\[10pt]
    &= \frac{1}{2} (\cos \alpha \cos \beta + \cos \alpha \cos \beta) \\[10pt]
    &= \frac{1}{2} (\cos \alpha \cos \beta + \cos \alpha \cos \beta + \sin \alpha \sin \beta - \sin \alpha \sin \beta) \\[10pt]
    &= \frac{1}{2} ((\cos \alpha \cos \beta + \sin \alpha \sin \beta) + (\cos \alpha \cos \beta - \sin \alpha \sin \beta)) \\[10pt]
    &= \frac{1}{2} (\cos(\alpha - \beta) + \cos(\alpha + \beta)) \\[10pt]
\end{align}
$$

<br>

Here is the second identity.

$$
\begin{align}
    \sin \alpha \sin \beta 
    &= \frac{1}{2} \cdot 2 \sin \alpha \sin \beta \\[10pt]
    &= \frac{1}{2} (\sin \alpha \sin \beta + \sin \alpha \sin \beta) \\[10pt]
    &= \frac{1}{2} (\sin \alpha \sin \beta + \sin \alpha \sin \beta + \cos \alpha \cos \beta - \cos \alpha \cos \beta) \\[10pt]
    &= \frac{1}{2} ((\cos \alpha \cos \beta + \sin \alpha \sin \beta) - (\cos \alpha \cos \beta - \sin \alpha \sin \beta)) \\[10pt]
    &= \frac{1}{2} (\cos(\alpha - \beta) - \cos(\alpha + \beta)) \\[10pt]
\end{align}
$$

<br>

Here is the third identity.

$$
\begin{align}
    \sin \alpha \cos \beta 
    &= \frac{1}{2} \cdot 2 \sin \alpha \cos \beta \\[10pt]
    &= \frac{1}{2} (\sin \alpha \cos \beta + \sin \alpha \cos \beta) \\[10pt]
    &= \frac{1}{2} (\sin \alpha \cos \beta + \sin \alpha \cos \beta + \cos \alpha \sin \beta - \cos \alpha \sin \beta) \\[10pt]
    &= \frac{1}{2} ((\sin \alpha \cos \beta + \cos \alpha \sin \beta) + (\sin \alpha \cos \beta - \cos \alpha \sin \beta)) \\[10pt]
    &= \frac{1}{2} (\sin(\alpha + \beta) + \sin(\alpha - \beta)) \\[10pt]
\end{align}
$$

<br>

We don't need to evaluate $\cos \alpha \sin \beta$ because we can just rename the variables $\alpha$ and $\beta$. However, for completeness, I'll provide it.

$$
\begin{align}
    \cos \alpha \sin \beta 
    &= \frac{1}{2} \cdot 2 \cos \alpha \sin \beta \\[10pt]
    &= \frac{1}{2} (\cos \alpha \sin \beta + \cos \alpha \sin \beta) \\[10pt]
    &= \frac{1}{2} (\cos \alpha \sin \beta + \cos \alpha \sin \beta + \sin \alpha \cos \beta - \sin \alpha \cos \beta) \\[10pt]
    &= \frac{1}{2} ((\sin \alpha \cos \beta + \cos \alpha \sin \beta) - (\sin \alpha \cos \beta - \cos \alpha \sin \beta)) \\[10pt]
    &= \frac{1}{2} (\sin(\alpha + \beta) - \sin(\alpha - \beta)) \\[10pt]
\end{align}
$$