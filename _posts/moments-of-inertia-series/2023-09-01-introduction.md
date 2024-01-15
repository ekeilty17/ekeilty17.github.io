---
layout:     series
title:      "Introduction"
date:       2023-09-01
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       0
series:     moments-of-inertia
tags:       moments-of-inertial, introduction
---

## Motivation

Calculating the moment of interia requires the computation of integrals over a 3-dimensional geometric object. They serve as a good introduction to this integration technique (which becomes second nature in advanced physics), and it's an excuse to create pretty diagrams.

<!-- view/h=-70,hide axis,colormap/blackwhite,domain=-5:5,domain y=-5:5,mark size=1pt,clip mode=individual,mark layer=like plot -->
<!-- Absolutely beautiful Tikz drawings for moments of inertia
https://tikz.net/dynamics_moment_of_inertia/ -->

<br>

## What is a Moment?

It's a bit of a meme in physics that everyone thinks they understand moments until they are asked to explain them. 

At the most basic level, we know that (for some reason) objects with mass have an intrinsic resistance to change. Elegantly summarized as **Newton's First Law of Motion**: "An object at rest remains at rest, and an object in motion remains in motion". This is true for both translation and rotation. The **moment of inertia** is the mathematical object that tells us how exactly a particular object resists change in its motion. 

This explanation tells us how to use a moment in physics calculations, but it does not tell us _what a moment is_. Many resources say "a moment is a mathematical expression involving the product of a distance and physical quantity", which at first is laughably vague, but then once you study moments you realize it's actually not that bad of a description. A more enlightening description is that a moment is "a measure of an object's tendency to rotate about a specific axis".

The physics YouTuber Andrew Dotson has good videos if you have to really understand where the concept of a "moment" comes from and what exactly they are in more detail ([part 1](https://www.youtube.com/watch?v=0flh8ovhZ9k) and [part 2](https://www.youtube.com/watch?v=k24FnV3myO4)).

<br>

## Definition of a Moment

For an arbitrary geometry, its mass can be calculated by the following integral.

$$
M = \int dm
$$

You have to be careful because depending on if it's a 2D surface or a 3D object, this integral is more complicated than it looks.

Let $\b{r}$ denote the position of a point on an object relative to a fixed origin. Let $\u{\omega}$ represent the direction of the fixed axis of rotation. Then, the moment of inertia is defined as the following.

$$
I = \int \lvert \b{r} \times \u{\omega} \rvert^2 \; dm
$$

However, other resources typically don't express this in terms of vectors. You will instead see the following definition, where $r_{axis} = \lvert \b{r} \times \u{\omega} \rvert$ is the distance of a given point in the object from the axis of rotation.

$$
I = \int r_{axis}^2 \; dm
$$

More annoyingly, resources online will neglect the subscript and simply write $I = \int r^2 \; dm$. I think this is terrible notation because it because very easy to comflate this with the position vector.

Another important property is the linearity of moments of inertia. If we can decompose an object into $n$ simpler geometries, then

$$
I = \sum_{i = 1}^n I_i
$$

To fully describe the inertia of an object, we define the following is a tensor, which can be used to find the moment of inertia about any axis.

$$
I = \begin{bmatrix}
    I_{xx} & -I_{xy} & -I_{xz} \\
    -I_{yx} & I_{yy} & -I_{yz} \\
    -I_{zx} & -I_{zy} & I_{zz}
\end{bmatrix}
$$

However, in this series we will always fix a defined axis, which means the moment of inertia is going to be a scalar value.

<br>

## Coordinate Systems

The vector $\b{r}$ always represents the coordinates of a point with respect to a fixed origin. There are different ways 

### Cartesian Coordinates

$$
\b{r} = x \u{x} + y \u{y} + z \u{z}
\qquad\qquad
d \b{\ell} = d x \u{x} + d y \u{y} + d z \u{z}
$$

### Cylindrical Coordinates 

$$
\b{r} = s \u{s} + z \u{z}
\qquad\qquad
d \b{\ell} = ds \u{s} + s d \phi \u{\phi} + z \u{z}
$$

$$
\begin{cases}
    x = s \ \cos \phi \\
    y = s \ \sin \phi \\
    z = z
\end{cases}
\qquad\qquad
\begin{cases}
    \u{x} = \cos \phi \ \u{s} - \sin \phi \ \u{\phi} \\
    \u{y} = \sin \phi \ \u{s} + \cos \phi \ \u{\phi} \\
    \u{z} = \u{z}
\end{cases}
$$

$$
\begin{cases}
    s    = \sqrt{x^2 + y^2} \\
    \phi = \arctan(y / x) \\
    z    = z
\end{cases}
\qquad\qquad
\begin{cases}
    \u{s}    = \cos \ \phi \u{x} + \sin \phi \ \u{y} \\
    \u{\phi} = - \sin \ \phi \u{x} + \cos \phi \ \u{y} \\
    \u{z}    = \u{z}
\end{cases}
$$

### Spherical Coordinates

$$
\b{r} = r \hat{\b{r}}
\qquad\qquad
d \b{\ell} = dr \u{r} + r d \theta \u{\theta} + r \sin \theta d \phi \u{\phi}
$$

$$
\begin{cases}
    x = r \ \sin \theta \ \cos \phi \\
    y = r \ \sin \theta \ \sin \phi \\
    z = r \cos \theta
\end{cases}
\qquad\qquad
\begin{cases}
    \u{x} = \sin \theta \ \cos \phi \ \u{r} + \cos \theta \cos \phi \ \u{\theta} - \sin \phi \ \u{\phi} \\
    \u{y} = \sin \theta \ \sin \phi \ \u{r} + \cos \theta \sin \phi \ \u{\theta} + \cos \phi \ \u{\phi} \\
    \u{z} = \cos \theta \ \u{r} - \sin \theta \ \u{\theta}
\end{cases}
$$

$$
\begin{cases}
    r      = \sqrt{x^2 + y^2 + z^2} \\
    \theta = \arctan(\sqrt{x^2 + y^2} / z) \\
    \phi   = \arctan(y / x)
\end{cases}
\qquad\qquad
\begin{cases}
    \u{r}      = \sin \theta \ \cos \phi \ \u{x} + \sin \theta \sin \phi \ \u{y} + \cos \theta \ \u{z} \\
    \u{\theta} = \cos \theta \ \cos \phi \ \u{x} + \cos \theta \sin \phi \ \u{y} - \sin \theta \ \u{z} \\
    \u{\phi}   = - \sin \phi \ \u{x} + \cos \phi \ \u{y}
\end{cases}
$$

<br>

## Trigonmetric Integrals

To prevent repetition, I will assert some trig integrals. I leave it as an exercise to the reader to prove these results

$$
\int_{0}^{2\pi} \cos \theta \; d \theta = \int_{0}^{2\pi} \sin \theta \; d \theta = 0
$$

$$
\int_{0}^{2\pi} \cos^2 \theta \; d \theta = \int_{0}^{2\pi} \sin^2 \theta \; d \theta = \pi
$$

$$
\int_{0}^{2\pi} \cos^3 \theta \; d \theta = int_{0}^{2\pi} \sin^3 \theta \; d \theta = 0
$$

$$
\int_{0}^{\pi} \cos \theta \; d \theta = 0
\qquad\qquad
\int_{0}^{\pi} \sin \theta \; d \theta = 2
$$

$$
\int_{0}^{\pi} \cos^2 \theta \; d \theta = \int_{0}^{\pi} \sin^2 \theta \; d \theta = \frac{1}{2} \pi
$$

$$
\int_{0}^{\pi} \cos^3 \theta \; d \theta = 0
\qquad\qquad
int_{0}^{\pi} \sin^3 \theta \; d \theta = \frac{4}{3}
$$