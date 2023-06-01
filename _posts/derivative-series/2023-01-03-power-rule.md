---
layout:     series
title:      "Power Rule"
date:       2023-01-03
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       2
series:     derivative-proofs
tags:       derivatives, power-rule, polynomials
---

## Zero

$$
\begin{align}
    \frac{d}{dx} x^0 
    &= \lim_{h \rightarrow 0} \ \frac{(x-h)^0 - x^0}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{1 - 1}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ 0 \\[10pt]
    &= 0 \\[10pt]
\end{align}
$$

Therefore, $\frac{d}{dx} x^0 = \frac{d}{dx} 1 = 0$$

<br>

## Positive Integers

Suppose $n \in \mathbb{N}$ and $n > 0$

$$
\begin{align}
    \frac{d}{dx} x^n 
    &= \lim_{h \rightarrow 0} \ \frac{(x-h)^n - x^n}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{1}{h}\left ( \sum_{k=0}^n \binom{n}{k} x^k h^{n-k} - x^n \right ) \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{1}{h}\left ( \sum_{k=0}^{n-1} \binom{n}{k} x^k h^{n-k} \right ) \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{1}{h}\left ( h \sum_{k=0}^{n-1} \binom{n}{k} x^k h^{n-(k-1)} \right ) \\[10pt]
    &= \lim_{h \rightarrow 0} \ \sum_{k=0}^{n-1} \binom{n}{k} x^k h^{n-(k-1)}\\[10pt]
    &= n x^{n-1} \\[10pt]
\end{align}
$$

<br>

## Negative Integers

Suppose $n \in \mathbb{N}$ and $n > 0$. Let $f(x) = 1/x$ and $g(x) = x^n$. Using the reciprocal rule we get.

$$
\begin{align}
    \frac{d}{dx} x^{-n}
    &= \frac{d}{dx} \frac{1}{x^n} \\[10pt]
    &= - \frac{\frac{d}{dx} x^n}{(x^n)^2} \\[10pt]
    &= - \frac{nx^{n-1}}{(x^n)^2} \\[10pt]
    &= - n x^{n-1 - 2n} \\[10pt]
    &= - n x^{-n-1} \\[10pt]
\end{align}
$$

Thus, this fits the pattern from the positive integers. For any integer $k \in \mathbb{Z}$ where $k \neq 0$, we have $\frac{d}{dx} x^k = k x^{k-1}$

<br>

## Rational Numbers

Suppose $p, q \in \mathbb{Z}$ such that $p, q \neq 0 \quad \forall x$.

First, we need to find the derivative of $x^{1/q}$. We do this using the fact that this is the inverse function of $f(x) = x^q$. Therefore,

$$
\begin{align}
    \frac{d}{dx} x^{1/q}
    &= \frac{1}{f'(x^{1/q})} \\[10pt]
    &= \frac{1}{q (x^{1/q})^{q-1}} \\[10pt]
    &= \frac{1}{q x^{(q-1)/q}} \\[10pt]
    &= \frac{1}{q x^{1-1/q}} \\[10pt]
    &= \frac{1}{q}x^{(1/q)-1} \\[10pt]
\end{align}
$$

Thus, the power rule works for the reciprocals of integers. Now, we combine this result with the chain rule to prove the result for all rationals.

$$
\begin{align}
    \frac{d}{dx} x^{p/q}
    &= \frac{d}{dx} (x^{1/q})^p \\[10pt]
    &= p(x^{1/q})^{p-1} \cdot \frac{d}{dx} x^{1/q} \\[10pt]
    &= px^{(p-1)/q} \cdot \frac{1}{q}x^{(1/q)-1} \\[10pt]
    &= px^{(p-1)/q} \cdot \frac{1}{q}x^{(1-q)/q} \\[10pt]
    &= \frac{p}{q} x^{(p-1)/q + (1-q)/q} \\[10pt]
    &= \frac{p}{q} x^{(p-1 + 1-q)/q} \\[10pt]
    &= \frac{p}{q} x^{(p-q)/q} \\[10pt]
    &= \frac{p}{q} x^{(p/q)-1} \\[10pt]
\end{align}
$$

<br>

## Real Numbers

The proof for this is very technical and involves the fact that any real number can be expressed as the limit of a Cauchy series of rational numbers. Then, the result follows by the definition of exponentiation of a real number. I will possibly save this for a different post. However, it is true that the power rule holds for real numbers.

Thus, let $r \in \mathbb{R}$

$$
\frac{d}{dx} x^r = r x^{r-1}
$$

<br>

Note, that if $r=0$, then the above also holds since $\frac{d}{dx} x^0 = \frac{d}{dx} 1 = 0 = 0 \cdot x^{0-1}$