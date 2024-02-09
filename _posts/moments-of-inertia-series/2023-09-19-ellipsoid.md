---
layout:     series
title:      "Ellipsoid"
date:       2023-09-19
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       18
series:     moments-of-inertia
tags:       moments-of-inertia, ball
excerpt_separator: <!--more-->
---

$a = b > c$: oblate spheroid.
$a = b < c$: prolate spheroid
$a > b > c$: scalene spheroid.

**TODO** This is probably wrong

## Parametarizing the Volume

We use modified spherical coordinates, which we have to express in Cartesian coordiantes.

$$
\b{r}(t, \theta, \phi) = at \sin \theta \; \cos \phi \; \u{x} + bt \sin \theta \sin \phi \; \u{y} + ct \cos \theta \; \u{z}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial t} = a \sin \theta \; \cos \phi \; \u{x} + b \sin \theta \sin \phi \; \u{y} + c \cos \theta \; \u{z}
\qquad\qquad
\frac{\partial \b{r}}{\partial \theta} = at \cos \theta \; \cos \phi \; \u{x} + bt \cos \theta \sin \phi \; \u{y} - ct \sin \theta \; \u{z}
\qquad\qquad
\frac{\partial \b{r}}{\partial \phi} = at \sin \theta \; \sin \phi \; \u{x} - bt \sin \theta \cos \phi \; \u{y}
$$

Now, we find the determinant of the Jacobian

$$
dV
= \left \lvert \begin{array}{}
\end{array} \right \rvert
$$

$$
dV = abc \; t^2 \; \sin \theta \; dt \; d\theta \; d\phi
$$

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \rho \int dV \\[10pt]
    &= \rho \int_{0}^{1} \int_{0}^{\pi} \int_{0}^{2\pi} abc \; t^2 \; \sin \theta \; dt \; d\theta \; d\phi \\[10pt]
    &= \rho \cdot abc \left ( \int_{0}^{1} t^2 \; dt \right ) \left ( \int_{0}^{\pi} \sin \theta \; d\theta \right ) \left ( \int_{0}^{2 \pi} d\phi \right ) \\[10pt]
    &= \rho \cdot abc \left ( \frac{1}{3} \right ) \left ( 2 \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \rho \cdot \frac{4}{3} \pi abc
\end{align}
$$

<br>

## Moment of Inertia About Any Diameter

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \rho \int r_{axis}^2 \; dV \\[10pt]
    &= \rho \int_{0}^{1} \int_{0}^{\pi} \int_{0}^{2 \pi} (r \sin \theta)^2 abc \; t^2 \sin \theta \; dt \; d\theta \; d\phi \\[10pt]
    &= \rho \cdot abc \left ( \int_{0}^{1} t^4 \; dt \right ) \left ( \int_{0}^{\pi} \sin^3 \theta \; d\theta \right ) \left ( \int_{0}^{2\pi} d \phi \right ) \\[10pt]
    &= \rho \cdot abc \left ( \frac{1}{5} \right ) \left ( \frac{4}{3} \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \rho \cdot \frac{8}{15} \pi abc \\[10pt]
    &= \frac{2}{5} M abc
\end{align}
$$