---
layout:     series
title:      "Rectangle"
date:       2023-09-16
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       15
series:     moments-of-inertia
tags:       moments-of-inertia
---

## Parameterizing the Surface

<center>
{% tikz rectangular-surface %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Curve Parameters
    \def\a{2}
    \def\b{2.5}

    % Particular definitions

    %=============================================================

    % shading
    \fill[shading=axis, color=mygray, opacity=0.4] (\a, \b, 0) -- (\a, -\b, 0) -- (-\a, -\b, 0) -- (-\a, \b, 0) -- cycle;

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % outline
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0);
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0);
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0);
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0);


    % r(x, y)
    \draw[very thick, ->] (O) -- (1.2, 1.6, 0) node[right, xshift=0, yshift=-5] {$\boldsymbol{r}$};

    % side length labels
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (-\a, \b, 0) -- (\a, \b, 0) node [midway, right, xshift=5, yshift=-13] {$a$};
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (\a, \b, 0) -- (\a, -\b, 0) node [midway, below, xshift=-3, yshift=-10] {$b$};

\end{scope}
{% endtikz %}
</center>

We can do this with just standard Cartesian coordinates, so the parameterization is very easy.

$$
\b{r}(x, y) = x \; \u{x} + y \; \u{y} \\[10pt]
A = \{ \b{r}(x, y) \ : \ -a/2 \leq x \leq a/2 \quad -b/2 \leq y \leq b/2 \}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial x} = \u{x}
\qquad
\frac{\partial \b{r}}{\partial y} = \u{y}
$$

$$
d \b{A} = \left ( \frac{\partial \b{r}}{\partial x} dx \right ) \times \left ( \frac{\partial \b{r}}{\partial y} dy \right ) = dx \; dy \; \u{z}
$$

$$
dA = \abs{ d \b{A} } = dx \; dy
$$

## Mass

$$
\begin{align}
    M &= \int \; dm \\[10pt]
    &= \sigma \int \; dA \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \int_{-b/2}^{b/2} dx \; dy \\[10pt]
    &= \sigma \left ( \int_{-a/2}^{a/2} dx \right ) \left ( \int_{-b/2}^{b/2} dy \right ) \\[10pt]
    &= \sigma (a) (b) \\[10pt]
    &= \sigma \cdot ab
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

<center>
{% tikz rectangular-surface-central-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{2}
    \def\b{2.5}

    % Particular definitions

    %=============================================================

    % axis of rotation (part 1)
    \draw [color=myred] (AORend) -- (O);

    % shading
    \fill[shading=axis, color=mygray, opacity=0.4] (\a, \b, 0) -- (\a, -\b, 0) -- (-\a, -\b, 0) -- (-\a, \b, 0) -- cycle;

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % outline
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0);
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0);
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0);
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0);

    % r(x, y)
    \draw[very thick, ->] (O) -- (1.2, 1.6, 0) node[right, xshift=0, yshift=-5] {$\boldsymbol{r}$};

    % axis of rotation (part 2)
    \draw [color=myred] (AORstart) -- (O);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % side length labels
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (-\a, \b, 0) -- (\a, \b, 0) node [midway, right, xshift=5, yshift=-13] {$a$};
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (\a, \b, 0) -- (\a, -\b, 0) node [midway, below, xshift=-3, yshift=-10] {$b$};

\end{scope}
{% endtikz %}
</center>

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \sigma \int r_{axis}^2 \; dA \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \int_{-b/2}^{b/2} (x^2 + y^2) \; dx \; dy \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} (b x^2 + \tfrac{1}{12} b^3) \; dx \\[10pt]
    &= \sigma \left ( \frac{1}{12}a^3 b + \frac{1}{12} a b^3 \right ) \\[10pt]
    &= \sigma \cdot \frac{1}{12} ab (a^2 + b^2) \\[10pt]
    &= \frac{1}{12} M (a^2 + b^2)
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

<center>
{% tikz rectangular-surface-central-diameter %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (6, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (-3.5, 0, 0);
    \coordinate (AORstart) at (5, 0, 0);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{2}
    \def\b{2.5}

    % Particular definitions

    %=============================================================

    % shading
    \fill[shading=axis, color=mygray, opacity=0.4] (\a, \b, 0) -- (\a, -\b, 0) -- (-\a, -\b, 0) -- (-\a, \b, 0) -- cycle;

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % outline
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0);
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0);
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0);
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0);

    % r(x, y)
    \draw[very thick, ->] (O) -- (1.2, 1.6, 0) node[right, xshift=0, yshift=-5] {$\boldsymbol{r}$};

    % side length labels
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (-\a, \b, 0) -- (\a, \b, 0) node [midway, right, xshift=5, yshift=-13] {$a$};
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (\a, \b, 0) -- (\a, -\b, 0) node [midway, below, xshift=-3, yshift=-10] {$b$};

    % axis of rotation
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around y=90] ($(AORstart) - (\rotarrowoffset, 0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=22, yshift=-20] {$\omega$};

\end{scope}
{% endtikz %}
</center>

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \sigma \int r_{axis}^2 \; dA \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \int_{-b/2}^{b/2} y^2 \; dx \; dy \\[10pt]
    &= \sigma \int_{-a/2}^{a/2} \tfrac{1}{12} b^3 \; dx \\[10pt]
    &= \sigma \left ( \frac{1}{12} a b^3 \right ) \\[10pt]
    &= \sigma \cdot \frac{1}{12} ab \cdot b^2 \\[10pt]
    &= \frac{1}{12} M b^2
\end{align}
$$

<br>

## Inertia Tensor

$$
I = \begin{bmatrix}
    \tfrac{1}{12} M b^2 & 0 & 0 \\
    0  & \tfrac{1}{12} M a^2 & 0 \\
    0  & 0 & \tfrac{1}{12} M (a^2 + b^2)
\end{bmatrix}
= \tfrac{1}{12} M \begin{bmatrix}
    b^2 & 0 & 0 \\
    0  & a^2 & 0 \\
    0  & 0 & a^2 + b^2
\end{bmatrix}
$$

<br>

Interestingly, this is exactly the same as the flat elliptical surface, but with the coefficient $\tfrac{1}{12}$ instead of $\tfrac{1}{4}$.