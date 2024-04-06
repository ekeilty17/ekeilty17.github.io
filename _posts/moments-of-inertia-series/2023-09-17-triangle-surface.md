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


Equilateral triangles and even isosceles triangles are pretty simple because there are symmetries that can be exploited. However, a general triangle can get pretty nasty due to the lack of symmetry. In this post, I've tried by best to find a balance between a general solution without it becoming unwieldy.

<!-- While in theory you can find the principal axes of a general triangle by finding its eigenvalues, I have yet to derive a formula that isn't the ugliest thing you've ever seen. If you can find a nice formulation, please <a href="mailto:epkeilty@gmail.com">let me know</a>. -->

<!-- https://brilliant.org/wiki/apollonius-theorem/ -->

<br>

## Parameterizing the Curve {#parameterization}

<center>
{% tikz triangle-curve %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (Y) at (0, 3, 0);
    \coordinate (Z) at (0, 0, 3);

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya, 0);
    \coordinate (B) at (\xb, \yb, 0);
    \coordinate (C) at (\xc, \yc, 0);

    %=============================================================

    % Axis (part 1)
    \draw [thick, -{Stealth}] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, -{Stealth}] (O) -- (Y) node[anchor=north west]{$y$};

    % triangle (part 1)
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, above, xshift=0, yshift=0] {$\color{black}{\ell_2}$};

    % Axes (part 2)
    \draw [thick, -{Stealth}] (O) -- (Z) node[anchor=north west]{$z$};

    % triangle (part 2)
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, below, xshift=15, yshift=0] {$\color{black}{\ell_1}$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, right, xshift=0, yshift=0] {$\color{black}{\ell_3}$};

\end{scope}
{% endtikz %}
</center>

The triangle is comprised of three line segments. Therefore, we do not need to paramaterize the curve. Instead, we can use the extensive analysis on lines in the $xy$ plane from the [previous post](/blog/moments-of-inertia/lines-special-cases#general).

<br>

## Mass {#mass}

The mass of the triangle is simply the mass of each individual line segment.

$$
M = M_a + M_b + M_c = \lambda a + \lambda b + \lambda c = \lambda \cdot (a + b + c)
$$

<br>

## Moment of Inertia About Central Axis {#central-axis}

Suppose we have a general triangle whose [centroid](https://en.wikipedia.org/wiki/Centroid) is at the origin. Let $a$, $b$, $c$ denote its side lengths and $A$, $B$, $C$ denote the cooresponding vertices.

<center>
{% tikz triangle-general-3D %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (Y) at (0, 3, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -1);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya, 0);
    \coordinate (B) at (\xb, \yb, 0);
    \coordinate (C) at (\xc, \yc, 0);

    %=============================================================

    % Axis (part 1)
    \draw [thick, -{Stealth}] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, -{Stealth}] (O) -- (Y) node[anchor=north west]{$y$};

    % triangle (part 1)
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, above, xshift=0, yshift=0] {$b$};

    % Axes (part 2)
    \draw [thick, -{Stealth}] (O) -- (Z) node[anchor=north west]{$z$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % triangle (part 2)
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, below, xshift=15, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, right, xshift=0, yshift=0] {$c$};

    % vertices
    \node[above, color=paramColor] at (A) {$A$};
    \node[below, color=paramColor] at (B) {$B$};
    \node[left, color=paramColor] at (C) {$C$};

    % node just for spacing
    \node at (0, 0, -3) {$$};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle-general-2D %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Axis of rotation
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=0, yshift=0] {$b$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, above, xshift=0, yshift=0] {$c$};

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

    % rotation arrow
    \draw[very thick, color=myred, fill=myred] (O) circle (0.05);
    \draw[rotarrow, rotate around z=-30] ($(O) - (0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=28, yshift=-12] {$\omega$};

{% endtikz %}
</center>

As stated above, to find the moment of inertia of this triangle, we just sum the contributions of each individual line segment.

$$
\begin{align}
    I_{zz} 
    &= I_{a, zz} + I_{b, zz} + I_{c, zz} 
    = \left ( \tfrac{1}{12} M_a a^2 + M_a D_a^2 \right ) + \left ( \tfrac{1}{12} M_b b^2 + M_b D_b^2 \right ) + \left ( \tfrac{1}{12} M_c c^2 + M_c D_c^2 \right )
\end{align}
$$

Finding the values of $D_a$, $D_b$, and $D_c$ is not trivial. It will require some nice results from geometry. Let $m_{a}$, $m_{b}$, and $m_{c}$ be the lengths of the [medians](https://en.wikipedia.org/wiki/Median_(geometry)#:~:text=In%20geometry%2C%20a%20median%20of,other%20at%20the%20triangle's%20centroid.) of the triangle.

<!-- I am going to skim over some details but will provide a complete proof inthe [appendix](#appendix) at the end of the post.  -->


<br>

<center>
{% tikz triangle-general-cm-distance %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \coordinate (ma) at ({(\xb+\xc)/2}, {(\yb+\yc)/2});
    \coordinate (mb) at ({(\xc+\xa)/2}, {(\yc+\ya)/2});
    \coordinate (mc) at ({(\xa+\xb)/2}, {(\ya+\yb)/2});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % midlines / medians
    \draw [very thick] (O) -- (ma) node[right, xshift=0, yshift=0] {$D_a$};
    \draw [very thick] (O) -- (mb) node[below, xshift=0, yshift=0] {$D_b$};
    \draw [very thick] (O) -- (mc) node[above, xshift=0, yshift=0] {$D_c$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C);
    \draw [ultra thick, color=paramColor] (C) -- (A);
    \draw [ultra thick, color=paramColor] (A) -- (B);

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle-general-midlines %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \coordinate (ma) at ({(\xb+\xc)/2}, {(\yb+\yc)/2});
    \coordinate (mb) at ({(\xc+\xa)/2}, {(\yc+\ya)/2});
    \coordinate (mc) at ({(\xa+\xb)/2}, {(\ya+\yb)/2});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % midlines / medians
    \draw [very thick] (A) -- (ma) node[right, xshift=0, yshift=0] {$m_a$};
    \draw [very thick] (B) -- (mb) node[below, xshift=0, yshift=0] {$m_b$};
    \draw [very thick] (C) -- (mc) node[above, xshift=0, yshift=0] {$m_c$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C);
    \draw [ultra thick, color=paramColor] (C) -- (A);
    \draw [ultra thick, color=paramColor] (A) -- (B);

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

{% endtikz %}
</center>


The lengths of the median lines can be expressed in terms of the side lengths of the triangle using [Apollonius' Theorem](https://brilliant.org/wiki/apollonius-theorem/).

$$
m_{a} = \tfrac{1}{2} \sqrt{2b^2 + 2c^2 - a^2}
\qquad
m_{b} = \tfrac{1}{2} \sqrt{2c^2 + 2a^2 - b^2}
\qquad
m_{c} = \tfrac{1}{2} \sqrt{2a^2 + 2b^2 - c^2}
$$

Then, the [Centroid Theorem](https://new.math.uiuc.edu/public403/affine/centroid.html) says that the centroid of a triangle divides each median into segments with a ratio of $2{:}1$. In other words, we arrive at the following final expression 

$$
D_a = \tfrac{1}{3} m_a = \tfrac{1}{6} \sqrt{2b^2 + 2c^2 - a^2}
\qquad
D_b = \tfrac{1}{3} m_b = \tfrac{1}{6} \sqrt{2c^2 + 2a^2 - b^2}
\qquad
D_c = \tfrac{1}{3} m_c = \tfrac{1}{6} \sqrt{2a^2 + 2b^2 - c^2}
$$

Now we can express everything in terms of the side lengths of the triangle. Note that I am analyzing $\tfrac{1}{\lambda} I_{zz}$ so that I don't have to include the $\lambda$ term.

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz}
    &= \left [ \tfrac{1}{12} a^3 + \tfrac{1}{36} a (2b^2 + 2c^2 - a^2) \right ] + \left [ \tfrac{1}{12} b^3 + \tfrac{1}{36} b (2c^2 + 2a^2 - b^2) \right ] + \left [ \tfrac{1}{12} c^3 + \tfrac{1}{36} c (2a^2 + 2b^2 - c^2) \right ] \\[10pt]
    &= \tfrac{1}{12} (a^3 + b^3 + c^3) + \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2 - 3a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2 - 3b^3) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2 - 3c^2) \\[10pt]
    &= \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2) \\[10pt]
    &= \tfrac{1}{18} (a + b + c) (a^2 + b^2 + c^2)
\end{align}
$$

Recall that the total mass of the triangle is $M = \lambda \cdot (a + b + c)$. Therefore

$$
I_{zz} = \tfrac{1}{18} M (a^2 + b^2 + c^2)
$$

This is a really elegant result that I've never seen anywhere else before, so that's pretty cool.

<br>

## Inertia Tensor {#inertia-tensor}

We can calculate the entire inertia tensor, however it's not nearly as elegant. A general triangle has so much asymmetry, that we shouldn't expect it to be a nice formula. Below is the nicest form that I could get write everything, but if you find something better then please <a href="mailto:epkeilty@gmail.com">let me know</a>.

First, we need some extra definitions because $I_{xx}$, $I_{yy}$, and $I_{xy}$ cannot only be determined by the side lengths of the triangle. We have to encode information about orientation. There is probably a way to do this with angles (feel free to experiment for yourself), but I did it just with coordiantes and lengths. Consider the following definitions.

<center>
{% tikz triangle-general-2D-vectors %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Axis of rotation
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, {Stealth}-, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=25] {$\boldsymbol{a} = a_x \; \hat{\boldsymbol{x}} + a_y \; \hat{\boldsymbol{y}}$};
    \draw [ultra thick, {Stealth}-, color=paramColor] (C) -- (A) node[midway, below, xshift=-40, yshift=-10] {$\boldsymbol{b} = b_x \; \hat{\boldsymbol{x}} + b_y \; \hat{\boldsymbol{y}}$};
    \draw [ultra thick, {Stealth}-, color=paramColor] (A) -- (B) node[midway, above, xshift=-30, yshift=10] {$\boldsymbol{c} = c_x \; \hat{\boldsymbol{x}} + c_y \; \hat{\boldsymbol{y}}$};

    % vertices
    \draw[very thick, -{Stealth}] (O) -- (A) node[left] {$\boldsymbol{A} = x_A \; \hat{\boldsymbol{x}} + y_B \; \hat{\boldsymbol{y}} $};
    \draw[very thick, -{Stealth}] (O) -- (B) node[above, xshift=30] {$\boldsymbol{B} = x_B \; \hat{\boldsymbol{x}} + y_B \; \hat{\boldsymbol{y}}$};
    \draw[very thick, -{Stealth}] (O) -- (C) node[below] {$\boldsymbol{C} = x_C \; \hat{\boldsymbol{x}} + y_C \; \hat{\boldsymbol{y}}$};

{% endtikz %}
</center>

<!-- $$
\begin{align}
    &\b{a} = a_x \; \u{x} + a_y \; \u{y}
    &\qquad
    &\b{A} = x_A \; \u{x} + y_A \; \u{y}
    \\[10pt]
    &\b{b} = b_x \; \u{x} + b_y \; \u{y}
    &\qquad
    &\b{B} = x_B \; \u{x} + y_B \; \u{y}
    \\[10pt]
    &\b{c} = c_x \; \u{x} + c_y \; \u{y}
    &\qquad
    &\b{C} = x_C \; \u{x} + y_C \; \u{y}
\end{align}
$$ -->

It's a bit redundant to use both. We could only use the values of the vertices $\b{A}$, $\b{B}$, and $\b{C}$, but including side lengths $\b{a}$, $\b{b}$, and $\b{c}$ shortens the formulas up a bit. From the diagram above, we can see an easy way to express the side lengths in terms of the vertices.

$$
\begin{align}
    &\b{a} = \b{B} - \b{C}
    &\implies\qquad
    &a_x = x_B - x_C
    &
    &a_y = y_B - y_C
    \\[10pt]
    &\b{b} = \b{C} - \b{A}
    &\implies\qquad
    &b_x = x_C - x_A
    &
    &b_y = y_C - y_A
    \\[10pt]
    &\b{c} = \b{A} - \b{B}
    &\implies\qquad
    &c_x = x_A - x_B
    &
    &c_y = y_A - y_B
\end{align}
$$

Note that you actually cannot go in the other direction. Just knowing the side lengths does not tell you the coordinates of the vertices. Intuitively, this is because rotating a triangle does not change the side lengths but does change the position of the vertices.

Now, we are ready to write the general inertia tensor for a triangle in the $xy$ plane.

$$
\m{I} = 
\begin{bmatrix}
    I_{xx} & -I_{xy} & 0 \\
    -I_{xy} & I_{yy} & 0 \\
    0 & 0 & I_{zz}
\end{bmatrix}
$$

where

$$
\begin{align}
    \tfrac{1}{\lambda} I_{xx} &= \tfrac{1}{3}(aa_y^2 + bb_y^2 + cc_y^2) + ay_b y_c + by_c y_a + cy_a y_b \\[10pt]
    \tfrac{1}{\lambda} I_{yy} &= \tfrac{1}{3}(aa_x^2 + bb_x^2 + cc_x^2) + ax_b x_c + bx_c x_a + cx_a x_b \\[10pt]
    \tfrac{1}{\lambda} I_{zz} &= \tfrac{1}{18} (a + b + c) (a^2 + b^2 + c^2) \\[10pt]
    \tfrac{1}{\lambda} I_{xy} &= \tfrac{1}{3} (a a_x a_y + b b_x b_y + c c_x c_y) - \tfrac{1}{2} \left ( x_a y_a + x_b y_b + x_c y_c \right )
\end{align}
$$

When calculating $I_{xy}$ be careful about the signs of $a_x$, $a_y$, $b_x$, $b_y$, $c_x$, and $c_y$. You just have to make sure you measure them consistently.

In theory, we could find the principal axes using standard eigenvector analysis. Doing this in general gives the following.

$$
I'_{xx}, I'_{yy} = \tfrac{1}{2} I_{zz} \pm \sqrt{ \left ( \frac{I_{xx} - I_{yy}}{2} \right )^2 + I_{xy}^2 }
$$

Best of luck to anyone who attempts to substitute the values in and simplify. I tried for about $10$ seconds until I realized the number of cross-terms I'd have to deal with. If you figure anything out, please <a href="mailto:epkeilty@gmail.com">let me know</a>. If you manage something, then also see if you can find an expression for the eigenvectors. Although, I suspect it's horribly verbose.

<br>

---

<br>

## Special Cases {#special-cases}

### Isosceles Triangle {#isoscelest-triangle}

When calculating the inertia tensor, the orientation of the triangle matters. Thus, I am going to analyze the most natural orientation. The triangle's apex is on the positive side of the $y$-axis and the base is parallel to the $x$-axis.

<center>
{% tikz triangle-isosceles %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 4);
    
    % Curve Parameters
    \def\b{3}
    \def\h{4}

    % Particular definitions
    \def\xa{-\b/2}
    \def\ya{-\h/3}
    \def\xb{0}
    \def\yb{2*\h/3}
    \def\xc{\b/2}
    \def\yc{-\h/3}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2.5) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=3, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=10, yshift=0] {$b$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, left, xshift=-3, yshift=0] {$a$};

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, xshift=10, yshift=0, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

    % angle
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\gamma$, very thick, angle radius={1.5cm}, angle eccentricity=1.4] {angle = O--B--C};

    % height
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt}] ($(\xc, \yb) + (0.5, 0)$) -- ($(C) + (0.5, 0)$) node [midway, right, xshift=10, yshift=0] {$h$};

{% endtikz %}
</center>

From the above diagram and some geometry, we can now write the particular values of $\b{A}$, $\b{B}$, $\b{C}$, $\b{a}$, $\b{b}$, and $\b{c}$.

$$
\begin{align}
    \b{A} &= -\tfrac{1}{2}b \; \u{x} - \tfrac{1}{3} h \; \u{y}
    &\qquad&
    \b{a} = \b{B} - \b{C} = -\tfrac{1}{2}b \; \u{x} + h \; \u{y} \\[10pt]
    \b{B} &= \tfrac{2}{3} h \; \u{y}
    &\implies \qquad&
    \b{b} = \b{C} - \b{A} = b \; \u{x} \\[10pt]
    \b{C} &= \tfrac{1}{2}b \; \u{x} - \tfrac{1}{3} h \; \u{y}
    &\qquad&
    \b{c} = \b{A} - \b{B} = -\tfrac{1}{2}b \; \u{x} - h \; \u{y} \\[10pt]
\end{align}
$$

<br>

I will spare you the algebra autopilot of substituting these values in for the general inertia tensor derived above, but feel free to verify for yourself. 

There are a few ways you can parameterize an isosceles triangle. The first and probably most natural is to use the base $b$ and height $h$ of the triangle. 

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{9}Mh^2 & 0 & 0 \\
    0 & \tfrac{1}{12}Mb^2 & 0 \\
    0 & 0 & \tfrac{1}{9}Mh^2 + \tfrac{1}{12}Mb^2
\end{bmatrix}
= \tfrac{1}{36} M \begin{bmatrix}
    4h^2 & 0 & 0 \\
    0 & 3b^2 & 0 \\
    0 & 0 & 4h^2 + 3b^2
\end{bmatrix}
$$

Alternatively, we can parameterize this in terms of the base $b$ and the side length $a$ of the triangle.

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{9}Ma^2 - \tfrac{1}{36}Mb^2 & 0 & 0 \\
    0 & \tfrac{1}{12}Mb^2 & 0 \\
    0 & 0 & \tfrac{1}{9}Ma^2 + \tfrac{1}{18}Mb^2
\end{bmatrix}
= \tfrac{1}{36} M \begin{bmatrix}
    4a^2 - b^2 & 0 & 0 \\
    0 & 3b^2 & 0 \\
    0 & 0 & 4a^2 + 2b^2
\end{bmatrix}
$$

Finally, we can consider the base length $b$ and the apex of the triangle $B$. Denote half of its angle by $\gamma$. Using basic trigonometry, we can see that $h = a \cos \gamma$ and $b = 2a \sin \gamma$.

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{9}Ma^2 \cos^2 \gamma & 0 & 0 \\
    0 & \tfrac{1}{3}Ma^2 \sin^2 \gamma & 0 \\
    0 & 0 & \tfrac{1}{9}Ma^2 (1 + 2 \sin^2 \gamma)
\end{bmatrix}
= \tfrac{1}{9} M a^2 \begin{bmatrix}
    \cos^2 \gamma & 0 & 0 \\
    0 & 3\sin^2 \gamma & 0 \\
    0 & 0 & 1 + 2 \sin^2 \gamma
\end{bmatrix}
$$

I've also seen $I_{zz}$ formulated as the following. I don't see any reason to prefer this over the former.

$$
I_{zz} = \tfrac{1}{9} M a^2 (3 - 2 \cos^2 \gamma)
$$

<br>

### Equilateral Triangle {#equilateral-triangle}

Finally, we finish with an equilateral triangle where all sides are equal length. 

<center>
{% tikz triangle-equilateral %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 4);
    
    % Curve Parameters
    \def\S{3.5}
    \def\h{\S/2*1.7320508}

    % Particular definitions
    \def\xa{-\S/2}
    \def\ya{-\h/3}
    \def\xb{0}
    \def\yb{2*\h/3}
    \def\xc{\S/2}
    \def\yc{-\h/3}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2.5) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=3, yshift=0] {$S$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=10, yshift=0] {$S$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, left, xshift=-3, yshift=0] {$S$};

{% endtikz %}
</center>

Here $a = b = S$. We simply plug into the second inertia tensor above.

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{12}MS^2 & 0 & 0 \\
    0 & \tfrac{1}{12}MS^2 & 0 \\
    0 & 0 & \tfrac{1}{6}MS^2
\end{bmatrix}
= \tfrac{1}{12} MS^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 2
\end{bmatrix}
$$

I find it really surprising that $I_{xx} = I_{yy}$. I can't think of an intuitive reason for why that should be the case.

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