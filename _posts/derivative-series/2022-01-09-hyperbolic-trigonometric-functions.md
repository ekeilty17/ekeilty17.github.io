---
layout:     series
title:      "Hyperbolic Trigonometric Functions"
date:       2022-01-09
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       8
series:     derivative-proofs
tags:       derivatives, hyperbolic-trigonometric-functions, hyperbolic-trigonometry, sine, cosine, tangent, secant, cosecant, cotangent
---

## Sine

$$
\begin{align}
    \frac{d}{dx} \sin (x)
    &= \lim_{h \rightarrow 0} \ \frac{\sin(x+h) - \sin(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{\sin(x)\cos(h) + \sin(h)\cos(x) - \sin(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{\sin(x)(\cos(h)-1) + \sin(h)\cos(x)}{h} \\[10pt]
    &= \sin(x) \left ( \lim_{h \rightarrow 0} \ \frac{\cos(h)-1}{h} \right ) + \cos(x) \left ( \lim_{h \rightarrow 0} \ \frac{\sin(h)}{h} \right ) \\[10pt]
    &= \sin(x) \cdot 0 + \cos(x) \cdot 1 \\[10pt]
    &= \cos(x)
\end{align}
$$

<br>

## Cosine

$$
\begin{align}
    \frac{d}{dx} \cos (x)
    &= \lim_{h \rightarrow 0} \ \frac{\cos(x+h) - \cos(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{\cos(x)\cos(h) - \sin(x)\sin(h) - \cos(x)}{h} \\[10pt]
    &= \lim_{h \rightarrow 0} \ \frac{\cos(x)(\cos(h)-1) - \sin(x)\sin(h)}{h} \\[10pt]
    &= \cos(x) \left ( \lim_{h \rightarrow 0} \ \frac{\cos(h)-1}{h} \right ) - \sin(x) \left ( \lim_{h \rightarrow 0} \ \frac{\sin(h)}{h} \right ) \\[10pt]
    &= \cos(x) \cdot 0 - \sin(x) \cdot 1 \\[10pt]
    &= - \sin(x)
\end{align}
$$

<br>

## Tangent

Using the quotient rule.

$$
\begin{align}
    \frac{d}{dx} \tan (x)
    &= \frac{d}{dx} \frac{\sin(x)}{\cos(x)} \\[10pt]
    &= \frac{\frac{d}{dx} \left [ \sin(x) \right ] \cdot \cos(x) - \sin(x) \cdot \frac{d}{dx} \left [ \cos(x) \right ]}{\left ( \cos(x) \right )^2} \\[10pt]
    &= \frac{\cos(x) \cdot \cos(x) - \sin(x) \cdot (-\sin(x))}{\cos^2(x)} \\[10pt]
    &= \frac{\cos^2(x) + \sin^2(x)}{\cos^2(x)} \\[10pt]
    &= \frac{1}{\cos^2(x)} \\[10pt]
    &= \sec^2(x) \\[10pt]
\end{align}
$$

<br>

## Secant

Using reciprocal rule

$$
\begin{align}
    \frac{d}{dx} \sec (x)
    &= \frac{d}{dx} \frac{1}{\cos(x)} \\[10pt]
    &= - \frac{\frac{d}{dx} \cos (x)}{(\cos(x))^2} \\[10pt]
    &= - \frac{- \sin (x)}{\cos^2(x)} \\[10pt]
    &= \tan(x)\sec(x)
\end{align}
$$

## Cosecant

Using reciprocal rule

$$
\begin{align}
    \frac{d}{dx} \csc (x)
    &= \frac{d}{dx} \frac{1}{\sin(x)} \\[10pt]
    &= - \frac{\frac{d}{dx} \sin (x)}{(\sin(x))^2} \\[10pt]
    &= - \frac{\cos (x)}{\sin^2(x)} \\[10pt]
    &= - \cot(x)\csc(x)
\end{align}
$$

## Cotangent

Using the quotient rule.

$$
\begin{align}
    \frac{d}{dx} \cot (x)
    &= \frac{d}{dx} \frac{\cos(x)}{\sin(x)} \\[10pt]
    &= \frac{\frac{d}{dx} \left [ \cos(x) \right ] \cdot \sin(x) - \cos(x) \cdot \frac{d}{dx} \left [ \sin(x) \right ]}{\left ( \sin(x) \right )^2} \\[10pt]
    &= \frac{(- \sin(x)) \cdot \sin(x) - \cos(x) \cdot \cos(x)}{\sin^2(x)} \\[10pt]
    &= - \frac{\sin^2(x) + \cos^2(x)}{\sin^2(x)} \\[10pt]
    &= -\frac{1}{\sin^2(x)} \\[10pt]
    &= -\csc^2(x) \\[10pt]
\end{align}
$$