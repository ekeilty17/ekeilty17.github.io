---
layout:     series
title:      "Spherical Ball"
date:       2023-09-26
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       25
series:     moments-of-inertia
tags:       moments-of-inertia, ball
---

**TODO** I think the axis is supposed to go through the base not the tip...which makes sense

## Parameterizing the Volume

We can do this with just standard spherical coordinates

$$
\b{r}(r, \theta, \phi) =  r \sin \theta \cos \phi \; \u{x} + r \sin \theta \sin \phi \; \u{y} + r \cos \theta \u{z} = r \; \u{r} \\[10pt]
V = \{ \b{r}(r, \theta, \phi) \ : \ 0 \leq r \leq R \quad 0 \leq \theta \leq \pi \quad 0 \leq \phi < 2\pi \}
$$

Therefore

$$
\frac{\partial \b{r}}{\partial r} dr = (\sin \theta \cos \phi \; \u{x} + \sin \theta \sin \phi \; \u{y} + \cos \theta \; \u{z}) dr = dr \; \u{r}
\\[10pt]
\frac{\partial \b{r}}{\partial \theta} d\theta = (r \cos \theta \cos \phi \; \u{x} + r \cos \theta \sin \phi \; \u{y} - r \sin \theta \; \u{z}) d\theta = r \; d\theta \; \u{\theta}
\\[10pt]
\frac{\partial \b{r}}{\partial \phi} d\phi = (- r \sin \theta \sin \phi \; \u{x} + r \sin \theta \cos \phi \; \u{y}) d\phi = r \; \sin \theta \; d\phi \; \u{\phi}
$$

$$
dV = \left \lvert \begin{array}{ccc}
    dr & 0  & 0 \\
    0  & r \; d\theta & 0 \\
    0  & 0  & r \; \sin \theta \; d\phi
\end{array} \right \rvert
= r^2 \sin \theta \; dr \; d\theta \; d\phi
$$

<br>

## Mass

<center>
{% tikz spherical-ball-mass-integral %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,patterns,calc}

    %                  (y, z, x)
    \coordinate (O) at (0, 0, 0);
    \def\R{2}
    \def\r{1.5}
    \def\mytheta{50}
    \def\myphi{65}
    \def\x{ {\r * sin(\mytheta) * cos(\myphi)} }
    \def\y{ {\r * sin(\mytheta) * sin(\myphi)} }
    \def\z{ {\r * cos(\mytheta)} }
    \coordinate (XYZ) at ({\R * sin(\mytheta) * sin(\myphi)}, {\R * cos(\mytheta) }, {\R * sin(\mytheta) * cos(\myphi)});
    \coordinate (xyz) at (\y, \z, \x);
    \coordinate (xy) at (\y, 0, \x);

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
    \draw pic[draw, myblue, ->, pic text=$\phi$, very thick, angle radius={0.5cm}, angle eccentricity=1.7] {angle = X--O--xy};
    \draw pic[draw, myblue, <-, pic text=$\theta$, very thick, angle radius={0.8cm}, angle eccentricity=1.5] {angle = xyz--O--Z};

    % draw drop-down radius from that point
    \draw[dashed] (xyz) -- (xy);
    \draw[dashed] (O) -- (xy);

    % draw arbitrary point on surface of circle
    \draw[color=myblue] (O) -- (xyz) node[midway, xshift=8, yshift=-3] {$r$};
    \draw[color=myblue, fill=myblue] (xyz) circle (0.05);
    \draw[dashed] (xyz) -- (XYZ) node[above, yshift=2] {$R$};
    \draw[color=black, fill=black] (XYZ) circle (0.05);

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
    &= \rho \int \; dV \\[10pt]
    &= \rho \int_{0}^{R} \int_{0}^{\pi} \int_{0}^{2 \pi} r^2 \sin \theta \; dr \; d\theta \; d\phi \\[10pt]
    &= \rho \left ( \int_{0}^{R} r^2 \; dr \right ) \left ( \int_{0}^{\pi} \sin \theta \; d\theta \right ) \left ( \int_{0}^{2 \pi} d\phi \right ) \\[10pt]
    &= \rho \left ( \tfrac{1}{3} R^3 \right ) \left ( 2 \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \rho \cdot \tfrac{4}{3} \pi R^3
\end{align}
$$

<br>

## Moment of Inertia About Any Diameter

<center>
{% tikz spherical-ball-moment-integral %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\r{1.75}
    \def\mytheta{40}
    \def\x{ {\r * cos(\mytheta)} }
    \def\y{ {\r * sin(\mytheta)} }

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
    \draw (O) -- (\x, \y, 0) node[midway, right, xshift=5] {$r$};
    \coordinate (A) at (0, \R, 0);
    \coordinate (B) at (\x, \y, 0);
    \draw pic[draw, myblue, ->, pic text=$\theta$, very thick, angle radius={0.7cm}, angle eccentricity=1.5] {angle = B--O--A};

    % draw radius and radius to axis of rotation
    \draw[color=myblue] (0,0,0) -- (2, 0, 0) node[above right]{$R$};
    \draw[color=myblue] (0,\y,0) -- (\x, \y, 0) node[above right, xshift=9]{$r_{axis} = r \sin \theta$};

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

We use spherical coordinates to evaluate this integral. Since it is a spherical ball, all parameters $r$,$\theta$, and $\phi$ vary. Therefore, $dV = r^2 \sin \theta \; d r \; d \theta \; d \phi$. Also, from the diagram we see that $r_{axis} = r \sin \theta$.

$$
\begin{align}
    I &= \int r_{axis}^2 \; dm \\[10pt]
    &= \rho \int r_{axis}^2 \; dV \\[10pt]
    &= \rho \int_{0}^{R} \int_{0}^{\pi} \int_{0}^{2 \pi} (r \sin \theta)^2 r^2 \sin \theta \; dr \; d\theta \; d\phi \\[10pt]
    &= \rho \left ( \int_{0}^{R} r^4 \; dr \right ) \left ( \int_{0}^{\pi} \sin^3 \theta \; d\theta \right ) \left ( \int_{0}^{2\pi} d \phi \right ) \\[10pt]
    &= \rho \left ( \tfrac{1}{5} R^5 \right ) \left ( \frac{4}{3} \right ) \left ( 2 \pi \right ) \\[10pt]
    &= \rho \cdot \tfrac{8}{15} \pi R^5 \\[10pt]
    &= \tfrac{2}{5} M R^2
\end{align}
$$

<br>

---

<br>

## Inertia Tensor of a Spherical Ball

$$
I = \begin{bmatrix}
    \frac{2}{5} M R^2 & 0 & 0 \\
    0  & \frac{2}{5} M R^2 & 0 \\
    0  & 0 & \frac{2}{5} M R^2
\end{bmatrix}
= \tfrac{2}{5} M R^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0  & 1 & 0 \\
    0  & 0 & 1
\end{bmatrix}
$$