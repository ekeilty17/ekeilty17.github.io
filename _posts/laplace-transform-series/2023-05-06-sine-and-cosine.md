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

I am also aware that you can do a similar trick to what I did in the previous post where you decompose the trig functions into exponentials. However, this proof is a bit unrigorous because $$\mathcal{L} \{ \cdot \}$$ is supposed to take a real-valued function as input, yet we decomposed it into two complex-valued functions. Thus, I prove it rigorously here.

## Integration by Parts

We have to prove these identities in tandem with each other (we will see why shortly)

$$
\begin{align}
    \mathcal{L}\{ \sin(t) \}
    &= \int_{0}^{\infty} \sin(t) e^{-st} \; dt \qquad \text{(using integration by parts)} \\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \sin(0) - \frac{1}{s} \lim_{t \rightarrow \infty} \sin(t) e^{-st} + \frac{1}{s} \int_{0}^{\infty} \cos(t) e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \int_{0}^{\infty} \cos(t) e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \mathcal{L}\{ \cos(t) \}
\end{align}
$$

Similarly

$$
\begin{align}
    \mathcal{L}\{ \cos(t) \}
    &= \int_{0}^{\infty} \cos(t) e^{-st} \; dt \qquad \text{(using integration by parts)} \\[10pt]
    &= \frac{1}{s} f(0) - \frac{1}{s} \lim_{t \rightarrow \infty} f(t)e^{-st} + \frac{1}{s} \int_{0}^{\infty} f'(t)e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} \cos(0) - \frac{1}{s} \lim_{t \rightarrow \infty} \cos(t) e^{-st} + \frac{1}{s} \int_{0}^{\infty} (-\sin(t)) e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} - \frac{1}{s} \int_{0}^{\infty} \sin(t) e^{-st} \ dt \\[10pt]
    &= \frac{1}{s} - \frac{1}{s} \mathcal{L}\{ \sin(t) \}
\end{align}
$$

<br>

## Sine

Combining the two results from above, we get

$$
\begin{align}
    &\mathcal{L}\{ \sin(t) \}
    = \frac{1}{s} \mathcal{L}\{ \cos(t) \}
    = \frac{1}{s} \left ( \frac{1}{s} - \frac{1}{s} \mathcal{L}\{ \sin(t) \} \right ) \\[10pt]

    &\left( 1 + \frac{1}{s^2} \right ) \mathcal{L}\{ \sin(t) \} = \frac{1}{s^2} \\[10pt]

    &\left( \frac{s^2 + 1}{s^2} \right ) \mathcal{L}\{ \sin(t) \} = \frac{1}{s^2} \\[10pt]

    &\mathcal{L}\{ \sin(t) \} = \frac{1}{s^2+1}
\end{align}
$$

Then, we can use our scaling property to see that 

$$
\mathcal{L}\{ \sin(bt) \} = \frac{1}{b} \frac{1}{(s/b)^2+1} = \frac{1}{s^2 + b^2}
$$

<br>

## Cosine

Similarly

$$
\begin{align}
    &\mathcal{L}\{ \cos(t) \}
    = \frac{1}{s} - \frac{1}{s} \mathcal{L}\{ \sin(t) \}
    = \frac{1}{s} - \frac{1}{s^2} \mathcal{L}\{ \cos(t) \} \\[10pt]

    &\left( 1 + \frac{1}{s^2} \right ) \mathcal{L}\{ \sin(t) \} = \frac{1}{s} \\[10pt]

    &\left( \frac{s^2 + 1}{s^2} \right ) \mathcal{L}\{ \sin(t) \} = \frac{1}{s} \\[10pt]

    &\mathcal{L}\{ \sin(t) \} = \frac{s}{s^2+1}
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