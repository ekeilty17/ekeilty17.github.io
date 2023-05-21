---
layout:     series
title:      "Sine and Cosine"
date:       2023-05-06
categories: blog laplace-transform
permalink:  ":categories/:title/"
part:       5
series:     laplace-transform
tags:       laplace-transform, trig, trigonometry, sine, cosine
---

## Sine

Recall the identity $$\sin(t) = \frac{e^{it} - e^{-it}}{2i}$$

Given $f(t) = \sin(t)$

$$
\begin{align}
    \mathcal{L}\{ \sin(t) \}
    &= \mathcal{L} \left \{ \frac{1}{2i} (e^{it} - e^{-it}) \right \} \\[10pt]
    &= \frac{1}{2i} \left ( \mathcal{L}\{ e^{it} \} - \mathcal{L}\{ e^{-it} \} \right ) \\[10pt]
    &= \frac{1}{2i} \left ( \frac{1}{s-i} - \frac{1}{s+i} \right ) \\[10pt]
    &= \frac{1}{2i} \frac{(s+i) - (s-i)}{s^2+1}  \\[10pt]
    &= \frac{1}{s^2+1}
\end{align}
$$

Then, we can use our scaling property to see that 

$$
\mathcal{L}\{ \sin(bt) \} = \frac{1}{b} \frac{1}{(s/b)^2+1} = \frac{b}{s^2 + b^2}
$$

<br>



## Cosine

Recall the identity $$\cos(t) = \frac{e^{it} + e^{-it}}{2}$$

Given $f(t) = \cos(t)$

$$
\begin{align}
    \mathcal{L}\{ \cos(t) \}
    &= \mathcal{L} \left \{ \frac{1}{2} (e^{it} + e^{-it}) \right \} \\[10pt]
    &= \frac{1}{2} \left ( \mathcal{L}\{ e^{it} \} + \mathcal{L}\{ e^{-it} \} \right ) \\[10pt]
    &= \frac{1}{2} \left ( \frac{1}{s-i} + \frac{1}{s+i} \right ) \\[10pt]
    &= \frac{1}{2} \frac{(s+i) + (s-i)}{s^2+1} \\[10pt]
    &= \frac{s}{s^2+1}
\end{align}
$$

Then, we can use our scaling property to see that 

$$
\mathcal{L}\{ \cos(bt) \} = \frac{1}{b} \frac{(s/b)}{(s/b)^2+1} = \frac{s}{s^2 + b^2}
$$

<br>


## Translation

For translation, recall the trig identities 

$$\sin(\theta + \phi) = \sin(\theta)\cos(\phi) + \cos(\theta)\sin(\phi)$$

$$\cos(\theta + \phi) = \cos(\theta)\cos(\phi) - \sin(\theta)\sin(\phi)$$

Therefore

$$
\begin{align}
    \mathcal{L}\{ \sin(bt+c) \} 
    &= \mathcal{L}\{ \cos(bt)\sin(c) + \sin(bt)\cos(c) \} \\[10pt]
    &= \sin(c) \mathcal{L}\{ \cos(bt) \} + \cos(c) \mathcal{L}\{ \sin(bt) \} \\[10pt]
    &= \sin(c) \frac{s}{s^2 + b^2} + \cos(c) \frac{b}{s^2 + b^2} \\[10pt]
    &= \frac{s \cdot \sin(c) + b \cdot \cos (c)}{s^2 + b^2}
\end{align}
$$

and

$$
\begin{align}
    \mathcal{L}\{ \cos(bt+c) \} 
    &= \mathcal{L}\{ \cos(bt)\cos(c) - \sin(bt)\sin(c) \} \\[10pt]
    &= \cos(c) \mathcal{L}\{ \cos(bt) \} - \sin(c) \mathcal{L}\{ \sin(bt) \} \\[10pt]
    &= \cos(c) \frac{s}{s^2 + b^2} - \sin(c) \frac{b}{s^2 + b^2} \\[10pt]
    &= \frac{s \cdot \cos(c) - b \cdot \sin(c)}{s^2 + b^2}
\end{align}
$$