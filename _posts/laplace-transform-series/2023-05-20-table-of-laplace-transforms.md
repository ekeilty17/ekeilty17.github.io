---
layout:     post
title:      "Table of Laplace Transforms"
categories: blog laplace-transforms
permalink:  ":categories/:title/"
tags:       laplace-transform, table
---

This is a table of bare functions. Using these functions in addition to the results in other tables, we can build up more complicated functions

| **Given Function**    | **Laplace Transform**     | **Condition**     |
|:---------------------:|:-------------------------:|:-----------------:|
| $1$                   | $\frac{1}{s}$                     | $s > 0$           |
| $t^n$                 | $\frac{n!}{s^n}$                  | $s > 0, \quad n \in \mathbb{N}$ |
| $t^{-n}$              | _divergent_                  |  $n \in \mathbb{N}$ |
| $e^t$              | $\frac{1}{s-1}$                  |  |
| $\sin t$              | $\frac{1}{s^2+1}$                  |  |
| $\cos t$              | $\frac{s}{s^2+1}$                  |  |
| $\sinh t$             | $\frac{1}{s^2-1}$                  |  |
| $\cosh t$             | $\frac{s}{s^2-1}$                  |  |

<br>

Now I give a table that lets us manipulate Laplace transformation addition and scalar multiplication

| **Given Function**    | **Laplace Transform**     | **Condition**     |
|:---------------------:|:-------------------------:|:-----------------:|
| $f(t) \pm g(t)$       | $F(s) \pm G(s)$           |            |
| $f(-t)$               | $F(-s)$                   |            |
| $f(bt)$               | $\frac{1}{b}F(s/b)$       |  $b > 0$          |
| $e^{at} f(t)$         | $F(s-a)$                  | $s > a$ (_what does thiis mean_) |

<br>

Now, I give function multiplication. The trig ones aren't super useful, but I prove them in the series.

| **Given Function**    | **Laplace Transform**     | **Condition**     |
|:---------------------:|:-------------------------:|:-----------------:|
| $\sin(t) f(t)$        | $\frac{1}{2i}(F(s+i) - F(s-i))$   |   |
| $\cos(t) f(t)$        | $\frac{1}{2}(F(s+i) + F(s-i))$    |   |
| $\sinh(t) f(t)$       | $\frac{1}{2}(F(s+1) - F(s-1))$   |   |
| $\cosh(t) f(t)$       | $\frac{1}{2}(F(s+1) + F(s-1))$    |   |
| $\theta(t-c)f(t-c)$   | $e^{-cs} F(s)$    |   |
| $\delta(t-c)f(t-d)$   | $e^{-cs} f(c-d)$    | $c \geq 0$  |

<br>

Next, I provide the interaction between Laplace transforms, derivatives, and integrals

| **Given Function**    | **Laplace Transform**     | **Condition**     |
|:---------------------:|:-------------------------:|:-----------------:|
| $t^n f(t)$        | $(-1)^n \frac{d^n}{d^n s} F(s)$   | $n \in \mathbb{N}$ (_there are also conditions on f(t) for all of these_) |
| $t^{-n} f(t)$        | $\int_{s}^{\infty} \cdots \int_{s}^{\infty} F(u) \ du_1 \cdots \ du_n$   | $n \in \mathbb{N}$ |
| $\frac{d^n}{d^n t} f(t)$        | $s^n F(s) - \sum_{k=0}^{n-1} s^{n-k-1} f^{(k)}(0)$   | $n \in \mathbb{N}$ |
| $\int_0^s \cdots \int_0^s f(t) \ du_1 \cdots \ du_n$        | $F(s) / s^n$   | $n \in \mathbb{N}$ |

<br>

Finally, we have two miscellaneous identities for periodic functions and convolution

| **Given Function**    | **Laplace Transform**     | **Condition**     |
|:---------------------:|:-------------------------:|:-----------------:|
| $f(t)$        | $\frac{1}{1 - e^{-Ts}} \int_{0}^T f(t) e^{-st} \ dt$   | $f(t)$ is $T$-periodic |
| $f(t) * g(t)$ | $F(s) \cdot G(s)$ | |

<h3 style="text-align:center; margin-bottom:1em;">
    <a href="/blog/laplace-transforms">Laplace Transforms Series</a>
</h3>