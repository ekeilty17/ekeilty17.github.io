---
layout:     series
title:      "Circular Disc"
date:       2024-11-19
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       18
series:     moments-of-inertia
tags:       moments-of-inertia
---

We are moving onto $2\text{D}$ surfaces, which unintuitively are easier in some respects. A topologist would call a "flat disc" a $2\text{D}$ ball.

<br>

## Parameterizing the Surface

<center>
{% tikz flat-disc-surface %}[scale=1.5, line width=1.5pt, font=\LARGE]
\usetikzlibrary{angles,arrows.meta}
\tdplotsetmaincoords{70}{110}
\begin{scope}[>=Stealth, tdplot_main_coords]
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!50!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);
    \coordinate (X) at (3.5, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Curve Parameters
    \def\R{2.5}         % radius of circle

    % Particular definitions
    \def\myphi{40};
    \def\s{1.5}
    \coordinate (xy) at ({\s*cos(\myphi)},{\s*sin(\myphi)},0);
    \def\ds{0.75}
    \def\dphi{25}

    %=============================================================

    % shading of flat disc
    \fill[shading=axis, color=mygray, opacity=0.4] (\R, 0, 0) arc (0:360:{\R}) -- cycle;

    % outline of flat disc (part 1)
    \draw[ultra thick] (90:\R) arc (90:270:{\R});

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % radius of flat disc
    \draw[ultra thick, color=paramColor] (O) -- (0,\R,0) node[midway, above] {$R$};

    % outline of flat disc (part 2)
    \draw[ultra thick] (90:\R) arc (90:-90:{\R});

    % dA
    \fill[shading=axis, color=myred, opacity=0.4, rotate around z=\myphi] ({\dphi}:{\s+\ds}) arc ({\dphi}:0:{\s+\ds}) -- (\s,0,0) -- (0:{\s}) arc (0:{\dphi}:{\s}) -- cycle;
    \draw[ultra thick, ->, color=myred, rotate around z=\myphi] (0:\s) arc (0:{\dphi}:{\s});
    \draw[ultra thick, ->, color=myred, rotate around z=\myphi] (\s,0,0) -- (\s+\ds,0,0);
    %\draw[ultra thick, ->, color=myred, rotate around z=\myphi] ({\dphi}:{\s+\ds}) arc ({\dphi}:0:{\s+\ds});
    %\draw[ultra thick, ->, color=myred, rotate around z=\myphi] ({\s*cos(\dphi)},{\s*sin(\dphi)},0) -- ({(\s+\ds)*cos(\dphi)},{(\s+\ds)*sin(\dphi)},0);
    \node[color=myred, rotate around z=\myphi, xshift=15, yshift=-10] at (\R,0,0) {$dA$};

    % r(s, \phi)
    \draw[very thick, ->] (O) -- (xy);

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, pic text=$\phi$, very thick, angle radius={0.4cm}, angle eccentricity=1.7] {angle = X--O--xy};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz flat-disc-differential-area %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!50!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);
    \coordinate (X) at (4, 0, 0);
    \coordinate (Y) at (0, 4, 0);

    % Curve Parameters
    \def\R{2.5}         % radius of circle

    % Particular definitions
    \def\s{2.5}
    \def\ds{0.75}
    \def\myphi{25};
    \def\dphi{20}
    \coordinate (xy) at ({\s*cos(\myphi)}, {\s*sin(\myphi)});
    \coordinate (uv) at ({\s*cos(\myphi+\dphi)}, {\s*sin(\myphi+\dphi)});

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};

    % r(s, \phi)
    \draw[very thick, ->] (O) -- (xy) node[midway, right, xshift=15, yshift=0] {$s$};
    \draw[very thick, ->] (O) -- (uv) node[midway, left, xshift=10, yshift=15] {$s$};

    % dA
    \fill[shading=axis, color=myred, opacity=0.4, rotate around z=\myphi] ({\dphi}:{\s+\ds}) arc ({\dphi}:0:{\s+\ds}) -- (\s,0) -- (0:{\s}) arc (0:{\dphi}:{\s}) -- cycle;
    \draw[ultra thick, ->, color=myred, rotate around z=\myphi] (0:\s) arc (0:{\dphi}:{\s}) node[above, xshift=-10, yshift=5] {$s d\phi \; \boldsymbol{\hat{\phi}}$};
    \draw[ultra thick, ->, color=myred, rotate around z=\myphi] (\s,0) -- (\s+\ds,0) node[below, xshift=3, yshift=-8] {$ds \; \boldsymbol{\hat{s}}$};

    % angle \phi
    %\draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, pic text=$\phi$, very thick, angle radius={1cm}, angle eccentricity=1.4] {angle = X--O--xy};
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, pic text=$d\phi$, very thick, angle radius={1.5cm}, angle eccentricity=1.4] {angle = xy--O--uv};

{% endtikz %}
</center>

We can parameterize the flat disc using cylindrical coordinates.

$$
\b{r}(s, \phi) = s \cos \phi \; \u{x} + s \sin \phi \; \u{y} = s \; \u{s} = \b{s} \\[10pt]
A = \{ \b{r}(s, \phi) \ : \ 0 \leq s \leq R \quad 0 \leq \phi < 2\pi \}
$$

Now, we find the differential area element. We can prove this both geometrically (see the right diagram above) and rigorously using calculus.

$$
\frac{\partial \b{r}}{\partial s} = \cos \phi \; \u{x} + \sin \phi \; \u{y} = \u{s}
\qquad
\frac{\partial \b{r}}{\partial \phi} = - s \sin \phi \; \u{x} + s \cos \phi \; \u{y} = s \; \u{\phi}
$$

$$
d \b{A} = \left ( \frac{\partial \b{r}}{\partial s} ds \right ) \times \left ( \frac{\partial \b{r}}{\partial \phi} d\phi \right ) = (ds \; \u{s}) \times (s \; d\phi \; \u{\phi}) = s \; ds \; d\phi \; \u{z}
$$

$$
dA = \abs{ d \b{A} } = s \; ds \; d\phi
$$

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \sigma \int dA \\[10pt]
    &= \sigma \int_{0}^{R} \int_{0}^{2 \pi} s \; d s \; d \phi \\[10pt]
    &= \sigma \left ( \int_{0}^{R} s \; d s \right ) \left ( \int_{0}^{2 \pi} d \phi \right ) \\[10pt]
    &= \sigma \left ( \tfrac{1}{2} R^2 \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \sigma \cdot \pi R^2
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

<center>
{% tikz flat-disc-central-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
\usetikzlibrary{angles,arrows.meta}
\tdplotsetmaincoords{70}{110}
\begin{scope}[>=Stealth, tdplot_main_coords]
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!50!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);
    \coordinate (X) at (3.5, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\R{2.5}         % radius of circle

    % Particular definitions
    \def\myphi{40};
    \def\s{2}
    \coordinate (xy) at ({\s*cos(\myphi)},{\s*sin(\myphi)},0);

    %=============================================================

    % axis of rotation (part 1)
    \draw [color=myred] (AORend) -- (O);

    % shading of flat disc
    \fill[shading=axis, color=mygray, opacity=0.4] (\R, 0, 0) arc (0:360:{\R}) -- cycle;

    % outline of flat disc (part 1)
    \draw[ultra thick] (90:\R) arc (90:270:{\R});

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % radius of flat disc
    \draw[ultra thick, color=paramColor] (O) -- (0,\R,0) node[midway, above] {$R$};

    % outline of flat disc (part 2)
    \draw[ultra thick] (90:\R) arc (90:-90:{\R});

    % axis of rotation (part 2)
    \draw [color=myred] (AORstart) -- (O);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % r(s, \phi)
    \draw[very thick, ->] (O) -- (xy) node[midway, xshift=12, yshift=0] {$\boldsymbol{s}$};
    \node[below, xshift=12, yshift=-10] at (xy) {$r_{axis} = s$};

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, very thick, angle radius={0.4cm}] {angle = X--O--xy};
    \node[color=paramColor, xshift=-15, yshift=0] at (O) {$\phi$};

\end{scope}
{% endtikz %}
</center>

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{R} \int_{0}^{2 \pi} s^2 \cdot s \; d s \; d \phi \\[10pt]
    &= \sigma \left ( \int_{0}^{R} s^3 \; d s \right ) \left ( \int_{0}^{2 \pi} d \phi \right ) \\[10pt]
    &= \sigma \left ( \tfrac{1}{4} R^4 \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \sigma \cdot \tfrac{1}{2} \pi R^4 \\[10pt]
    &= \tfrac{1}{2} M R^2
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

<center>
{% tikz flat-disc-central-diameter %}[scale=1.5, line width=1.5pt, font=\LARGE]
\usetikzlibrary{angles,arrows.meta}
\tdplotsetmaincoords{70}{110}
\begin{scope}[>=Stealth, tdplot_main_coords]
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!50!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0, 0);
    \coordinate (X) at (5.5, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (-3.5, 0, 0);
    \coordinate (AORstart) at (4.5, 0, 0);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\R{2.5}         % radius of circle

    % Particular definitions
    \def\myphi{40};
    \def\s{2}
    \coordinate (xy) at ({\s*cos(\myphi)},{\s*sin(\myphi)},0);
    \coordinate (x) at ({\s*cos(\myphi)},0,0);

    %=============================================================

    % shading of flat disc
    \fill[shading=axis, color=mygray, opacity=0.4] (\R, 0, 0) arc (0:360:{\R}) -- cycle;

    % outline of flat disc (part 1)
    \draw[ultra thick] (90:\R) arc (90:270:{\R});

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % radius of flat disc
    \draw[ultra thick, color=paramColor] (O) -- (0,\R,0) node[midway, above] {$R$};

    % outline of flat disc (part 2)
    \draw[ultra thick] (90:\R) arc (90:-90:{\R});

    % r(s, \phi)
    \draw[very thick, ->] (O) -- (xy) node[midway, xshift=12, yshift=0] {$\boldsymbol{s}$};
    \draw[very thick] (xy) -- (x) node[below, xshift=60, yshift=-15] {$r_{axis} = s \sin \phi$};
    \draw[thick] ($(x) - (0.15*\R,0)$) -- ++(0,0.1*\R) -- ++(0.15*\R,0);

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, very thick, angle radius={0.4cm}] {angle = X--O--xy};
    \node[color=paramColor, xshift=-15, yshift=0] at (O) {$\phi$};

    % axis of rotation
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around y=90] ($(AORstart) - (\rotarrowoffset, 0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=25, yshift=-15] {$\omega$};

\end{scope}
{% endtikz %}
</center>

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{R} \int_{0}^{2 \pi} (s \ \sin \phi )^2 \cdot s \; d s \; d \phi \\[10pt]
    &= \sigma \left ( \int_{0}^{R} s^3 \; d s \right ) \left ( \int_{0}^{2 \pi} \sin^2 \phi \; d \phi \right ) \\[10pt]
    &= \sigma \left ( \tfrac{1}{4} R^4 \right ) \left ( \pi \right ) \\[10pt]
    &= \sigma \cdot \tfrac{1}{4} \pi R^4 \\[10pt]
    &= \tfrac{1}{4} M R^2
\end{align}
$$

<br>

## Inertia Tensor

$$
I = \begin{bmatrix}
    \frac{1}{4} M R^2 & 0 & 0 \\
    0  & \frac{1}{4} M R^2 & 0 \\
    0  & 0 & \frac{1}{2}M R^2
\end{bmatrix}
= \tfrac{1}{4} M R^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0  & 1 & 0 \\
    0  & 0 & 2
\end{bmatrix}
$$