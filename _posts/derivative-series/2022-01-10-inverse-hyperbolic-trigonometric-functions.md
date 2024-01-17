---
layout:     series
title:      "Inverse Hyperbolic Trigonometric Functions"
date:       2022-01-10
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       9
series:     derivative-proofs
tags:       derivatives, inverse-hyperbolic-trigonometric-functions, hyperbolic-trigonometry
---

## Definitions

For background on the inverse hyperbolic trig functions, you can refer to my [series](/blog/trigonometry/) on trigonometry and this [post](/blog/trigonometry/inverse-hyperbolic-trig-functions/). These results are very commonly used in advanced integration.

All proofs will directly evaluate the formula of the inverse functions. However, the same results could also be derived using the inverse derivative property (as we did for the [standard inverse trig functions](/blog/derivative-proofs/inverse-trigonometric-functions/)).

<br>

## Inverse Hyperbolic Sine

$$
\begin{align}
    \frac{d}{dx} \arcsinh (x)
    &= \frac{d}{dx} \left [ \ln \left ( x + \sqrt{x^2 + 1} \right ) \right ] \\[10pt]
    &= \frac{1 + \frac{x}{\sqrt{x^2+1}}}{x + \sqrt{x^2 + 1}} \\[10pt]
    &= \frac{\frac{x + \sqrt{x^2+1}}{\sqrt{x^2+1}}}{x + \sqrt{x^2 + 1}} \\[10pt]
    &= \frac{1}{\sqrt{x^2+1}}
\end{align}
$$

<br>

## Inverse Hyperbolic Cosine

$$
\begin{align}
    \frac{d}{dx} \arccosh (x)
    &= \frac{d}{dx} \left [ \ln \left ( x + \sqrt{x^2 - 1} \right ) \right ] \\[10pt]
    &= \frac{1 + \frac{x}{\sqrt{x^2-1}}}{x + \sqrt{x^2 - 1}} \\[10pt]
    &= \frac{\frac{x + \sqrt{x^2-1}}{\sqrt{x^2-1}}}{x + \sqrt{x^2 - 1}} \\[10pt]
    &= \frac{1}{\sqrt{x^2-1}}
\end{align}
$$

<br>

## Inverse Hyperbolic Tangent

$$
\begin{align}
    \frac{d}{dx} \arctanh (x)
    &= \frac{d}{dx} \left [ \frac{1}{2} \ln \left ( \frac{1+x}{1-x} \right ) \right ] \\[10pt]
    &= \frac{1}{2} \frac{\frac{1 \cdot (1-x) - (-1) \cdot (1+x)}{(1-x)^2}}{ \frac{1+x}{1-x} } \\[10pt]
    &= \frac{\frac{1}{(1-x)^2}}{ \frac{1+x}{1-x} } \\[10pt]
    &= \frac{1}{1 - x^2}
\end{align}
$$

<br>

## Inverse Hyperbolic Secant

$$
\begin{align}
    \frac{d}{dx} \arcsech (x)
    &= \frac{d}{dx} \left [ \ln \left ( \frac{1}{x} + \sqrt{\frac{1}{x^2} - 1} \, \right ) \right ] \\[10pt]
    &= \frac{-\frac{1}{x^2} + \frac{-\frac{1}{x^3}}{\sqrt{\frac{1}{x^2}-1}}}{\frac{1}{x} + \sqrt{\frac{1}{x^2} - 1}} \\[10pt]
    &= \frac{-1 - \frac{1}{\sqrt{1 - x^2}}}{x + x\sqrt{1 - x^2}} \\[10pt]
    &= \frac{- \frac{1 + \sqrt{1 - x^2}}{\sqrt{1 - x^2}}}{x(1 + \sqrt{1 - x^2})} \\[10pt]
    &= \frac{- 1}{x \sqrt{1 - x^2}}
\end{align}
$$

## Inverse Hyperbolic Cosecant

$$
\begin{align}
    \frac{d}{dx} \arccsch (x)
    &= \frac{d}{dx} \left [ \ln \left ( \frac{1}{x} + \sqrt{\frac{1}{x^2} + 1} \, \right ) \right ] \\[10pt]
    &= \frac{-\frac{1}{x^2} + \frac{-\frac{1}{x^3}}{\sqrt{\frac{1}{x^2}+1}}}{\frac{1}{x} + \sqrt{\frac{1}{x^2} + 1}} \\[10pt]
    &= \frac{-1 - \frac{1}{\sqrt{1 + x^2}}}{x + x\sqrt{1 + x^2}} \\[10pt]
    &= \frac{- \frac{1 + \sqrt{1 + x^2}}{\sqrt{1 + x^2}}}{x(1 + \sqrt{1 + x^2})} \\[10pt]
    &= \frac{- 1}{x \sqrt{1 + x^2}}
\end{align}
$$

## Inverse Hyperbolic Cotangent

$$
\begin{align}
    \frac{d}{dx} \arccoth (x)
    &= \frac{d}{dx} \left [ \frac{1}{2} \ln \left ( \frac{x+1}{x-1} \right ) \right ] \\[10pt]
    &= \frac{1}{2} \frac{\frac{1 \cdot (x-1) - 1 \cdot (x+1)}{(x-1)^2}}{ \frac{x+1}{x-1} } \\[10pt]
    &= \frac{-\frac{1}{(x-1)^2}}{ \frac{x+1}{x-1} } \\[10pt]
    &= \frac{1}{1 - x^2}
\end{align}
$$