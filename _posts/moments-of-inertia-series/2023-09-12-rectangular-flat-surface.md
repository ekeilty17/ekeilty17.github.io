---
layout:     series
title:      "Rectangular Flat Surface"
date:       2023-09-12
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       11
series:     moments-of-inertia
tags:       moments-of-inertia
excerpt_separator: <!--more-->
---

## Parametarizing the Surface

We can do this with just standard Cartesian coordinates

$$
\b{r}(x, y) = x \; \u{x} + y \; \u{y}
$$

Therefore

$$
dA = dx \; dy
$$

## Mass

$$
\begin{align}
    M &= \int \; dm \\[10pt]
    &= \sigma \int \; dA \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \int_{-b/2}^{b/2} dx \; dy \\[10pt]
    &= \sigma \left ( \int_{-a/2}^{a/2} dx \right ) \left ( \int_{-b/2}^{b/2} dy \right ) \\[10pt]
    &= \sigma (a) (b) \\[10pt]
    &= \sigma \cdot ab
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \sigma \int r_{axis}^2 \; dA \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \int_{-b/2}^{b/2} (x^2 + y^2) \; dx \; dy \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} (b x^2 + \tfrac{1}{12} b^3) \; dx \\[10pt]
    &= \sigma \left ( \frac{1}{12}a^3 b + \frac{1}{12} a b^3 \right ) \\[10pt]
    &= \sigma \cdot \frac{1}{12} ab (a^2 + b^2) \\[10pt]
    &= \frac{1}{12} M (a^2 + b^2)
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

assume the axis of rotation is on the $x$-axis

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \sigma \int r_{axis}^2 \; dA \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \int_{-b/2}^{b/2} y^2 \; dx \; dy \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \tfrac{1}{12} b^3 \; dx \\[10pt]
    &= \sigma \left ( \frac{1}{12} a b^3 \right ) \\[10pt]
    &= \sigma \cdot \frac{1}{12} ab \cdot b^2 \\[10pt]
    &= \frac{1}{12} M b^2
\end{align}
$$