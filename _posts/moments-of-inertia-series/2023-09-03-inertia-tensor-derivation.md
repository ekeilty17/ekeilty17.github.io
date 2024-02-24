---
layout:     series
title:      "Inertia Tensor Derivation"
date:       2023-09-03
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       2
series:     moments-of-inertia
tags:       moments-of-inertia, intermediate-axis
---

In this post, I will derive the value of the inertia tensor from the definition of angular momentum. I've included this for completeness, but it's not required to understand the rest of the series.

**Caution**: In this post, the variable $\b{L}$ is referring to **angular momentum**. In all future posts, it will refer to length as angular momentum will never come up again. Please do not conflate these variables.

<br>

## Point Mass

As always, we start with a point mass $m$ at position $\b{r}$ moving around a fixed axis $\b{\omega}$. It's angular momentum is described by the equation.

$$
\b{L} = \b{r} \times \b{p} = \b{r} \times (m \b{v}) = m \left [ \b{r} \times (\b{\omega} \times \b{r}) \right ]
$$

Unlike our analysis in the [previous post](/blog/moments-of-inertia/definition-of-the-mass-moment-of-inertia), we cannot in general assume that $\b{r}$ is perpendicular to $\b{v}$. Thus, we use the [triple cross product identity](https://en.wikipedia.org/wiki/Triple_product).

$$
\b{a} \times (\b{b} \times \b{c}) = (\b{a} \cdot \b{c}) \b{b} - (\b{a} \cdot \b{b}) \b{c}
$$

Substituting in for $\b{a}$, $\b{b}$, and $\b{c}$ we get

$$
\b{L} = m \left [ r^2 \b{\omega} - (\b{r} \cdot \b{\omega}) \b{r} \right ]
$$

Let $\b{r} = x \; \u{x} + y \; \u{y} + z \; \u{z}$ and $\b{\omega} = \omega_x \; \u{x} + \omega_y \; \u{y} + \omega_z \; \u{z}$. Now, we are going to expand this out.

$$
\begin{align}
    \b{L}_x &= m \left [ r^2 \omega_x - (\b{r} \cdot \b{\omega}) x \right ] \; \u{x} \\[10pt]
    &= m \left [ r^2 \omega_x - (x \omega_x + y \omega_y + z \omega_z) x \right ] \; \u{x} \\[10pt]
    &= m \left [ (r^2 - x^2)\omega_x - xy \omega_y - xz \omega_z \right ] \; \u{x} \\[10pt]
    &= m \left [ (y^2 + z^2)\omega_x - xy \omega_y - xz \omega_z \right ] \; \u{x} \\[10pt]
\end{align}
$$

Of course, we can do exactly the same thing for the $y$ and $z$ components to get

$$
\b{L} = m \left [ ((y^2 + z^2)\omega_x - xy \omega_y - xz \omega_z) \; \u{x} 
            + (- yx \omega_x + (z^2 + x^2) \omega_y - yz \omega_z) \; \u{y} 
            + (- zx \omega_x - zy \omega_y + (x^2 + y^2)\omega_z) \; \u{z}
        \right ]
$$

There's a lot of repetition here. We can write this much more compactly as follow

$$
\b{L} = m
\begin{bmatrix}
    y^2 + z^2 & - xy & - xz \\
    - yx  & z^2 + x^2 & - yz \\
    - zx  & - zy & x^2 + y^2
\end{bmatrix}
\b{\omega}
= \m{I} \; \b{\omega}
$$

This matrix in the middle (along with the mass) is called the **inertia tensor**, usually denoted by $\m{I}$.

<br>

## A Collection of Particles

Suppose we have a collection of $n$ particles with mass $m_i$ at position $\b{r}_i$ all rotating around a fixed axis $\b{\omega}$. Since angular velocity is linear, we just add each particle's contribution

$$
\b{L} = \sum_{i=1}^n \b{L}_i = \sum_{i=1}^n m_i 
\begin{bmatrix}
    y_i^2 + z_i^2 & - x_iy_i & - x_iz_i \\
    - y_ix_i  & z_i^2 + x_i^2 & - y_iz_i \\
    - z_ix_i  & - z_iy_i & x_i^2 + y_i^2
\end{bmatrix}
\b{\omega}
$$

Notice that $\b{\omega}$ is the same for all particles, so we factor it out of the sum. This means we can sum all inertia tensors first in order to get an effective inertia tensor for the system

$$
\b{L} = \left ( \sum_{i=1}^n \m{I_i} \right ) \b{\omega} = \m{ I_{\text{system}} } \; \b{\omega}
$$

which means moments of inertias are additive.

<br>

## Rigid Body

Now suppose we have some rigid body $\mathcal{G}$ rotating around a fixed axis $\b{\omega}$. We think of this object as an continuous collection of point masses. In other words, we consider each infinitesmal mass and integrate along the geometry.

$$
\b{L} = \int_{\mathcal{G}} 
\begin{bmatrix}
    y^2 + z^2 & - xy & - xz \\
    - yx  & z^2 + x^2 & - yz \\
    - zx  & - zy & x^2 + y^2
\end{bmatrix}
\b{\omega} \; dm
= \left ( \int_{\mathcal{G}} 
\begin{bmatrix}
    y^2 + z^2 & - xy & - xz \\
    - yx  & z^2 + x^2 & - yz \\
    - zx  & - zy & x^2 + y^2
\end{bmatrix}
\; dm
\right ) \b{\omega}
$$

Just as in the system of particles, $\b{\omega}$ is constant and therefore can be factored out of the integral. Thus, we get the effective inertia tensor of the rigid body.

$$
\m{ I_{\mathcal{G}} } = \int_{\mathcal{G}} 
\begin{bmatrix}
    y^2 + z^2 & - xy & - xz \\
    - yx  & z^2 + x^2 & - yz \\
    - zx  & - zy & x^2 + y^2
\end{bmatrix}
\; dm
$$

This gives us the definition from the [previous post](/blog/moments-of-inertia/definition-of-the-mass-moment-of-inertia).

<br>

## A Compact Formula

Sometimes you will see the elements of the inertia written as follows. Let $(x_1, x_2, x_3) = (x, y, z)$ and let $\delta_{ij}$ be the [Kronecker delta](https://en.wikipedia.org/wiki/Kronecker_delta).

$$
I_{ij} = \int_{\mathcal{G}} ( r^2 \delta_{ij} - x_i x_j ) \; dm
$$

If we let $\otimes$ denote the outer product and $\m{ \mathbb{I} }$ be the identity matrix, then we can even write the following.

$$
\m{I} = \int_{\mathcal{G}} ( r^2 \m{ \mathbb{I} } - \b{r} \otimes \b{r} ) \; dm
$$

It is nice and compact, and is a useful formulation for writing computer simulations. However, for human computation it's a bit ofuscating. I will stick to the above formulation.

<br>

## Calculating the Moment of Inertia for an Arbitrary Axis

Given n arbitrary axis of rotation $\b{\omega}$, the objects angular momentum is $\b{L} = \m{I} \; \b{\omega}$. This is a vector quantity. What if we are only interested in the angular momentum in the direction of the axis of rotation? We can compute this component by simply taking the dot product of the angular momentum with the unit vector in the axis of rotation.

$$
L_{\b{\omega}} = \b{L} \cdot \u{\omega} = \u{\omega}^T \b{L}
$$

Now, we substitute in the expression for the angular momentum in terms of the rotational inertial.

$$
L_{\b{\omega}} = \u{\omega}^T \; \left ( \m{I} \; \b{\omega} \right ) = \left ( \u{\omega}^T \; \m{I} \; \u{\omega} \right ) \omega = I_{\b{\omega}} \omega
$$

Therefore, given any arbitrary axis of rotation and the inertia tensor, the moment of inertia about that axis is computed as follows

$$
I_{\b{\omega}} = \u{\omega}^T \; \m{I} \; \u{\omega}
$$

### Products of Inertia Revisited

Let $(x_1, x_2, x_3) = (x, y, z)$. Then

$$
I_{ij} = \u{x}_i^T \; \m{I} \; \u{x}_j
$$

Applying this to what we derived above, suppose we have two axes of rotation $\b{\omega}$ and $\b{\psi}$, then 

$$
\u{\psi}^T \m{I} \; \u{\omega}
$$

vaguely measures the angular momentum in the $\b{\phi}$ direction when the object is rotating about the $\b{\omega}$ axis.