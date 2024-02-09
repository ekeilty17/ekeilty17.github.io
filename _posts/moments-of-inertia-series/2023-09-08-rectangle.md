---
layout:     series
title:      "Rectangle"
date:       2023-09-08
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       7
series:     moments-of-inertia
tags:       moments-of-inertia
excerpt_separator: <!--more-->
---

## Moment of Inertia About Central Axis

$$
\begin{align}
    I &= I_1 + I_2 + I_3 + I_4 \\[10pt]
    &= (\tfrac{1}{3} M_1 L_1^2 + M_1 d_1^2) + (\tfrac{1}{3} M_2 L_2^2 + M_2 d_2^2) + (\tfrac{1}{3} M_3 L_3^2 + M_3 d_3^2) + (\tfrac{1}{3} M_4 L_4^2 + M_4 d_4^2) \\[10pt]
    &= (\tfrac{1}{3} \lambda a^3 + \tfrac{1}{4} \lambda ab^2) + (\tfrac{1}{3} \lambda b^3 + \tfrac{1}{4} \lambda a^2b) + (\tfrac{1}{3} \lambda a^3 + \tfrac{1}{4} \lambda ab^2) + (\tfrac{1}{3} \lambda b^3 + \tfrac{1}{4} \lambda a^2b) \\[10pt]
    &= \tfrac{2}{3} \lambda (a^3 + b^3) + \tfrac{1}{2} \lambda (a^2b + ab^2) \\[10pt]
    &= \tfrac{2}{3} \lambda (a + b) (a^2 - ab + b^2) + \tfrac{1}{2} \lambda (a + b)ab \\[10pt]
    &= \lambda \cdot 2(a + b) \cdot \left ( \tfrac{1}{3} (a^2 - ab + b^2) + \tfrac{1}{4} ab \right ) \\[10pt]
    &= M \left ( \tfrac{1}{3} (a^2 - ab + b^2) + \tfrac{1}{4} ab \right )
\end{align}
$$

<br>

### Moment of Inertia About Central Diameter

**TODO**

<br>

## Special Case: Square

$a = b = s$.

### Moment of Inertia About Central Axis

$$
I = M \left ( \tfrac{1}{3} s^2 + \tfrac{1}{4} s^2 \right ) = \tfrac{7}{12} M s^2
$$



<!-- 
## Parametarizing the Curve

Again, we have 4 different curves we need to parameterize

$$
\b{\ell}_1(t) = \frac{a}{2} t \; \u{x} - \frac{b}{2} \; \u{y}
\qquad\qquad
\b{\ell}_2(t) = \frac{a}{2} \; \u{x} + \frac{b}{2} t \; \u{y}
\qquad\qquad
\b{\ell}_3(t) = - \frac{a}{2} t \; \u{x} + \frac{b}{2} \; \u{y}
\qquad\qquad
\b{\ell}_4(t) = - \frac{a}{2} \; \u{x} - \frac{b}{2} t \; \u{y}
$$

$$
d\b{\ell}_1 = \frac{a}{2} \; dt \; \u{x}
\qquad\qquad
d\b{\ell}_2 = \frac{b}{2} \; dt \; \u{y}
\qquad\qquad
d\b{\ell}_3 = -\frac{a}{2} \; dt \; \u{x}
\qquad\qquad
d\b{\ell}_4 = -\frac{b}{2} \; dt \; \u{y}
$$

$$
d\ell_1 = \abs{d \b{\ell}_1 } = \frac{a}{2} \; dt
\qquad\qquad
d\ell_2 = \abs{d \b{\ell}_2 } = \frac{b}{2} \; dt
\qquad\qquad
d\ell_3 = \abs{d \b{\ell}_3 } = \frac{a}{2} \; dt
\qquad\qquad
d\ell_4 = \abs{d \b{\ell}_4 } = \frac{b}{2} \; dt
\qquad\qquad
$$

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \lambda \int d\ell \\[10pt]
    &= \lambda \left ( \int_{\ell_1} d\ell_1 + \int_{\ell_2} d\ell_2 + \int_{\ell_3} d\ell_3 + \int_{\ell_4} d\ell_4 \right ) \\[10pt]
    &= \lambda \left ( \int_{-1}^{1} \frac{a}{2} dt + \int_{-1}^{1} \frac{b}{2} dt + \int_{-1}^{1} \frac{a}{2} dt + \int_{-1}^{1} \frac{b}{2} dt \right ) \\[10pt]
    &= \lambda \left ( 2 \cdot \frac{a}{2} + 2 \cdot \frac{b}{2} + 2 \cdot \frac{a}{2} + 2 \cdot \frac{b}{2} \right ) \\[10pt]
    &= \lambda \cdot 2 \left (a + b \right )
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \lambda \int r_{axis}^2 d\ell \\[10pt]
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \lambda \int r_{axis}^2 d\ell \\[10pt]
\end{align}
$$ -->