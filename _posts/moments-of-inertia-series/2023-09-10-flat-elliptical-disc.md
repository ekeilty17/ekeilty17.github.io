---
layout:     series
title:      "Flat Elliptical Disc"
date:       2023-09-10
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       9
series:     moments-of-inertia
tags:       moments-of-inertia
excerpt_separator: <!--more-->
---

## Parametarizing the Surface

We need to evaluate this in Cartesian coordiantes. However, you should think of it as modified polar coordiantes.

$$
\b{r}(t, \phi) = at \cos \phi \; \u{x} + bt \sin \phi \; \u{y}
$$

$$
\frac{\partial \b{r}}{\partial t} = a \cos \phi \; \u{x} + b \sin \phi \; \u{y}
\qquad
\frac{\partial \b{r}}{\partial \phi} = - at \sin \phi \; \u{x} + bt \cos \phi \; \u{y}
$$

$$
d \b{A} = \frac{\partial \b{r}}{\partial t} dt \times \frac{\partial \b{r}}{\partial \phi} d\phi = (abt \cos^2 \phi + abt \sin^2 \phi) \; dt \; d\phi \; \u{z} = abt \; dt \; d\phi \; \u{z}
$$

$$
dA = \abs{ d \b{A} } = abt \; dt \; d\phi
$$

## Mass

<center>
{% tikz flat-elliptical-disc-integral %}[scale=1.5, line width=1.5pt, font=\LARGE]
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

    % Axis
    \draw [thick, ->] (O) -- (0,0,4) node[left] {$x$};
    \draw [thick, ->] (O) -- (3,0,0) node[right] {$y$};
    \draw [thick, ->] (O) -- (0,2.5,0) node[above] {$z$};

    % radius of path of point math
    \draw[very thick, color=myblue] (O) -- (\R,0,0) node[midway, below] {$R$};

    % path of point mass (part 1)
    \draw[ultra thick] (\R,0,0) arc (0:180:{\R} and 0.6);

    % axis of rotation
    \draw [color=myred] (0, -1.5, 0) -- (0, 1.5, 0) node[xshift=17, yshift=-7] {$\omega$};
    \pic[color=myred] at (0, 1.25, 0) {rotarr};

    % path of point mass (part 2)
    \draw[ultra thick] (-\R,0,0) arc (180:360:{\R} and 0.6);
{% endtikz %}
</center>

<br>

We use cylindrical coordinates to evaluate this integral. Since it is a circle, the parameters $s = R$ and $z = 0$ are constant while the parameter $\phi$ varies. Therefore, $d\ell = R \; d \phi$.

$$
\begin{align}
    M &= \int dm \\[10pt]
    &= \sigma \int dA \\[10pt]
    &= \sigma \int_{0}^{1} \int_{0}^{2 \pi} abt \; d t \; d \phi \\[10pt]
    &= \sigma \cdot ab \left ( \int_{0}^{1} t \; d t \right ) \left ( \int_{0}^{2 \pi} d \phi \right ) \\[10pt]
    &= \sigma \cdot ab \left ( \frac{1}{2} \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \sigma \cdot \pi ab
\end{align}
$$

<br>

## Moment of Inertia About Central Axis

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{1} \int_{0}^{2 \pi} t^2 (a^2 \cos^2 \phi + b^2 \sin^2 \phi) \cdot abt \; d t \; d \phi \\[10pt]
    &= \sigma \cdot ab \left ( \int_{0}^{1} t^3 \; d t \right ) \left ( \int_{0}^{2 \pi} (a^2 \cos^2 \phi + b^2 \sin^2 \phi) \; d \phi \right ) \\[10pt]
    &= \sigma \cdot ab \left ( \frac{1}{4} \right ) \left ( \pi a^2 + \pi b^2 \right ) \\[10pt]
    &= \sigma \cdot \frac{1}{4} \pi ab(a^2 + b^2) \\[10pt]
    &= \frac{1}{4} M (a^2 + b^2)
\end{align}
$$

<br>

## Moment of Inertia About Central Diameter

$$
\begin{align}
    I &= \int r_{axis}^2 dm \\[10pt]
    &= \sigma \int r_{axis}^2 dA \\[10pt]
    &= \sigma \int_{0}^{1} \int_{0}^{2 \pi} t^2 b^2 \sin^2 \phi \cdot abt \; d t \; d \phi \\[10pt]
    &= \sigma \cdot ab \left ( \int_{0}^{1} t^3 \; d t \right ) \left ( \int_{0}^{2 \pi} b^2 \sin^2 \phi \; d \phi \right ) \\[10pt]
    &= \sigma \cdot ab \left ( \frac{1}{4} \right ) \left ( \pi b^2 \right ) \\[10pt]
    &= \sigma \cdot \frac{1}{4} \pi ab^3 \\[10pt]
    &= \frac{1}{4} M b^2
\end{align}
$$