---
layout:     series
title:      "Integrals"
date:       2023-05-11
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       10
series:     laplace-transforms
tags:       laplace-transform, itegrals
---

In keeping with the notation I've been using throughout the series. Suppose we are function $f(t)$ with Laplace Transform $F(s)$.

## Integrals of f(t)

Consider the following integral $$\int_{0}^{t} f(u) \ du$$. Assuming $f(t)$ is continuous and differentiable, by definition  $$\frac{d}{dt} \int_{0}^{t} f(u) \ du = f(t)$$.

Let $f^{(-n)}(t)$ denote the $n$th such integral of $f(t)$ with respect to $t$. Notice the unexpected property that $f^{(-n)}(0) = 0$ for $n > 0$, since by definition $f^{(-n)}(0) = \int_0^0 f^{(-n+1)}(u) \ du = 0$

We will prove the following result using induction on $n \geq 0$ where $f^{(0)}(t) = f(t)$.

$$
\mathcal{L}\{ f^{(-n)}(t) \} = \frac{F(s)}{s^n}
$$

First, checking the base-case $n=0$ gives

$$
\frac{F(s)}{s^0} = F(s) = \mathcal{L}\{ f(t) \}
$$

Now, we check the induction step by evaluating $$\mathcal{L}\{ f^{(-n-1)}(t) \}$$, assuming that the equation above holds for $$\mathcal{L}\{ f^{(-n)}(t) \}$$.

$$
\begin{align}
    \mathcal{L}\{ f^{(-n-1)}(t) \}
    &= \int_{0}^{\infty} f^{(-n-1)}(t) e^{-st} \; dt \qquad \text{(using integration by parts)} \\[10pt]
    &= -\frac{1}{s}f^{(-n)}(t)e^{-st} \biggr\rvert_{0}^{\infty} - \int_{0}^{\infty} f^{(-n)}(t) (-\frac{1}{s} e^{-st}) \; dt \\[10pt]
    &= \frac{1}{s}f^{(-n)}(0) - \frac{1}{s}\left( \lim_{t \rightarrow \infty} f^{(-n)}(t) e^{-st} \right ) + \frac{1}{s} \int_{0}^{\infty} f^{(-n)}(t) \cdot e^{-st} \; dt \\[10pt]
    &\text{assuming } f^{(-n)}(t) = o(e^t) \text{ as otherwise the Lapalce Transform would not exist} \\[10pt]
    &= \frac{1}{s} \cdot \mathcal{L}\{ f^{(-n)}(t) \} \\[10pt]
    &= \frac{1}{s} \cdot \frac{F(s)}{s^n} \\[10pt]
    &= \frac{F(s)}{s^{n+1}}
\end{align} 
$$

To write out the final result more explicitly

$$
\mathcal{L} \left \{ \int_0^s \int_0^s \cdots \int_0^s f(t) \ du_1 \ du_2 \cdots \ du_n \right \} = \frac{F(s)}{s^{n}}
$$

for $n \geq 0$

## Integrals of F(s)

Consider the following integral $$\int_{s}^{\infty} F(u) \ du$$. Assuming $F(s)$ is continuous and differentiable, by definition $$\frac{d}{ds} \int_{s}^{\infty} F(u) \ du = - F(s)$$. So it's not really the opposite of a derivative, but just go with the definition for now. Note that if you try to use the same definition of this notation as we used above, you won't get a conclusive result. 

Let $F^{(-n)}(s)$ denote the $n$th such integral of $F(s)$ with respect to $s$. We will prove the following result using induction on $n \geq 0$ where $F^{(0)}(s) = F(s)$.

$$
\mathcal{L}\{ f(t) / t^n \} = F^{(-n)}(s)
$$

First, checking the base-case $n=0$ gives

$$
F^{(-0)}(s) = F(s) = \mathcal{L}\{ f(t) \}
$$

Now, we check the induction step by evaluating $$\mathcal{L}\{ f(t) / t^{n+1} \}$$, assuming that the equation above holds for $$\mathcal{L}\{ f(t) / t^n \}$$.

$$
\begin{align}
    F^{(-n-1)}(s) 
    &= \int_{s}^{\infty} F^{(-n)}(u) \ du \\[10pt]
    &= \int_{s}^{\infty} \mathcal{L}\{ f(t) / t^n \} \ du \\[10pt]
    &= \int_{s}^{\infty} \left ( \int_{0}^{\infty}  t^{-n} f(t) e^{-ut} \ dt \right ) \ du \\[10pt]
    &= \int_0^{\infty} t^{-n} f(t) \left ( \int_{s}^{\infty}  e^{-ut} \ du \right ) \ dt \\[10pt]
    &= \int_0^{\infty} t^{-n} f(t) \left ( - \frac{1}{t} e^{-ut}  \right ) \biggr\rvert_{s}^{\infty} \ dt \\[10pt]
    &= \int_0^{\infty} t^{-n-1} f(t) e^{-st} \ dt \\[10pt]
    &= \mathcal{L}\{ f(t) / t^{n+1} \}
\end{align} 
$$

Note that we have to assume that f(t) is continuous in order to interchange the integrals.

To write out the final result more explicitly

$$
\mathcal{L}\{ t^{-n} f(t) \} = \int_{s}^{\infty} \int_{s}^{\infty} \cdots \int_{s}^{\infty} F(u) \ du_1 \ du_2 \cdots \ du_n
$$

for $n \geq 0$