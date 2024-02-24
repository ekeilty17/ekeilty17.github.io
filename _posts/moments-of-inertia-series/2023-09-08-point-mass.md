---
layout:     series
title:      "Point Mass (More Detail)"
date:       2023-09-08
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       7
series:     moments-of-inertia
tags:       moments-of-inertia
---

**TODO**

There are two ways to analyze the moment of inertia of an object: coordinate dependent or coordinate independent. When I gave the definition of the moment of inertia of a point mass, this formula was expressed as coordiante _independent_

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

The reason this is the way people write it is because it's easy for computers to use. However, there is another to formulate this that I think in some ways is even more elegant. 

$$
\m{I} =
mD^2
\begin{bmatrix}
    \sin^2 \alpha_x & - \cos \alpha_x \cos \alpha_y & - \cos \alpha_x \cos \alpha_z \\
    - \cos \alpha_y \cos \alpha_x & \sin^2 \alpha_y & - \cos \alpha_y \cos \alpha_z \\
    - \cos \alpha_z \cos \alpha_x & - \cos \alpha_z \cos \alpha_y & \sin^2 \alpha_z
\end{bmatrix}
$$

where $\alpha_x$, $\alpha_y$, and $\alpha_z$ are the angles of the vector $\b{r}_{\text{cm}}$ to the $x$, $y$, and $z$ axes, respectively.