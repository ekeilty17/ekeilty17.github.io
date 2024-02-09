---
layout:     series
title:      "Definition of a Moment"
date:       2023-09-02
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       1
series:     moments-of-inertia
tags:       moments-of-inertia
excerpt_separator: <!--more-->
---

## Point Mass

Suppose we have a point mass $m$ which is rotating a distance $R$ away from a fixed axis of rotation $\b{\omega}$. 

<center>
{% tikz point-mass %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc,bending,decorations.pathreplacing}
    \tikzset{
        pics/rotarr/.style={
            code={
            \draw[white,line width=0.8] ({#1*cos(210)},0) arc(-210:35:{#1} and {0.35*#1});
            \draw[-{>[flex'=1]}] ({#1*cos(210)},0) coordinate (W1) arc(-210:35:{#1} and {0.35*#1})
                node[midway] (W2) {} --++ (150:0.1) coordinate (W3);
        }},
        pics/rotarr/.default=0.3,
    }
    
    %                  (y, z, x)
    \coordinate (O) at (0, 0, 0);
    \def\R{2.5}       % radius of hoop
    \def\L{0.5}     % thickness of the hoop

    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!70!black}
    \colorlet{mygray}{gray!40}

    % radius of the path of point mass
    \draw[thick, color=myblue] (O) -- (\R,0,0) node[midway, below] {$R$};

    % point mass
    \draw[very thick, color=black, fill=black] (\R, 0, 0) circle (0.05) node[right, xshift=5] {$m$};

    % path of point mass (part 2)
    \draw[thick, densely dashed, rotate around x=90] (-\R,0,0) arc (180:360:{\R});

    % axis of rotation
    \draw [color=myred] (0, -1.5, 0) -- (0, 1.5, 0) node[xshift=17, yshift=-7] {$\omega$};
    \pic[color=myred] at (0, 1.25, 0) {rotarr};

    % path of point mass (part 1)
    \draw[thick, densely dashed, rotate around x=90] (\R,0,0) arc (0:180:{\R});

{% endtikz %}
</center>

It's **moment of inertia** is defined as 

$$
I = m r^2
$$

At the end of the day this is a definition. 

Now, suppose we had $n$ point masses with mass $m_i$ each rotating a distance $r_i$ away from a fixed axis of rotation $\omega$.

Then, the moment of inertia of this system is 

$$
I = \sum_{i=1}^n I_i = \sum_{i=1}^n m_i r_i^2
$$

again, this is just an empirical result.

<br>

## Rigid Body

A **rigid body** is an object that does not deform or change shape. Mathematically you can say that the distance between any two points within the body is always constant.

Consider a rigid body $\mathcal{G}$ rotating around a fixed axis $\omega$. We can consider any infinitesimal unit of area $dm$. Suppose its distance to the axis of rotation is $r_{axis}$. This is essentially the same as a point mass, therefore its infinitesimal moment of inertia is 

$$
dI = r_{axis}^2 dm
$$

Now, if we sum up all of the infinitesimal moments of inertias within the object $\mathcal{G}$

$$
I = \int_{\mathcal{G}} dI = \int_{\mathcal{G}} r_{axis}^2 dm
$$

While this looks simple, its complexity hides in the subscript $\mathcal{G}$. This is saying we have to integrate with respect to the object's geometry, which can be tricky to do correctly. We will see many examples in the subsequent posts.

Let $\b{r}$ denote the position of a point on an object relative to a fixed origin. Let $\u{\omega}$ represent the direction of the fixed axis of rotation. Then, the moment of inertia is defined as the following.

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

<!-- https://ocw.mit.edu/courses/16-07-dynamics-fall-2009/dd277ec654440f4c2b5b07d6c286c3fd_MIT16_07F09_Lec26.pdf -->

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

The **principal axis theorem** says it's always possible to find 3 mutually orthogonal axes such that the products of inertia are 0. In this series, I will always solve using the principle axes. Then you can use the 3D rotation matrices in order to get any other orientation

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

<!-- However, in this series we will always fix a defined **axis of rotation**, which means the moment of inertia is going to be a scalar value. -->

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