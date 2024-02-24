---
layout:     series
title:      "Elliptical Disc"
date:       2023-09-20
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       19
series:     moments-of-inertia
tags:       moments-of-inertia
---

## Parametarizing the Surface

<center>
{% tikz flat-ellipse-surface %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (5, 0, 0);
    \coordinate (Y) at (0, 5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Curve Parameters
    \def\a{3}           % minor axis of ellipse
    \def\b{4}           % major axis of ellipse

    % Particular definitions
    \def\myphi{40}
    \def\dphi{25}
    \def\t{0.6}
    \def\dt{0.3}
    \coordinate (xy) at ({\t*\a*cos(\myphi)},{\t*\b*sin(\myphi)},0);
    \coordinate (xy2) at ({(\t+\dt)*\a*cos(\myphi)},{(\t+\dt)*\b*sin(\myphi)},0);
    \coordinate (xy3) at ({(\t+\dt)*\a*cos(\myphi + \dphi)},{(\t+\dt)*\b*sin(\myphi + \dphi)},0);
    \coordinate (xy4) at ({\t*\a*cos(\myphi+\dphi)},{\t*\b*sin(\myphi+\dphi)},0);

    %=============================================================

    % shading of flat ellipse
    \fill[shading=axis, color=mygray, opacity=0.4] (\a, 0, 0) arc (0:360:{\a} and {\b}) -- cycle;

    % flat ellipse outline (part 1)
    \draw[ultra thick] (90:\b) arc (90:270:{\a} and {\b});

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % major and minor axes of ellipse
    \draw[ultra thick, color=paramColor] (O) -- (\a,0,0) node[midway, left, yshift=3] {$a$};
    \draw[ultra thick, color=paramColor] (O) -- (0,\b,0) node[midway, above] {$b$};

    % outline of flat disc (part 2)
    \draw[ultra thick] (90:\b) arc (90:-90:{\a} and {\b});

    % dA
    \fill[shading=axis, color=myred, opacity=0.4] (xy3) arc ({\myphi + \dphi}:{\myphi}:{(\t+\dt)*\a} and {(\t+\dt)*\b}) -- (xy2) -- (xy) arc ({\myphi}:{\myphi + \dphi}:{\t * \a} and {\t * \b}) -- cycle;
    \draw[ultra thick, ->, color=myred] (xy) arc ({\myphi}:{\myphi + \dphi}:{\t*\a} and {\t*\b});
    \draw[ultra thick, ->, color=myred] (xy) -- (xy2);
    %\draw[ultra thick, ->, color=myred] (xy3) arc ({\myphi + \dphi}:{\myphi}:{(\t+\dt)*\a} and {(\t+\dt)*\b});
    %\draw[ultra thick, ->, color=myred, rotate around z=\myphi] (xy4) -- (xy3);
    \node[color=myred, xshift=25, yshift=-15] at (xy2) {$dA$};

    % r(t, \phi)
    \draw[very thick, ->] (O) -- (xy);

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, pic text=$\phi'$, very thick, angle radius={0.4cm}, angle eccentricity=1.7] {angle = X--O--xy};
    %\node[color=paramColor, xshift=-60, yshift=20] at (O) {$\tan \phi' = \tfrac{b}{a} \tan \phi$};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz elliptical-disc-angle %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!50!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 4);

    % Curve Parameters
    \def\a{3}           % minor axis of ellipse
    \def\b{4}           % major axis of ellipse

    % Particular definitions
    \def\myphi{40}
    \def\t{0.8}
    \coordinate (xy) at ({\t*\a*cos(\myphi)},{\t*\b*sin(\myphi)});
    \coordinate (x) at ({\t*\a*cos(\myphi)},0);

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};

    % r(t, \phi)
    \draw[very thick, ->] (O) -- (xy) node[midway, above, xshift=15, yshift=20] {$\boldsymbol{r}$};
    \draw[thick, dashed] (x) -- (xy) node[midway, right] {$bt \sin \phi$};
    \node[right, xshift=17, yshift=-10] at (O) {$at \cos \phi$};

    % right angle
    \draw[thick] ($(x) - (0.3,0)$) -- ++(0,0.3) -- ++(0.3,0);

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, pic text=$\phi'$, very thick, angle radius={1cm}, angle eccentricity=1.4] {angle = X--O--xy};

{% endtikz %}
</center>

This is very similar to the parameterization of a flat disc in the [previous post](/blog/moments-of-inertia/flat-disc/). Let the parameter $t$ denote the percentage of the "radius" of the ellipse at a given "angle". These are in quotes because their definitions are more complicated than that of a circle. For example

$$
\b{r}(t, \phi) = at \cos \phi \; \u{x} + bt \sin \phi \; \u{y} \\[10pt]
A = \{ \b{r}(t, \phi) \ : \ 0 \leq t \leq 1 \quad 0 \leq \phi < 2\pi \}
$$

Now, just as before we find the value of an infinitesimal section of area. In this case, it is much harder to derive it using geometry, so we rely on the rigor of calculus. We are cashing in all of the hard work from the previous posts.

$$
\frac{\partial \b{r}}{\partial t} = a \cos \phi \; \u{x} + b \sin \phi \; \u{y}
\qquad
\frac{\partial \b{r}}{\partial \phi} = - at \sin \phi \; \u{x} + bt \cos \phi \; \u{y}
$$

$$
d \b{A} = \left ( \frac{\partial \b{r}}{\partial t} dt \right ) \times \left ( \frac{\partial \b{r}}{\partial \phi} d\phi \right ) = (ab \; t \cos^2 \phi + ab \; t \sin^2 \phi) \; dt \; d\phi \; \u{z} = ab \; t \; dt \; d\phi \; \u{z}
$$

$$
dA = \abs{ d \b{A} } = ab \; t \; dt \; d\phi
$$

Before moving on to the integration, I want to pause and talk about $\phi$. We see that I've labeled the diagram $\phi'$ but I'm using $\phi$ as my argument in $\b{r}(t, \phi)$. This is because $\phi$ actually has no geometric meaning. Like the parameter $t$, it's just a parameter we can use for integration. Using the right figure, we see that

$$
\abs{\b{r}} \tan \phi' = \tfrac{b}{a} \tan \phi
$$

## Mass

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \sigma \int dA \\[10pt]
    &= \sigma \int_{0}^{1} \int_{0}^{2 \pi} ab \; t \; d t \; d \phi \\[10pt]
    &= \sigma \cdot ab \left ( \int_{0}^{1} t \; d t \right ) \left ( \int_{0}^{2 \pi} d \phi \right ) \\[10pt]
    &= \sigma \cdot ab \left ( \frac{1}{2} \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \sigma \cdot \pi ab
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

<center>
{% tikz flat-ellipse-central-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (5, 0, 0);
    \coordinate (Y) at (0, 5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -2);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{3}           % minor axis of ellipse
    \def\b{4}           % major axis of ellipse

    % Particular definitions
    \def\myphi{40}
    \def\t{0.6}
    \coordinate (xy) at ({\t*\a*cos(\myphi)},{\t*\b*sin(\myphi)},0);

    %=============================================================

    % axis of rotation (part 1)
    \draw [color=myred] (AORend) -- (O);

    % shading of flat ellipse
    \fill[shading=axis, color=mygray, opacity=0.4] (\a, 0, 0) arc (0:360:{\a} and {\b}) -- cycle;

    % flat ellipse outline (part 1)
    \draw[ultra thick] (90:\b) arc (90:270:{\a} and {\b});

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % major and minor axes of ellipse
    \draw[ultra thick, color=paramColor] (O) -- (\a,0,0) node[midway, left, xshift=-12, yshift=-5] {$a$};
    \draw[ultra thick, color=paramColor] (O) -- (0,\b,0) node[midway, above] {$b$};

    % outline of flat disc (part 2)
    \draw[ultra thick] (90:\b) arc (90:-90:{\a} and {\b});

    % axis of rotation (part 2)
    \draw [color=myred] (AORstart) -- (O);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % r(t, \phi)
    \draw[very thick, ->] (O) -- (xy) node[below, xshift=10, yshift=10] {$\boldsymbol{r}$};

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, very thick, angle radius={0.4cm}] {angle = X--O--xy};
    \node[color=paramColor, xshift=-15, yshift=0] at (O) {$\phi'$};

    \node[xshift=60, yshift=-60] at (O) {$r_{axis} = r$};

\end{scope}
{% endtikz %}
</center>

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{1} \int_{0}^{2 \pi} (a^2 t^2 \cos^2 \phi + b^2 t^2 \sin^2 \phi) \cdot ab \; t \; d t \; d \phi \\[10pt]
    &= \sigma \cdot ab \left ( \int_{0}^{1} t^3 \; d t \right ) \left ( \int_{0}^{2 \pi} (a^2 \cos^2 \phi + b^2 \sin^2 \phi) \; d \phi \right ) \\[10pt]
    &= \sigma \cdot ab \left ( \frac{1}{4} \right ) \left ( \pi a^2 + \pi b^2 \right ) \\[10pt]
    &= \sigma \cdot \tfrac{1}{4} \pi ab(a^2 + b^2) \\[10pt]
    &= \tfrac{1}{4} M (a^2 + b^2)
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

<center>
{% tikz flat-elliptical-disc-central-diameter %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (6, 0, 0);
    \coordinate (Y) at (0, 5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (-3.5, 0, 0);
    \coordinate (AORstart) at (5, 0, 0);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{3}           % minor axis of ellipse
    \def\b{4}           % major axis of ellipse

    % Particular definitions
    \def\myphi{40}
    \def\t{0.6}
    \coordinate (xy) at ({\t*\a*cos(\myphi)},{\t*\b*sin(\myphi)},0);
    \coordinate (x) at ({\t*\a*cos(\myphi)},0);

    %=============================================================

    % shading of flat ellipse
    \fill[shading=axis, color=mygray, opacity=0.4] (\a, 0, 0) arc (0:360:{\a} and {\b}) -- cycle;

    % flat ellipse outline (part 1)
    \draw[ultra thick] (90:\b) arc (90:270:{\a} and {\b});

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % outline of flat disc (part 2)
    \draw[ultra thick] (90:\b) arc (90:-90:{\a} and {\b});

    % axis of rotation
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around y=90] ($(AORstart) - (\rotarrowoffset, 0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=25, yshift=-15] {$\omega$};

    % major and minor axes of ellipse
    \draw[ultra thick, color=paramColor] (O) -- (\a,0,0) node[midway, left, xshift=-12, yshift=-5] {$a$};
    \draw[ultra thick, color=paramColor] (O) -- (0,\b,0) node[midway, above] {$b$};

    % r(t, \phi)
    \draw[very thick, ->] (O) -- (xy) node[below, xshift=10, yshift=10] {$\boldsymbol{r}$};
    \draw[very thick] (xy) -- (x);
    \node[xshift=60, yshift=-60] at (O) {$r_{axis} = bt \sin \phi$};
    \draw[thick] ($(x) - (0.3,0)$) -- ++(0,0.3) -- ++(0.3,0);

    % angle \phi
    \draw pic[draw, paramColor, -{Classical TikZ Rightarrow}, very thick, angle radius={0.4cm}] {angle = X--O--xy};
    \node[color=paramColor, xshift=-15, yshift=0] at (O) {$\phi'$};

\end{scope}
{% endtikz %}
</center>

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{1} \int_{0}^{2 \pi} t^2 b^2 \sin^2 \phi \cdot ab \; t \; d t \; d \phi \\[10pt]
    &= \sigma \cdot ab \left ( \int_{0}^{1} t^3 \; d t \right ) \left ( \int_{0}^{2 \pi} b^2 \sin^2 \phi \; d \phi \right ) \\[10pt]
    &= \sigma \cdot ab \left ( \frac{1}{4} \right ) \left ( \pi b^2 \right ) \\[10pt]
    &= \sigma \cdot \tfrac{1}{4} \pi ab^3 \\[10pt]
    &= \tfrac{1}{4} M b^2
\end{align}
$$

<br>

## Inertia Tensor

$$
I = \begin{bmatrix}
    \tfrac{1}{4} M b^2 & 0 & 0 \\
    0  & \tfrac{1}{4} M a^2 & 0 \\
    0  & 0 & \tfrac{1}{4} M (a^2 + b^2)
\end{bmatrix}
= \tfrac{1}{4} M \begin{bmatrix}
    b^2 & 0 & 0 \\
    0  & a^2 & 0 \\
    0  & 0 & a^2 + b^2
\end{bmatrix}
$$