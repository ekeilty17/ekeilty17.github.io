---
layout:     series
title:      "Triangle"
date:       2023-09-17
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       16
series:     moments-of-inertia
tags:       moments-of-inertia
---


Triangles have haunted me for a few days now. They seem simple enough to be able to describe completely. Instead, they served as a lesson on how much we rely on symmetry for practical results. The following is as general analysis I can provide while keeping the final results actually usable.

## Notes

We just aren't going to do principal axes use [this link](https://calcresource.com/moment-of-inertia-tri.html) to get some values. The product of inertias are generally not zero because a general triangle has no symmetry to take advantage of. 

There is also this result

$$
I = \frac{1}{6} M ( \abs{\b{p}}^2 +  \abs{\b{q}}^2 + \b{p} \cdot \b{q} )
$$

However, once you even have an isosceles triangle you can get the principal axes because $b_1 = b_2$ so the product of inertias go away.

You can express it in a number of ways. But here is one

$$
I = \frac{1}{2} M L^2 (1 - \frac{2}{3} \sin^2 \beta)
$$

Actually, this result can be used to prove the general result for any $n$-gon

$$
I = \frac{1}{2} M R^2 (1 - \frac{2}{3} \sin^2 \frac{\pi}{n})
$$

## Right Triangles

We aren't really interested in right triangles, but we will use this result to build up the rest of our results.

### Parameterizing the Surface

$$
\b{r}(x, y) = x \; \u{x} + y \; \u{y} \\[10pt]
A = \{ \b{r}(x, y) \ : \ 0 \leq x \leq b \quad 0 \leq y \leq h - \tfrac{h}{b}x \}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial x} = \u{x}
\qquad
\frac{\partial \b{r}}{\partial y} = \u{y}
$$

$$
d \b{A} = \left ( \frac{\partial \b{r}}{\partial x} dx \right ) \times \left ( \frac{\partial \b{r}}{\partial y} dy \right ) = dx \; dy \; \u{z}
$$

$$
dA = \abs{ d \b{A} } = dx \; dy
$$

### Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \sigma \int dA \\[10pt]
    &= \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} dx \; dy \\[10pt]
    &= \sigma \int_{0}^{b} (h - \tfrac{h}{b}x) \; dx \\[10pt]
    &= \sigma \cdot (hb - \tfrac{1}{2}\tfrac{h}{b} b^2) \\[10pt]
    &= \sigma \cdot (hb - \tfrac{1}{2} hb) \\[10pt]
    &= \sigma \cdot \tfrac{1}{2} bh \\[10pt]
\end{align}
$$

<br>

### Moment of Inertia About Base

$$
\begin{align}
    I_{xx} &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} y^2 \; dx \; dy \\[10pt]
    &= \sigma \int_{0}^{b} \tfrac{1}{3}(h - \tfrac{h}{b}x)^3 \; dx \\[10pt]
    &= \sigma \cdot \left ( - \tfrac{1}{12} \tfrac{b}{h}(h - \tfrac{h}{b}x)^4 \right ) \Big\rvert_{0}^{b} \\[10pt]
    &= \sigma \cdot \tfrac{1}{12} \tfrac{b}{h}(h)^4 \\[10pt]
    &= \sigma \cdot \tfrac{1}{12} b h^3 \\[10pt]
    &= \tfrac{1}{6} M h^2
\end{align}
$$

<br>

### Moment of Inertia About Height

$$
\begin{align}
    I_{yy} &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} x^2 \; dx \; dy \\[10pt]
    &= \sigma \int_{0}^{b} x^2 (h - \tfrac{h}{b}x) \; dx \\[10pt]
    &= \sigma \int_{0}^{b} (h x^2 - \tfrac{h}{b}x^3) \; dx \\[10pt]
    &= \sigma \cdot (\tfrac{1}{3}h b^3 - \tfrac{1}{4}\tfrac{h}{b}b^4) \\[10pt]
    &= \sigma \cdot (\tfrac{1}{3}h b^3 - \tfrac{1}{4} hb^3) \\[10pt]
    &= \sigma \cdot \tfrac{1}{12} b^3 h \\[10pt]
    &= \tfrac{1}{6} M b^2
\end{align}
$$

We could have derived this by symmetry

<br>

### Moment of Inertia About Right Angle

$$
\begin{align}
    I_{zz} &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} (x^2 + y^2) \; dx \; dy \\[10pt]
    &= \left ( \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} x^2 \; dx \; dy \right ) + \left ( \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} y^2 \; dx \; dy \right ) \\[10pt]
    &= I_{yy} + I_{xx} \\[10pt]
    &= \tfrac{1}{6} M h^2 + \tfrac{1}{6} M b^2 \\[10pt]
    &= \tfrac{1}{6} M [ b^2 + h^2 ]
\end{align}
$$

Notice that $b^2 + h^2$ is the squared length of the hypotenuse of the right triangle.

<br>

### Products of Inertia

Since $z = 0$, we know that $I_{yz} = I_{zy} = I_{zx} = I_{xz} = 0$. So all that remains is to compute $I_{xy} = I_{yx}$.

$$
\begin{align}
    I_{xy} &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{b} \int_{0}^{h - \tfrac{h}{b}x} xy \; dx \; dy \\[10pt]
    &= \sigma \int_{0}^{b} \tfrac{1}{2}x(h - \tfrac{h}{b}x)^2 \; dx \\[10pt]
    &= \sigma \int_{0}^{b} \left ( \tfrac{1}{2}h^2x - \tfrac{h^2}{b}x^2 + \tfrac{1}{2}\tfrac{h^2}{b^2}x^3 \right ) \; dx \\[10pt]
    &= \left ( \tfrac{1}{4}h^2b^2 - \tfrac{1}{3}\tfrac{h^2}{b}b^3 + \tfrac{1}{8}\tfrac{h^2}{b^2}b^4 \right ) \\[10pt]
    &= \left ( \tfrac{1}{4}h^2b^2 - \tfrac{1}{3}h^2b^2 + \tfrac{1}{8}h^2b^2 \right ) \\[10pt]
    &= \sigma \cdot \tfrac{1}{24}h^2b^2 \\[10pt]
    &= \tfrac{1}{12} M bh \\[10pt]
\end{align}
$$

### Inertia Tensor

Recall that in the matrix, we put in $-I_{xy}$ and $-I_{yx}$ for the product of inertias.

$$
I = \begin{bmatrix}
    \frac{1}{6} M h^2 & -\frac{1}{12} M bh & 0 \\
    -\frac{1}{12} M bh  & \frac{1}{6} M b^2 & 0 \\
    0  & 0 & \frac{1}{6} M [ b^2 + h^2 ]
\end{bmatrix}
= \tfrac{1}{6} M \begin{bmatrix}
    h^2 & -\frac{1}{2}bh & 0 \\
    -\frac{1}{2}bh  & b^2 & 0 \\
    0  & 0 & b^2 + h^2
\end{bmatrix}
$$

You may want to solve this for the principal axes so we can get a nice diagonal matrix. I wish you the best of luck. Every attempt I made resulted in a disgusting vomit of algebra. However, if you can get something nice, please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

---

<br>

## Triangle with Base on $x$-axis

We can do this by combining two right triangles with equal heights. Obviously, for the mass, we have 

$$
M = M_1 + M_2 = \tfrac{1}{2} b_1 h + \tfrac{1}{2} b_2 h = \tfrac{1}{2} (b_1 + b_2) h
$$

Note that the product of inertia of the second right triangle has to be negative since it's oriented flipped across the $y$-axis (you can think of it as we input $b = -b_2$).

$$
\begin{align}
I &= 
\begin{bmatrix}
    \frac{1}{6} M_1 h^2 & \frac{1}{12} M_1 b_1h & 0 \\
    \frac{1}{12} M_1 b_1h  & \frac{1}{6} M_1 b_1^2 & 0 \\
    0  & 0 & \frac{1}{6} M_1 [ b_1^2 + h^2 ]
\end{bmatrix}
+
\begin{bmatrix}
    \frac{1}{6} M_2 h^2 & -\frac{1}{12} M_2 b_2h & 0 \\
    -\frac{1}{12} M_2 b_2h  & \frac{1}{6} M_1 b_2^2 & 0 \\
    0  & 0 & \frac{1}{6} M_1 [ b_2^2 + h^2 ]
\end{bmatrix} 
\\[10pt]
&= \begin{bmatrix}
    \frac{1}{12} b_1h^3 & \frac{1}{24} b_1^2h^2 & 0 \\
    \frac{1}{24} b_1^2h^2  & \frac{1}{12} b_1^3h & 0 \\
    0  & 0 & \frac{1}{12} [ b_1^3h + b_1h^3 ]
\end{bmatrix}
+
\begin{bmatrix}
    \frac{1}{12} b_2h^3 & -\frac{1}{24} b_2^2h^2 & 0 \\
    -\frac{1}{24} b_2^2h^2  & \frac{1}{12} b_2^3h & 0 \\
    0  & 0 & \frac{1}{12} [ b_2^3h + b_2h^3 ]
\end{bmatrix}
\\[10pt]
&= \begin{bmatrix}
    \frac{1}{12} (b_1 + b_2) h^3 & -\frac{1}{24} (b_2^2 - b_1^2)h^2 & 0 \\
    -\frac{1}{24} (b_2^2 - b_1^2)h^2  & \frac{1}{12} (b_1^3 + b_2^3)h & 0 \\
    0  & 0 & \frac{1}{12} [ (b_1^3 + b_2^3)h + (b_1 + b_2)h^3 ]
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{6} M \begin{bmatrix}
    h^2 & -\frac{1}{2} (b_2 - b_1)h & 0 \\
    -\frac{1}{2} (b_2 - b_1)h  & b_1^2 - b_1b_2 + b_2^2 & 0 \\
    0  & 0 & b_1^2 - b_1b_2 + b_2^2 + h^2
\end{bmatrix}
\end{align}
$$

I wouldn't say it's super pretty, but it's not the worst either, and it simplifies nicely in the special cases.

<br>

### Special Case: Isosceles Triangle

Suppose $b_2 = b_1 = b/2$.

$$
\begin{align}
I 
&= \tfrac{1}{6} M \begin{bmatrix}
    h^2 & -\frac{1}{2} (b/2 - b/2)h & 0 \\
    -\frac{1}{2} (b/2 - b/2)h  & ((b/2)^2 - (b/2)(b/2) + (b/2)^2) & 0 \\
    0  & 0 & (b/2)^2 - (b/2)(b/2) + (b/2)^2 + h^2
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{6} M \begin{bmatrix}
    h^2 & 0 & 0 \\
    0   & \frac{1}{4}b^2 & 0 \\
    0   & 0 & \frac{1}{4}b^2 + h^2
\end{bmatrix}
\end{align}
$$

<br>

### Special Case: Equilateral Triangle

Suppose all sides are equal, which means $b = s$ and $h = \tfrac{\sqrt{3}}{2} s$.

$$
\begin{align}
I 
&= \tfrac{1}{6} M \begin{bmatrix}
    (\tfrac{\sqrt{3}}{2}s)^2 & 0 & 0 \\
    0   & \frac{1}{4}s^2 & 0 \\
    0   & 0 & \frac{1}{4}s^2 + (\tfrac{\sqrt{3}}{2}s)^2
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{6} M \begin{bmatrix}
    \tfrac{3}{4}s^2 & 0 & 0 \\
    0   & \frac{1}{4}s^2 & 0 \\
    0   & 0 & s^2
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{24} M s^2 \begin{bmatrix}
    3 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 4
\end{bmatrix}
\end{align}
$$

<br>

---

<br>

## Triangle About Center of Mass

Note that we have a very particular orientation to the centroid.

The centroid is located at $x = \tfrac{1}{3}(b_2 - b_1)$ and $y = \tfrac{1}{3}h$

Using the parallel axis theorem (**TODO** check if the products of inertia have the right sign on them when applying the parallel axis theorem)

$$
\begin{align}
I
&= \tfrac{1}{6} M \begin{bmatrix}
    h^2 & -\frac{1}{2} (b_2 - b_1)h & 0 \\
    -\frac{1}{2} (b_2 - b_1)h  & b_1^2 - b_1b_2 + b_2^2 & 0 \\
    0  & 0 & b_1^2 - b_1b_2 + b_2^2 + h^2
\end{bmatrix}
-
\tfrac{1}{9} M \begin{bmatrix}
    h^2 & -(b_2 - b_1)h & 0 \\
    -(b_2 - b_1)h  & (b_2 - b_1)^2 & 0 \\
    0  & 0 & (b_2 - b_1)^2 + h^2
\end{bmatrix}
\\[10pt]
&= M \begin{bmatrix}
    \tfrac{1}{18}h^2 & \frac{1}{36} (b_2 - b_1)h & 0 \\
    \frac{1}{36} (b_2 - b_1)h  & \tfrac{1}{18}(b_1^2 + b_1b_2 + b_2^2) & 0 \\
    0  & 0 & \tfrac{1}{18}(b_1^2 - b_1b_2 + b_2^2 + h^2)
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{18} M \begin{bmatrix}
    h^2 & \frac{1}{2} (b_2 - b_1)h & 0 \\
    \frac{1}{2} (b_2 - b_1)h  & b_1^2 + b_1b_2 + b_2^2 & 0 \\
    0  & 0 & b_1^2 + b_1b_2 + b_2^2 + h^2
\end{bmatrix}
\end{align}
$$

<br>

### Special Case: Isosceles Triangle

Suppose $b_2 = b_1 = b/2$.

$$
\begin{align}
I
&= \tfrac{1}{18} M \begin{bmatrix}
    h^2 & \frac{1}{2} (b/2 - b/2)h & 0 \\
    \frac{1}{2} (b/2 - b/2)h  & (b/2)^2 + (b/2)(b/2) + (b/2)^2 & 0 \\
    0  & 0 & (b/1)^2 - (b/1)(b/2) + (b/2)^2 + h^2
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{18} M \begin{bmatrix}
    h^2 & 0 & 0 \\
    0 & \tfrac{3}{4} b^2 & 0 \\
    0  & 0 & \tfrac{3}{4} b^2 + h^2
\end{bmatrix}
\end{align}
$$

<br>

### Special Case: Equilateral Triangle

Suppose all sides are equal, which means $b = S$ and $h = \tfrac{\sqrt{3}}{2} S$.


$$
\begin{align}
I
&= \tfrac{1}{18} M \begin{bmatrix}
    (\tfrac{\sqrt{3}}{2}S)^2 & 0 & 0 \\
    0 & \tfrac{3}{4} S^2 & 0 \\
    0  & 0 & \tfrac{3}{4} S^2 + (\tfrac{\sqrt{3}}{2}S)^2
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{18} M \begin{bmatrix}
    \tfrac{3}{4}S^2 & 0 & 0 \\
    0 & \tfrac{3}{4} S^2 & 0 \\
    0  & 0 & \tfrac{3}{2} S^2
\end{bmatrix}
\\[10pt]
&= \tfrac{1}{24} M S^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0 & 1 & 0 \\
    0  & 0 & 2
\end{bmatrix}
\end{align}
$$

<br>

---

<br>

## Triangle About Vertex with Base on the $x$-axis

**TODO** 

<br>

---

<br>

## Triangle About Vertex with Base Parallel to $x$-axis

**TODO** 