---
layout:     series
title:      "Hyperbolic Trigonometric Functions"
date:       2022-01-09
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       8
series:     derivative-proofs
tags:       derivatives, hyperbolic-trigonometric-functions, hyperbolic-trigonometry
---

## Definitions

Recall the relationship of the hyperbolic trig functions to the standard trig functions. I have a [series](/blog/trigonometry/) on trigonometry and a [post](/blog/trigonometry/hyperbolic-trig-functions/) which explains these definitions.

$$
\begin{align}
    &\sinh x = -i \sin (i x) &\qquad\qquad& \sech \ x = \sec (i x) \\[10pt]
    &\cosh x = \cos (i x) &\qquad\qquad& \csch \ x = i \csc (i x) \\[10pt]
    &\tanh x = -i \tan (i x) &\qquad\qquad& \coth x = i \cot (i x)
\end{align}
$$

<br>

## Hyperbolic Sine

$$
\begin{align}
    \frac{d}{dx} \sinh (x)
    &= \frac{d}{dx} \left [ - i \sin (i x) \right ] \\[10pt]
    &= -i \cdot i \cos (i x) \\[10pt]
    &= \cos (i x) \\[10pt]
    &= \cosh(x)
\end{align}
$$

<br>

## Hyperbolic Cosine

$$
\begin{align}
    \frac{d}{dx} \cosh (x)
    &= \frac{d}{dx} \left [ \cos (i x) \right ] \\[10pt]
    &= - i \sin (i x) \\[10pt]
    &= \sinh(x)
\end{align}
$$

<br>

## Hyperbolic Tangent

$$
\begin{align}
    \frac{d}{dx} \tanh (x)
    &= \frac{d}{dx} \left [ - i \tan (i x) \right ] \\[10pt]
    &= -i \cdot i \sec^2 (i x) \\[10pt]
    &= \sec^2 (i x) \\[10pt]
    &= \sech^2 (x)
\end{align}
$$

<br>

## Hyperbolic Secant

$$
\begin{align}
    \frac{d}{dx} \sech (x)
    &= \frac{d}{dx} \left [ \sec (i x) \right ] \\[10pt]
    &= i \tan (i x) \sec (i x) \\[10pt]
    &= - \tanh(x) \sech(x)
\end{align}
$$

## Hyperbolic Cosecant

$$
\begin{align}
    \frac{d}{dx} \csch (x)
    &= \frac{d}{dx} \left [ - i \csc (i x) \right ] \\[10pt]
    &= -i \cdot i \cot (i x) \csc(i x) \\[10pt]
    &= - i \cot (i x) \cdot i \csc(i x) \\[10pt]
    &= - \coth(x) \csch(x)
\end{align}
$$

## Hyperbolic Cotangent

$$
\begin{align}
    \frac{d}{dx} \coth (x)
    &= \frac{d}{dx} \left [ i \cot (i x) \right ] \\[10pt]
    &= - i \cdot i \csc^2 (i x) \\[10pt]
    &= - \csc^2 (i x) \\[10pt]
    &= - \csch^2 (x)
\end{align}
$$