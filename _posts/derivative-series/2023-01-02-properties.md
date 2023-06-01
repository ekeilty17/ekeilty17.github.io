---
layout:     series
title:      "Properties"
date:       2023-01-02
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       1
series:     derivative-proofs
tags:       derivatives, linearity, chain-rule, product-rule, quotient-rule, inverse-functions
---

Let $f$ and $g$ be continuous functions and $c$ a constant.

## Scalar Multiplication

$$
\begin{align}
    (c \cdot f)'(x)
    &= \lim_{h \rightarrow 0} \ \frac{(c \cdot f)(x+h) - (c \cdot f)(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{c \cdot f(x+h) - c \cdot f(x)}{h} \\[10pt]
    &= c \cdot \lim_{h \rightarrow 0} \ \frac{f(x+h) - f(x)}{h} \\[10pt]
    &= c \cdot f'(x)
\end{align}
$$

<br>

## Addition and Subtraction

$$
\begin{align}
    (f \pm g)'(x)
    &= \lim_{h \rightarrow 0} \ \frac{(f \pm g)(x+h) - (f \pm g)(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{(f(x+h) \pm g(x+h)) - (f(x) \pm g(x))}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{(f(x+h) \pm g(x+h)) - (f(x) \pm g(x))}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{f(x+h) - f(x)}{h} \pm \lim_{h \rightarrow 0} \ \frac{g(x+h) - g(x)}{h}\\[10pt]
    &= f'(x) \pm g'(x)
\end{align}
$$

Combined with the scalar multiplication property, this shows that the derivative operator is linear.

<br>

## Chain Rule

For this proof, we will use a modified definition of a derivative.

$$
\begin{align}
    (f \circ g)'(x)
    &= \lim_{x \rightarrow a} \ \frac{f(g(x)) - f(g(x))}{x - a} \\[10pt]
    &= \lim_{x \rightarrow a} \ \frac{f(g(x)) - f(g(a))}{x - a} \cdot \frac{g(x) - g(a)}{g(x) - g(a)} \\[10pt]
    &= \lim_{x \rightarrow a} \ \frac{f(g(x)) - f(g(a))}{g(x) - g(a)} \cdot \frac{g(x) - g(a)}{x - a} \\[10pt]
    &= \left ( \lim_{x \rightarrow a} \ \frac{f(g(x)) - f(g(a))}{g(x) - g(a)} \right ) \cdot \left ( \lim_{x \rightarrow a} \ \frac{g(x) - g(a)}{x - a} \right ) \\[10pt]
    &= \left ( \lim_{g(x) \rightarrow g(a)} \ \frac{f(g(x)) - f(g(a))}{g(x) - g(a)} \right ) \cdot \left ( \lim_{x \rightarrow a} \ \frac{g(x) - g(a)}{x - a} \right ) \\[10pt]
    &= f'(g(x)) \cdot g'(x)
\end{align}
$$

<br>

## Product Rule

$$
\begin{align}
    (f \cdot g)'(x)
    &= \lim_{h \rightarrow 0} \ \frac{(f \cdot g)(x+h) - (f \cdot g)(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{f(x+h) \cdot g(x+h) - f(x) \cdot g(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{(f(x+h) - f(x)) g(x) + f(x) (g(x+h) - g(x)) + (f(x+h) - f(x))(g(x+h) - g(x))}{h} \\[10pt]
    &= \left ( \lim_{h \rightarrow 0} \ \frac{(f(x+h) - f(x)) g(x)}{h} \right ) + \left ( \lim_{h \rightarrow 0} \ \frac{f(x) (g(x+h) - g(x))}{h} \right ) + \left ( \lim_{h \rightarrow 0} \ \frac{(f(x+h) - f(x))(g(x+h) - g(x))}{h} \right ) \\[10pt]
    &= \left ( g(x) \cdot \lim_{h \rightarrow 0} \ \frac{f(x+h) - f(x)}{h} \right ) + \left ( f(x) \cdot \lim_{h \rightarrow 0} \ \frac{g(x+h) - g(x)}{h} \right ) + \left ( \lim_{h \rightarrow 0} \ \frac{(f(x+h) - f(x))}{h} \right ) \left ( \lim_{h \rightarrow 0} g(x+h) - g(x) \right ) \\[10pt]
    &= g(x)f'(x) + f(x)g'(x) + f'(x) \cdot 0 \\[10pt]
    &= f'(x)g(x) + f(x)g'(x)
\end{align}
$$

<br>

## Reciprocal Rule

Assume that $f(x) \neq 0 \quad \forall x$

$$
\begin{align}
    (1/f)'(x)
    &= \lim_{h \rightarrow 0} \ \frac{(1/f)(x-h) - (1/f)(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{1/f(x-h) - 1/f(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{\frac{f(x) - f(x-h)}{f(x-h)f(x)}}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{f(x) - f(x-h)}{h f(x-h)f(x)} \\[10pt]
    &= \left ( - \lim_{h \rightarrow 0} \ \frac{f(x-h) - f(x)}{h} \right ) \cdot \left ( \lim_{h \rightarrow 0} \frac{1}{f(x-h)f(x)} \right ) \\[10pt]
    &= - f'(x) \cdot \frac{1}{(f(x))^2} \\[10pt]
    &= - \frac{f'(x)}{(f(x))^2}
\end{align}
$$

<br>

## Quotient Rule

Assume that $g(x) \neq 0 \quad \forall x$

$$
\begin{align}
    (f / g)'(x)
    &= (f \cdot 1/g)'(x) \\[10pt]
    &= f'(x) (1/g)(x) + f(x) (1/g)'(x) \\[10pt]
    &= f'(x) 1/g(x) + f(x) \left ( - \frac{g'(x)}{(g(x))^2} \right ) \\[10pt]
    &= \frac{f'(x)}{g(x)} - \frac{f(x)g'(x)}{(g(x))^2} \\[10pt]
    &= \frac{f'(x)g(x) - f(x)g'(x)}{(g(x))^2}
\end{align}
$$

<br>

## Inverse Functions

Let $f^{-1}(x)$ be the inverse function of $f(x)$. Therefore, $f(f^{-1}(x)) = x$ Using the chain rule, we get

$$
\frac{d}{dx} f(f^{-1}(x)) = f'(f^{-1}(x)) \cdot \frac{d}{dx} f^{-1}(x)
$$

However, the left-hand side is $\frac{d}{dx} f(f^{-1}(x)) = \frac{d}{dx} x = 1$

Therefore

$$
\frac{d}{dx} f^{-1}(x) = \frac{1}{f'(f^{-1}(x))}
$$