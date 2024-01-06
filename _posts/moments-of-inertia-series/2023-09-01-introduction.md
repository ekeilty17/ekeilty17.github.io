---
layout:     series
title:      "Introduction"
date:       2022-10-01
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       0
series:     moments-of-inertia
tags:       introduction
---

## Motivation

Really, this is all just an excuse to do integrals.

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

The moment of inertia is defined as the following. In this integral, $r$ is the distance of each point in the object from the axis of rotation.

$$
I = \int r^2 \; dm
$$

Another important property is the linearity of moments of inertia. If we can decompose an object into $n$ simpler geometries, then

$$
I = \sum_{i = 1}^n I_i
$$