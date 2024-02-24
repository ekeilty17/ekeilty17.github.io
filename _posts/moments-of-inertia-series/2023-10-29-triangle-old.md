---
layout:     series
title:      "Triangle"
date:       2023-09-29
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       51
series:     moments-of-inertia
tags:       moments-of-inertia
---



**TODO** Move to extras

It takes some geometry, but you can show that

$$
h = \frac{1}{2b} \sqrt{(a^2+b^2+c^2)^2 - 2(a^4+b^4+c^4)}
$$

This is very related to Heron's formula for the area of a triangle

$$
\begin{align}
    I &= I_1 + I_2 + I_3 \\[10pt]
    &= (\tfrac{1}{3} M_1 a^2) + (\tfrac{1}{12} M_2 b^2 + M_2 h^2) + (\tfrac{1}{3} M_3 c^2) \\[10pt]
    &= (\tfrac{1}{3} \lambda a^3) + (\tfrac{1}{12} \lambda b^3 + \lambda b h^2) + (\tfrac{1}{3} \lambda c^3) \\[10pt]
    &= \tfrac{1}{3} \lambda \left ( a^3 + \tfrac{1}{4}b^3 + c^3 + \tfrac{3}{2} ( (a^2+b^2+c^2)^2 - 2(a^4+b^4+c^4) ) \ \right )
\end{align}
$$

<br>

## Isosceles Triangle

This is a special case where $a = c$ which gives. However, it's more common to express this in terms of its base and height.

$$
I = \tfrac{1}{12} \lambda \left ( 8a^3 + b^3 + 12bh^2 \ \right )
$$

<br>

## Equilateral Triangle

This is a special case where $a = c$ which gives. However, it's more common to express this in terms of its base and height.

$$
h = \frac{1}{2s} \sqrt{(3s^2)^2 - 2(3s^4)} = \tfrac{\sqrt{3}}{2} s
$$

$$
I = \tfrac{1}{12} \lambda \left ( 9s^3 + 6\sqrt{3} s^3 \ \right ) = \lambda \tfrac{3 + 2\sqrt{3}}{4} s^3
$$

Triangles are way more complicated than they should be. I'm also not helping myself because I'm going to try go do this as generally as possible.

## Parameterizing the Curve

We actually have 3 curves that we need to parameterize. There are a bunch of ways to do this, but the method I am using is for a reason

$$
\b{\ell}_1(t) = -at \; \u{x} + ht \; \u{y}
\qquad\qquad
\b{\ell}_2(t) = -a(1 - t) \; \u{x} + h \; \u{y}
\qquad\qquad
\b{\ell}_3(t) = bt \; \u{x} + h \; \u{y}
\qquad\qquad
\b{\ell}_4(t) = b(1-t) \; \u{x} + h(1-t) \; \u{y}
$$

I would have parameterized the curve in terms of $x$ or $y$. For example, $\b{\ell}_1(x) = x \; \u{x} + \frac{2h}{b}x \; \u{y}$ and $\b{\ell}_1(y) = \frac{b}{2h}y \; \u{x} + y \; \u{y}$. However, by choosing an independent parameter $t$, I've removed the dimensionality of the problem.

$$
d\b{\ell}_1 = -a \; dt \; \u{x} + h \; dt \; \u{y}
\qquad\qquad
d\b{\ell}_2 = a \; dt \; \u{x}
\qquad\qquad
d\b{\ell}_3 = b \; dt \; \u{x}
\qquad\qquad
d\b{\ell}_4 = -b \; dt \; \u{x} - h \; dt \; \u{y}
$$

Finally

$$
d\ell_1 = \abs{d \b{\ell}_1 } = \sqrt{a^2 + h^2} \; dt
\qquad\qquad
d\ell_2 = \abs{d \b{\ell}_2 } = a \; dt
\qquad\qquad
d\ell_3 = \abs{d \b{\ell}_3 } = b \; dt
\qquad\qquad
d\ell_4 = \abs{d \b{\ell}_4 } = \sqrt{b^2 + h^2} \; dt
$$

<br>

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \lambda \int d\ell \\[10pt]
    &= \lambda \left ( \int d\ell_1 + \int d\ell_2 + \int d\ell_3 +  \int d\ell_4 \right ) \\[10pt]
    &= \lambda \left ( \int_{0}^{1} \sqrt{a^2 + h^2} \; dt + \int_{0}^{1} a \; dt + \int_{0}^{1} b \; dt + \int_{0}^{1} \sqrt{b^2 + h^2} \; dt \right ) \\[10pt]
    &= \lambda \left ( \sqrt{a^2 + h^2} + a + b + \sqrt{b^2 + h^2} \right )
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \lambda \int r_{axis}^2 d\ell \\[10pt]
    &= \lambda \left ( \int r_{axis}^2 d\ell_1 + \int r_{axis}^2 d\ell_2 + \int r_{axis}^2 d\ell_3 +  \int r_{axis}^2 d\ell_4 \right ) \\[10pt]
    &= \lambda \Big ( \int_{0}^{1} (a^2t^2 + h^2t^2) \; \sqrt{a^2 + h^2} \; dt + \int_{0}^{1} (a^2(1-t)^2 + h^2) \; a \; dt \\[10pt]
    &\qquad\qquad + \int_{0}^{1} (b^2t^2 + h^2) \; b \; dt + \int_{0}^{1} (b^2(1-t)^2 + h^2(1-t)^2) \; \sqrt{b^2 + h^2} \; dt \Big ) \\[10pt]
    &= \lambda \Big ( \tfrac{1}{3}(a^2 + h^2) \; \sqrt{a^2 + h^2} + (\tfrac{1}{3}a^2 + h^2) \; a \\[10pt]
    &\qquad\qquad + (\tfrac{1}{3}b^2 + h^2) \; b + \tfrac{1}{3}(b^2 + h^2) \; \sqrt{b^2 + h^2}\Big ) \\[10pt]
    &= \lambda \left ( \tfrac{1}{3}(a^2 + h^2)^{3/2} + \tfrac{1}{3}(b^2 + h^2)^{3/2} + \tfrac{1}{3}(a^2 + b^2) + 2h^2 \right ) \\[10pt]
    &= \lambda \left ( \tfrac{1}{3}s_1^3 + \tfrac{1}{3} s_3^3 \right )
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \lambda \int r_{axis}^2 d\ell \\[10pt]
\end{align}
$$