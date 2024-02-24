---
layout:     series
title:      "Lines - Special Cases"
date:       2023-09-28
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       50
series:     moments-of-inertia
tags:       moments-of-inertia
---

In the [previous post](/blog/moments-of-inertia/lines) we derived the moment of inertia for any line. However, this result is so general as to not be very useful in practice. The useful results come from the special cases.

<br>

## Perpendicular to the Axis of Rotation

### Moment of Inertia about a Perpendicular Axis at a Distance from its Center {#moment-of-inertia-about-a-perpendicular-axis-at-a-distance-from-its-center}

Without loss of generality can assume that $z_1 = z_2$ and that the line is parallel to the $x$-axis ($y_1 = y_2 = d$). Finally, since it's centered relative to the axis of rotation, we have $x_1 = -L/2$ and $x_2 = L/2$.

<center>
{% tikz line-inertia-center-distance %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\a{-3}
    \def\b{2}
    \def\c{0}
    \def\d{3}
    \def\e{2}
    \def\f{0}

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
    \draw [ultra thick] (start) -- (end);

    % label width
    %\draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (\a, \b, 0) -- (0, \b, 0) node [midway, below, right, xshift=10, yshift=-5]{$L/2$};
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (0, \e, 0) -- (\d, \e, 0) node [midway, below, right, xshift=10, yshift=-5]{$L/2$};

    % label height
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (0, 0.05, 0) -- (0, \b, 0) node [midway, above, xshift=4, yshift=10]{$d$};

\end{scope}
{% endtikz %}
</center>

Therefore, using the general formula for $I_{zz}$ above we get

$$
I = \tfrac{1}{3} M \left [ ((-L/2) + (L/2))^2 + (d + d)^2 - (-L/2)(L/2) - (d)(d) \right ] = \tfrac{1}{12} M L^2 + Md^2
$$

This formula is suspiciously clean. We will see another way to derive this later.

<br>

### Moment of Inertia about a Perpendicular Axis at its Center {#moment-of-inertia-about-a-perpendicular-axis-at-its-center}

<center>
{% tikz line-inertia-center %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\a{-3}
    \def\b{0}
    \def\c{0}
    \def\d{3}
    \def\e{0}
    \def\f{0}

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
    \draw [ultra thick] (start) -- (end);

    % label width
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (\d, \e, 0) -- (0, \e, 0) node [midway, above, left, xshift=0, yshift=15]{$L/2$};

\end{scope}
{% endtikz %}
</center>

This is just a special case of the previous example where $d = 0$.

$$
I = \tfrac{1}{12} M L^2
$$

<br>

### Moment of Inertia about a Perpendicular Axis at a Distance from its End {#moment-of-inertia-about-a-perpendicular-axis-at-a-distance-from-its-end}

<center>
{% tikz line-inertia-end-distance %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\c{0}
    \def\d{3}
    \def\e{2}
    \def\f{0}

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
    \draw [ultra thick] (start) -- (end);

    % label width
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (0, \e, 0) -- (\d, \e, 0) node [midway, below, right, xshift=10, yshift=-5]{$L$};

    % label height
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (0, 0.05, 0) -- (0, \b, 0) node [midway, above, xshift=4, yshift=10]{$d$};

\end{scope}
{% endtikz %}
</center>

$$
I = \tfrac{1}{3} M \left [ (0 + L)^2 + (d + d)^2 - (0)(L) - (d)(d) \right ] = \tfrac{1}{3} M L^2 + Md^2
$$

<br>

### Moment of Inertia about a Perpendicular Axis from its End {#moment-of-inertia-about-a-perpendicular-axis-from-its-end}

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
    \def\d{3}
    \def\e{0}
    \def\f{0}

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
    \draw [ultra thick] (start) -- (end);

    % label width
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (\d, \e, 0) -- (0, \e, 0) node [midway, above, left, xshift=0, yshift=15]{$L$};

\end{scope}
{% endtikz %}
</center>

This is just a special case of the previous example where $d = 0$.

$$
I = \tfrac{1}{3} M L^2
$$

<br>

## Parallel to the Axis of Rotation

### Moment of Inertia about a Parallel Axis at a Distance {#moment-of-inertia-about-a-parallel-axis-at-a-distance}

Without loss of generality, we can assume that the line is parallel to the $z$-axis. The $z$-coordinates actually don't matter (they don't show up in the formula), so let's say that $z_1 = -L/2$ and $z_2 = L/2$. We can also assume that the line is perpendicular to the $y$-axis. Therefore, $y_1 = y_2 = d$. Finally, $x_1 = x_2 = 0$.

<center>
{% tikz line-inertia-parallel-to-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \draw [ultra thick] (start) -- (end);

    % label width
    %\draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (end) -- (0, \e, 0) node [midway, right, xshift=10]{$L/2$};

\end{scope}
{% endtikz %}
</center>

$$
I = \tfrac{1}{3} M \left [ (0 + 0)^2 + (d + d)^2 - (0)(0) - (d)(d) \right ] = Md^2
$$

This is interesting because the length of the line actually does not matter. In fact, this is equivalent to a point mass of equal mass the same distance away from the axis. We will see this in other formulas. Lengths parallel to the axis of rotation do not contribute to the final result.

<br>

<!-- ## Intersecting with the Axis of Rotation

<br> -->

---

<br>

## A Common Mistake

You may look at these equations and think there is an inconsistency. We know that moments of inertia are additive. So, we should be able to derive the formula for the inertia of a line about its center by breaking it up into two lines and calculating each of their moments of inertia about their end. 

Many people will incorrectly do the following.

$$
I_{\text{center}} = 2 I_{\text{end}} = 2 \cdot \frac{1}{3} M (L/2)^2 = \frac{1}{6} M L^2
$$

And this is not the formula that we derived above. The fallacy in the above argument is that we've conflated the **mass** of each line. $M_{\text{center}} = L$ while $M_{\text{end}} = L/2$. The correct derivation is

$$
\begin{align}
    I_{\text{center}} &= 2 I_{\text{end}} \\[10pt]
    &= 2 \cdot \frac{1}{3} M_{\text{end}} L_{\text{end}}^2 \\[10pt]
    &= \frac{2}{3} \lambda (L/2) \cdot (L/2)^2 \\[10pt]
    &= \frac{1}{12} \lambda L^3 \\[10pt]
    &= \frac{1}{12} M_{\text{center}} L^2
\end{align}
$$

Which is the result we had before.