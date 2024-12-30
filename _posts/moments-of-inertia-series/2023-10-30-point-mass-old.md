---
layout:     series
title:      "Point Mass (Alternative Formulation)"
date:       3023-10-30
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       52
series:     moments-of-inertia
tags:       moments-of-inertia
draft:      true
---

**TODO**

This is a bit of a weird post. It didn't feel appropriate to put into the background, but technically a point mass isn't a curve. The purpose of this post is to first act as an easy example of the application of the parallel axis theorem, and second show a reformulation of the parallel axis theorem that will be used

There are two ways to analyze the moment of inertia of an object: coordinate dependent or coordinate independent. When I gave the definition of the moment of inertia of a point mass, this formula was expressed as coordinate _independent_

$$
I = mR^2
$$

This formula only depends on the geometry of the system, i.e. the distance of the point mass relative to the axis of rotation. On the other hand, when I write down the inertia tensor, I am implicitly assuming a $\text{3D}$ Cartesian coordinate system.

$$
\m{I} = 
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & mR^2 & 0 \\
    0 & 0 & 0
\end{bmatrix}
$$

## Another formulations

$$
\m{I} = m
\begin{bmatrix}
    y^2 + z^2 & - x y & - x z \\
    - y x & z^2 + x^2 & - y z \\
    - z x & - z y & x^2 + y^2
\end{bmatrix}
$$

The reason this is the way people write it is because it's easy for computers to use. However, there is another to formulate this that I think in some ways is even more elegant. Consider the following.



In the right figure, $\alpha_x$, $\alpha_y$, and $\alpha_z$ are the angles of the vector $\b{r}$ to the $x$, $y$, and $z$ axes, respectively. Using some geometry, you can prove that.

$$
\begin{align}
    R \sin \alpha_x &= y^2 + z^2
    &
    R \cos \alpha_x &= x
    \\[10pt]
    R \sin \alpha_y &= z^2 + x^2
    &
    R \cos \alpha_y &= y
    \\[10pt]
    R \sin \alpha_z &= x^2 + y^2
    &
    R \cos \alpha_z &= z
\end{align}
$$

Therefore, we can refactor the inertia tensor as the following.

$$
\m{I} =
mR^2
\begin{bmatrix}
    \sin^2 \alpha_x & - \cos \alpha_x \cos \alpha_y & - \cos \alpha_x \cos \alpha_z \\
    - \cos \alpha_y \cos \alpha_x & \sin^2 \alpha_y & - \cos \alpha_y \cos \alpha_z \\
    - \cos \alpha_z \cos \alpha_x & - \cos \alpha_z \cos \alpha_y & \sin^2 \alpha_z
\end{bmatrix}
$$

We can write this more compactly as the following

$$
\m{I} = mR^2 (\m{\mathbb{I}} - \cos(\b{\alpha}) \otimes \cos(\b{\alpha}))
$$

where

$$
\b{\alpha} = [\alpha_x \ \alpha_y \ \alpha_z]^T
$$