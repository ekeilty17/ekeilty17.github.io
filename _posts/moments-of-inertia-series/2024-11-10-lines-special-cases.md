---
layout:     series
title:      "Lines in the XY Plane"
date:       2024-11-10
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       9
series:     moments-of-inertia
tags:       moments-of-inertia
---

## Table of Contents

- [Preamble](#preamble)
- [General](#general)
    - [Coordiante Formula](#coordiante-formula)
- [At the Origin](#at-the-origin)
    - [Center of Mass at the Origin](#center-of-mass-at-the-origin)
    - [Endpoint at the Origin](#endpoint-at-the-origin)
- [Endpoints on the x Axis and y Axis](#endpoints-on-the-x-axis-and-y-axis)
- [Parallel to x Axis and Perpendicular to y Axis](#parallel-to-x-axis-and-perpendicular-to-y-axis)
    - [General](#parallel-perpendicular-general)
    - [Centered at a Distance](#centered-at-a-distance)
    - [Centered on an Axis](#centered-on-an-axis)

<br>

---

<br>

## Preamble {#preamble}

In the [previous post](/blog/moments-of-inertia/lines), we found the general expression for the moment of inertia of a line. In this post, we are going to take the special case where the line is restricted to the $xy$ plane and derive some simplified formulas. This will be help in the next post on [triangles](/blog/moments-of-inertia/triangle-curve). This is meant to be more of a reference, which is why I have provided a table of contents.

One interesting thing to notice in the inertia tensors is that $I_{zz} = I_{xx} + I_{yy}$. This is true for any object restricted to the $xy$ plane (not just lines). You can easily prove this using the definitions of these values.

<br>

---

<br>

## General {#general}


Recall the general [inertia tensor of a line](/blog/moments-of-inertia/lines#inertia-tensor) from the previous post. Since we are restricted to the $xy$ plane, $\alpha_z = \pi/2$. Therefore $\sin \alpha_z = 1$ and $\cos \alpha_z = 0$. Furthermore, there is now a much more direct relationship between $\alpha_x$ and $\alpha_y$. It is a bit redundant to use both. Therefore, we use the standard convention from cylindrical and polar coordinate and denote $\phi_L = \alpha_x = \pi/2 - \alpha_y$. We do likewise with $\beta_x$ and $\beta_y$ and denote $\phi_{\text{cm}} = \beta_x = \pi/2 - \beta_y$.

<center>
{% tikz line-inertia-xy-plane-3D %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (5, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Curve Parameters
    \def\a{1.5}
    \def\b{-1}
    \def\c{0}
    \def\d{3}
    \def\e{3}
    \def\f{0}

    % Particular definitions
    \coordinate (start) at (\a, \b, \c);
    \coordinate (end) at (\d, \e, \f);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \def\zcm{(\f-\c)*0.5 + \c}
    \coordinate (CM) at ({\xcm}, {\ycm}, {\zcm});

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};
    
    % drawing the box around the line
    \draw [thick, dashed] (\a, \b, 0) -- (\d, \b, 0) node[midway, left, yshift=5] {$L_x$};
    \draw [thick, dashed] (\d, \b, 0) -- (\d, \e, 0) node[midway, below] {$L_y$};
    \draw [thick, dashed] (\d, \e, 0) -- (\a, \e, 0);
    \draw [thick, dashed] (\a, \e, 0) -- (\a, \b, 0);

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[below, xshift=10, yshift=0] {$L$};

    % center of mass
    \draw [very thick, ->] (O) -- (CM) node[midway, right] {$\boldsymbol{r}_{\text{cm}}$};
    
\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz line-inertia-xy-plane-2D %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{1.5}
    \def\b{-1}
    \def\d{3}
    \def\e{3}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \coordinate (CM) at ({\xcm}, {\ycm});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-2, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % drawing the box around the line
    \draw [thick, dashed] (\a, \b) -- (\d, \b) node[midway, below] {$L_x$};
    \draw [thick, dashed] (\d, \b) -- (\d, \e) node[midway, right] {$L_y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[below, xshift=-15, yshift=0] {$L$};

    % center of mass
    \draw [very thick, -{Stealth}] (O) -- (CM) node[midway, above, yshift=3] {$\boldsymbol{r}_{\text{cm}}$};

    % \phi_L
    \coordinate (T1) at (\a, \b);
    \coordinate (T2) at (\d, \b);
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_L$, very thick, angle radius={0.7cm}, angle eccentricity=1.7] {angle = T2--T1--CM};

    % \phi_{cm}
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_{\text{cm}}$, very thick, angle radius={1.4cm}, angle eccentricity=1.4] {angle = X--O--CM};

{% endtikz %}
</center>

Therefore, the inertia tensor is the following. Recall that $D = \abs{\b{r}_{\text{cm}}}$.

$$
\m{I} = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
    - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
    0 & 0 & 1
\end{bmatrix}
+
M D^2
\begin{bmatrix}
    \sin^2 \phi_{\text{cm}} & - \cos \phi_{\text{cm}} \sin \phi_{\text{cm}} & 0 \\
    - \sin \phi_{\text{cm}} \cos \phi_{\text{cm}} & \cos^2 \phi_{\text{cm}} & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$ 

**Note** For the signs of the product of inertia values to be correct, we need to measure $\phi_L$ and $\phi_{\text{cm}}$ using the standard conventions (positive side of the $x$-axis, counterclockwise).

Of course we can also write this in terms of lengths instead of angles.

$$
\m{I} = 
\tfrac{1}{12} M
\begin{bmatrix}
    L_y^2 & - L_x L_y & 0 \\
    - L_y L_x & L_x^2 & 0 \\
    0 & 0 & L^2
\end{bmatrix}
+
M
\begin{bmatrix}
    y_{\text{cm}}^2 & - x_{\text{cm}} y_{\text{cm}} & 0 \\
    - y_{\text{cm}} x_{\text{cm}} & x_{\text{cm}}^2 & 0 \\
    0 & 0 & D^2
\end{bmatrix}
$$ 

**Note** for the product of inertia values to be correct, we need to measure pairs $(L_x, L_y)$ and $(x_{\text{cm}}, y_{\text{cm}})$ using the standard conventions (right and up are positive).


### Coordinate Formula {#coordiante-formula}

Let $\b{r}_1 = (x_1, y_1, 0)$ and $\b{r}_2 = (x_2, y_2, 0)$ be the endpoints of the line. 

<center>
{% tikz line-inertia-xy-plane-end-points %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{1.5}
    \def\b{-1}
    \def\d{3}
    \def\e{3}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \coordinate (CM) at ({\xcm}, {\ycm});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-2, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[midway, xshift=10, yshift=0] {$L$};

    % draw endpoints
    \draw [very thick, -{Stealth}] (O) -- (start) node[right, xshift=3, yshift=-3] {$\boldsymbol{r}_{1}$};
    \draw [very thick, -{Stealth}] (O) -- (end) node[right] {$\boldsymbol{r}_{2}$};

{% endtikz %}
</center>

Recall the formula for the [moments of inertia](/blog/moments-of-inertia/lines#moment-of-inertia) and [product of inertia](/blog/moments-of-inertia/lines#product-of-inertia) from the previous post. Applying these to the special case of a triangle on the $xy$ plane gives the following.

$$
\m{I} = 
\tfrac{1}{3} M
\begin{bmatrix}
    y_1^2 + y_2^2 + y_1y_2 & - \tfrac{1}{2}[ (x_2 + x_1) (y_2 + y_1) + x_1y_1 + x_2y_2 ] & 0 \\
    - \tfrac{1}{2}[ (x_2 + x_1) (y_2 + y_1) + x_1y_1 + x_2y_2 ] & x_1^2 + x_2^2 + x_1x_2 & 0 \\
    0 & 0 & \abs{\b{r}_1}^2 + \abs{\b{r}_2}^2 + \b{r}_1 \cdot \b{r}_2
\end{bmatrix}
$$

This is nice because it's a pure coordiante definition of a line (which will come in handy when we analyze general triangles in the [next post](/blog/moments-of-inertia/triangle-curve/)). Using the <span class="tooltip">law of cosines
    <span class="tooltiptext"> 
        $$
        \abs{\b{r}_2 - \b{r}_1}^2 = \abs{\b{r}_1}^2 + \abs{\b{r}_2}^2 - 2(\b{r}_1 \cdot \b{r}_2) \\[10pt]
        \b{r}_1 \cdot \b{r}_2 = \tfrac{1}{2} \left ( \abs{\b{r}_1}^2 + \abs{\b{r}_2}^2 - \abs{\b{r}_2 - \b{r}_1}^2 \right )
        $$
    </span>
</span>, then we can get rid of that dot product.

$$
\m{I} = 
\tfrac{1}{3} M
\begin{bmatrix}
    3y_1^2 + 3y_2^2 - (y_2 - y_1)^2 & - \tfrac{1}{2}[ (x_2 + x_1) (y_2 + y_1) + x_1y_1 + x_2y_2 ] & 0 \\
    - \tfrac{1}{2}[ (x_2 + x_1) (y_2 + y_1) + x_1y_1 + x_2y_2 ] & 3x_1^2 + 3x_2^2 - (x_2 - x_2)^2 & 0 \\
    0 & 0 & 3\abs{\b{r}_1}^2 + 3\abs{\b{r}_2}^2 - \abs{\b{r}_2 - \b{r}_1}^2
\end{bmatrix}
$$

$$
I_{zz} 
= \tfrac{1}{6} M \left ( 3\abs{\b{r}_1}^2 + 3\abs{\b{r}_2}^2 - L^2 \right ) 
= \lambda \cdot \tfrac{1}{6} \abs{\b{r}_2 - \b{r}_1} \left ( 3\abs{\b{r}_1}^2 + 3\abs{\b{r}_2}^2 - \abs{\b{r}_2 - \b{r}_1}^2 \right ) 
$$

This is cool because we will see a very similar looking for the moment of inertia of a [triangular surface](/blog/moments-of-inertia/triangle-surface). If you can find a similarly nice way to expression $I_{xx}$, $I_{yy}$, and $I_{xy}$ then please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

---

<br>

## At the Origin {#at-the-origin}

### Center of Mass at the Origin {#center-of-mass-at-the-origin}

In this case, $\phi_{\text{cm}} = \phi_L$ and $D = 0$.

<center>
{% tikz line-inertia-xy-plane-cm-at-origin %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (3.5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{-2.5}
    \def\b{-1}
    \def\d{2.5}
    \def\e{1}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-3.5, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[above, xshift=-5, yshift=0] {$L$};

    % \phi_{L}
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_L$, very thick, angle radius={1.5cm}, angle eccentricity=1.4] {angle = X--O--end};

{% endtikz %}
</center>

Simplifying from the general case on the $xy$ plane we just solved for in the previous section.

$$
\begin{align}
    \m{I} &= 
    \tfrac{1}{12} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
        - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    =
    \tfrac{1}{12} M
    \begin{bmatrix}
        L_y^2 & - L_x L_y & 0 \\
        - L_y L_x & L_x^2 & 0 \\
        0 & 0 & L^2
    \end{bmatrix}
\end{align}
$$

### Endpoint at the Origin {#endpoint-at-the-origin}

In this case, $\phi_{\text{cm}} = \phi_L$ and $D = L/2$.

<center>
{% tikz line-inertia-xy-plane-end-at-origin %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (3.5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{0}
    \def\b{0}
    \def\d{2.5}
    \def\e{1}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-3.5, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[above, xshift=-5, yshift=0] {$L$};

    % \phi_{L}
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_L$, very thick, angle radius={1.5cm}, angle eccentricity=1.4] {angle = X--O--end};

{% endtikz %}
</center>

Simplifying from the general case on the $xy$ plane we just solved for in the previous section.

$$
\begin{align}
    \m{I} &= 
    \tfrac{1}{12} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
        - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{4} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
        - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    \\[10pt]
    &=
    \tfrac{1}{3} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
        - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    \\[10pt]
    &=
    \tfrac{1}{3} M
    \begin{bmatrix}
        L_y^2 & - L_x L_y & 0 \\
        - L_y L_x & L_x^2 & 0 \\
        0 & 0 & L^2
    \end{bmatrix}
\end{align}
$$

<br>

---

<br>

## Endpoints on the $x$ Axis and $y$ Axis {#endpoints-on-the-x-axis-and-y-axis}

In this case, $\phi_{\text{cm}} = \pi-\phi_L$ and $D = L/2$. To convince yourself that is true requires a bit of geometry.

<center>
{% tikz line-inertia-xy-plane-ends-on-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{1.5}
    \def\b{0}
    \def\d{0}
    \def\e{3}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \coordinate (CM) at ({\xcm}, {\ycm});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-2, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % drawing the box around the line
    \node at ($(\a, \b)!0.5!(\d, \b)$) [below] {$L_x$};
    \node at ($(\d, \b)!0.5!(\d, \e)$) [left] {$L_y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[below, xshift=15, yshift=0] {$L$};

    % center of mass
    \draw [ultra thick, -{Stealth}] (O) -- (CM) node[above, xshift=12, yshift=0] {$\boldsymbol{r}_{\text{cm}}$};

    % \phi_L
    \coordinate (T) at (\a, \b);
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_L$, very thick, angle radius={0.7cm}, angle eccentricity=1.6] {angle = X--T--CM};

    % \phi_{cm}
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_{\text{cm}}$, very thick, angle radius={0.6cm}, angle eccentricity=2] {angle = X--O--CM};

{% endtikz %}
</center>

Simplifying from the general case on the $xy$ plane we just solved for in the previous section.

$$
\begin{align}
    \m{I} &= 
    \tfrac{1}{12} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
        - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{4} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & \cos \phi_L \sin \phi_L & 0 \\
        \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    \\[10pt]
    &=
    \tfrac{1}{3} M L^2
    \begin{bmatrix}
        \sin^2 \phi_L & \tfrac{1}{2} \cos \phi_L \sin \phi_L & 0 \\
        \tfrac{1}{2} \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    \\[10pt]
    &=
    \tfrac{1}{3} M
    \begin{bmatrix}
        L_y^2 & \tfrac{1}{2} L_x L_y & 0 \\
        \tfrac{1}{2} L_y L_x & L_x^2 & 0 \\
        0 & 0 & L^2
    \end{bmatrix}
\end{align}
$$

Be careful with the sign of $L_x$ and $L_y$ when applying the formula. For instance, in the above diagram $L_x$ is negative while $L_y$ is positive.

<br>

---

<br>

## Parallel to $x$ Axis and Perpendicular to $y$ Axis {#parallel-to-x-axis-and-perpendicular-to-y-axis}

In these special cases, we assume $\phi_L = 0$, i.e. the line is parallel to the $x$-axis. Of course, if we instead assume that $\phi_L = \pi/2$ (the line is parallel to the $y$-axis), then the inertia tensors can be derived symmetrically.

### General {#parallel-perpendicular-general}

First, we consider the general case.

<center>
{% tikz line-inertia-xy-plane-parallel-and-perpendicular %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (3.5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{-1}
    \def\b{1.5}
    \def\d{2.5}
    \def\e{1.5}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \coordinate (CM) at ({\xcm}, {\ycm});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-3.5, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[above, xshift=-5, yshift=0] {$L$};

    % center of mass
    \draw [ultra thick, -{Stealth}] (O) -- (CM) node[above, xshift=12, yshift=0] {$\boldsymbol{r}_{\text{cm}}$};

    % \phi_{cm}
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\phi_{\text{cm}}$, very thick, angle radius={0.6cm}, angle eccentricity=2] {angle = X--O--CM};

{% endtikz %}
</center>

Simplifying from the general case on the $xy$ plane we just solved for in the previous section. Recall that $D = \abs{\b{r}_{\text{cm}}}$.

$$
\m{I} = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 1
\end{bmatrix}
+
M D^2
\begin{bmatrix}
    \sin^2 \phi_{\text{cm}} & - \cos \phi_{\text{cm}} \sin \phi_{\text{cm}} & 0 \\
    - \sin \phi_{\text{cm}} \cos \phi_{\text{cm}} & \cos^2 \phi_{\text{cm}} & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$ 

Again, we can instead write this in terms of lengths.

$$
\m{I} = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 1
\end{bmatrix}
+
M
\begin{bmatrix}
    y_{\text{cm}}^2 & - x_{\text{cm}} y_{\text{cm}} & 0 \\
    - y_{\text{cm}} x_{\text{cm}} & x_{\text{cm}}^2 & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$ 

### Centered at a Distance {#centered-at-a-distance}

Now we assume the line intersects the axis at its center of mass. Therefore $\phi_{\text{cm}} = \pi/2$.

<center>
{% tikz line-inertia-xy-plane-parallel-and-perpendicular-2 %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (3.5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{-1.75}
    \def\b{1.5}
    \def\d{1.75}
    \def\e{1.5}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \coordinate (CM) at ({\xcm}, {\ycm});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-3.5, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[above, xshift=-5, yshift=0] {$L$};

    % center of mass
    \draw [ultra thick, -{Stealth}] (O) -- (CM) node[midway, left, xshift=0, yshift=0] {$\boldsymbol{r}_{\text{cm}}$};

    % \phi_{cm}
    \draw[thick] (0.25, 0) -- ++(0,0.25) -- ++(-0.25,0) node[above, right, xshift=10, yshift=7] {$\phi_{\text{cm}}$};

{% endtikz %}
</center>

Simplifying from the previous result.  Recall that $D = \abs{\b{r}_{\text{cm}}}$.

$$
\m{I} = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 1
\end{bmatrix}
+
M D^2
\begin{bmatrix}
    1 & 0 & 0 \\
    0 & 0 & 0 \\
    0 & 0 & 1
\end{bmatrix}
= 
M
\begin{bmatrix}
    D^2 & 0 & 0 \\
    0 & \tfrac{1}{12} L^2 & 0 \\
    0 & 0 & \tfrac{1}{12} L^2 + D^2
\end{bmatrix}
$$ 

### Center on an Axis {#centered-on-an-axis}

Finally, we assume the center of mass is at the origin ($D = 0$).

<center>
{% tikz line-inertia-xy-plane-parallel-and-perpendicular-3 %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (3.5, 0);
    \coordinate (Y) at (0, 3.5);

    % Curve Parameters
    \def\a{-1.75}
    \def\b{0}
    \def\d{1.75}
    \def\e{0}

    % Particular definitions
    \coordinate (start) at (\a, \b);
    \coordinate (end) at (\d, \e);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \coordinate (CM) at ({\xcm}, {\ycm});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] (-3.5, 0) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2) -- (Y) node[anchor=north west]{$y$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[above, xshift=-5, yshift=0] {$L$};

{% endtikz %}
</center>

We can either simplify from the previous result, or from the [Center of Mass at the Origin](#center-of-mass-at-the-origin) result.

$$
\m{I} = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$

This gives us the standard formula you will see for the moment of inertia of a line.