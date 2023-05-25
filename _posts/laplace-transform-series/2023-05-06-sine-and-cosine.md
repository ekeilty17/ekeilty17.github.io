---
layout:     series
title:      "Sine and Cosine"
date:       2023-05-06
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       5
series:     laplace-transforms
tags:       laplace-transform, trig, trigonometry, sine, cosine
---

I am also aware that decompose the trig functions into exponentials. I will do that in this [post](http://127.0.0.1:4000/blog/laplace-transforms/sine-cosine-and-any-function/). However, I want to do it without complex numbers for now just to show that you don't need them. Also, the recursive trick used is a nice technique I want to showcase.

## Integration by Parts

We have to prove these identities in tandem with each other (we will see why shortly).

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

We've now expressed both Laplace transforms in terms of each other. So now it's like we have a system of two equations and two unknowns.

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
\mathcal{L}\{ \sin(bt) \} = \frac{1}{b} \frac{1}{(s/b)^2+1} = \frac{b}{s^2 + b^2}
$$

<br>

## Cosine

Similarly

$$
\begin{align}
    &\mathcal{L}\{ \cos(t) \}
    = \frac{1}{s} - \frac{1}{s} \mathcal{L}\{ \sin(t) \}
    = \frac{1}{s} - \frac{1}{s^2} \mathcal{L}\{ \cos(t) \} \\[10pt]

    &\left( 1 + \frac{1}{s^2} \right ) \mathcal{L}\{ \cos(t) \} = \frac{1}{s} \\[10pt]

    &\left( \frac{s^2 + 1}{s^2} \right ) \mathcal{L}\{ \cos(t) \} = \frac{1}{s} \\[10pt]

    &\mathcal{L}\{ \cos(t) \} = \frac{s}{s^2+1}
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