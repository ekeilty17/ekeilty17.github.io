---
layout:     series
title:      "Intermediate Axis Theorem"
date:       2023-09-25
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       24
series:     moments-of-inertia
tags:       moments-of-inertia, intermediate-axis
---

To build some intuition, consider a thin rectangular slab (this could be a thin sheet of wood for example). Now consider the three perpendicular axes shown in the diagram below.

<center>
{% tikz intermediate-axis-theorem %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \def\a{2}
    \def\b{4}
    \def\c{0.25}

    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!70!black}
    \colorlet{mygray}{gray!90}

    % Axes of rotation (part 1)
    \draw [thick, myred] (-3,0,0) -- ({\b/2},0,0);
    \draw [thick, myred] (0,-2,0) -- (0,{\c/2},0);
    \draw [thick, myred] (0,0,-4) -- (0,0,{\a/2});

    % corners
    \coordinate (A) at ({-\b/2}, {-\c/2}, {-\a/2});
    \coordinate (B) at ({-\b/2}, {-\c/2}, {\a/2});
    \coordinate (C) at ({\b/2}, {-\c/2}, {\a/2});
    \coordinate (D) at ({\b/2}, {-\c/2}, {-\a/2});

    \coordinate (E) at ({-\b/2}, {\c/2}, {-\a/2});
    \coordinate (F) at ({-\b/2}, {\c/2}, {\a/2});
    \coordinate (G) at ({\b/2}, {\c/2}, {\a/2});
    \coordinate (H) at ({\b/2}, {\c/2}, {-\a/2});
    
    % edges (part 1)
    \draw[thin, dashed] (D) -- (A) -- (B);
    \draw[thin, dashed] (A) -- (E);

    % surfaces
    \fill[shading=axis, color=mygray] (E) -- (F) -- (G) -- (H) -- cycle;
    \fill[shading=axis, color=mygray] (D) -- (H) -- (G) -- (C) -- cycle;
    \fill[shading=axis, color=mygray] (B) -- (F) -- (G) -- (C) -- cycle;

    % edges (part 2)
    \draw[thick] (B) -- (C) -- (D);
    \draw[thick] (E) -- (F) -- (G) -- (H) -- cycle;
    \draw[thick] (B) -- (F);
    \draw[thick] (C) -- (G);
    \draw[thick] (D) -- (H);

    % Axes of rotation (part 2)
    \draw [thick, myred] ({\b/2},0,0) -- (3,0,0) node[right] {$\omega_2$};
    \draw [thick, myred] (0,{\c/2},0) -- (0,2,0) node[above] {$\omega_1$};
    \draw [thick, myred] (0,0,{\a/2}) -- (0,0,4) node[left] {$\omega_3$};

    % rotation circles
    \pic[color=myred] at (0,1.75,0) {rotarr};
    \pic[color=myred, rotate around z=-60, rotate around y=20, rotate around x=0] at (-1.3,0.3,3.3) {rotarr};
    \pic[color=myred, rotate around z=90, rotate around y=0, rotate around x=0] at (0,-2.5,0) {rotarr};

{% endtikz %}
</center>

Which axis is does the slab most "want" to rotate around? In other words, which axis will produce the least resistance to rotation? You can answer this question empirically. Throw your smartphone in the air, rotating it about each axis. What you will find is that axis $1$ is the easiest to create very quick rotate. Axis $2$ allows rotation, but it's slower than axis $1$. Finally, axis $3$ proves very difficult to achieve pure rotation. You will find the phone almost always does a turn around axis $2$.