---
layout:     series
title:      "Spherical Shell"
date:       2023-09-22
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       21
series:     moments-of-inertia
tags:       moments-of-inertia, shell
---

Sometimes called a hollow sphere.

## Parameterizing the Surface

We can do this with just standard spherical coordinates.

$$
\b{r}(\theta, \phi) = R \sin \theta \cos \phi \; \u{x} + R \sin \theta \sin \phi \; \u{y} + R \cos \theta \u{z} = R \; \u{r} \\[10pt]
A = \{ \b{r}(\theta, \phi) \ : \ 0 \leq \theta < \pi \quad 0 \leq \phi < 2\pi \}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial \theta} = R \cos \theta \cos \phi \; \u{x} + R \sin \cos \sin \phi \; \u{y} - R \sin \theta \u{z} = R \; \u{\theta}
\\[10pt]
\frac{\partial \b{r}}{\partial \phi} = - R \sin \theta \sin \phi \; \u{x} + R \sin \theta \cos \phi \; \u{y} = R \sin \theta \; \u{\phi}
$$

$$
d \b{A} = \left ( \frac{\partial \b{r}}{\partial \theta} d\theta \right ) \times \left ( \frac{\partial \b{r}}{\partial \phi} d\phi \right ) = R^2 \sin \theta \; d\theta \; d\phi \; \u{r}
$$

$$
dA = \abs{ d \b{A} } = R^2 \sin \theta \; d\theta \; d\phi
$$

## Mass

<center>
{% tikz spherical-shell-mass-integral %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc}

    %                  (y, z, x)
    \coordinate (O) at (0, 0, 0);
    \def\R{2}
    \def\mytheta{50}
    \def\myphi{65}
    \def\x{ {\R * sin(\mytheta) * cos(\myphi)} }
    \def\y{ {\R * sin(\mytheta) * sin(\myphi)} }
    \def\z{ {\R * cos(\mytheta) } }
    \coordinate (XYZ) at (\y, \z, \x);
    \coordinate (XY) at (\y, 0, \x);

    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!70!black}
    \colorlet{mygray}{gray!40}

    % outline of the equator of the sphere (behind)
    \draw[thin, dashed] (\R,0,0) arc (0:180:{\R} and 0.8);

    % Axes
    \draw [thick, ->] (O) -- (3,0,0) node[right] {$y$};
    \draw [thick, ->] (O) -- (0,3,0) node[above] {$z$};
    \draw [thick, ->] (O) -- (0,0,5) node[left] {$x$};

    % draw angles
    \coordinate (X) at (0, 0, \R);
    \coordinate (Z) at (0, \R, 0);
    \draw pic[draw, myblue, ->, pic text=$\phi$, very thick, angle radius={0.5cm}, angle eccentricity=1.7] {angle = X--O--XY};
    \draw pic[draw, myblue, <-, pic text=$\theta$, very thick, angle radius={0.8cm}, angle eccentricity=1.5] {angle = XYZ--O--Z};

    % draw drop-down radius from that point
    \draw[dashed] (XYZ) -- (XY);
    \draw[dashed] (O) -- (XY);

    % draw arbitrary point on surface of circle
    \draw[color=myblue] (O) -- (XYZ) node[midway, xshift=8, yshift=22] {$R$};
    \draw[color=myblue, fill=myblue] (XYZ) circle (0.05);

    % Sphere
    \shade[ball color=mygray, opacity=0.4] (O) circle (\R cm);
    \draw[thick] (O) circle (\R cm);

    % outline of the equator of the sphere (in front)
    \draw[thin] (-\R,0,0) arc (180:360:{\R} and 0.8);

{% endtikz %}
</center>

<br>

$$
\begin{align}
    M &= \int \; dm \\[10pt]
    &= \sigma \int \; dA \\[10pt]
    &= \sigma \int_{0}^{\pi} \int_{0}^{2 \pi} R^2 \sin \theta \; d\theta \; d\phi \\[10pt]
    &= \sigma R^2 \left ( \int_{0}^{\pi} \sin \theta \; d\theta \right ) \left ( \int_{0}^{2 \pi} d\phi \right ) \\[10pt]
    &= \sigma R^2 \left ( 2 \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \sigma \cdot 4 \pi R^2
\end{align}
$$

<br>

## Moment of Inertia About Any Diameter

<center>
{% tikz spherical-shell-moment-integral %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc,bending}
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
    \def\R{2}
    \def\mytheta{40}
    \def\x{ {\R * cos(\mytheta)} }
    \def\y{ {\R * sin(\mytheta)} }

    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!70!black}
    \colorlet{mygray}{gray!40}

    % outline equator of the sphere (behind)
    \draw[thin, dashed] (\R,0,0) arc (0:180:{\R} and 0.6);

    % outline an arbitrary longitude line (behind)
    \draw[thin, dashed] (\x, \y, 0) arc (0:180:{\x} and 0.3);

    % Axes
    \draw [thick, ->] (O) -- (3,0,0) node[right] {$y$};
    \draw [thick, ->] (O) -- (0,3,0) node[above] {$z$};
    \draw [thick, ->] (O) -- (0,0,5) node[left] {$x$};

    % draw angle to arbitrary longitude line
    \draw (O) -- (\x, \y, 0);
    \coordinate (A) at (0, \R, 0);
    \coordinate (B) at (\x, \y, 0);
    \draw pic[draw, myblue, <-, pic text=$\theta$, very thick, angle radius={0.8cm}, angle eccentricity=1.5] {angle = B--O--A};

    % draw radius and radius to axis of rotation
    \draw[color=myblue] (0,0,0) -- (2, 0, 0) node[above right]{$R$};
    \draw[color=myblue] (0,\y,0) -- (\x, \y, 0) node[above right]{$r_{axis} = R \sin \theta$};

    % axis of rotation
    \draw [color=myred] (0, -2.5, 0) -- (0, 2.5, 0) node[xshift=17, yshift=-10] {$\omega$};
    \pic[color=myred] at (0,2.25,0) {rotarr};

    % Sphere
    \shade[ball color=mygray, opacity=0.4] (O) circle (\R cm);
    \draw[thick] (O) circle (\R cm);

    % outline equator of the sphere (in front)
    \draw[thin] (-\R,0,0) arc (180:360:{\R} and 0.6);
    
    % outline an arbitrary longitude line (in front)
    \draw[thin] (-\x, \y, 0) arc (180:360:{\x} and 0.3);

{% endtikz %}
</center>

<br>

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \sigma \int r_{axis}^2 \; dA \\[10pt]
    &= \sigma \int_{0}^{\pi} \int_{0}^{2 \pi} r_{axis}^2 R^2 \sin \theta \; d\theta \; d\phi \\[10pt]
    &= \sigma \int_{0}^{\pi} \int_{0}^{2 \pi} (R \sin \theta)^2 R^2 \sin \theta \; d\theta \; d\phi \\[10pt]
    &= \sigma R^4 \left ( \int_{0}^{\pi} \sin^3 \theta \; d\theta \right ) \left ( \int_{0}^{2\pi} d \phi \right ) \\[10pt]
    &= \sigma R^4 \left ( \frac{4}{3} \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \sigma \cdot \tfrac{8}{3} \pi R^4 \\[10pt]
    &= \tfrac{2}{3} M R^2
\end{align}
$$


<br>

---

<br>

## Inertia Tensor of a Spherical Shell

$$
I = \begin{bmatrix}
    \frac{2}{3} M R^2 & 0 & 0 \\
    0  & \frac{2}{3} M R^2 & 0 \\
    0  & 0 & \frac{2}{3} M R^2
\end{bmatrix}
= \tfrac{2}{3} M R^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0  & 1 & 0 \\
    0  & 0 & 1
\end{bmatrix}
$$