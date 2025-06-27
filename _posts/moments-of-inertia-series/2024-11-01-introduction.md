---
layout:     series
title:      "Introduction"
date:       2024-11-01
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       0
series:     moments-of-inertia
tags:       moments-of-inertial, introduction
---

## Motivation

Originally, I created this series as an excuse to evaluate some fun integrals and draw pretty diagrams. As I continued writing I really fell down a rabbit hole. Instead of climbing out, I kept digging until I came out the other side. Essentially, this series has become my collation, interpretation, and summarization of all the resources and information that I could find on moments of inertia as well as some of my own unique results. 

<!-- However, as I wrote and researched I feel that there is a hole in explanations on this subject. In online resources, you will either find just assertions of formulae for various geometric objects [[1](https://scienceworld.wolfram.com/physics/MomentofInertia.html)], high-level explanations that only calculate a few examples [[2](https://phys.libretexts.org/Courses/Joliet_Junior_College/Physics_201_-_Fall_2019v2/Book%3A_Custom_Physics_textbook_for_JJC/11%3A_Rotational_Kinematics_Angular_Momentum_and_Energy/11.06%3A_Calculating_Moments_of_Inertia)], or graduate-level theory [[3](https://ocw.mit.edu/courses/16-07-dynamics-fall-2009/dd277ec654440f4c2b5b07d6c286c3fd_MIT16_07F09_Lec26.pdf)].  -->

In this series, I first give the relevant physics and mathematical background necessary to compute moments of inertia. Then I derive the inertia tensor for various interesting shapes. I separate them into curves ($\text{1D}$ objects), surfaces ($\text{2D}$ objects), and volumes ($\text{3D}$ objects). Most of the posts after the _Background_ section are intended to be self-contained, so you can read them in any order. However, some of the more complicated shapes (such as triangles) will require results from previous posts. I will provide links when this is the case.

<br>

## What is a Moment?

It's a bit of a meme in physics that everyone thinks they understand moments until they are asked to explain them. Many resources say _"a moment is a mathematical expression involving the product of a distance and physical quantity"_, which at first is laughably vague, but the more you study physics the better of a description it becomes.

At the most basic level, we observe that objects with mass have an intrinsic resistance to change. Elegantly summarized as [Newton's First Law of Motion](https://www.khanacademy.org/science/physics/forces-newtons-laws/newtons-laws-of-motion/a/what-is-newtons-first-law#:~:text=Newton's%20first%20law%3A%20An%20object,the%20status%20quo%20of%20motion.): _An object at rest remains at rest, and an object in motion remains in motion_. This is true for both translation and rotation. The **moment of inertia** is the mathematical quantity that measures an object's resistance to change in rotational motion. An object's mass is to translational motion as the object's moment of inertia is to rotational motion. We can see this symmetry in the formulas for force and linear momentum compared to torque and angular momentum.

$$
\begin{align}
    &F = m a
    &\qquad\scriptsize{\text{(force, mass, acceleration)}}&
    &\quad\qquad&
    \tau = I \alpha
    &&\quad\scriptsize{\text{(torque, rotational inertia, angular acceleration)}}
    \\[10pt]
    &p = m v
    &\quad\scriptsize{\text{(momentum, mass, velocity)}}&
    &\qquad\qquad&
    L = I \omega
    &&\quad\scriptsize{\text{(angular momentum, rotational inertia, angular vecloty)}}
\end{align}
$$

For more detail, the physics YouTuber Andrew Dotson has good videos on where the concept of a "moment" comes from and its interpretation ([part 1](https://www.youtube.com/watch?v=0flh8ovhZ9k) and [part 2](https://www.youtube.com/watch?v=k24FnV3myO4)). I will also give my formulation of the moment of inertia in the [next post](/blog/moments-of-inertia/definition-of-the-mass-moment-of-inertia/).

<br>

## Prerequisites

### Vector Calculus

This series is going to require the computation of integrals. However, due to the setup, these integrals will be reasonably simple to compute. I am going to assume the reader is comfortable with standard integration techniques (e.g. the power rule).

The complexity in solving for the moment of inertia of an object will actually be parameterizing the object and setting up the corresponding integral, which requires vector calculus. Therefore, I highly recommend that the reader has studied vector calculus at one point (even if it was a while ago). The vector calculus is (usually) not difficult, so I will do my best to make the series accessible to those who have not. 

If you have never studied vector calculus, the first chapter of David Griffiths' [Introduction to Electrodynamics](https://hansandcassady.org/David%20J.%20Griffiths-Introduction%20to%20Electrodynamics-Addison-Wesley%20(2012).pdf) has an excellent synopsis of this subject. Otherwise, any textbook or lecture videos will probably do.

### Trigonometry

Setting up these integrals is going to require a good understanding of geometry and trigonometry. I am going to assume the reader is very comfortable with trigonometry and its identities (as to not belabor over every minute detail). If this is not the case, I have a series on [trigonometry](/blog/trigonometry).

To prevent repetition in proofs, I will assert some trigonometric integrals. I leave it as an exercise to the reader to prove these results (or just google it).

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

<br>

---

<br>

## Notation and Conventions

I really try my best to have good notation. Especially when you have scalars, vectors, and matrices mixing it is easy to get lost. Having good notation and conventions really speeds up understanding.

### Scalars

Any regular-font character is a **scalar**, e.g. $M$, $r$, or $\phi$. Latin characters ($a$, $b$, $c$, etc) will typically refer to lengths while Greek characters ($\alpha$, $\beta$, $\gamma$, etc) will typically refer to **angles**.

### Vectors

Any bold-face character is a **vector**, e.g. $\b{r}$ or $\b{\omega}$. Any bold-face character with a hat is a [unit vector](https://en.wikipedia.org/wiki/Unit_vector), e.g. $\u{x}$.

One definition of a vector is a mathematical object with a _magnitude_ and _direction_. We actually have good notation for both of these concepts. Given any vector $\b{v}$, it's magnitude is written $\abs{\b{v}}$, but is often denoted just by the unbolded character $v$ (since it is a scalar). Its direction is denoted by its unit vector $\u{v}$, which points in the same direction as $\b{v}$ but has magnitude $1$. We can relate all of these objects as follows.

$$
\u{v} = \frac{\b{v}}{\abs{\b{v}}} = \frac{\b{v}}{v}
\qquad\qquad
\b{v} = \abs{\b{v}} \; \u{v} = v \; \u{v}
$$

<!-- The variable $\b{r}$ will _always_ represent a vector whose tale is at the origin and whose tip is at the point of interest. This is called the **position vector**.  -->

### Matrices

Any regular-font capitalized character between square brackets is a **matrix**, e.g. $\m{A}$. Furthermore, in this series it all matrices will contain real-valued scalar elements, i.e. $\m{A} \in \mathbb{R}^{m \times n}$. Almost always, $m = n = 3$ since we will be dealing with objects living in $3\text{D}$ space.

The expression $\abs{A}$ denotes the [determinant](https://en.wikipedia.org/wiki/Determinant) of a matrix. If you don't already know what this is, then you should ([3Blue1Brown video](https://www.youtube.com/watch?v=Ip3X9LOh2dk)).

<!-- I will be using the notation $I_{\b{\omega}}$ and $\m{I}$ to refer to the moment of inertia of an object, and it is important to understand the difference. $I_{\b{\omega}}$ is a _scalar quantity_ refering to the moment of inertia with respect to some fixed axis of rotation $\b{\omega}$. $\m{I}$ refers to the **inertia tensor**, which is a _matrix quantity_ that describes the moment of inertia with respect to any axis. In particular,

$$
I_{\b{\omega}} = \u{\omega}^T \; \m{I} \; \u{\omega}
$$ -->

<br>

### Variable Convensions Summary

Given an object in $3\text{D}$ space, we have a plethora of ways to describe its position (see post on [coordinate systems](/blog/moments-of-inertia/coordinate-systems/)). The following variable conventions are used.
- $\b{r}$ is the **position vector** with respect to a fixed origin. Given any point in $3\text{D}$ space, it is the vector whose tail is at the origin and tip is at the object.
- $r = \abs{\b{r}}$ is the magnitude of the position vector, representing the distance of the object from the fixed origin.
- $x$, $y$, and $z$ refer to the object's respective Cartesian directions.
- $\theta$ and $\phi$ refer to the **polar angle** and **azimuthal angle**, respectively.
- $s$ is the **polar radius** in the $xy$ plane.

Given an object in $3\text{D}$ space, we have to describe its geometry. The following variable conventions are used.
- $\mathcal{G}$ refers to the entire given object.
- $M$ refers to the total mass of the given object
- $a$, $b$, and $c$ are fixed lengths in the $x$, $y$, and $z$ Cartesian direction, respectively. These can be used to refer to the length/width/height of a cuboid or the semi-axes of an ellipse.
- $R$ is a fixed radius of some circle.
- $L$ refers to the length of a line or rod/disc. Note that in some posts in the _Theory and Background_ section, $L$ will refer to **angular momentum**. I make a note to avoid confusion.
- $H$ refers to the height of a cone.

When computing line/surface/volumn integrals, I use the following variable conventions. See post on [vector integration](/blog/moments-of-inertia/vector-integration/) for more details.
- $dm$ refers to an infinitesimal mass.
- $d\ell$, $dA$, $dV$ refer to an infinitesimal length, area, and volume respectively.
- $\lambda$, $\sigma$, $\rho$ give the mass distribution per unit length, area, and volume, respectively.

When describing the moment of inertia I will use the following convensions.
- $\m{\mathbb{I}}$ refers to the inertia tensor
- $\b{\omega}$ refers to a fixed axis of rotation
- $I_{\b{\omega}}$ is a _scalar quantity_ refering to the moment of inertia with respect to some fixed axis of rotation $\b{\omega}$. Note that $I_{\b{\omega}} = \u{\omega}^T \; \m{I} \; \u{\omega}$ (we will discuss this more in a [future post](/blog/moments-of-inertia/inertia-tensor-derivation/)).
- $r_{\b{\omega}}$ refers to the **shortest distance** between a given point an the fixed axis of rotation $\b{\omega}$.

Finally, some miscellaneous variables.
- $\pi \approx 3.14159$ refers to the circle constant.
- $\m{\mathbb{I}}$ refers to the <span class="tooltip">identity matrix
    <span class="tooltiptext"> 
    $$
    \m{\mathbb{I}} = \begin{bmatrix}
        1 & 0 & \cdots & 0 \\
        0 & 1 & \cdots & 0 \\
        \vdots & \vdots & \ddots & \vdots \\
        0 & 0 & \cdots & 1
    \end{bmatrix}
    $$
    </span>
</span> (since $\m{I}$ is being used to denote the inertia tensor).

