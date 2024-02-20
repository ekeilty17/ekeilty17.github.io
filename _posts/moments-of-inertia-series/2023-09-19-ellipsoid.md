---
layout:     series
title:      "Ellipsoid"
date:       2023-09-19
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       18
series:     moments-of-inertia
tags:       moments-of-inertia, ball
---

$a = b > c$: oblate spheroid

$a = b < c$: prolate spheroid

$a > b > c$: scalene spheroid

<br>

## Parameterizing the Volume

We use modified spherical coordinates, which we have to express in Cartesian coordinates.

$$
\b{r}(t, \theta, \phi) = at \sin \theta \; \cos \phi \; \u{x} + bt \sin \theta \sin \phi \; \u{y} + ct \cos \theta \; \u{z} \\[10pt]
V = \{ \b{r}(t, \theta, \phi) \ : \ 0 \leq t \leq 1 \quad 0 \leq \theta \leq \pi \quad 0 \leq \phi < 2\pi \}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial t} dt = (a \sin \theta \cos \phi \; \u{x} + b \sin \theta \sin \phi \; \u{y} + c \cos \theta \; \u{z}) dt
\\[10pt]
\frac{\partial \b{r}}{\partial \theta} d\theta = (at \cos \theta \cos \phi \; \u{x} + bt \cos \theta \sin \phi \; \u{y} - ct \sin \theta \; \u{z}) d\theta
\\[10pt]
\frac{\partial \b{r}}{\partial \phi} d\phi = (- at \sin \theta \sin \phi \; \u{x} + bt \sin \theta \cos \phi \; \u{y}) d\phi
$$

This is pretty nasty because we have to do everything in Cartesian coordinates.

$$
\begin{align}
    dV &= \left \lvert \begin{array}{ccc}
        a \sin \theta \cos \phi \; dt & b \sin \theta \sin \phi \; dt & c \cos \theta \; dt \\
        at \cos \theta \cos \phi \; d\theta & bt \cos \theta \sin \phi \; d\theta & - ct \sin \theta \; d\theta \\
        - at \sin \theta \sin \phi \; d\phi & bt \sin \theta \cos \phi \; d\phi & 0
    \end{array} \right \rvert 
    \\[10pt]

    &= (- at \sin \theta \sin \phi \; d\phi) \cdot \left \lvert \begin{array}{cc}
        b \sin \theta \sin \phi \; dt & c \cos \theta \; dt \\
        bt \cos \theta \sin \phi \; d\theta & - ct \sin \theta \; d\theta
    \end{array} \right \rvert
    - (bt \sin \theta \cos \phi \; d\phi) \cdot \left \lvert \begin{array}{cc}
        a \sin \theta \cos \phi \; dt & c \cos \theta \; dt \\
        at \cos \theta \cos \phi \; d\theta & - ct \sin \theta \; d\theta
    \end{array} \right \rvert
    + (0) \cdot \left \lvert \begin{array}{cc}
        b \sin \theta \sin \phi \; dt & c \cos \theta \; dt \\
        bt \cos \theta \sin \phi \; d\theta & - ct \sin \theta \; d\theta
    \end{array} \right \rvert
    \\[10pt]

    &= (- at \sin \theta \sin \phi \; d\phi) \left [ - bc \; t \; \sin^2 \theta \sin \phi \; dt \; d\theta - bc \; t \; \cos^2 \theta \sin \phi \; dt \; d\theta \right ]
    + (bt \sin \theta \cos \phi \; d\phi) \left [ ac \; t \; \sin^2 \theta \cos \phi \; dt \; d\theta + ac \; t \; \cos^2 \theta \cos \phi \; dt \; d\theta \right ]
    \\[10pt]

    &= abc \; t^2 \; \sin \theta \left [ (\sin^2 \theta + \cos^2 \theta) \sin^2 \phi + (\sin^2 \theta + \cos^2 \theta) \cos^2 \phi \right ] \; dt \; d\theta \; d\phi \\[10pt]
    &= abc \; t^2 \; \sin \theta \left [ \sin^2 \phi + \cos^2 \phi \right ] \; dt \; d\theta \; d\phi \\[10pt]
    &= abc \; t^2 \; \sin \theta \; dt \; d\theta \; d\phi
\end{align}
$$

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \rho \int dV \\[10pt]
    &= \rho \int_{0}^{1} \int_{0}^{\pi} \int_{0}^{2\pi} abc \; t^2 \; \sin \theta \; dt \; d\theta \; d\phi \\[10pt]
    &= \rho \cdot abc \left ( \int_{0}^{1} t^2 \; dt \right ) \left ( \int_{0}^{\pi} \sin \theta \; d\theta \right ) \left ( \int_{0}^{2 \pi} d\phi \right ) \\[10pt]
    &= \rho \cdot abc \left ( \frac{1}{3} \right ) \left ( 2 \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \rho \cdot \tfrac{4}{3} \pi abc
\end{align}
$$

<br>

## Moment of Inertia About Any Diameter

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \rho \int r_{axis}^2 \; dV \\[10pt]
    &= \rho \int_{0}^{1} \int_{0}^{\pi} \int_{0}^{2 \pi} (a^2 t^2 \sin^2 \theta \cos^2 \phi + b^2 t^2 \sin^2 \theta \sin^2 \phi) \; abc \; t^2 \sin \theta \; dt \; d\theta \; d\phi \\[10pt]
    &= \rho \cdot abc \left ( \int_{0}^{1} t^4 \; dt \right ) \left ( \int_{0}^{\pi} \sin^3 \theta \; d\theta \right ) \left ( \int_{0}^{2\pi} (a^2 \cos^2 \phi + b^2 \sin^2 \phi) d \phi \right ) \\[10pt]
    &= \rho \cdot abc \left ( \frac{1}{5} \right ) \left ( \frac{4}{3} \right ) \left ( \pi a^2 + \pi b^2 \right ) \\[10pt]
    &= \rho \cdot \tfrac{4}{15} \pi abc (a^2 + b^2) \\[10pt]
    &= \tfrac{1}{5} M (a^2 + b^2)
\end{align}
$$

<br>

## Inertia Tensor

$$
I = \begin{bmatrix}
    \frac{1}{5} M (b^2 + c^2) & 0 & 0 \\
    0  & \frac{1}{5} M (c^2 + a^2) & 0 \\
    0  & 0 & \frac{1}{5} M (a^2 + b^2)
\end{bmatrix}
= \tfrac{1}{5} M \begin{bmatrix}
    b^2 + c^2 & 0 & 0 \\
    0  & c^2 + a^2 & 0 \\
    0  & 0 & a^2 + b^2
\end{bmatrix}
$$