---
layout:     series
title:      "Parallel Axis Theorem"
date:       2023-09-22
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       21
series:     moments-of-inertia
tags:       moments-of-inertia, parallel-axis
---

Thus far, each of the axes of rotation have been intentionally chosen to pass through the object's center of mass. What if this is not the case? What if we want to rotate the object about another axis? For this, we use the **parallel axis theorem**.

$$
I_{\text{parallel axis}} = I_{\text{central axis}} + Md^2
$$

where $d$ is the shortest distance from the object's center of mass to the new axis of rotation.

<br>

## Proof

Given an arbitrary point, let $r_{\text{central axis}}$ be the distance of that point to the central axis of rotation. Similarly, let $r_{\text{parallel axis}}$ be the distance of that point to the parallel axis of rotation. Let $d$ be the distance between the central axis to the parallel axis. Thus, $d = \abs{r_{\text{central axis}} - r_{\text{parallel axis}}}$. Note that $d$ is constant with respect to the object (and therefore is a constant during integration).

I apologize for using $d$ as a variable in an integral, but it's the standard variable used in the parallel axis theorem.

$$
\begin{align}
    I_{\text{parallel axis}} 
    &= \int r_{\text{parallel axis}}^2 \;dm \\[10pt]
    &= \int (r_{\text{central axis}} - d)^2 \;dm \\[10pt]
    &= \int (r_{\text{central axis}}^2 + d^2 - 2 d r_{\text{central axis}}) \;dm \\[10pt]
    &= \left ( \int r_{\text{central axis}}^2 \;dm \right ) + \left ( \int d^2 \;dm \right ) + \left ( \int 2 d r_{\text{central axis}} \;dm \right ) \\[10pt]
    &= \left ( \int r_{\text{central axis}}^2 \;dm \right ) + \left ( d^2 \int \;dm \right ) + \left (  2 d \int r_{\text{central axis}} \;dm \right ) \\[10pt]
    &= \left ( I_{\text{central axis}} \right ) + \left ( M d^2 \right ) + \left ( 0 \right ) \\[10pt]
    &= I_{\text{central axis}} +  M d^2
\end{align}
$$

<br>

Now, we have to argue why 
$$
\displaystyle
\int r_{\text{central axis}} \;dm = 0
$$.
Essentially this is due to symmetry, since a central axis of rotation (by definition) passes through the center of mass of the object.

<br>

## Example: Thin Rod About Exterior Diameter

<center>
{% tikz thin-rod %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\R{0.1}       % radius of rod
    \def\L{2.5}         % thickness of the rod

    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!70!black}
    \colorlet{mygray}{gray!40}

    % Axis of rotation (part 1)
    \draw [color=myred] (0, 0, -1.5) -- (0, 0, -2.5);

    % Axis of rotation (part 2)
    \draw [color=myred] (0, 0, -1.5) -- (0, 0, 1.75);

    % cylinder outline (behind)
    \draw[dashed, thin] (\R,{-\L/2},0) arc (0:180:{\R} and 0.03);

    % Shading
    \fill[shading=axis, color=mygray, opacity=0.4] (\R, {\L/2}, 0) arc (0:360:{\R} and 0.05) -- cycle;
    \fill[shading=axis, color=mygray, opacity=0.4] (-\R, {-\L/2}, 0) arc (180:360:{\R} and 0.05) -- (\R,{\L/2},0) arc (360:180:{\R} and 0.05) -- cycle;

    % edges
    \draw[thick] (-\R, {-\L/2}, 0) -- (-\R, {\L/2}, 0);
    \draw[thick] (\R, {-\L/2}, 0) -- (\R, {\L/2}, 0);

    % cylinder outline (behind)
    \draw[thick] (\R,{\L/2},0) arc (0:180:{\R} and 0.05);

    % cylinder outline (in front) 
    \draw[thick] (-\R,{\L/2},0) arc (180:360:{\R} and 0.05);
    \draw[thick] (-\R,{-\L/2},0) arc (180:360:{\R} and 0.05);

    % Axis of rotation (part 3)
    \draw [color=myred] (0, 0, 0.1) -- (0, 0, 2.5) node[xshift=17, yshift=-7] {$\omega$};
    \pic[color=myred, rotate around z=-60, rotate around y=20, rotate around x=0] at (-1,0.3,2.5) {rotarr};

    % label the width
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (\R, {\L/2}, 0) -- (\R, {-\L/2}, 0) node [midway, xshift=20]{$L$};
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz thin-rod-parallel-axis %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\R{0.1}       % radius of rod
    \def\L{2.5}         % thickness of the rod

    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!70!black}
    \colorlet{mygray}{gray!40}

    % cylinder outline (behind)
    \draw[dashed, thin] (\R,{-\L/2},0) arc (0:180:{\R} and 0.03);

    % Shading
    \fill[shading=axis, color=mygray, opacity=0.4] (\R, {\L/2}, 0) arc (0:360:{\R} and 0.05) -- cycle;
    \fill[shading=axis, color=mygray, opacity=0.4] (-\R, {-\L/2}, 0) arc (180:360:{\R} and 0.05) -- (\R,{\L/2},0) arc (360:180:{\R} and 0.05) -- cycle;

    % edges
    \draw[thick] (-\R, {-\L/2}, 0) -- (-\R, {\L/2}, 0);
    \draw[thick] (\R, {-\L/2}, 0) -- (\R, {\L/2}, 0);

    % cylinder outline (behind)
    \draw[thick] (\R,{\L/2},0) arc (0:180:{\R} and 0.05);

    % cylinder outline (in front) 
    \draw[thick] (-\R,{\L/2},0) arc (180:360:{\R} and 0.05);
    \draw[thick] (-\R,{-\L/2},0) arc (180:360:{\R} and 0.05);

    % Axis of rotation (part 3)
    \draw [color=myred] (0, {\L/2}, -2.5) -- (0, {\L/2}, 2.5) node[xshift=17, yshift=-7] {$\omega$};
    \pic[color=myred, rotate around z=-60, rotate around y=20, rotate around x=0] at (-2.2,1.2,2.5) {rotarr};

    % label the width
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=3pt},color=myblue] (\R, {\L/2}, 0) -- (\R, {-\L/2}, 0) node [midway, xshift=20]{$L$};
{% endtikz %}
</center>

<br>

We know that a thin rod about its central diameter is $I = \frac{1}{12}ML^2$. Now, if the axis is on its exterior diameter, we can calculate the moment of inertia without using any more integrals. The distance from the center of mass to the new axis of rotation is $d = L/2$.

$$
I = I_{\text{center of mass}} + Md^2 = \frac{1}{12}ML^2 + M(L/2)^2 = \frac{1}{3}ML^2
$$