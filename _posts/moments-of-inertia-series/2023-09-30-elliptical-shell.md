---
layout:     series
title:      "Elliptical Shell"
date:       2023-09-30
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       29
series:     moments-of-inertia
tags:       moments-of-inertia, shell
---

This is actually impossible to evaluate

## Parametarizing the Surface

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
d \b{A} = \frac{\partial \b{r}}{\partial \theta} \times \frac{\partial \b{r}}{\partial \phi} 
= (bc \; \sin^2 \theta \; \cos \phi) \; \u{x}
+ (- ac \; \sin^2 \theta \; \sin \phi) \; \u{y}
+ (- ab \sin \theta \; \cos \theta \; \cos^2 \phi - ab \sin \theta \; \cos \theta \; \sin^2 \phi) \; \u{z}
$$

$$
\begin{align}
    dA &= \abs{d \b{A}} \\[10pt]
    &= \sqrt{ (bc \; \sin^2 \theta \; \cos \phi)^2 + (ac \; \sin^2 \theta \; \sin \phi)^2 + (ab \sin \theta \; \cos \theta \; \cos^2 \phi + ab \sin \theta \; \cos \theta \; \sin^2 \phi)^2 } \\[10pt]
    &= \sqrt{ (bc \; \sin^2 \theta \; \cos \phi)^2 + (ac \; \sin^2 \theta \; \sin \phi)^2 + a^2b^2\sin^2 \theta \; \cos^2 \theta } \\[10pt]
\end{align}
$$


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
$$