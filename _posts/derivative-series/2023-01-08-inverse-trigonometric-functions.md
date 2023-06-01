---
layout:     series
title:      "Inverse Trigonometric Functions"
date:       2023-01-08
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       7
series:     derivative-proofs
tags:       derivatives, inverse-trigonometric-functions, trigonometry, sine, cosine, tangent, secant, cosecant, cotangent
---

All proofs will be using the inverse derivative property

## Sine

$$
\begin{align}
    \frac{d}{dx} \sin^{-1} (x)
    &= \frac{1}{\frac{d}{dz} \sin(z) \bigg\rvert_{z=\sin^{-1} (x)} } \\[10pt]
    &= \frac{1}{\cos(z) \bigg\rvert_{z=\sin^{-1} (x)} } \\[10pt]
    &= \frac{1}{\cos(\sin^{-1} (x))} \\[10pt]
    &= \frac{1}{\sqrt{\cos^2(\sin^{-1} (x))}} \\[10pt]
    &= \frac{1}{\sqrt{1 - \sin^2(\sin^{-1} (x))}} \\[10pt]
    &= \frac{1}{\sqrt{1 - x^2}}
\end{align}
$$

<br>

## Cosine

$$
\begin{align}
    \frac{d}{dx} \cos^{-1} (x)
    &= \frac{1}{\frac{d}{dz} \cos(z) \bigg\rvert_{z=\cos^{-1} (x)} } \\[10pt]
    &= \frac{1}{-\sin(z) \bigg\rvert_{z=\cos^{-1} (x)} } \\[10pt]
    &= - \frac{1}{\sin(\cos^{-1} (x))} \\[10pt]
    &= - \frac{1}{\sqrt{\sin^2(\cos^{-1} (x))}} \\[10pt]
    &= - \frac{1}{\sqrt{1 - \cos^2(\cos^{-1} (x))}} \\[10pt]
    &= - \frac{1}{\sqrt{1 - x^2}}
\end{align}
$$

<br>

## Tangent

$$
\begin{align}
    \frac{d}{dx} \tan^{-1} (x)
    &= \frac{1}{\frac{d}{dz} \tan(z) \bigg\rvert_{z=\tan^{-1} (x)} } \\[10pt]
    &= \frac{1}{\sec^2(z) \bigg\rvert_{z=\tan^{-1} (x)} } \\[10pt]
    &= \frac{1}{\sec^2(\tan^{-1} (x))} \\[10pt]
    &= \frac{1}{1 + \tan^2(\tan^{-1} (x))} \\[10pt]
    &= \frac{1}{1 + x^2}
\end{align}
$$

<br>

## Secant

$$
\begin{align}
    \frac{d}{dx} \sec^{-1} (x)
    &= \frac{1}{\frac{d}{dz} \sec(z) \bigg\rvert_{z=\sec^{-1} (x)} } \\[10pt]
    &= \frac{1}{\sec(z) \tan(z) \bigg\rvert_{z=\sec^{-1} (x)} } \\[10pt]
    &= \frac{1}{\sec(\sec^{-1} (x)) \tan(\sec^{-1} (x)) } \\[10pt]
    &= \frac{1}{x \sqrt{\tan^2(\sec^{-1} (x))} } \\[10pt]
    &= \frac{1}{x \sqrt{1 + \sec^2(\sec^{-1} (x))} } \\[10pt]
    &= \frac{1}{x \sqrt{1 + x^2} } \\[10pt]
\end{align}
$$

**TODO** need to explain why we get an absolute value sign

<br>

## Cosecant

$$
\begin{align}
    \frac{d}{dx} \csc^{-1} (x)
    &= \frac{1}{\frac{d}{dz} \csc(z) \bigg\rvert_{z=\csc^{-1} (x)} } \\[10pt]
    &= \frac{1}{- \csc(z) \cot(z) \bigg\rvert_{z=\csc^{-1} (x)} } \\[10pt]
    &= - \frac{1}{\csc(\csc^{-1} (x)) \cot(\csc^{-1} (x)) } \\[10pt]
    &= - \frac{1}{x \sqrt{\cot^2(\csc^{-1} (x))} } \\[10pt]
    &= - \frac{1}{x \sqrt{1 + \csc^2(\csc^{-1} (x))} } \\[10pt]
    &= - \frac{1}{x \sqrt{1 + x^2} } \\[10pt]
\end{align}
$$

**TODO** need to explain why we get an absolute value sign

<br>

## Cotangent

$$
\begin{align}
    \frac{d}{dx} \cot^{-1} (x)
    &= \frac{1}{\frac{d}{dz} \cot(z) \bigg\rvert_{z=\cot^{-1} (x)} } \\[10pt]
    &= \frac{1}{- \csc^2(z) \bigg\rvert_{z=\cot^{-1} (x)} } \\[10pt]
    &= - \frac{1}{\csc^2(\cot^{-1} (x))} \\[10pt]
    &= - \frac{1}{1 + \cot^2(\cot^{-1} (x))} \\[10pt]
    &= - \frac{1}{1 + x^2}
\end{align}
$$