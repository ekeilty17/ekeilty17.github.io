---
layout:     post
title:      "Summary of Derivatives"
categories: blog derivative-proofs
permalink:  ":categories/:title/"
tags:       derivatives, summary
---

Let $c$ be any constant. Let the derivative of a function $f(x)$ be denoted by $\frac{d}{dx} f(x) = f'(x)$. The following are general properties of the derivative operation

| **Function**          | **Derivative**                                            |
|:---------------------:|:---------------------------------------------------------:|
| $c \cdot f(x)$        | $c \cdot f'(x)$                                           |
| $f(x) \pm g(x)$       | $f'(x) \pm g'(x)$                                         |
| $f(x) \cdot g(x)$     | $f'(x) \cdot g(x) + f(x) \cdot g'(x)$                     |
| $\frac{1}{f(x)}$      | $-\frac{f'(x)}{(f(x))^2}$                                 |
| $\frac{f(x)}{g(x)}$   | $\frac{f'(x) \cdot g(x) - f(x) \cdot g'(x)}{(g(x))^2}$    |
| $f^{-1}(x)$           | $\frac{1}{f'(f^{-1}(x))}$                                 |
| $f(g(x))$             | $f'(g(x)) \cdot g'(x)$                                    |


Let the $n$th derivative of a function $f(x)$ be denoted by $\frac{d^n}{dx^n} f(x) = f^{(n)}(x)$. An additional less commonly used, but interesting property

$$
\frac{d^n}{dx^n} [f(x) \cdot g(x)] = \sum_{k=0}^{n} \binom{n}{k} f^{(n-k)}(x) g^{(k)}(x)
$$

<br>

Let $c$ and $r$ be any constant. Let $b > 1$ be any constant. Let $e$ be Euler's number and $\ln x = \log_e x$ be the natural logarithm. The following are derivatives of some particular functions.


| **Function**          | **Derivative**                |
|:---------------------:|:-----------------------------:|
| $c$                   | $0$                           |
| $x$                   | $1$                           |
| $x^r$                 | $r x^{r-1}$                   |
| $\frac{1}{x}$         | $-\frac{1}{x^2}$              |
| $\sqrt{x}$            | $\frac{1}{2 \sqrt{x}}$        |
| $\lvert x \rvert$     | $\frac{x}{\lvert x \rvert}$   |
| $b^x$                 | $b^x \ln b$                   |
| $e^x$                 | $e^x$                         |
| $\log_b x$            | $\frac{1}{x \ln b}$           |
| $\ln x$               | $\frac{1}{x}$                 |


<br>

We have derivatives of the trigonometric and inverse trigonometric functions.

| **Function**          | **Derivative**                                |
|:---------------------:|:---------------------------------------------:|
| $\sin x$              | $\cos x$                                      |
| $\cos x$              | $- \sin x$                                    |
| $\tan x$              | $\sec^2 x$                                    |
| $\sec x$              | $\tan x \sec x$                               |
| $\csc x$              | $- \cot x \csc x$                             |
| $\cot x$              | $-\csc^2 x$                                   |
| $\sin^{-1} x$         | $\frac{1}{\sqrt{1 - x^2}}$                    |
| $\cos^{-1} x$         | $- \frac{1}{\sqrt{1 - x^2}}$                  |
| $\tan^{-1} x$         | $\frac{1}{1 + x^2}$                           |
| $\sec^{-1} x$         | $\frac{1}{\lvert x \rvert \sqrt{x^2 - 1} }$   |
| $\csc^{-1} x$         | $- \frac{1}{\lvert x \rvert \sqrt{x^2 - 1} }$ |
| $\cot^{-1} x$         | $- \frac{1}{1 + x^2}$                         |


<br>

We have derivatives of the hyperbolic trigonometric and inverse hyperbolic trigonometric functions.

| **Function**          | **Derivative**            | **Condition**     |
|:---------------------:|:-------------------------:|:-----------------:|
| $\sinh x$             | $\cosh x$ |
| $\cosh x$             | $\sinh x$ |
| $\tanh x$             | $\color{black}{\text{sech}}^2 \, x$ |
| $\color{black}{\text{sech}} \ x$     | $-\tanh x \ \color{black}{\text{sech}} \ x$ |
| $\color{black}{\text{csch}} \ x$     | $- \color{black}{\text{csch}}^2 \, x$ |
| $\coth x$             | $- \coth x \ \color{black}{\text{csch}} \ x$ |
| $\sinh^{-1} x$        | $\frac{1}{\sqrt{1 + x^2}}$ |
| $\cosh^{-1} x$        | $\frac{1}{\sqrt{x^2 - 1}}$ | $x > 1$ | 
| $\tanh^{-1} x$        | $\frac{1}{1-x^2}$ | $\lvert x \rvert < 1$ |
| $\color{black}{\text{sech}}^{-1} \ x$  | $- \frac{1}{\lvert x \rvert \sqrt{1 + x^2} }$ |
| $\color{black}{\text{csch}}^{-1} \ x$  | $- \frac{1}{\lvert x \rvert \sqrt{1 - x^2} }$ |
| $\coth^{-1} x$        | $\frac{1}{1-x^2}$ | $\lvert x \rvert > 1$ |

<br>

<h3 style="text-align:center; margin-bottom:1em;">
    <a href="/blog/derivative-proofs/">Derivative Proofs Series</a>
</h3>