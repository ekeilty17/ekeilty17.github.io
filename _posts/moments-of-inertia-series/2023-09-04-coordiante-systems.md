---
layout:     series
title:      "Coordiante Systems"
date:       2023-09-04
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       3
series:     moments-of-inertia
tags:       moments-of-inertia
---

<!-- Insane coordinate drawings -->
<!-- https://tikz.net/tag/coordinates/ -->

We need to take a quite detour. In order to calculate the moment of inertia of an object, we need to be able to algebraically describe its geometry. Choosing the right coordiante system can vastly simplify the analysis. In this post, I will _briefly_ go over the standard coordinate systems used in physics - Cartesian, cylindrical, and spherical.  

<br>

## Cartesian Coordinates

Conceptually, this is the most intuitive and obvious coordinate system. Given any point in $3\text{D}$ space, pick any three orthogonal directions and measure the point's distance from a fixed origin in those direction. This coordinate system most naturally describes cuboid geometries and is typically used in very irregular geometries.

<center>
{% tikz cartesian-coordinates %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc,bending,decorations.pathreplacing}
    
    %                  (y, z, x)
    \coordinate (O) at (0, 0, 0);
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}

    \draw [thick, ->] (O) -- (0,0,4) node[left] {$x$};
    \draw [thick, ->] (O) -- (3,0,0) node[right] {$y$};
    \draw [thick, ->] (O) -- (0,3,0) node[above] {$z$};

    \def\x{2.5}
    \def\y{2}
    \def\z{2.5}

    \coordinate (XYZ) at (\y, \z, \x);
    \coordinate (XY) at (\y, 0, \x);
    \draw [ultra thick, paramColor] (O) -- (XYZ) node[midway, above, xshift=-12, yshift=-15] {$\boldsymbol{r}$};
    \draw [dashed, semithick] (0, 0, \x) -- (XY) node[midway, below, yshift=-5] {$x$};
    \draw [dashed, semithick] (\y, 0, 0) -- (XY) node[midway, right, xshift=7, yshift=-5] {$y$};
    \draw [dashed, semithick] (XY) -- (XYZ) node[midway, right, xshift=3, yshift=10] {$z$};

    \def\eps{0.5}
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (0, 0, \eps) $) node[left] {$\hat{\boldsymbol{x}}$};
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (\eps, 0, 0) $) node[right] {$\hat{\boldsymbol{y}}$};
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (0, \eps, 0) $) node[above] {$\hat{\boldsymbol{z}}$};

    \draw[very thick, color=paramColor, fill=paramColor] (XYZ) circle (0.05);

{% endtikz %}
</center>

$$
\b{r} = x \; \u{x} + y \; \u{y} + z \; \u{z}
$$

The benefit of this coordiante system is that each unit vector is constant. No matter what is going on inside the coordiante system, the $\u{x}$ unit vector always points along the $x$-axis (a property novice calculus students take for granted). Therefore, doing calculus with vectors in this coordinate system is very easy. The cost of this is that for complicate geometries the parameterizations become unwieldy. This is why mathematicians created alternative coordinate systems.

<!-- Since each [basis vector](https://en.wikipedia.org/wiki/Basis_(linear_algebra)) is constant with respect to the coordinate of interest, this coordinate system is extremely easy to do calculus with. When evaluating line, surface, and volume integrals, we have the following infinitesimals. 

$$
d \b{\ell} = d x \; \u{x} + d y \; \u{y} + d z \; \u{z}
$$

$$
d\b{A}_{xy} = dx \; dy \; \u{z}
\qquad
d\b{A}_{yz} = dy \; dz \; \u{x}
\qquad
d\b{A}_{zx} = dz \; dx \; \u{y}
$$

$$
dV = dx \; dy \; dz
$$ -->

<br>

## Cylindrical Coordinates 

Now we get a little more complicated (but not too much). We are using the [polar coordiantes](https://www.khanacademy.org/computing/computer-programming/programming-natural-simulations/programming-angular-movement/a/polar-coordinates) $(s, \phi)$ to describe the point's projection onto the $xy$-plane, then we simply go straight in the $z$ direction. As the name suggests, this coordinate system is best suited for cylindrically-shaped objects.

<center>
{% tikz cylindrical-coordinates %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc,bending,decorations.pathreplacing}
    
    %                  (y, z, x)
    \coordinate (O) at (0, 0, 0);
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}

    \draw [thick, ->] (O) -- (0,0,4) node[left] {$x$};
    \draw [thick, ->] (O) -- (3,0,0) node[right] {$y$};
    \draw [thick, ->] (O) -- (0,3,0) node[above] {$z$};

    \def\x{2.5}
    \def\y{2}
    \def\z{2.5}

    \coordinate (XYZ) at (\y, \z, \x);
    \coordinate (XY) at (\y, 0, \x);
    \draw [ultra thick, paramColor] (O) -- (XYZ) node[midway, above, xshift=-12, yshift=-15] {$\boldsymbol{r}$};
    \draw [dashed, semithick] (O) -- (XY) node[midway, below, xshift=2, yshift=-7] {$s$};
    \draw [dashed, semithick] (XY) -- (XYZ) node[midway, right, xshift=3, yshift=10] {$z$};

    \coordinate (X) at (0, 0, \x);
    \draw pic[draw, ->, pic text=$\phi$, thick, angle radius={0.5cm}, angle eccentricity=1.7] {angle = X--O--XY};

    \def\eps{0.5}
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (\y * \eps / 1.5, 0, \x * \eps / 1.5) $) node[right] {$\hat{\boldsymbol{s}}$};
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (\x * \eps/3, 0, -\y * \eps/3) $) node[right, yshift=5] {$\hat{\boldsymbol{\phi}}$};
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (0, \eps, 0) $) node[above] {$\hat{\boldsymbol{z}}$};

    \draw[very thick, color=paramColor, fill=paramColor] (XYZ) circle (0.05);

{% endtikz %}
</center>

$$
\b{r} = s \; \u{s} + z \; \u{z}
$$

We have to be careful with the $\u{s}$ as it is not constant. Its direction changes depending on the coordiante we are describing. Therefore, we have to be careful when doing calculus. For example, $\frac{\partial}{\partial \phi} \u{s} = \u{\phi}$ (we prove this fact when finding the moment of inertia of a [circle](/blog/moments-of-inertia/circle)). The benefit of this small annoyance is (usually) a reduction in complexity in parameterization.

<!-- Doing calculus with this coordinate system is a bit tricker than with Cartesian coordinates because the unit vector $\u{s}$ changes depending on the coordinate (i.e. it's not constant). Therefore, we have to do some correcting using [Jacobeans](https://rohankulkarni.me/files/extra_exams/jacobians_rohan.pdf). The infinitesimals for this coordiante system are listed below.

$$
d \b{\ell} = ds \; \u{s} + s \; d \phi \; \u{\phi} + z \; \u{z}
$$

$$
d\b{A}_{s \phi} = s \; ds \; d\phi \; \u{z}
\qquad
d\b{A}_{\phi z} = s \; d\phi \; dz \; \u{s}
\qquad
d\b{A}_{z s} = dz \; ds \; \u{\phi}
$$

$$
dV = s \; ds \; d\phi \; dz
$$ -->

Below is the conversion between Cartesian and cylindrical coordinates. We will particularly use the conversion between the unit vectors. Deriving these formulas is a good exercise to make sure you understand the coordiante system.

$$
\begin{align}

&\begin{cases}
    x = s \ \cos \phi \\
    y = s \ \sin \phi \\
    z = z
\end{cases}
\qquad&&
\begin{cases}
    \u{x} = \cos \phi \ \u{s} - \sin \phi \ \u{\phi} \\
    \u{y} = \sin \phi \ \u{s} + \cos \phi \ \u{\phi} \\
    \u{z} = \u{z}
\end{cases}
\\[15pt]
&\begin{cases}
    s    = \sqrt{x^2 + y^2} \\
    \phi = \arctan(y / x) \\
    z    = z
\end{cases}
\qquad&&
\begin{cases}
    \u{s}    = \cos \phi \ \u{x} + \sin \phi \ \u{y} \\
    \u{\phi} = - \sin \phi \ \u{x} + \cos \phi \ \u{y} \\
    \u{z}    = \u{z}
\end{cases}
\end{align}
$$

<br>

## Spherical Coordinates

Finally, we have the coordinate system which is conceptually the most difficult since none of the unit vectors are constant. Notice the direction we measure $\theta$ (it's probably the opposite of what you would expect). Also notice that even though the unit vectors change depending on the point of interest, they always remain perpendicular to each other.

<center>
{% tikz spherical-coordinates %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc,bending,decorations.pathreplacing}
    
    %                  (y, z, x)
    \coordinate (O) at (0, 0, 0);
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}

    \draw [thick, ->] (O) -- (0,0,4) node[left] {$x$};
    \draw [thick, ->] (O) -- (3,0,0) node[right] {$y$};
    \draw [thick, ->] (O) -- (0,3,0) node[above] {$z$};

    \def\x{2.5}
    \def\y{2}
    \def\z{2.5}

    \coordinate (XYZ) at (\y, \z, \x);
    \coordinate (XY) at (\y, 0, \x);
    \draw [ultra thick, paramColor] (O) -- (XYZ) node[midway, below, xshift=5, yshift=-5] {$\boldsymbol{r}$};
    \draw [dashed, semithick] (O) -- (XY);
    \draw [dashed, semithick] (XY) -- (XYZ);

    \coordinate (X) at (0, 0, \x);
    \coordinate (Z) at (0, \z, 0);
    \draw pic[draw, <-, pic text=$\theta$, thick, angle radius={0.75cm}, angle eccentricity=1.7] {angle = XYZ--O--Z};
    \draw pic[draw, ->, pic text=$\phi$, thick, angle radius={0.5cm}, angle eccentricity=1.7] {angle = X--O--XY};

    \def\eps{0.5}
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (\y * \eps/1.5, \z * \eps/1.5, \x * \eps/1.5) $) node[above] {$\hat{\boldsymbol{r}}$};
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (\x * \eps/3, 0, -\y * \eps/3) $) node[right, yshift=5] {$\hat{\boldsymbol{\phi}}$};
    \draw [ultra thick, ->] (XYZ) -- ($ (XYZ) + (\y * \eps/3.5, -\z * \eps/3.5, \x * \eps/3.5) $) node[right] {$\hat{\boldsymbol{\theta}}$};

    \draw[very thick, color=paramColor, fill=paramColor] (XYZ) circle (0.05);

{% endtikz %}
</center>

$$
\b{r} = r \; \u{r}
$$

This coordinate system finishes what cylindrical coordinates started. In this coordinate system, none of the unit vectors are constant. However, due to the nature $\u{\theta}$ and $\u{\phi}$ there is usually a symmetry argument to simplify them. Again, it is trading one type of complexity for another. In certain geometries, it greatly simplifies the analysis.

<!-- As before, we have some Jacobean terms to account for the dependencies in the unit vectors. These are listed below. 

$$
d \b{\ell} = dr \; \u{r} + r \; d \theta \; \u{\theta} + r \; \sin \theta \; d \phi \; \u{\phi}
$$

$$
d\b{A}_{r \theta} = r \; dr \; d\theta \; \u{\phi}
\qquad
d\b{A}_{\theta \phi} = r^2 \sin \theta \; d\theta \; d\phi \; \u{r}
\qquad
d\b{A}_{\phi r} = r \sin \theta \; d\phi \; dr \; \u{\theta}
$$

$$
dV = r^2 \sin \theta \; dr \; d\theta \; d\phi
$$ -->

Again, we give the conversion between spherical coordiantes and the two previous coordiante systems. If you've never worked with spherical coordiantes, I recommend you try to derive these formulas. It's much more simple than it looks.

$$
\begin{align}

&\begin{cases}
    x = r \ \sin \theta \ \cos \phi \\
    y = r \ \sin \theta \ \sin \phi \\
    z = r \cos \theta
\end{cases}
\qquad&&
\begin{cases}
    \u{x} = \sin \theta \ \cos \phi \ \u{r} + \cos \theta \cos \phi \ \u{\theta} - \sin \phi \ \u{\phi} \\
    \u{y} = \sin \theta \ \sin \phi \ \u{r} + \cos \theta \sin \phi \ \u{\theta} + \cos \phi \ \u{\phi} \\
    \u{z} = \cos \theta \ \u{r} - \sin \theta \ \u{\theta}
\end{cases}
\\[15pt]
&\begin{cases}
    r      = \sqrt{x^2 + y^2 + z^2} \\
    \theta = \arctan(\sqrt{x^2 + y^2} / z) \\
    \phi   = \arctan(y / x)
\end{cases}
\qquad&&
\begin{cases}
    \u{r}      = \sin \theta \ \cos \phi \ \u{x} + \sin \theta \sin \phi \ \u{y} + \cos \theta \ \u{z} \\
    \u{\theta} = \cos \theta \ \cos \phi \ \u{x} + \cos \theta \sin \phi \ \u{y} - \sin \theta \ \u{z} \\
    \u{\phi}   = - \sin \phi \ \u{x} + \cos \phi \ \u{y}
\end{cases}
\end{align}
$$