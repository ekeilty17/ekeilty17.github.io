---
layout:     series
title:      "Triangle"
date:       2024-11-17
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       16
series:     moments-of-inertia
tags:       moments-of-inertia
---

**TODO**: Triangles are hard :( I didn't have time to dive into this one.

<!-- <br>

---

<br>

## Appendix {#appendix}

There is a very nice property called the [Centroid Theorem](https://new.math.uiuc.edu/public403/affine/centroid.html), which says that the centroid is located as the arithmetic mean of the coordiantes. Written mathematically, if we let $\b{A}$, $\b{B}$, and $\b{C}$ be the vectors to the vertices of the triangle and $\b{G}$ be the coordinates of the centroid, then we have the following.

$$
\b{G} = \tfrac{1}{3} ( \b{A} + \b{B} + \b{C} )
$$

In our case, since we are assuming the centroid is located at the origin, $\b{G} = \b{0}$. -->

<!-- 
<br>

---

<br>

## Base on $x$-Axis

Base on $x$-axis vertically centered with top vertex.

### General Triangle

$$
I = \tfrac{1}{3} M \frac{a^3 + b_1^3 + b_2^3 + c^3}{a + b_1 + b_2 + c}
$$


$$
h^2 + b_1^2 = a^2 
\qquad\qquad
h^2 + b_2^2 = c^2 
$$

$$
\begin{align}
    I &= I_{a} + I_{b_1} + I_{b_2} + I_{c} 
    \\[10pt]
    
    &= \tfrac{1}{3} M_{a} \begin{bmatrix}
        b_1^2 & \tfrac{1}{2} b_1h & 0 \\
        \tfrac{1}{2} b_1h & h^2 & 0 \\
        0 & 0 & b_1^2 + h^2
    \end{bmatrix}
    + 
    \tfrac{1}{3}M_{b_1}b_1^2
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3}M_{b_2}b_2^2
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3} M_{c} \begin{bmatrix}
        b_2^2 & -\tfrac{1}{2} b_2h & 0 \\
        -\tfrac{1}{2} b_2h & h^2 & 0 \\
        0 & 0 & b_2^2 + h^2
    \end{bmatrix}
    \\[10pt]

    &= \tfrac{1}{3} a \begin{bmatrix}
        b_1^2 & \tfrac{1}{2} b_1h & 0 \\
        \tfrac{1}{2} b_1h & h^2 & 0 \\
        0 & 0 & a^2
    \end{bmatrix}
    + 
    \tfrac{1}{3}b_1^3
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3}b_2^3
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3} c \begin{bmatrix}
        b_2^2 & -\tfrac{1}{2} b_2h & 0 \\
        -\tfrac{1}{2} b_2h & h^2 & 0 \\
        0 & 0 & c^2
    \end{bmatrix}
    \\[10pt]
    
    &= \tfrac{1}{3} \begin{bmatrix}
        ab_1^2 + b_2^2c & - \tfrac{1}{2} (b_2c - ab_1) h & 0 \\
        - \tfrac{1}{2} (b_2c - ab_1) h & (a + c)h^2 + b_1^3 + b_2^3 & 0 \\
        0 & 0 & a^3 + b_1^3 + b_2^3 + c^3
    \end{bmatrix}
\end{align}
$$

<br>

### Isosceles Triangle

$$
\begin{align}
    I &= \tfrac{1}{3} \begin{bmatrix}
        2ab^2 & 0 & 0 \\
        0 & 2ah^2 + \tfrac{1}{4}b^3 & 0 \\
        0 & 0 & 2a^3 + \tfrac{1}{4}b^3
    \end{bmatrix}
\end{align}
$$

<br>

### Equilateral Triangle

$$
\begin{align}
    I &= \tfrac{1}{3} \begin{bmatrix}
        2S^3 & 0 & 0 \\
        0 & \tfrac{7}{4}S^3 & 0 \\
        0 & 0 & \tfrac{9}{4}S^3
    \end{bmatrix}
\end{align}
$$

<br>

---

<br>

<br>

---

<br>

## General - Coordiantes

If we are only interested in the rotational inertia around the $z$-axis, then there is a somewhat elegant way to describe this. Recall the coordiante formula for the rotational inertia of a line around the $z$-axis ([here](/blog/moments-of-inertia/lines-special-cases#coordiante-formula)).

**TODO** draw diagram

An identity I will use a number of times is the following, which is a version of the law of cosines. Really this is just a expanding the left-hand side.

$$
\abs{\b{A} - \b{B}}^2 = \abs{\b{A}}^2 + \abs{\b{B}}^2 - 2(\b{A} \cdot \b{B})
$$

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz} 
    &= \tfrac{1}{\lambda} I_{a} + \tfrac{1}{\lambda} I_{b} + \tfrac{1}{\lambda} I_{c} \\[10pt]
    &= \tfrac{1}{3} \abs{\b{B} - \b{C}} \left ( \abs{\b{B}}^2 + \abs{\b{C}}^2 + \b{B} \cdot \b{C} \right ) + \tfrac{1}{3} \abs{\b{C} - \b{A}} \left ( \abs{\b{C}}^2 + \abs{\b{A}}^2 + \b{C} \cdot \b{A} \right ) + \tfrac{1}{3} \abs{\b{A} - \b{B}} \left ( \abs{\b{A}}^2 + \abs{\b{B}}^2 + \b{A} \cdot \b{B} \right ) \\[10pt]
    &= \tfrac{1}{3} \abs{\b{B} - \b{C}} \left ( \abs{\b{B} - \b{C}}^2 + 3(\b{B} \cdot \b{C}) \right ) + \tfrac{1}{3} \abs{\b{C} - \b{A}} \left ( \abs{\b{C} - \b{A}}^2 + 3(\b{C} \cdot \b{A}) \right ) + \tfrac{1}{3} \abs{\b{A} - \b{B}} \left ( \abs{\b{A} - \b{B}}^2 + 3(\b{A} \cdot \b{B}) \right ) \\[10pt]
    &= \tfrac{1}{3} \left ( \abs{\b{B} - \b{C}}^3 + \abs{\b{C} - \b{A}}^3 + \abs{\b{A} - \b{B}}^3 \right ) + \abs{\b{B} - \b{C}} \; (\b{B} \cdot \b{C}) + \abs{\b{C} - \b{A}} \; (\b{C} \cdot \b{A}) + \abs{\b{A} - \b{B}} \; (\b{A} \cdot \b{B}) \\[10pt]
    &= \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right ) + a \; (\b{B} \cdot \b{C}) + b \; (\b{C} \cdot \b{A}) + c \; (\b{A} \cdot \b{B}) \\[10pt]
\end{align}
$$

Now, in order to simplify the analysis, we are going to assume the triangle's centroid is at the origin. Now, we can get an expression for the magnutides of $\b{A}$, $\b{B}$, $\b{C}$. We use [Apollonius Theorem](https://brilliant.org/wiki/apollonius-theorem/). Let $m_{A}$, $m_{B}$, and $m_{C}$ be the lengths of the medians. Then

$$
m_{A} = \tfrac{1}{2} \sqrt{2b^2 + 2c^2 - a^2}
\qquad
m_{B} = \tfrac{1}{2} \sqrt{2c^2 + 2a^2 - b^2}
\qquad
m_{C} = \tfrac{1}{2} \sqrt{2a^2 + 2b^2 - c^2}
$$

Then, we know that

$$
\abs{\b{A}} = \tfrac{2}{3} m_A
\qquad
\abs{\b{B}} = \tfrac{2}{3} m_B
\qquad
\abs{\b{C}} = \tfrac{2}{3} m_C
$$

$$
\begin{align}
    \b{B} \cdot \b{C} &= \tfrac{1}{2} \left ( \abs{\b{B}}^2 + \abs{\b{C}}^2 - \abs{\b{B} - \b{C}}^2 \right ) \\[10pt]
    &= \tfrac{1}{2} \left ( \tfrac{1}{9}(2c^2 + 2a^2 - b^2) + \tfrac{1}{9}(2a^2 + 2b^2 - c^2) - a^2 \right ) \\[10pt]
    &= \tfrac{1}{18} \left ( (2c^2 + 2a^2 - b^2) + (2a^2 + 2b^2 - c^2) - 9a^2 \right ) \\[10pt]
    &= \tfrac{1}{18} \left ( b^2 + c^2 - 5a^2 \right ) \\[10pt]
\end{align}
$$

Yiu can compute $\b{A} \cdot \b{B}$ and $\b{C} \cdot \b{A}$ symmetrically. Substituting into the above equation.

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz} 
    &= \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right ) + \tfrac{1}{18} a \left ( b^2 + c^2 - 5a^2 \right ) + \tfrac{1}{18} b \left ( c^2 + a^2 - 5b^2 \right ) + \tfrac{1}{18} c \left ( a^2 + b^2 - 5c^2 \right ) \\[10pt]
    &= \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right ) + \tfrac{1}{18} a \left ( b^2 + c^2 + a^2 \right ) + \tfrac{1}{18} b \left ( c^2 + a^2 + b^2 \right ) + \tfrac{1}{18} c \left ( a^2 + b^2 + c^2 \right ) - \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right )\\[10pt]
    &= \tfrac{1}{18} \left ( a + b + c \right ) \left ( b^2 + c^2 + a^2 \right ) \\[10pt]
\end{align}
$$

The mass of the triangle is $\lambda \cdot (a + b + c)$. Therefore

$$
I_{zz} = \tfrac{1}{18} M (a^2 + b^2 + c^2)
$$

This is beautiful, and I've never seen this formula anywhere else.

<br>

---

<br>

## General - Proof 2

We can do this a lot more simply without using coordinates

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz} 
    &= \tfrac{1}{\lambda} I_{a} + \tfrac{1}{\lambda} I_{b} + \tfrac{1}{\lambda} I_{c} \\[10pt]
    &= \tfrac{1}{12} M_a a^2 + M_a D_a^2 + \tfrac{1}{12} M_b b^2 + M_b D_b^2 + \tfrac{1}{12} M_c c^2 + M_c D_c^2 \\[10pt]
    &= \tfrac{1}{12} a^3 + \tfrac{1}{36} a (2b^2 + 2c^2 - a^2) + \tfrac{1}{12} b^3 + \tfrac{1}{36} b (2c^2 + 2a^2 - b^2)  + \tfrac{1}{12} c^3 + \tfrac{1}{36} c (2a^2 + 2b^2 - c^2) \\[10pt]
    &= \tfrac{1}{12} (a^3 + b^3 + c^3) + \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2 - 3a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2 - 3b^3) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2 - 3c^2) \\[10pt]
    &= \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2) \\[10pt]
    &= \tfrac{1}{18} (a + b + c) (a^2 + b^2 + c^2)
\end{align}
$$

The mass of the triangle is $M = \lambda \cdot (a + b + c)$. Therefore

$$
I_{zz} = \tfrac{1}{18} M (a^2 + b^2 + c^2)
$$

This is beautiful, and I've never seen this formula anywhere else. -->