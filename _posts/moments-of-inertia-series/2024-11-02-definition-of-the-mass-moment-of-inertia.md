---
layout:     series
title:      "Definition of the Mass Moment of Inertia"
date:       2024-11-02
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       1
series:     moments-of-inertia
tags:       moments-of-inertia
excerpt_separator: <!--more-->
---

<!-- https://ocw.mit.edu/courses/16-07-dynamics-fall-2009/dd277ec654440f4c2b5b07d6c286c3fd_MIT16_07F09_Lec26.pdf -->

## Point Mass

Suppose we have a point mass $m$ which is rotating a distance $R$ away from a fixed axis of rotation with angular velocity $\omega$.

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

    %=============================================================

    % radius of the path of the point mass
    \draw[thick, color=paramColor] (O) -- (0, \R,0) node[midway, below] {$R$};

    % path of point mass (part 1)
    \draw[thick, dashed] (90:\R) arc (90:270:{\R});

    % velocity
    \draw[thick, ->] (0, \R, 0) -- (-1.5, \R, 0) node[right] {$v$};

    % point mass
    \coordinate (M) at (0, \R, 0);
    \draw [color=black, fill=black, tdplot_rotated_coords] (M) circle (\pointradius) node[right, xshift=5, yshift=-8] {$m$};

    % axis of rotation
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % path of point mass (part 2)
    \draw[thick, dashed] (90:\R) arc (90:-90:{\R});

\end{scope}
{% endtikz %}
</center>

Recall the definitions of physical quantities
- $\b{v} = \b{R} \times \b{\omega}$
- $\b{p} = m \b{v}$
- $\b{L} = \b{R} \times \b{p}$

denoting tangential velocity, linear momentum, and angular momentum, respectively. Note that $\times$ refers to the <span class="tooltip">cross product
    <span class="tooltiptext"> 
        $$
        \b{u} \times \b{v} 
        = \left \lvert \begin{array}{ccc} 
            \u{x} & \u{y} & \u{z} \\
            u_x & u_y & u_z \\
            v_x & v_y & v_z
        \end{array} \right \rvert 
        = (u_y v_z - u_z v_y) \; \u{x} + (u_z v_x - u_x v_z) \; \u{y} + (u_x v_y - u_y v_x) \; \u{z}
        $$
    </span>
</span>. In this simplified example, the **angular momentum** of this point mass is given by the following.

$$
\b{L} = \b{R} \times \b{p} = \b{R} \times (m \b{v}) = \b{R} \times (m \b{R} \times \b{\omega})
$$

We exploit that $\b{R}$ and $\b{\omega}$ are perpendicular, which means we can get rid of the cross product (<span class="tooltip">more explanation
    <span class="tooltiptext"> 
        $$
        \abs{ \b{u} \times \b{v} }
        = u v \sin \theta
        $$
        where $\theta$ is the angle between $\b{u}$ and $\b{v}$. If $\b{u} \perp \b{v}$, then $\theta = 90^{\circ}$ and $\abs{ \b{u} \times \b{v} } = u v$
    </span>
</span>).

$$
\b{L} = (m R^2) \b{\omega}
$$

Notice that $m R^2$ only depends on the geometry of the mass while $\omega$ only depends on the motion of the mass. While $\omega$ may change over time, $m R^2$ is constant for each object (at least in this idealized scenario). Therefore, it is natural to separate this term out and give it a name. We call this the **mass moment of inertia** or **rotational inertia** of the point mass. For this example, this is defined as 

$$
I \equiv m R^2
$$

and therefore,

$$
\b{L} = I \b{\omega}
$$

Notice the similarity to the equation for linear momentum, $\b{p} = m\b{v}$. Analogous to mass in linear motion, the rotational inertia describes the objects intrinsic resistance to rotation. The larger the moment of inertia, the harder it is to get the object to rotate. Conversely, if an object with a large moment of inertia is already rotating, then it is difficult to stop. This [video](https://www.youtube.com/watch?v=NsKIPa4Fnfo) is a nice, short demonstration of the effect an object's moment of inertia on its rotational motion.

<br>

## A Collection of Point Masses

Suppose a collection of $n$ point masses $m_i$ are a distance $R_i$ from a fixed axis of rotation each with angular velocity $\omega$. 

<center>
{% tikz collection-of-point-masses %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (AORend) at (0, 0, -3.5);
    \coordinate (AORstart) at (0, 0, 3.5);
    \def\rotarrowradius{0.25}
    \def\rotarrowoffset{0.25}
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Points
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}

    % Magnitude of velocity
    \def\vmag{1}

    %=============================================================

    \def\coords{1/0/2.5/0/7/7/10/-15, 2/-1/-1.5/-2/-8/-5/-2/12, 3/-0.5/-1/2/-8/-5/-2/12}

    \foreach \i / \xpoint / \ypoint / \zpoint / \vxshift / \vyshift / \mxshift / \myshift in \coords {

        \coordinate (M) at (\xpoint, \ypoint, \zpoint);
        \pgfmathsetmacro{\R}{sqrt(\xpoint*\xpoint + \ypoint*\ypoint)}
        \coordinate (velocity) at ({-\ypoint / \R * \vmag}, {\xpoint / \R * \vmag});

        % Radius of the path of the point mass
        \draw[thick, color=paramColor] ($(O) + (0, 0, \zpoint)$) -- (M) node[midway, below] {$R_{\i}$};

        % path of point mass (part 1)
        \draw[thick, dashed] (0, \R, \zpoint) arc (90:270:{\R});

        % Velocity vector (showing direction)
        \draw[thick, ->] (M) -- ++(velocity) node[xshift=\vxshift, yshift=\vyshift] {$v_{\i}$};

        % Point mass location (M) and labeling it
        \draw[color=black, fill=black, tdplot_rotated_coords] (M) circle (\pointradius) node[xshift=\mxshift, yshift=\myshift] {$m_{\i}$};

        % path of point mass (part 2)
        \draw[thick, dashed] (0, \R, \zpoint) arc (90:-90:{\R});
    }
    
    % Axis of rotation (Z-axis)
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    \foreach \i / \xpoint / \ypoint / \zpoint / \vxshift / \vyshift / \mxshift / \myshift in \coords {

        \pgfmathsetmacro{\R}{sqrt(\xpoint*\xpoint + \ypoint*\ypoint)}

        % path of point mass (part 2)
        \draw[thick, dashed] (0, \R, \zpoint) arc (90:-90:{\R});
    }

\end{scope}
{% endtikz %}
</center>

From the above, we know that each object has angular momentum and rotational inertia.

$$
\b{L}_i = (m_i R_i^2) \b{\omega} = I_i \b{\omega}
$$

Now we want to find the total angular momentum of the _system_ of $n$ points. 

$$
\b{L}_{\text{system}} = \sum_{i=1}^n \b{L}_i = \sum_{i=1}^n I_i \b{\omega} = \left ( \sum_{i=1}^n I_i \right ) \b{\omega}
$$

Since all point masses are moving with the same angular velocity (they are moving identically as a group), we can factor out $\b{\omega}$. This let's us define the total rotational inertia of the system.

$$
I_{\text{system}} = \sum_{i=1}^n I_i
$$

This is a very powerful result. It means that we can break down complicated shapes into a set of simple shapes, compute their rotational inertia independently, and then combine to get the final result. In this series, we will use this property to prove the rotational inertia of a [ring](/blog/moments-of-inertia/ring/). 

<br>

## Rigid Body

A **rigid body** is an object that does not deform or change shape. Mathematically you can say that the distance between any two points within the body is always constant.

Consider a rigid body $\mathcal{G}$ rotating around a fixed axis $\b{\omega}$. We can consider any infinitesimal unit of area $dm$. Suppose its distance to the axis of rotation is $r_{\b{\omega}}$. Note that this may be different than $\b{r}$, which denotes the position in space relative to a fixed origin. 

<!-- TODO: Draw a diagram...but it will be super complicated
    I want to draw a blob object, and then have a little section dm
    Then draw the dotted path and radius just like in the point mass case
 -->

This is essentially the same as a point mass, therefore its infinitesimal moment of inertia is 

$$
dI = r_{\b{\omega}}^2 dm
$$

Since it is a _rigid_ body there is no internal motion. Therefore, all parts of $\mathcal{G}$ are rotating with the same angular velocity, so the total rotational inertia is the sum of all the infinitesimal rotational inertias within the object $\mathcal{G}$ (analogous to a collection of point masses). For continuous objects, we integrate over its geometry.

$$
I_{\b{\omega}} = \int_{\mathcal{G}} dI = \int_{\mathcal{G}} r_{\b{\omega}}^2 dm
$$

This is the rotational inertia with respect to a fixed axis $\b{\omega}$. 

While this looks simple, its complexity hides in the subscript $\mathcal{G}$. This is saying we have to integrate with respect to the object's geometry, which can be tricky to do correctly. We will see many examples in the subsequent posts.

<br>

## The Inertia Tensor

The above formula only gives the moment of inertia for a particular axis of rotation. We can generalize this to obtain the **inertia tensor**, which describes the rotational inertia of an object about every axis.

$$
\m{I} = \left[ \begin{array}{@{}rrr@{}}
      I_{xx} & - I_{xy} & - I_{xz} \\
    - I_{yx} &   I_{yy} & - I_{yz} \\
    - I_{zx} & - I_{zy} &   I_{zz}
\end{array} \right ]
$$

The diagonals are called the **moments of inertia** with respect to the $x$, $y$, and $z$ axis. They are a measure of the resistance to rotation in the respective axes.

$$
I_{xx} = \int_{\mathcal{G}} (y^2 + z^2) \; dm
\qquad
I_{yy} = \int_{\mathcal{G}} (z^2 + x^2) \; dm
\qquad
I_{zz} = \int_{\mathcal{G}} (x^2 + y^2) \; dm
$$

The other values are called the **products of inertia** with respect to the $xy$, $yz$, and $zx$ plane. They are a measure of the imbalance in the mass distribution in the respective planes.

<!-- What this means exactly is discussed in the post on the [principal axis theorem](/blog/moments-of-inertia/principal-axis-theorem/). -->

$$
I_{xy} = I_{yx} = \int_{\mathcal{G}} xy \; dm
\qquad
I_{yz} = I_{zy} = \int_{\mathcal{G}} yz \; dm
\qquad
I_{zx} = I_{xz} = \int_{\mathcal{G}} zx \; dm
$$

I derive the inertia tensor and discuss each element in more detail in the [next post](/blog/moments-of-inertia/inertia-tensor-derivation/).

<br>

### Calculating the Moment of Inertia for an Arbitrary Axis

Given the inertia tensor and any axis of rotation $\b{\omega}$, we can find the object's inertia about this axis as follows

$$
I_{\b{\omega}} = \u{\omega}^T \; \m{I} \; \u{\omega}
$$

I derive the inertia tensor and discuss this more in the [next post](/blog/moments-of-inertia/inertia-tensor-derivation). However, if you want you can just take it as a matter of definition.


<!-- Let $\b{r}$ denote the position of a point on an object relative to a fixed origin. Let $\u{\omega}$ represent the direction of the fixed axis of rotation. Then, the moment of inertia is defined as the following.

$$
I = \int_{\mathcal{G}} \lvert \b{r} \times \u{\omega} \rvert^2 \; dm
$$

However, other resources typically don't express this in terms of vectors. You will instead see the following definition, where $r_{axis} = \lvert \b{r} \times \u{\omega} \rvert$ is the distance of a given point in the object from the axis of rotation.

$$
I = \int_{\mathcal{G}} r_{axis}^2 \; dm
$$

More annoyingly, resources online will neglect the subscript and simply write $I = \int r^2 \; dm$. I think this is terrible notation because it's very easy to conflate this with the position vector $\boldsymbol{r}$. Thus, I will always include a subscript.

When evaluating the moment of inertia integral, we need to do the following

$$
I = \int_{\mathcal{G}} r_{axis}^2 \; (\lambda(\b{r}) \; d\ell)
\qquad
I = \int_{\mathcal{G}} r_{axis}^2 \; (\sigma(\b{r}) \; dA)
\qquad
I = \int_{\mathcal{G}} r_{axis}^2 \; (\rho(\b{r}) \; dV)
$$

And we will always assume a uniform mass density. Therefore, 

$$
I = \lambda \cdot \int_{\mathcal{G}} r_{axis}^2 \; d\ell
\qquad
I = \sigma \cdot \int_{\mathcal{G}} r_{axis}^2 \; dA
\qquad
I = \rho \cdot \int_{\mathcal{G}} r_{axis}^2 \; dV
$$

In the above, we have assumed a fixed axis of rotation $\omega$. However, to fully describe an object's moment of inertia, we define the following a **inertia tensor**, which can be used to find the moment of inertia about any axis of rotation.

$$
I = \left[ \begin{array}{@{}rrr@{}}
     I_{xx}  & -I_{xy}  & -I_{xz} \\
    -I_{yx}  &  I_{yy}  & -I_{yz} \\
    -I_{zx}  & -I_{zy}  & I_{zz}
\end{array} \right ]
$$

The diagonals are the **moments of inertia with respect to the x, y and z axis**. You can see that it is precisely the square distance to each respective axis.

$$
I_{xx} = \int_{\mathcal{G}} (y^2 + z^2) \; dm
\qquad
I_{yy} = \int_{\mathcal{G}} (z^2 + x^2) \; dm
\qquad
I_{zz} = \int_{\mathcal{G}} (x^2 + y^2) \; dm
$$

The other values are called the **products of inertia**. They are a measure of the imbalance in the mass distribution.

$$
I_{xy} = I_{yx} = \int_{\mathcal{G}} xy \; dm
\qquad
I_{yz} = I_{zy} = \int_{\mathcal{G}} yz \; dm
\qquad
I_{zx} = I_{xz} = \int_{\mathcal{G}} zx \; dm
$$

For all of them. $I_{ij}$ means we are measuring the moment of inertia around the $i$-axis when the objects are rotated around the $j$-axis.

The **principal axis theorem** says it's always possible to find 3 mutually orthogonal axes such that the products of inertia are 0. In this series, I will always solve using the principle axes. Then you can use the $3\text{D}$ rotation matrices in order to get any other orientation



In order to translate the object, you can use the **parallel axis theorem**, which we will discuss in a [future post](/blog/moments-of-inertia/parallel-axis-theorem).

<br>

## Linearity of Moments

Another important property is the linearity of moments of inertia. If we can decompose an object into $n$ simpler geometries, then

$$
I = \sum_{i = 1}^n I_i
$$

In some ways this is an empirical result and thus does not have a proof. We can see why this fact follows from the integral definition.

$$
I_{\mathcal{G} + \mathcal{H}} = \int_{\mathcal{G} + \mathcal{H}} r_{\text{axis}}^2 \; dm = \int_{\mathcal{G}} r_{\text{axis}}^2 \; dm + \int_{\mathcal{H}} r_{\text{axis}}^2 \; dm = I_{\mathcal{G}} + I_{\mathcal{H}}
$$

If we have two geometries $\mathcal{G}$ and $\mathcal{H}$. We can either evaluate the integral on their concatenation $\mathcal{G} + \mathcal{H}$ or separately as two integrals. This is similar to the trivial property

$$
\int_{a}^b f(t) \; dt = \int_{a}^c f(t) \; dt + \int_{c}^b f(t) \; dt
$$

<br>

In a later post, we will prove the **parallel axis theorem** which allows you to calculate the moment of inertia after translating ...

Therefore, the strategy of this series is to find the moment of inertia values for very simple objects. Then using linearity and the parallel axis theorem, you can find the moments of inertia of more complicated systems without needing to calculate integrals.

<br>

If you let a rigid body roll down an incline, the one with the larger moment of inertia will roll slower.

The moment of inertia is **not** coordinate-dependent. In other words, it's translation invariant.

If the transformation matrix is $T$, then 

$$
I_{x', y', z'} = [T] [I_{x,y,z}] [T]^{T}
$$

where

$$
\b{r}' = [T] \b{r}
\qquad\text{and}\qquad
\b{r} = [T]^{-1} \b{r}'
$$

However, note that $[T]^{-1} = [T]^{T}$

### Generalized Parallel Axis Theorem

$$
I_{x', y', z'} = I_{x,y,z} + 
M \left [ \begin{array}{ccc}
    (y')^2 + (z')^2 & -(x')(y')  & -(x')(z') \\
    -(y')(x')  & (z')^2 + (x')^2 & -(y')(z') \\
    -(z')(x')  & -(z')(y')  & (x')^2 + (y')^2
\end{array} \right ]
$$ -->
