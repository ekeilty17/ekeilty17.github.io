---
layout:     series
title:      "Principal Axis Theorem"
date:       2024-02-07
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       6
series:     moments-of-inertia
tags:       moments-of-inertia, parallel-axis
---

**TODO**

In the [previous post](/blog/moments-of-inertia/parallel-axis-theorem) on the parallel axis theorem, we say how the inertia tensor updated when the object $\mathcal{G}$ is **translated** in our fixed coordiante system. In this post, we are going to see how the inertia tensor is updated when the object $\mathcal{G}$ is **rotated**. Then, we are going to generalize this result for any **linear transformation** and **affine tranformation**.

## Principal Axes

If we are analyzing the moment of inertia of an object about a fixed axis of rotation, then clearly rotating about this axis does not change its inertia. In the figure below, each of the point masses have the same rotational inertia.

<center>
{% tikz point-mass %}[scale=1.5, line width=1.5pt, font=\LARGE]
\usetikzlibrary{angles,arrows.meta}
\tdplotsetmaincoords{70}{110}
\begin{scope}[>=Stealth, tdplot_main_coords]
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25}
    \def\rotarrowoffset{0.25}
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Points
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}

    % Curve Parameters
    \def\R{2.5}         % radius of circle

    % Particular Definitions
    \coordinate (M1) at (0, \R, 0);
    \coordinate (M2) at  ({\R*cos(160)},{\R*sin(160)},0);
    \coordinate (M3) at  ({\R*cos(250)},{\R*sin(250)},0);

    %=============================================================

    % radius of the path of the point mass
    \draw[thick, color=paramColor] (O) -- (M1) node[midway, below] {$R$};
    \draw[thick, color=paramColor] (O) -- (M2) node[midway, above] {$R$};
    \draw[thick, color=paramColor] (O) -- (M3) node[midway, below] {$R$};

    % path of point mass (part 1)
    \draw[thick, dashed] (90:\R) arc (90:270:{\R});

    % point mass
    \draw [color=black, fill=black, tdplot_rotated_coords] (M1) circle (\pointradius) node[right, xshift=5, yshift=-8] {$m$};
    \draw [color=black, fill=black, tdplot_rotated_coords] (M2) circle (\pointradius) node[right, xshift=5, yshift=8] {$m$};
    \draw [color=black, fill=black, tdplot_rotated_coords] (M3) circle (\pointradius) node[left, xshift=-5, yshift=8] {$m$};

    % axis of rotation
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % path of point mass (part 2)
    \draw[thick, dashed] (90:\R) arc (90:-90:{\R});

\end{scope}
{% endtikz %}
</center>

However, if we have an inertia tensor, then it gets a bit more complicated. The inertia tensor does not remain constant when the object is rotated. For example, consider a point mass on the $xy$ plane a distance $R$ from the origin.

<center>
{% tikz point-mass-xy-plane-1 %}[scale=1.5, line width=1.5pt, font=\LARGE]
\usetikzlibrary{angles,arrows.meta}
\tdplotsetmaincoords{70}{110}
\begin{scope}[>=Stealth, tdplot_main_coords]
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);
    \coordinate (X) at (4, 0, 0);
    \coordinate (Y) at (0, 2.5, 0);
    \coordinate (Z) at (0, 0, 2);

    % Points
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}

    % Curve Parameters
    \def\R{2.5}         % radius of circle

    % Particular definitions
    \def\myphi{40}
    \coordinate (xy) at ({\R*cos(\myphi)},{\R*sin(\myphi)},0);

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    \draw pic[draw, -{Classical TikZ Rightarrow}, paramColor, pic text=$\phi$, thick, angle radius={0.5cm}, angle eccentricity=1.6] {angle = X--O--xy};

    % radius of the path of the point mass
    \draw[very thick, color=paramColor] (O) -- (xy) node[midway, above, xshift=10, yshift=-5] {$R$};

    % point mass
    \draw [color=black, fill=black, tdplot_rotated_coords] (xy) circle (\pointradius) node[right, xshift=5, yshift=-8] {$m$};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz point-mass-xy-plane-2 %}[scale=1.5, line width=1.5pt, font=\LARGE]
\usetikzlibrary{angles,arrows.meta}
\tdplotsetmaincoords{70}{110}
\begin{scope}[>=Stealth, tdplot_main_coords]
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);
    \coordinate (X) at (4, 0, 0);
    \coordinate (Y) at (0, 2.5, 0);
    \coordinate (Z) at (0, 0, 2);

    % Points
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}

    % Curve Parameters
    \def\R{1.5}         % radius of circle

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % radius of the path of the point mass
    \draw[ultra thick, color=paramColor] (O) -- (0, \R, 0) node[midway, above] {$R$};

    % point mass
    \coordinate (M) at (0, \R, 0);
    \draw [color=black, fill=black, tdplot_rotated_coords] (M) circle (\pointradius) node[below, xshift=0, yshift=-5] {$m$};

\end{scope}
{% endtikz %}
</center>

The inertia tensor to describe this is the following. As an exercise, verify this using the general formula for the inertia tensor of a point pass given in a [previous post](/blog/moments-of-inertia/inertia-tensor-derivation).

$$
\m{I} = mR^2 
\begin{bmatrix}
    \sin^2 \phi & - \sin \phi \cos \phi & 0 \\
    - \sin \phi \cos \phi & \cos^2 \phi & 0 \\
    0 & 0 & 1
\end{bmatrix} 
$$

Notice that if $\phi = \pi/2$, then the inertia tensor becomes

$$
\m{I} = mR^2 
\begin{bmatrix}
    1 & 0 & 0 \\
    0 & 0 & 0 \\
    0 & 0 & 1
\end{bmatrix} 
$$

This is a much nicer inertia tensor to work with, and we really haven't changed anything about the system. All we have done is moved our coordinate system. 

a **principal axis** is a coordiante system such that the inertia tensor is diagonal. In otherwords, all product of inertia values are $0$.

<br>

---

<br>

## The Principal Axis Theorem



### Proof

Let $\m{A} \in \mathbb{R}^{n \times n}$ with eigenvectors $\b{v}_1, \b{v}_2, \ldots, \b{v}_n$ (not necessarily normalized) and cooresponding eigenvalues $\lambda_1, \lambda_2, \ldots, \lambda_n$. Let

$$
\m{V} = 
\begin{bmatrix}
    \vert  & & \vert \\
    \b{v}_1 & \cdots & \b{v}_n \\
    \vert  & & \vert
\end{bmatrix} 
\qquad\qquad
\m{\Lambda} = 
\begin{bmatrix}
    \lambda_1 & \cdots & 0 \\
    \vdots & \ddots &  \\
    0 & & \lambda_n
\end{bmatrix} 
$$

Therefore

$$
\m{A} = \m{V} \ \m{\Lambda} \ \m{V}^{-1}
$$

Now, suppose $\m{A}$ is symmetric, then it can be shown that the eigenvectors $\b{v}_1, \b{v}_2, \ldots, \b{v}_n$ form an [orthonormal basis](https://en.wikipedia.org/wiki/Orthonormal_basis). Essentially, this means that the normalized eigenvectors can be thought of as a purely rotated coordiante system. Applied to rotational inertias, this implies that we can always find principal axes.

<!-- 
https://www.math.uwaterloo.ca/~jmckinno/Math225/Week7/Lecture2m.pdf 
https://moodle.swarthmore.edu/pluginfile.php/266483/mod_resource/content/0/Handouts/eigen/P_axis_thm2.pdf
-->

<br>

---

<br>

## Transformations

We are going to get a bit formal

First, what is a transformation? 

### Linear Transformations

A **linear transformation** is a transformation $T : X \rightarrow Y$ such that

$$
T(\b{v} + \b{u}) = T(\b{v}) + T(\b{u})
\qquad\qquad
T(c \cdot \b{v}) = c \cdot T(\b{v})
\qquad\qquad
\forall \b{v}, \b{u} \in X
\ , \
c \in \mathbb{R}
$$

An interesting fact about linear transformations is that $T(\b{0}) = \b{0}$. A good exercise is to prove this fact. More importantly, all linear transformations $T$ over finite vector spaces can be represented by a matrix. In particular, $T : X \rightarrow Y$ where $\abs{X} = n$ and $\abs{Y} = m$ is isomorphic to $\m{T} : \mathbb{R}^n \rightarrow \mathbb{R}^m$. For an explanation and proof of this result, I recommend this [blog post](<!-- https://mbernste.github.io/posts/matrices_linear_transformations/ -->).

<!-- https://textbooks.math.gatech.edu/ila/linear-transformations.html -->

### Operators

An **operator** is a linear tranformation from a vector space to itself, in particular $T : X \rightarrow X$. 

<br>

---

<br>

Suppose we want to determine the rotational inertia of a rigid body $\mathcal{G}$. In previous posts, we saw that the inertia tensor is the object we want to calculate. 

$$
\m{I} = \left[ \begin{array}{@{}rrr@{}}
      I_{xx} & - I_{xy} & - I_{xz} \\
    - I_{yx} &   I_{yy} & - I_{yz} \\
    - I_{zx} & - I_{zy} &   I_{zz}
\end{array} \right ]
$$

However, a particular inertia tensor implicitly assumes that object $\mathcal{G}$ is at a random location in a fixed coordinate system. If the object position in the coordinate system changes, then the inertia tensor will also change. To give a simple example using a point mass.



The inertia tensor of each is given by the following. As an exercise, verify these inertia tensors using the general inertia tensor for a point pass given in a [previous post](/blog/moments-of-inertia/inertia-tensor-derivation).

$$
\m{I_1} = mR^2 
\begin{bmatrix}
    \sin^2 \phi & - \sin \phi \cos \phi & 0 \\
    - \sin \phi \cos \phi & \cos^2 \phi & 0 \\
    0 & 0 & 1
\end{bmatrix} 
\qquad\qquad
\m{I_2} = mR^2 
\begin{bmatrix}
    1 & 0 & 0 \\
    0 & 0 & 0 \\
    0 & 0 & 1
\end{bmatrix} 
$$

We see that in general $\m{I_1}$ is not a principal axis. However, by rotating the point mass by the appropriate amount, we can find a principal axis, $\m{I_2}$.

The question becomes, when are the 

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

So, $I_{xy} = 0$ to be true, we need the positive coordinates and negative coordinates to balance out.

<br>

## The Principal Axis Theorem
The principal axis theorem says that we can always find a fixed perpendicular set of basis vectors such that the inertia tensor is diagonal. This proof is trivial if the object is on the $xy$ plane. Put the object anywhere in the coordinate system and compute $I_{xy}$. If it's $0$, then we are done. if it's not $0$, then it's either positive or negative. Let's assume it's positive. Now, rotate this object $90$ degrees. By symmetry, it must be the case that it is exactly the same value, but negative. Therefore, since this rotation was smooth, by the intermediate value theorem there must be some point during that rotation at which $I_{xy}$ was $0$.
Now this gets more tricky for an object in $3D$ space.

The real proof essentially boils down to the following claim: every symmetric matrix is orthogonally diagonalizable. This is a bit too hard-core linear algebra for this series. 


<br>

## How to Find the Principal Axis

Eigenvectors! The eigenvectors of $\m{I}$ are the directions of the principal axes. Also, the eigenvalues are going to be the values on the diagonal of $\m{I'}$.

Why does this work? We are doing a coordinate transformation on the angular momentum. Suppose $\m{T}$ is any **unitary transformation** (meaning the determinant is $1$). We need this property so stuff doesn't get scaled.

### Tranformations

$$
\b{L}' = \m{T} \b{L} = \m{T} (\m{I} \b{\omega}) = \m{T} \m{I} \b{\omega}
$$

But actually, $\b{\omega}$ is still being written in terms of the old coordinate system. We need $\b{\omega}$ to rotate as well. Therefore

$$
\b{L}' = \m{T} \m{I} ( \m{T}^{-1} \b{\omega}') = (\m{T} \m{I} \m{T}^{-1}) \b{\omega}'
$$

Therefore

$$
\m{I'} = \m{T} \m{I} \m{T}^{-1}
$$

**TODO**: This is handwavy math. Fix later.

### Rotation Matrices

Rotation matrices are a specific instance of a unitary transformation. 

$$
\begin{align}
R_z(\alpha) \; R_y(\beta) \; R_x(\gamma) 
&= 
\begin{bmatrix}
    \cos \alpha & - \sin \alpha & 0 \\
    \sin \alpha & \cos \alpha & 0 \\
    0 & 0 & 1
\end{bmatrix} 
\
\begin{bmatrix}
    \cos \beta & 0 & \sin \beta \\
    0 & 1 & 0 \\
    - \sin \beta & 0 & \cos \beta
\end{bmatrix}
\
\begin{bmatrix}
    1 & 0 & 0 \\
    0 & \cos \gamma & - \sin \gamma \\
    0 & \sin \gamma & \cos \gamma
\end{bmatrix}
\\[10pt]
&= 
\begin{bmatrix}
    \cos \alpha \cos \beta & \cos \alpha \sin \beta \sin \gamma - \sin \alpha \cos \gamma & \cos \alpha \sin \beta \cos \gamma + \sin \alpha \sin \gamma \\
    \sin \alpha \cos \beta & \sin \alpha \sin \beta \sin \gamma - \cos \alpha \cos \gamma & \sin \alpha \sin \beta \cos \gamma - \cos \alpha \sin \gamma \\
    - \sin \beta & \cos \beta \sin \gamma & \cos \beta \cos \gamma
\end{bmatrix}
\end{align}
$$

<br>

---

<br>

## General Transformation

Assume object $\mathcal{G}$ is situated such that its center of mass is at the origin. Suppose its inertia tensor is $\m{I_{\text{cm}}}$.

$$
\m{I_{\text{rotated}}} = \m{R_z(\alpha)} \; \m{R_y(\beta)} \; \m{R_x(\gamma)} \; \m{I_{\text{cm}}} \; \m{R_x(\gamma)}^{-1} \; \m{R_y(\beta)}^{-1} \; \m{R_z(\alpha)}^{-1}
$$

$$
\m{I_{\text{translated}}} = \m{I_{\text{rotated}}} +  M (D^2 \m{\mathbb{I}} - \b{D} \otimes \b{D})
$$

This is called an **affine transformation**. An affine tranformation is equivalent to a linear tranformation + translation