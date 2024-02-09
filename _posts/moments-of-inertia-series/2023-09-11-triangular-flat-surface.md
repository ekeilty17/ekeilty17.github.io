---
layout:     series
title:      "Triangular Flat Surface"
date:       2023-09-11
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       10
series:     moments-of-inertia
tags:       moments-of-inertia
excerpt_separator: <!--more-->
---

## Parametarizing the Surface

$$
\b{r}(t, q) = \tfrac{1}{2} b t \; \u{x} + hq \; \u{y}
$$

$$
\frac{\partial \b{r}}{\partial t} = \tfrac{1}{2} b \; \u{x}
\qquad
\frac{\partial \b{r}}{\partial q} = h \; \u{y}
$$

$$
d \b{A} = \frac{\partial \b{r}}{\partial t} dt \times \frac{\partial \b{r}}{\partial q} dq = \tfrac{1}{2} b h \; dt \; dq
$$

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \sigma \int dA \\[10pt]
    &= \sigma \int_{-1}^{1} \int_{0}^{1} \tfrac{1}{2} b h \; dt \; dq \\[10pt]
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