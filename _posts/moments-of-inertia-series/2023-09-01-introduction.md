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

Originally, I created this series as an excuse to evaluate some fun integrals and draw pretty diagrams. However, as I wrote and researched I feel that there is a hole in explanations on this subject. In online resources, you will either find just assertions of formulae for various geometric objects [[1](https://scienceworld.wolfram.com/physics/MomentofInertia.html)], high-level explanations that only calculate a few examples [[2](https://phys.libretexts.org/Courses/Joliet_Junior_College/Physics_201_-_Fall_2019v2/Book%3A_Custom_Physics_textbook_for_JJC/11%3A_Rotational_Kinematics_Angular_Momentum_and_Energy/11.06%3A_Calculating_Moments_of_Inertia)], or graduate-level theory [[3](https://ocw.mit.edu/courses/16-07-dynamics-fall-2009/dd277ec654440f4c2b5b07d6c286c3fd_MIT16_07F09_Lec26.pdf)]. 

In this series, I want to unify all of these types of resources. I want to derive each the inertia tensor for a wide variety of interesting shapes in a way that is accessible to someone comfortable with basic vector calculus. Then I want to show how these can be manipulated and combined in order to calculate the moment of inertia for more complicated systems.

<br>

## What is a Moment?

It's a bit of a meme in physics that everyone thinks they understand moments until they are asked to explain them. Many resources say _"a moment is a mathematical expression involving the product of a distance and physical quantity"_, which at first is laughably vague, but the more you study physics the better of a description it becomes.

At the most basic level, we observe that objects with mass have an intrinsic resistance to change. Elegantly summarized as [Newton's First Law of Motion](https://www.khanacademy.org/science/physics/forces-newtons-laws/newtons-laws-of-motion/a/what-is-newtons-first-law#:~:text=Newton's%20first%20law%3A%20An%20object,the%20status%20quo%20of%20motion.): _An object at rest remains at rest, and an object in motion remains in motion_. This is true for both translation and rotation. The **moment of inertia** is the mathematical quantity that measures an object's resistance to change in rotational motion. An object's mass is to translational motion as the object's moment of inertia is to rotational motion. We can see this symmetry in the formulas for force and linear momentum compared to torque and angular momentum.

$$
\begin{align}
    &F = m a
    &\qquad\qquad&
    \tau = I \alpha \\[10pt]
    &p = m v
    &\qquad\qquad&
    L = I \omega
\end{align}
$$

For more detail, the physics YouTuber Andrew Dotson has good videos on where the concept of a "moment" comes from and its interpretation ([part 1](https://www.youtube.com/watch?v=0flh8ovhZ9k) and [part 2](https://www.youtube.com/watch?v=k24FnV3myO4)). I will also give my formulation of the moment of inertia in the [next post](/blog/moments-of-inertia/definition-of-a-moment).

<br>

## Prerequisites

### Vector Calculus

This series is going to require the computation of integrals. However, due to the setup, these integrals will be essentially trivial. The complexity will actually be in setting up the correct integral. Therefore, I highly recommend the reader has studied multivariable/vector calculus at one point. I will do my best to make this accessible to those who have not. 

If you have never studied vector calculus, the first chapter of David Griffiths' [Introduction to Electrodynamics](https://hansandcassady.org/David%20J.%20Griffiths-Introduction%20to%20Electrodynamics-Addison-Wesley%20(2012).pdf) has an excellent synopsis of this subject. Otherwise, any textbook or lecture videos will probably do.

### Trigonometry

Setting up these integrals is going to require a good understanding of geometry and trigonometry. I am going to assume the reader is very comfortable with trigonometry and its identities (as to not belabor over every minute detail). If this is not the case, I have a series on [trigonometry](/blog/trigonometry).

Finally, to prevent repetition in proofs, I will assert some trigonometric integrals. I leave it as an exercise to the reader to prove these results.

$$
\begin{align}
    &\int_{0}^{2\pi} \cos \theta \; d \theta \ \ = \int_{0}^{2\pi} \sin \theta \; d \theta = 0
    &\qquad\qquad&
    \int_{0}^{\pi} \cos \theta \; d \theta = 0
    &&
    \int_{0}^{\pi} \sin \theta \; d \theta = 2
    \\[10pt]
    &\int_{0}^{2\pi} \cos^2 \theta \; d \theta = \int_{0}^{2\pi} \sin^2 \theta \; d \theta = \pi
    &\qquad\qquad&
    \int_{0}^{\pi} \cos^2 \theta \; d \theta = \frac{\pi}{2}
    &&
    \int_{0}^{\pi} \sin^2 \theta \; d \theta = \frac{\pi}{2}
    \\[10pt]
    &\int_{0}^{2\pi} \cos^3 \theta \; d \theta = \int_{0}^{2\pi} \sin^3 \theta \; d \theta = 0
    &\qquad\qquad&
    \int_{0}^{\pi} \cos^3 \theta \; d \theta = 0
    &&
    \int_{0}^{\pi} \sin^3 \theta \; d \theta = \frac{4}{3}
\end{align}
$$