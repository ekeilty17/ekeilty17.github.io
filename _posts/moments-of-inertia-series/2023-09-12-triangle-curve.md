---
layout:     series
title:      "Triangle"
date:       2023-09-12
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       11
series:     moments-of-inertia
tags:       moments-of-inertia
---

Equilateral triangles and even isosceles triangles are pretty simple because there are symmetries that can be exploited. However, a general triangle can get pretty nasty due to the lack of symmetry. I have broken this post up by the position of the triangle relative to the axis. This is because analyzing a general triangle at its centroid is terrible.

There are a lot of cases, so I've provided a table of contents

<!-- https://brilliant.org/wiki/apollonius-theorem/ -->

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

## 