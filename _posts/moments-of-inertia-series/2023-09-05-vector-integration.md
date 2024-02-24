---
layout:     series
title:      "Vector Integration"
date:       2023-09-05
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       4
series:     moments-of-inertia
tags:       moments-of-inertia
---

**TODO** These are somewhat like cliffnotes. Expand on this stuff later and draw diagrams

Recall the formula for the moment of inertia.

$$
I = \int_{\mathcal{G}} r_{axis}^2 \; dm
$$

I will go over the high-level method for correctly evaluating this integral for any object $\mathcal{G}$

## Mass Density

Depending on the object, the meaning of $dm$ can change.

$$
\begin{align}
    &\text{Curve}:      \quad &&dm = \lambda(\b{r}) \; d\ell \\[10pt]
    &\text{Surface}:    \quad &&dm = \sigma(\b{r}) \; dA \\[10pt]
    &\text{Volume}:     \quad &&dm = \rho(\b{r}) \; dV \\[10pt]
\end{align}
$$

Here, $\lambda(\b{r})$, $\sigma(\b{r})$, $\rho(\b{r})$ are functions which describe the mass distribution in an object $\mathcal{G}$. Thus, in general depending on if $\mathcal{G}$ is a curve, surface, or volume we would evaluate the moment of inertia integral as follows.

$$
I = \int_{\mathcal{G}} r_{axis}^2 \; (\lambda(\b{r}) \; d\ell)
\qquad
I = \int_{\mathcal{G}} r_{axis}^2 \; (\sigma(\b{r}) \; dA)
\qquad
I = \int_{\mathcal{G}} r_{axis}^2 \; (\rho(\b{r}) \; dV)
$$

However, in this series we are always going to **assume a uniform mass distribution**. Therefore, these integrals simplify to the following.

$$
I = \lambda \cdot \int_{\mathcal{G}} r_{axis}^2 \; d\ell
\qquad
I = \sigma \cdot \int_{\mathcal{G}} r_{axis}^2 \; dA
\qquad
I = \rho \cdot \int_{\mathcal{G}} r_{axis}^2 \; dV
$$

Thus, the problem has now reduced to line, surface, and volume integrals.

## Line Integrals

Suppose the curve is parameterized by $\b{r}(q)$, then 

$$
d\b{\ell} = \frac{\partial \b{r}}{\partial q} \; dq
$$

therefore

$$
d\ell = \abs{d\b{\ell}} = \abs{ \frac{\partial \b{r}}{\partial q} } \; dq
$$

## Surface Integrals

Suppose the surface is parameterized by $\b{r}(q_1, q_2)$

$$
d\b{A} = \left ( \frac{\partial \b{r}}{\partial q_1} \; dq_1 \right ) \times \left ( \frac{\partial \b{r}}{\partial q_2} \; dq_2 \right )
$$

therefore

$$
dA = \abs{d\b{A}} = \abs{ \frac{\partial \b{r}}{\partial q_1} \times \frac{\partial \b{r}}{\partial q_2} } \; dq_1 \; dq_2
$$

## Volume Integrals

Suppose the volume is parameterized by $\b{r}(q_1, q_2, q_3)$

$$
dV = \left \lvert \begin{array}{ccc}
    dV_{11} & dV_{12} & dV_{13} \\
    dV_{21} & dV_{22} & dV_{23} \\
    dV_{31} & dV_{32} & dV_{33}
\end{array} \right \rvert
$$

where

$$
dV_{ij} = \left ( \frac{\partial \b{r}}{\partial q_i} dq_i \right ) \cdot \u{e}_j
$$

where $(\u{e}_1, \u{e}_2, \u{e}_3)$ are the basis vectors of the chosen coordiante system. It may be the case that they are related to $(q_1, q_2, q_3)$, but they need not be.

In other words, $dV_{ij}$ is the $e_j$-component of the partial with respect to $q_i$. Another way to think about it is as row vectors

$$
dV = \left \lvert \begin{array}{ccc}
    \; \cdots & (\partial \b{r} / \partial q_1) \, dq_1 & \cdots \; \\
    \; \cdots & (\partial \b{r} / \partial q_2) \, dq_2 & \cdots \; \\
    \; \cdots & (\partial \b{r} / \partial q_3) \, dq_3 & \cdots \; \\
\end{array} \right \rvert
$$
