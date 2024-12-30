---
layout:     series
title:      "Vector Integration"
date:       2024-11-05
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       4
series:     moments-of-inertia
tags:       moments-of-inertia
---

Recall the formula for the moment of inertia with respect to a fixed axis of rotation.

$$
I_{\mathcal{G}} = \int_{\mathcal{G}} r_{axis}^2 \; dm
$$

There are a few questions about this integral that one may have. What does the subscript $\mathcal{G}$ on the integral mean? And how do we integrate with respect to an object's mass? In this post, I am going to unpack this definition and explain exactly how we will evaluate it in the upcoming posts.

<br>

## Mass Density

First, how do we integrate with respect to mass? Integrals don't know how to deal with mass; they know how to deal with lengths, areas, and volumes. Therefore, we define a **mass density function**, which maps each point in $\mathcal{G}$ to a mass density value. Depending on if $\mathcal{G}$ is a curve, surface, or volume I am going to use slightly different notation. 

$$
\begin{align}
    &\text{Curve}:      \quad &&dm = \lambda(\b{r}) \; d\ell \\[10pt]
    &\text{Surface}:    \quad &&dm = \sigma(\b{r}) \; dA \\[10pt]
    &\text{Volume}:     \quad &&dm = \rho(\b{r}) \; dV \\[10pt]
\end{align}
$$

Here, $\lambda(\b{r})$ gives the mass distribution in $\mathcal{G}$ per unit length. Likewise, $\sigma(\b{r})$ gives the mass distribution per unit area. Finally, $\rho(\b{r})$ gives the mass distribution per unit volume. These are essentially unnormalized _probability density functions_ (PDFs). 

To evaluate the original integral, we write the following.

$$
I_{\mathcal{G}} = \int_{\mathcal{G}} r_{axis}^2 \; (\lambda(\b{r}) \; d\ell)
\qquad\qquad
I_{\mathcal{G}} = \int_{\mathcal{G}} r_{axis}^2 \; (\sigma(\b{r}) \; dA)
\qquad\qquad
I_{\mathcal{G}} = \int_{\mathcal{G}} r_{axis}^2 \; (\rho(\b{r}) \; dV)
$$

Furthermore, in this series, we are always going to **assume a uniform mass distribution**, i.e. 

$$
\lambda(\b{r}) = \lambda
\qquad
\sigma(\b{r}) = \sigma
\qquad
\rho(\b{r}) = \rho
\qquad\qquad
\forall \b{r} \in \mathcal{G}
$$

Therefore, these integrals simplify to the following.

$$
I_{\mathcal{G}} = \lambda \cdot \int_{\mathcal{G}} r_{axis}^2 \; d\ell
\qquad
I_{\mathcal{G}} = \sigma \cdot \int_{\mathcal{G}} r_{axis}^2 \; dA
\qquad
I_{\mathcal{G}} = \rho \cdot \int_{\mathcal{G}} r_{axis}^2 \; dV
$$

Thus, the problem has now been reduced to line, surface, and volume integrals. If you have studied vector calculus you should, in principle, know how to evaluate these. If you don't remember or never learned how to evaluate such integrals, I will give a brief overview.

<br>

## Parameterization

In order to integrate over an object $\mathcal{G}$, you must first be able to precisely describe it. Thus, we always start with a **parameterization** of $\mathcal{G}$. This is a multivariable vector function, which maps a set of parameters over some domain to a set of position vectors such that the range of all position vectors reproduces the $\mathcal{G}$. 

To give a few simple examples. The following is a parameterization for a line segment, rectangle, and cuboid.

$$
\begin{align}
    \b{r}(x) &= x \; \u{x}
    &&
    \ell = \{ \b{r}(x) &&: -\tfrac{1}{2} a \leq x \leq \tfrac{1}{2} a \}
    \\[10pt]
    \b{r}(x, y) &= x \; \u{x} + y \; \u{y}
    &&
    A = \{ \b{r}(x,y) &&: -\tfrac{1}{2} a \leq x \leq \tfrac{1}{2} a \ , \quad -\tfrac{1}{2} b \leq y \leq \tfrac{1}{2} b \}
    \\[10pt]
    \b{r}(x, y, z) &= x \; \u{x} + y \; \u{y} + z \; \u{z}
    &&
    V = \{ \b{r}(x,y,z) &&: -\tfrac{1}{2} a \leq x \leq \tfrac{1}{2} a \ , \quad -\tfrac{1}{2} b \leq y \leq \tfrac{1}{2} b \ , \quad -\tfrac{1}{2} c \leq z \leq \tfrac{1}{2} c \}
\end{align}
$$

Note that the parameter variables and coordinate system do not have to be related. For example, we can equivalently parameterize these objects as the following. Notice how the parameters are jumbled in the definition of $\b{r}$.

$$
\begin{align}
    \b{r}(q_1) &= a q_1 \; \u{x}
    &&
    \ell = \{ \b{r}(q_1) &&: -\tfrac{1}{2} \leq q_1 \leq \tfrac{1}{2} \}
    \\[10pt]
    \b{r}(q_1, q_2) &= a q_2\; \u{x} + b q_1 \; \u{y}
    &&
    A = \{ \b{r}(q_1,q_2) &&: -\tfrac{1}{2} \leq q_1, q_2, \leq \tfrac{1}{2} \}
    \\[10pt]
    \b{r}(q_1, q_2, q_3) &= a q_2 \; \u{x} + b q_3 \; \u{y} + c q_1 \; \u{z}
    &&
    V = \{ \b{r}(q_1,q_2,q_3) &&: -\tfrac{1}{2} \leq q_1, q_2, q_3 \leq \tfrac{1}{2} \}
\end{align}
$$

<!-- For the remaining post, we are going to assume we are given some general parameterization using coordinate system $(\u{e}_1, \u{e}_2, \u{e}_3)$ with respect to parameters $(q_1,q_2,q_3)$ over domain $(D_1, D_2, D_3)$. -->

<!-- $$
\begin{align}
    \b{r}(q_1) &= r_1(q_1) \; \u{e}_1
    &&
    \ell = \{ \b{r}(q_1) &&: q_1 \in D_1 \}
    \\[10pt]
    \b{r}(q_1, q_2) &= r_2(q_1, q_2) \; \u{e}_1 + r_2(q_1, q_2) \; \u{e}_1
    &&
    A = \{ \b{r}(q_1,q_2) &&: q_1 \in D_1 \ , \ q_2 \in D_2 \}
    \\[10pt]
    \b{r}(q_1, q_2, q_3) &= r_1(q_1, q_2, q_3) \; \u{e}_1 + r_2(q_1, q_2, q_3) \; \u{e}_2 + r_3(q_1, q_2, q_3) \; \u{e}_3
    &&
    V = \{ \b{r}(q_1,q_2,q_3) &&:  q_1 \in D_1 \ , \ q_2 \in D_2 \ , \ q_3 \in D_3 \}
\end{align}
$$ -->

The final thing to note is that the domain does not have to be constant. It can depend on one or more of the parameters. For example, the following parameterizes a right triangle with its right angle at the origin.

$$
\b{r}(x, y) = x \; \u{x} + y \; \u{y}
\qquad
A = \{ \b{r}(x, y) : 0 \leq x \leq b \ , \quad hx \leq y \leq h(b - x) \}
$$

The vector function $\b{r}(x, y)$ is the same as that of a rectangle. The difference is the bounds of the domain. 

<br>

## Integration Over a Geometry

In this series, I am going to use a generalized method that works for any object and any geometry. It might be a bit overkill for simpler geometries, e.g. circles, which can be done intuitively without this method. However, being rigorous on the simpler objects will help greatly with the more complex objects, e.g. ellipses.



### Line Integrals {#line-integrals}

We wish to compute the following integral

$$
I_{\mathcal{G}} = \lambda \cdot \int_{\mathcal{G}} r_{axis}^2 \; d\ell
$$

Suppose we have the following parameterization of the curve $\mathcal{G}$.

$$
\b{r}(q_1) = r_1(q_1) \; \u{e}_1
\qquad
\ell = \{ \b{r}(q_1): q_1 \in D_1 \}
$$

Then we consider how the curve changes infinitesmally.

$$
d\b{\ell} = \frac{\partial \b{r}}{\partial q_1} \; dq_1
$$

Be careful when computing the partial derivative. It's possible that $\u{e}_1$ is dependant on $q_1$. Also notice that this is a vector quantity. You can take integrals over vector differentials, but that is not what we are interested in. So we need to take the magnitude.

$$
d\ell = \abs{d\b{\ell}} = \abs{ \frac{\partial \b{r}}{\partial q_1} } \; dq_1
$$

Finally, we rewrite the original integral as follows.

$$
I_{\mathcal{G}} = \lambda \cdot \int_{D_1} r_{axis}^2 \; \abs{ \frac{\partial \b{r}}{\partial q_1} } \; dq_1
$$

This is something any first year calculus student should (in theory) be able to evaluate.



### Surface Integrals {#surface-integrals}

We wish to compute the following integral

$$
I_{\mathcal{G}} = \sigma \cdot \int_{\mathcal{G}} r_{axis}^2 \; dA
$$

Suppose we have the following parameterization of the surface $\mathcal{G}$.

$$
\b{r}(q_1, q_2) = r_1(q_1, q_2) \; \u{e}_1 + r_2(q_1, q_2) \; \u{e}_2
\qquad
A = \{ \b{r}(q_1,q_2) : q_1 \in D_1 \ , \ q_2 \in D_2 \}
$$

From line integrals, we know that $(\partial \b{r} / \partial q_1) \; dq_1$ and $(\partial \b{r} / \partial q_2) \; dq_2$ give the infinitesmal change with respect to $q_1$ and $q_2$ respectively. Thus, if we want the infinitesmal area spanned by these vectors, we use the magnitude of the cross product. This is a simple result from vector calculus. You can see [this video](https://www.youtube.com/watch?v=YbZmAqGUkqc) for the explanation.

$$
d\b{A} = \left ( \frac{\partial \b{r}}{\partial q_1} \; dq_1 \right ) \times \left ( \frac{\partial \b{r}}{\partial q_2} \; dq_2 \right )
$$

Therefore,

$$
dA = \abs{d\b{A}} = \abs{ \frac{\partial \b{r}}{\partial q_1} \times \frac{\partial \b{r}}{\partial q_2} } \; dq_1 \; dq_2
$$

Finally, we rewrite the original integral as follows.

$$
I_{\mathcal{G}} = \sigma \cdot \int_{D_1} \int_{D_2} r_{axis}^2 \; \abs{ \frac{\partial \b{r}}{\partial q_1} \times \frac{\partial \b{r}}{\partial q_2} } \; dq_1 \; dq_2
$$


### Volume Integrals {#volume-integrals}

We wish to compute the following integral

$$
I_{\mathcal{G}} = \rho \cdot \int_{\mathcal{G}} r_{axis}^2 \; dA
$$

Suppose we have the following parameterization of the volume $\mathcal{G}$.

$$
\b{r}(q_1, q_2, q_3) = r_1(q_1, q_2, q_3) \; \u{e}_1 + r_2(q_1, q_2, q_3) \; \u{e}_2 + r_3(q_1, q_2, q_3) \; \u{e}_3 
\\[10pt]
V = \{ \b{r}(q_1,q_2,q_3) :  q_1 \in D_1 \ , \ q_2 \in D_2 \ , \ q_3 \in D_3 \}
$$

We define the [Jacobean](https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant) matrix as the following. It's basically all possible combinations of $dr_i/dq_j$.

<!-- \left \lvert \begin{array}{ccc}
    \vert & \vert & \vert \\
    \frac{d\b{r}}{dq_1} & \frac{d\b{r}}{dq_2} & \frac{d\b{r}}{dq_3} \\
    \vert & \vert & \vert
\end{array} \right \rvert -->

$$
\m{J} 
= 
\left [ \frac{d\b{r}}{d\b{q}} \right ]
= 
\left [ \frac{\partial\b{r}}{\partial q_1} \quad \frac{\partial\b{r}}{\partial q_2} \quad \frac{\partial\b{r}}{\partial q_3} \right ]
=
\left [ \begin{array}{ccc}
    \frac{\partial r_1}{\partial q_1} & \frac{\partial r_1}{\partial q_2} & \frac{\partial r_1}{\partial q_3} \; \\
    \frac{\partial r_2}{\partial q_1} & \frac{\partial r_2}{\partial q_2} & \frac{\partial r_2}{\partial q_3} \\
    \frac{\partial r_3}{\partial q_1} & \frac{\partial r_3}{\partial q_2} & \frac{\partial r_3}{\partial q_3} \\
\end{array} \right ]
$$

Now, I assert the following.

$$
dV = \left \lvert \frac{\partial\b{r}}{\partial q_1} dq_1 \quad \frac{\partial\b{r}}{\partial q_2} dq_2 \quad \frac{\partial\b{r}}{\partial q_3} dq_3 \right \rvert
=
\left \lvert \ J \ \right \rvert \; dq_1 \; dq_2 \; dq_3
$$

I am not going to explain why this result is true. I recommend [this video](https://www.youtube.com/watch?v=wCZ1VEmVjVo), which explains how we should really be thinking of this integral in terms of linear maps. 

Therefore, we rewrite the original integral as follows.

$$
I_{\mathcal{G}} = \rho \cdot \int_{D_1} \int_{D_2} \int_{D_3} r_{axis}^2 \; 
\left \lvert \begin{array}{ccc}
    \frac{\partial r_1}{\partial q_1} & \frac{\partial r_1}{\partial q_2} & \frac{\partial r_1}{\partial q_3} \; \\
    \frac{\partial r_2}{\partial q_1} & \frac{\partial r_2}{\partial q_2} & \frac{\partial r_2}{\partial q_3} \\
    \frac{\partial r_3}{\partial q_1} & \frac{\partial r_3}{\partial q_2} & \frac{\partial r_3}{\partial q_3} \\
\end{array} \right \rvert
 \; dq_1 \; dq_2\; dq_3
$$

<!-- TODO -->

<!-- <br>

## Linear Transformations

There is a correct way to think about what my generalized method is doing. Consider the trivial parameterization 

$$
\b{r}(x, y, z) = x \; \u{x} + y \; \u{y} + z \; \u{z}
$$

This is the easiest parameterization to integrate over. Now consider some other parameterization

$$
\b{r}(u, v, w) = x(u, v, w) \; \u{x} + y(u, v, w) \; \u{y} + z(u, v, w) \; \u{z}
$$


defined above. Integrating over this parameterization is very easy because it is using the standard Cartesian coordinates $(x, y, z)$. Comparing this to the parameterization $\b{r}(q_1,q_2,q_3)$.

What we should do is translate the problem into the $(q_1,q_2,q_3)$ coordinate system. Then, integration becomes much simpler. -->