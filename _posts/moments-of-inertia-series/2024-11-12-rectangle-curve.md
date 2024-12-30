---
layout:     series
title:      "Rectangle"
date:       2024-11-12
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       11
series:     moments-of-inertia
tags:       moments-of-inertia
---

## Parameterizing the Curve {#parameterization}

The rectangle is made up of $4$ distinct lines.

<center>
{% tikz rectangle-curve %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\a{1.5}
    \def\b{2}

    % Particular definitions

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % rectangle
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0);
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0);
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0);
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0);

    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (-\a, \b, 0) -- (\a, \b, 0) node [midway, right, xshift=5, yshift=-13] {$a$};
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (\a, \b, 0) -- (\a, -\b, 0) node [midway, below, xshift=-3, yshift=-10] {$b$};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz rectangle-curve-2 %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\a{1.5}
    \def\b{2}

    % Particular definitions

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % rectangle
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0) node[midway, below, xshift=10, yshift=-2] {$\ell_1$};
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0) node[midway, left, xshift=-4, yshift=5] {$\ell_4$};
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0) node[midway, above, xshift=5, yshift=0] {$\ell_3$};
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0) node[midway, right, xshift=-5, yshift=-15] {$\ell_2$};

\end{scope}
{% endtikz %}
</center>

So we actually don't have to parameterize the curve, we can derive the mass and moment of inertia using results from the post on [lines](/blog/moments-of-inertia/lines).

<br>

## Mass {#mass}

The mass is obviously just the perimeter times the mass density, but let's do it rigorously. To get the total mass, we sum the mass of each line segment ($\ell_1$, $\ell_2$, $\ell_3$, and $\ell_4$), which we derived in the post on [lines](/blog/moments-of-inertia/lines#mass).

$$
\begin{align}
    M &= M_1 + M_2 + M_3 + M_4 \\[10pt]
    &= \lambda L_1 + \lambda L_2 + \lambda L_3 + \lambda L_4 \\[10pt]
    &= \lambda b + \lambda a + \lambda b + \lambda a \\[10pt]
    &= \lambda \cdot 2(a + b)
\end{align}
$$

<br>

## Moment of Inertia About Central Axis {#central-axis}

<center>
{% tikz rectangle-inertia-central-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\a{1.5}
    \def\b{2}

    % Particular definitions

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % rectangle (part 1)
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0) node[midway, above, xshift=5, yshift=0] {$\ell_3$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % rectangle (part 2)
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0) node[midway, right, xshift=-5, yshift=-15] {$\ell_2$};
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0) node[midway, below, xshift=10, yshift=-2] {$\ell_1$};
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0) node[midway, left, xshift=-4, yshift=5] {$\ell_4$};

\end{scope}
{% endtikz %}
</center>

Just like in calculating the mass, we can calculate the total moment of inertia by summing the contribution of each line segment ($\ell_1$, $\ell_2$, $\ell_3$, and $\ell_4$). We use the special case formula for the moment of inertia of a line derived in the [previous post](/blog/moments-of-inertia/lines-special-cases#xy-plane-parallel-and-perpendicular).

$$
\begin{align}
    I &= I_1 + I_2 + I_3 + I_4 \\[10pt]
    &= (\tfrac{1}{12} M_1 L_1^2 + M_1 D_1^2) + (\tfrac{1}{12} M_2 L_2^2 + M_2 D_2^2) + (\tfrac{1}{12} M_3 L_3^2 + M_3 D_3^2) + (\tfrac{1}{12} M_4 L_4^2 + M_4 D_4^2) \\[10pt]
    &= (\tfrac{1}{12} (\lambda b)(b)^2 + (\lambda b)(a/2)^2) + (\tfrac{1}{12} (\lambda a)(a)^2 + (\lambda a)(b/2)^2) + (\tfrac{1}{12} (\lambda b)(b)^2 + (\lambda b)(a/2)^2) + (\tfrac{1}{12} (\lambda a)(a)^2 + (\lambda a)(b/2)^2) \\[10pt]
    &= (\tfrac{1}{12} \lambda b^3 + \tfrac{1}{4} \lambda a^2b) + (\tfrac{1}{12} \lambda a^3 + \tfrac{1}{4} \lambda ab^2) + (\tfrac{1}{12} \lambda b^3 + \tfrac{1}{4} \lambda a^2b) + (\tfrac{1}{12} \lambda a^3 + \tfrac{1}{4} \lambda ab^2) \\[10pt]
    &= \tfrac{1}{6} \lambda (a^3 + b^3) + \tfrac{1}{2} \lambda (a^2b + ab^2) \\[10pt]
    &= \tfrac{1}{6} \lambda (a + b) (a^2 - ab + b^2) + \tfrac{1}{2} \lambda (a + b)ab \\[10pt]
    &= \lambda \cdot 2(a + b) \cdot \tfrac{1}{12} \left ( (a^2 - ab + b^2) + 3ab \right ) \\[10pt]
    &= \tfrac{1}{12} M \left ( a^2 + 2ab + b^2 \right ) \\[10pt]
    &= \tfrac{1}{12} M \left ( a + b \right )^2
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter {#central-diameter}

<center>
{% tikz rectangle-inertia-central-diameter %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (5.5, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (-3, 0, 0);
    \coordinate (AORstart) at (4.5, 0, 0);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{1.5}
    \def\b{2}

    % Particular definitions

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % rectangle
    \draw [ultra thick] (\a, \b, 0) -- (\a, -\b, 0) node[midway, below, xshift=10, yshift=-2] {$\ell_1$};
    \draw [ultra thick] (\a, -\b, 0) -- (-\a, -\b, 0) node[midway, left, xshift=-4, yshift=5] {$\ell_4$};
    \draw [ultra thick] (-\a, -\b, 0) -- (-\a, \b, 0) node[midway, above, xshift=-5, yshift=2] {$\ell_3$};
    \draw [ultra thick] (-\a, \b, 0) -- (\a, \b, 0) node[midway, right, xshift=-5, yshift=-15] {$\ell_2$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around y=90] ($(AORstart) - (\rotarrowoffset, 0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=25, yshift=-15] {$\omega$};

\end{scope}
{% endtikz %}
</center>

We do likewise here.

$$
\begin{align}
    I &= I_1 + I_2 + I_3 + I_4 \\[10pt]
    &= (\tfrac{1}{12} M_1 L_1^2 + M_1 D_1^2) + (M_2 D_2^2) + (\tfrac{1}{12} M_3 L_3^2 + M_3 D_1^3) + (M_4 D_4^2) \\[10pt]
    &= (\tfrac{1}{12} (\lambda b)(b)^2 + (\lambda b)(0)^2) + ((\lambda a)(b/2)^2) + (\tfrac{1}{12} (\lambda b)(b)^2 + (\lambda b)(0)^2) + ((\lambda a)(b/2)^2) \\[10pt]
    &= (\tfrac{1}{12} \lambda b^3) + (\tfrac{1}{4} \lambda ab^2) + (\tfrac{1}{12} \lambda b^3) + (\tfrac{1}{4} \lambda ab^2) \\[10pt]
    &= \tfrac{1}{6} \lambda b^3 + \tfrac{1}{2} \lambda ab^2 \\[10pt]
    &= \tfrac{1}{6} \lambda b^2 (b + 3a) \\[10pt]
    &= \tfrac{1}{6} \lambda (a + b) \cdot \frac{b^2 (b + 3a)}{a + b} \\[10pt]
    &= \tfrac{1}{12} M b^2 \; \frac{3a + b}{a + b} \\[10pt]
\end{align}
$$

Unfortunately, I have not found a way to simplify this any further. If you have any ideas, please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

## Inertia Tensor {#inertia-tensor}

$$
\m{I} = \tfrac{1}{12} M \begin{bmatrix}
    b^2 \frac{3a+b}{a+b} & 0 & 0 \\
    0  & a^2 \frac{a+3b}{a+b} & 0 \\
    0  & 0 & (a+b)^2
\end{bmatrix}
$$

<br>

--- 

<br>

## Special Case: Square {#square}
This is a special case where all sides are equal in length. Therefore, $a = b = S$.

### Moment of Inertia About Central Axis

$$
I = \tfrac{1}{12} M \left ( S + S \right )^2 = \tfrac{1}{3} M S^2
$$

### Moment of Inertia About Central Diameter

$$
I = \tfrac{1}{12} M S^2 \; \frac{3S + S}{S + S} = \tfrac{1}{6} M S^2
$$

### Inertia Tensor

$$
\m{I} = \tfrac{1}{6} M S^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0  & 1 & 0 \\
    0  & 0 & 2
\end{bmatrix}
$$
