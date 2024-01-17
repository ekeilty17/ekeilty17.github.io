---
layout:     series
title:      "Inverse Trigonometric Functions"
date:       2022-01-08
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       7
series:     derivative-proofs
tags:       derivatives, inverse-trigonometric-functions, trigonometry, sine, cosine, tangent, secant, cosecant, cotangent
---

For background on the inverse functions and how the inverse trig functions are defined, you can refer to my [series](/blog/trigonometry/) on trigonometry and this [post](/blog/trigonometry/inverse-trig-functions/).

All proofs will be using the inverse derivative property. These results are very commonly used in advanced integration.

## Inverse Sine

$$
\begin{align}
    \frac{d}{dx} \arcsin (x)
    &= \frac{1}{\frac{d}{dz} \sin(z) \bigg\rvert_{z=\arcsin (x)} } \\[10pt]
    &= \frac{1}{\cos(z) \bigg\rvert_{z=\arcsin (x)} } \\[10pt]
    &= \frac{1}{\cos(\arcsin (x))} \\[10pt]
    &= \frac{1}{\sqrt{\cos^2(\arcsin (x))}} \\[10pt]
    &= \frac{1}{\sqrt{1 - \sin^2(\arcsin (x))}} \\[10pt]
    &= \frac{1}{\sqrt{1 - x^2}}
\end{align}
$$

<br>

## Inverse Cosine

$$
\begin{align}
    \frac{d}{dx} \arccos (x)
    &= \frac{1}{\frac{d}{dz} \cos(z) \bigg\rvert_{z=\arccos (x)} } \\[10pt]
    &= \frac{1}{-\sin(z) \bigg\rvert_{z=\arccos (x)} } \\[10pt]
    &= \frac{-1}{\sin(\arccos (x))} \\[10pt]
    &= \frac{-1}{\sqrt{\sin^2(\arccos (x))}} \\[10pt]
    &= \frac{-1}{\sqrt{1 - \cos^2(\arccos (x))}} \\[10pt]
    &= \frac{-1}{\sqrt{1 - x^2}}
\end{align}
$$

<br>

## Inverse Tangent

$$
\begin{align}
    \frac{d}{dx} \arctan (x)
    &= \frac{1}{\frac{d}{dz} \tan(z) \bigg\rvert_{z=\arctan (x)} } \\[10pt]
    &= \frac{1}{\sec^2(z) \bigg\rvert_{z=\arctan (x)} } \\[10pt]
    &= \frac{1}{\sec^2(\arctan (x))} \\[10pt]
    &= \frac{1}{1 + \tan^2(\arctan (x))} \\[10pt]
    &= \frac{1}{1 + x^2}
\end{align}
$$

<br>

## Inverse Secant

$$
\begin{align}
    \frac{d}{dx} \arcsec (x)
    &= \frac{1}{\frac{d}{dz} \sec(z) \bigg\rvert_{z=\arcsec (x)} } \\[10pt]
    &= \frac{1}{\sec(z) \tan(z) \bigg\rvert_{z=\arcsec (x)} } \\[10pt]
    &= \frac{1}{\sec(\arcsec (x)) \tan(\arcsec (x)) } \\[10pt]
    &= \frac{1}{x \sqrt{\tan^2(\arcsec (x))} } \\[10pt]
    &= \frac{1}{x \sqrt{1 + \sec^2(\arcsec (x))} } \\[10pt]
    &= \frac{1}{x \sqrt{1 + x^2} } \\[10pt]
\end{align}
$$

<!-- **TODO** need to explain why we get an absolute value sign -->

<br>

## Inverse Cosecant

$$
\begin{align}
    \frac{d}{dx} \arccsc (x)
    &= \frac{1}{\frac{d}{dz} \csc(z) \bigg\rvert_{z=\arccsc (x)} } \\[10pt]
    &= \frac{1}{- \csc(z) \cot(z) \bigg\rvert_{z=\arccsc (x)} } \\[10pt]
    &= \frac{-1}{\csc(\arccsc (x)) \cot(\arccsc (x)) } \\[10pt]
    &= \frac{-1}{x \sqrt{\cot^2(\arccsc (x))} } \\[10pt]
    &= \frac{-1}{x \sqrt{1 + \csc^2(\arccsc (x))} } \\[10pt]
    &= \frac{- 1}{x \sqrt{1 + x^2} } \\[10pt]
\end{align}
$$

<!-- **TODO** need to explain why we get an absolute value sign -->

<br>

## Inverse Cotangent

$$
\begin{align}
    \frac{d}{dx} \arccot (x)
    &= \frac{1}{\frac{d}{dz} \cot(z) \bigg\rvert_{z=\arccot (x)} } \\[10pt]
    &= \frac{1}{- \csc^2(z) \bigg\rvert_{z=\cot^{-1} (x)} } \\[10pt]
    &= \frac{-1}{\csc^2(\cot^{-1} (x))} \\[10pt]
    &= \frac{-1}{1 + \cot^2(\cot^{-1} (x))} \\[10pt]
    &= \frac{-1}{1 + x^2}
\end{align}
$$