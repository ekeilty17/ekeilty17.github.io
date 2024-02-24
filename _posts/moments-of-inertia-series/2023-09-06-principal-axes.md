---
layout:     series
title:      "Principal Axes"
date:       2023-09-06
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       5
series:     moments-of-inertia
tags:       moments-of-inertia, parallel-axis
---

## What are the Principal Axes

Recall the definition of the inertia tensor

$$
\m{I} = \left[ \begin{array}{@{}rrr@{}}
      I_{xx} & - I_{xy} & - I_{xz} \\
    - I_{yx} &   I_{yy} & - I_{yz} \\
    - I_{zx} & - I_{zy} &   I_{zz}
\end{array} \right ]
$$

These values implicitly assume a coordiate system. Suppose we label this coordiante system's basis vectors $\u{x}$, $\u{y}$, and $\u{z}$. 

$I_{xy} = 0$ if the object is symmetric about the $x$ OR $y$ axes.

<br>

## A Deeper Understanding of the Product of Inertia

Given the 4 quadrants of the $xy$ plane, we know that the value of the product $xy$ is 

```
  y
- | + 
----- x
+ | -
```

So, $I_{xy} = 0$ to be true, we need the positive coordiantes and negative coordiantes to balance out.

<br>

## The Principal Axis Theorem

The prinipal axis theorem says that we can always find a fixed perpendicular set of basis vectors such that the inertia tensor is diagonal. This proof is trivial if the object is on the $xy$ plane. Put the object anywhere in the coordinate system and compute $I_{xy}$. If it's $0$, then we are done. if it's not $0$, then it's either positive or negative. Let's assume it's positive. Now, rotate this object $90$ degrees. By symmetry, it must be the case that it is exactly the same value, but negative. Therefore, since this rotation was smooth, by the intermediate value theorem there must be some point during that rotation at which $I_{xy}$ was $0$.

Now this get's more tricky for an object in $3D$ space.

<br>

## How to Find the Principal Axis

Eigenvectors! The eigenvectors of $\m{I}$ are the directions of the principal axes. Also, the eigenvalues are going to be the values on the diagonal of $\m{I'}$.