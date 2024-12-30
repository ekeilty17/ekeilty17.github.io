---
layout:     series
title:      "Elliptical Shell (Impossible)"
date:       2024-11-23
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       22
series:     moments-of-inertia
tags:       moments-of-inertia, shell
---

This is actually impossible to evaluate

## Parameterizing the Surface

We use modified spherical coordinates, which we have to express in Cartesian coordiantes.

$$
\b{r}(\theta, \phi) = a \sin \theta \; \cos \phi \; \u{x} + b \sin \theta \sin \phi \; \u{y} + c \cos \theta \; \u{z}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial \theta} = a \cos \theta \; \cos \phi \; \u{x} + b \cos \theta \sin \phi \; \u{y} - c \sin \theta \; \u{z}
\qquad\qquad
\frac{\partial \b{r}}{\partial \phi} = a \sin \theta \; \sin \phi \; \u{x} - b \sin \theta \cos \phi \; \u{y}
$$


$$
\begin{align}
    d \b{A} &= \left ( \frac{\partial \b{r}}{\partial \theta} d\theta \right ) \times \left ( \frac{\partial \b{r}}{\partial \phi} d\phi \right ) \\[10pt]
    &= \left [ (bc \; \sin^2 \theta \; \cos \phi) \; \u{x}
    + (- ac \; \sin^2 \theta \; \sin \phi) \; \u{y}
    + (- ab \sin \theta \; \cos \theta \; \cos^2 \phi - ab \sin \theta \; \cos \theta \; \sin^2 \phi) \; \u{z}
    \right ] \; d\theta \; d\phi
\end{align}
$$

Now we compute.

$$
\begin{align}
    dA &= \abs{d \b{A}} \\[10pt]
    &=  \sqrt{ (bc \; \sin^2 \theta \; \cos \phi)^2 + (ac \; \sin^2 \theta \; \sin \phi)^2 + (ab \sin \theta \; \cos \theta \; \cos^2 \phi + ab \sin \theta \; \cos \theta \; \sin^2 \phi)^2 } \; d\theta \; d\phi \\[10pt]
    &= \sqrt{ (bc \; \sin^2 \theta \; \cos \phi)^2 + (ac \; \sin^2 \theta \; \sin \phi)^2 + (ab \sin \theta \; \cos \theta)^2 } \; d\theta \; d\phi \\[10pt]
    &= \sqrt{ (bc \; \sin \theta \; \cos \phi)^2 + (ac \; \sin \theta \; \sin \phi)^2 + (ab \cos \theta)^2 } \; \sin \theta \; d\theta \; d\phi \\[10pt]
\end{align}
$$

And here is where we get stuck. There's really nothing else we can do to further simplify this. Obviously there is no way we are going to be able to integrate this, so we can't evaluate any of the subsequent integrals.

<!-- 
## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \sigma \int dA \\[10pt]
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
\end{align}
$$ -->