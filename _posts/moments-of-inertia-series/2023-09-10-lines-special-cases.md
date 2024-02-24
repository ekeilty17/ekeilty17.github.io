---
layout:     series
title:      "Lines - Special Cases"
date:       2023-09-10
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       9
series:     moments-of-inertia
tags:       moments-of-inertia
---

In the [previous post](/blog/moments-of-inertia/lines), we found the general expression for the moment of inertia of a line. In this post, we are going to derive this result using a different method, but our reward will be obtaining the general inertia tensor.

$$
I = 
\tfrac{1}{12} M
\begin{bmatrix}
    L_y^2 + L_z^2 & - L_x L_y & - L_x L_z \\
    - L_y L_x & L_z^2 + L_x^2 & - L_y L_z \\
    - L_z L_x & - L_z L_y & L_x^2 + L_y^2
\end{bmatrix}
+
M 
\begin{bmatrix}
    D_y^2 + D_z^2 & - D_x D_y & - D_x D_z \\
    - D_y D_x & D_z^2 + D_x^2 & - D_y D_z \\
    - D_z D_x & - D_z D_y & D_x^2 + D_y^2
\end{bmatrix}
$$

Or we equivalently can write.

$$
I = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    \sin^2 \alpha_x & - \cos \alpha_x \cos \alpha_y & - \cos \alpha_x \cos \alpha_z \\
    - \cos \alpha_y \cos \alpha_x & \sin^2 \alpha_y & - \cos \alpha_y \cos \alpha_z \\
    - \cos \alpha_z \cos \alpha_x & - \cos \alpha_z \cos \alpha_y & \sin^2 \alpha_z
\end{bmatrix}
+
M D^2
\begin{bmatrix}
    \sin^2 \beta_x & - \cos \beta_x \cos \beta_y & - \cos \beta_x \cos \beta_z \\
    - \cos \beta_y \cos \beta_x & \sin^2 \beta_y & - \cos \beta_y \cos \beta_z \\
    - \cos \beta_z \cos \beta_x & - \cos \beta_z \cos \beta_y & \sin^2 \beta_z
\end{bmatrix}
$$ 

<br>

## Center of Mass at Origin

**TODO** Draw diagram

Here, $D = 0$

$$
I = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    \sin^2 \alpha_x & - \cos \alpha_x \cos \alpha_y & - \cos \alpha_x \cos \alpha_z \\
    - \cos \alpha_y \cos \alpha_x & \sin^2 \alpha_y & - \cos \alpha_y \cos \alpha_z \\
    - \cos \alpha_z \cos \alpha_x & - \cos \alpha_z \cos \alpha_y & \sin^2 \alpha_z
\end{bmatrix}
$$

<br>

## End at Origin

**TODO** Draw diagram

Here, $\beta_x = \alpha_x$, $\beta_y = \alpha_y$, and $\beta_z = \alpha_z$ and $D = L/2$.

$$
I = 
\tfrac{1}{3} M L^2
\begin{bmatrix}
    \sin^2 \alpha_x & - \cos \alpha_x \cos \alpha_y & - \cos \alpha_x \cos \alpha_z \\
    - \cos \alpha_y \cos \alpha_x & \sin^2 \alpha_y & - \cos \alpha_y \cos \alpha_z \\
    - \cos \alpha_z \cos \alpha_x & - \cos \alpha_z \cos \alpha_y & \sin^2 \alpha_z
\end{bmatrix}
$$

<br>

## In the $xy$ Plane

Very often, we make a simplifying assumption that the line lies on the $xy$ plane. So it's worth precomputing these special cases.

One interesting thing to notice is that $I_{zz} = I_{xx} + I_{yy}$. You can easily show this using the definitions of these values.

### General

**TODO** Draw diagram

Here, $\alpha_z = \pi/2$. Therefore $\sin \alpha_z = 1$ and $\cos \alpha_z = 0$. Also, when using cylindrical or spherical coordinates we typically denote $\phi = \alpha_x$. This means $\alpha_y = \pi/2 - \phi$. Therefore, $\cos \alpha_y = \sin \phi$ and $\sin \alpha_y = \cos \phi$.

**Note** For the signs to work out, we need to measure $\phi_L$ and $\phi_D$ in the standard way we do trig (positive side of the $x$-axis, counterclockwise).

$$
I = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    \sin^2 \phi_L & - \cos \phi_L \sin \phi_L & 0 \\
    - \sin \phi_L \cos \phi_L & \cos^2 \phi_L & 0 \\
    0 & 0 & 1
\end{bmatrix}
+
M D^2
\begin{bmatrix}
    \sin^2 \phi_D & - \cos \phi_D \sin \phi_D & 0 \\
    - \sin \phi_D \cos \phi_D & \cos^2 \phi_D & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$ 

<br>

### End at Origin

**TOOD** Draw a diagram

In this case, $\phi_D = \phi_L$ and $D = L/2$. Alternatively, we can take the general case of an end at the origin and set $\alpha_z = \pi/2$.

$$
\begin{align}
    I &= 
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
\end{align}
$$

<br>

### Ends on the $x$ Axis and $y$ Axis

**TODO** Draw diagram

In this case, $\phi_D = -\phi_L$ and $D = L/2$

$$
\begin{align}
    I &= 
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
\end{align}
$$

<br>

### Parallel and Perpendicular

**TOOD** Draw a diagram

Here $\phi_L = 0$, i.e. the line is parallel to the $x$-axis.

$$
I = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 1
\end{bmatrix}
+
M D^2
\begin{bmatrix}
    \sin^2 \phi_D & - \cos \phi_D \sin \phi_D & 0 \\
    - \sin \phi_D \cos \phi_D & \cos^2 \phi_D & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$ 

If we assume the line intersects the axis at its center of mass, we simply have

$$
I = 
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

Now, if $D = 0$, we get

$$
I = 
\tfrac{1}{12} M L^2
\begin{bmatrix}
    0 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 1
\end{bmatrix}
$$

This gives us the standard formula you will see for the moment of inertia of a line.

---

<br>

## Old

### Perpendicular to the Axis of Rotation {#perpendicular-to-the-axis-of-rotation}

This is the special case where $\alpha = 90^{\circ}$.

<center>
{% tikz line-inertia-perpendicular %}[scale=1.5, line width=1.5pt, font=\LARGE]
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

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{-1}
    \def\b{2}
    \def\c{0}
    \def\d{4.5}
    \def\e{1}
    \def\f{0}

    % Particular definitions
    \coordinate (start) at (\a, \b, \c);
    \coordinate (end) at (\d, \e, \f);
    \def\xcm{(\a+\d)/2}
    \def\ycm{(\b+\e)/2}
    \def\zcm{(\c+\f)/2}
    \coordinate (CM) at ({\xcm}, {\ycm}, {\zcm});

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % line
    \draw [ultra thick, color=paramColor] (end) -- (start) node[right] {$L$};
    \draw[thick] ($(O) + ({\xcm*0.15}, {\ycm*0.15}, 0)$) -- ++(0,0,0.3) -- ++(-{\xcm*0.15}, -{\ycm*0.15}, 0);

    % label distance to center
    %\draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=paramColor] (0, 0.05, 0) -- (CM) node [midway, above, xshift=4, yshift=10]{$D_{\text{cm}}$};
    \draw [thick, dashed] (O) -- (CM) node[below, right, xshift=3, yshift=-5] {$D_{\text{cm}}$};
    %\draw [thick, dashed] (O) -- (\d, \e, \f) node[right, xshift=2, yshift=-5] {$D_{\text{end}}$};

\end{scope}
{% endtikz %}
</center>

<br>

Substituting into the general equation, we get the following.

$$
I = \tfrac{1}{12} ML^2 + M D_{\text{cm}}^2
$$

<br>

### Parallel to the Axis of Rotation {#parallel-to-the-axis-of-rotation}

This is the special case where $\alpha = 0$. Since the line is parallel to the axis of rotation, all points on the are the same distance from the axis of rotation. Therefore, we will just call $D_{\text{cm}} = D$.

<center>
{% tikz line-inertia-parallel %}[scale=1.5, line width=1.5pt, font=\LARGE]
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

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{0}
    \def\b{2}
    \def\c{-1.5}
    \def\d{0}
    \def\e{2}
    \def\f{1.5}

    % Particular definitions
    \coordinate (start) at (\a, \b, \c);
    \coordinate (end) at (\d, \e, \f);

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % line
    \draw [ultra thick, color=paramColor] (end) -- (start) node[right, xshift=3, yshift=30] {$L$};

    % label distance
    \draw [thick, dashed] (0, 0, 0.75) -- (0, \e, 0.75) node[midway, above] {$D$};

\end{scope}
{% endtikz %}
</center>

<br>

Substituting into the general equation, we get the following.

$$
I = M D^2
$$

<br>


### Rotating About a Line's End {#rotating-about-a-lines-end}

<center>
{% tikz line-inertia-end %}[scale=1.5, line width=1.5pt, font=\LARGE]
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

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{0}
    \def\b{0}
    \def\c{0}
    \def\d{0}
    \def\e{2}
    \def\f{2}

    % Particular definitions
    \coordinate (start) at (\a, \b, \c);
    \coordinate (end) at (\d, \e, \f);
    \def\xcm{(\d-\a)*0.5 + \a}
    \def\ycm{(\e-\b)*0.5 + \b}
    \def\zcm{(\f-\c)*0.5 + \c}
    \coordinate (CM) at ({\xcm}, {\ycm}, {\zcm});
    \coordinate (aboveCM) at ({\xcm}, {\ycm}, {\zcm + 1});
    \coordinate (xyCM) at ({\xcm}, {\ycm}, 0);

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % line
    \draw [ultra thick, color=paramColor] (start) -- (end) node[midway, right, xshift=8, yshift=0] {$L$};

    % label distance
    \draw [thick, dashed] (0, 0, \f/2) -- (CM) node[midway, above] {$D_{\text{cm}}$};

    % angle \alpha
    \draw pic[draw, paramColor, {Classical TikZ Rightarrow}-, pic text=$\alpha$, very thick, angle radius={0.6cm}, angle eccentricity=1.5] {angle = CM--O--Z};

\end{scope}
{% endtikz %}
</center>

We can do some geometry and show that 

$$
D_{\text{cm}} = \tfrac{1}{2} L \sin \alpha
$$

Therefore, we can simplify the moment of inertia equation.

$$
I = \tfrac{1}{12} M L^2 \sin^2 \alpha + M (\tfrac{1}{2} L \sin \alpha)^2 = \tfrac{1}{3} M L^2 \sin^2 \alpha 
$$

And, of course, if the line happens to be perpendicular to the axis of rotation ($\alpha = 90$), we can further simplify.

$$
I = \tfrac{1}{3} M L^2
$$