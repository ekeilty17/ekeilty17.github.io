---
layout:     series
title:      "Triangle"
date:       2023-09-12
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       11
series:     moments-of-inertia
tags:       moments-of-inertia
---

There are two factors contributing to the lack of elegance in the formulas from this post. First, a generalized triangle is actually extremely asymmetric. As I have solved more and more of these types of problems, I have learned that even the smallest amount of symmetry can really help simplify things. An arbitrary triangle has almost no symmetry. Second, analyzing the boundaries/perimeters of shapes are much more complicated than the surface/interior. This is because the boundary is actually $3$ objects, where the surface is a single continuous object.

In this post, I've tried by best to find a balance between a general solution without it becoming unwieldy.

<!-- While in theory you can find the principal axes of a general triangle by finding its eigenvalues, I have yet to derive a formula that isn't the ugliest thing you've ever seen. If you can find a nice formulation, please <a href="mailto:epkeilty@gmail.com">let me know</a>. -->

<!-- https://brilliant.org/wiki/apollonius-theorem/ -->

<br>

## Parameterizing the Curve {#parameterization}

<center>
{% tikz triangle-curve %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (Y) at (0, 3, 0);
    \coordinate (Z) at (0, 0, 3);

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    % Particular definitions
    \def\pointradius{0.05}
    \coordinate (A) at (\xa, \ya, 0);
    \coordinate (B) at (\xb, \yb, 0);
    \coordinate (C) at (\xc, \yc, 0);
    \def\a{sqrt((\xb-\xc)*(\xb-\xc) + (\yb-\yc)*(\yb-\yc))}
    \def\b{sqrt((\xc-\xa)*(\xc-\xa) + (\yc-\ya)*(\yc-\ya))}
    \def\c{sqrt((\xa-\xb)*(\xa-\xb) + (\ya-\yb)*(\ya-\yb))}
    \def\P{\a + \b + \c}
    \coordinate (ma) at ({(\xb + \xc)/2}, {(\yb + \yc)/2}, 0);
    \coordinate (mb) at ({(\xc + \xa)/2}, {(\yc + \ya)/2}, 0);
    \coordinate (mc) at ({(\xa + \xb)/2}, {(\ya + \yb)/2}, 0);
    \coordinate (S) at ({(\a*(\xb + \xc)/2 + \b*(\xc + \xa)/2 + \c*(\xa + \xb)/2) / (\P)}, {(\a*(\yb + \yc)/2 + \b*(\yc + \ya)/2 + \c*(\ya + \yb)/2) / (\P)}, 0);

    %=============================================================

    % Axis (part 1)
    \draw [thick, -{Stealth}] (O) -- ($(S)+(X)$) node[anchor=north east]{$x$};
    \draw [thick, -{Stealth}] (O) -- ($(S)+(Y)$) node[anchor=north west]{$y$};

    % triangle (part 1)
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, above, xshift=0, yshift=0] {$\color{black}{\ell_2}$};

    % Axes (part 2)
    \draw [thick, -{Stealth}] (O) -- (Z) node[anchor=north west]{$z$};

    % triangle (part 2)
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, below, xshift=15, yshift=0] {$\color{black}{\ell_1}$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, right, xshift=0, yshift=0] {$\color{black}{\ell_3}$};

\end{scope}
{% endtikz %}
</center>

The triangle is comprised of three line segments. Therefore, we do not need to paramaterize the curve. Instead, we can use the extensive analysis on lines in the $xy$ plane from the [previous post](/blog/moments-of-inertia/lines-special-cases#general). Therefore, I could end the post here, and simply write that.

$$
\m{I} = \m{I_{\ell_1}} + \m{I_{\ell_2}} + \m{I_{\ell_3}}
$$

However, let's see if we can simplify this any further. Spoiler alert: not by much. 

### Deconstructing a Triangle

Before we calculate moments of inertia, let's define the parts of the triangle in rigorous notation. Consider the below figures. Let $\b{A}$, $\b{B}$, and $\b{C}$ denote the angles/vertices of the triangle and let $\b{a}$, $\b{b}$, and $\b{c}$ denote the coorsponding side lengths.

<center>
{% tikz triangle-general-angles-and-sides %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{3}
    \def\yc{-3}

    % Particular definitions
    \def\pointradius{0.05}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \def\a{sqrt((\xb-\xc)*(\xb-\xc) + (\yb-\yc)*(\yb-\yc))}
    \def\b{sqrt((\xc-\xa)*(\xc-\xa) + (\yc-\ya)*(\yc-\ya))}
    \def\c{sqrt((\xa-\xb)*(\xa-\xb) + (\ya-\yb)*(\ya-\yb))}
    \def\P{\a + \b + \c}
    \coordinate (ma) at ({(\xb + \xc)/2}, {(\yb + \yc)/2});
    \coordinate (mb) at ({(\xc + \xa)/2}, {(\yc + \ya)/2});
    \coordinate (mc) at ({(\xa + \xb)/2}, {(\ya + \yb)/2});
    \coordinate (S) at ({(\a*(\xb + \xc)/2 + \b*(\xc + \xa)/2 + \c*(\xa + \xb)/2) / (\P)}, {(\a*(\yb + \yc)/2 + \b*(\yc + \ya)/2 + \c*(\ya + \yb)/2) / (\P)});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(S)-(X)$) -- ($(S)+(X)$) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(S)-(Y)$) -- ($(S)+(Y)$) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=0, yshift=0] {$b$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, above, xshift=0, yshift=0] {$c$};

    % vertices
    \node[left] at (A) {$A$};
    \node[above] at (B) {$B$};
    \node[below] at (C) {$C$};

{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle-general-vectors %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{3}
    \def\yc{-3}

    % Particular definitions
    \def\pointradius{0.05}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \def\a{sqrt((\xb-\xc)*(\xb-\xc) + (\yb-\yc)*(\yb-\yc))}
    \def\b{sqrt((\xc-\xa)*(\xc-\xa) + (\yc-\ya)*(\yc-\ya))}
    \def\c{sqrt((\xa-\xb)*(\xa-\xb) + (\ya-\yb)*(\ya-\yb))}
    \def\P{\a + \b + \c}
    \coordinate (ma) at ({(\xb + \xc)/2}, {(\yb + \yc)/2});
    \coordinate (mb) at ({(\xc + \xa)/2}, {(\yc + \ya)/2});
    \coordinate (mc) at ({(\xa + \xb)/2}, {(\ya + \yb)/2});
    \coordinate (S) at ({(\a*(\xb + \xc)/2 + \b*(\xc + \xa)/2 + \c*(\xa + \xb)/2) / (\P)}, {(\a*(\yb + \yc)/2 + \b*(\yc + \ya)/2 + \c*(\ya + \yb)/2) / (\P)});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(S)-(X)$) -- ($(S)+(X)$) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(S)-(Y)$) -- ($(S)+(Y)$) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, {Stealth}-, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=0] {$\boldsymbol{a}$};
    \draw [ultra thick, {Stealth}-, color=paramColor] (C) -- (A) node[midway, below, xshift=0, yshift=0] {$\boldsymbol{b}$};
    \draw [ultra thick, {Stealth}-, color=paramColor] (A) -- (B) node[midway, above, xshift=0, yshift=0] {$\boldsymbol{c}$};

    % vertices
    \draw [very thick, -{Stealth}] (S) -- (A) node[left, xshift=0, yshift=0] {$\boldsymbol{A}$};
    \draw [very thick, -{Stealth}] (S) -- (B) node[above, xshift=0, yshift=0] {$\boldsymbol{B}$};
    \draw [very thick, -{Stealth}] (S) -- (C) node[below, xshift=0, yshift=0] {$\boldsymbol{C}$};

{% endtikz %}
</center>

It is standard notation to label the length of the opposite edges of the angle with the lowercase letter, as shown in the above diagrams. We define the coordiantes of $\b{A}$, $\b{B}$, $\b{C}$, $\b{a}$, $\b{b}$, and $\b{c}$ as follows.

$$
\begin{align}
    &\b{A} = x_A \; \u{x} + y_A \; \u{y}
    &\qquad\qquad
    &\b{a} = a_x \; \u{x} + a_y \; \u{y}
    \\[10pt]
    &\b{B} = x_B \; \u{x} + y_B \; \u{y}
    &\qquad\qquad
    &\b{b} = b_x \; \u{x} + b_y \; \u{y}
    \\[10pt]
    &\b{C} = x_C \; \u{x} + y_C \; \u{y}
    &\qquad\qquad
    &\b{c} = c_x \; \u{x} + c_y \; \u{y}
    \\[10pt]
\end{align}
$$

Given the vertices, we can derivate the values of the side lengths.

$$
\begin{align}
    &\b{a} = \b{B} - \b{C}
    &\implies\qquad
    &a_x = x_B - x_C
    &
    &a_y = y_B - y_C
    \\[10pt]
    &\b{b} = \b{C} - \b{A}
    &\implies\qquad
    &b_x = x_C - x_A
    &
    &b_y = y_C - y_A
    \\[10pt]
    &\b{c} = \b{A} - \b{B}
    &\implies\qquad
    &c_x = x_A - x_B
    &
    &c_y = y_A - y_B
\end{align}
$$

In general, we cannot write the coordinates of the vertices in terms of the side vectors. This is because of the triangle would not change the side vectors but would change the position of the coordinates. However, we are going to assume the triangle is located at its center of mass, in which case we could, in theory, reconstruct the vertices.

<br>

## Mass {#mass}

The mass of the triangle is simply the mass of each individual line segment.

$$
M = M_a + M_b + M_c = \lambda a + \lambda b + \lambda c = \lambda \cdot (a + b + c)
$$

<br>

## Center of Mass {#center-of-mass}

Using the results from the previous post, we know the center of mass of each side of the triangle is given by the following.

$$
\overline{\b{r}}_{a} = \frac{\b{B} + \b{C}}{2} = \frac{x_B + x_C}{2} \; \u{x} + \frac{y_B + y_C}{2} \; \u{y}
\\[10pt]
\overline{\b{r}}_{b} = \frac{\b{C} + \b{A}}{2} = \frac{x_C + x_A}{2} \; \u{x} + \frac{y_C + y_A}{2} \; \u{y}
\\[10pt]
\overline{\b{r}}_{c} = \frac{\b{A} + \b{B}}{2} = \frac{x_A + x_B}{2} \; \u{x} + \frac{y_A + y_B}{2} \; \u{y}
$$

Therefore, to find the total center of mass, we just take the weighted average of each line.

$$
\begin{align}
    \overline{\b{r}} &= \frac{M_a \overline{\b{r}}_{a} + M_b \overline{\b{r}}_{b} + M_c \overline{\b{r}}_{c}}{M} 
    \\[10pt]
    &= \left ( \frac{a(x_B + x_C) + b(x_C + x_A) + c(x_A + x_B)}{2(a+b+c)} \right ) \; \u{x} + \left ( \frac{a(y_B + y_C) + b(y_C + y_A) + c(y_A + y_B)}{2(a+b+c)} \right ) \; \u{y}
\end{align}
$$

In this post, we are going to assume the center of mass of the triangle is at the origin. Therefore, we have the following properties.

$$
a(x_B + x_C) + b(x_C + x_A) + c(x_A + x_B) = 0
\qquad\qquad
a(y_B + y_C) + b(y_C + y_A) + c(y_A + y_B) = 0
$$

<br>

### The Spieker Center

The center of mass of the boundary of a triangle is called the [Spieker center](https://en.wikipedia.org/wiki/Spieker_center).

<!-- https://proofwiki.org/wiki/Length_of_Angle_Bisector -->
<!-- https://mathvox.com/geometry/triangles/chapter-8-the-angle-bisector-of-a-triangle/the-distance-from-the-vertex-to-the-incenter-formula-1/ -->

<center>
{% tikz triangle-general-median-incenter %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{3}
    \def\yc{-3}

    % Particular definitions
    \def\pointradius{0.05}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \def\a{sqrt((\xb-\xc)*(\xb-\xc) + (\yb-\yc)*(\yb-\yc))}
    \def\b{sqrt((\xc-\xa)*(\xc-\xa) + (\yc-\ya)*(\yc-\ya))}
    \def\c{sqrt((\xa-\xb)*(\xa-\xb) + (\ya-\yb)*(\ya-\yb))}
    \def\P{\a + \b + \c}
    \def\Area{sqrt((\a+\b+\c)*(-\a+\b+\c)*(\a-\b+\c)*(\a+\b-\c))/4}
    \coordinate (ma) at ({(\xb + \xc)/2}, {(\yb + \yc)/2});
    \coordinate (mb) at ({(\xc + \xa)/2}, {(\yc + \ya)/2});
    \coordinate (mc) at ({(\xa + \xb)/2}, {(\ya + \yb)/2});
    \coordinate (S) at ({(\a*(\xb + \xc)/2 + \b*(\xc + \xa)/2 + \c*(\xa + \xb)/2) / (\P)}, {(\a*(\yb + \yc)/2 + \b*(\yc + \ya)/2 + \c*(\ya + \yb)/2) / (\P)});
    \def\incenterradius{(\Area) / (\P)}

    %=============================================================

    % Axis
    %\draw [thick, {Stealth}-{Stealth}] ($(S)-(X)$) -- ($(S)+(X)$) node[anchor=north east]{$x$};
    %\draw [thick, {Stealth}-{Stealth}] ($(S)-(Y)$) -- ($(S)+(Y)$) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=5, yshift=5] {$a$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=-5, yshift=-5] {$b$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, above, xshift=-5, yshift=5] {$c$};

    % vertices
    \node[left] at (A) {$A$};
    \node[above] at (B) {$B$};
    \node[below] at (C) {$C$};

    % medians
    \draw [color=black, fill=black] (ma) circle (\pointradius) node[right, xshift=5, yshift=0] {$$};
    \draw [color=black, fill=black] (mb) circle (\pointradius) node[below, xshift=0, yshift=-5] {$$};
    \draw [color=black, fill=black] (mc) circle (\pointradius) node[above, xshift=-3, yshift=2] {$$};

    % triangle
    \draw [thick] (mb) -- (mc) node[midway, below, left, xshift=0, yshift=-2] {$a/2$};
    \draw [thick] (mc) -- (ma) node[midway, above, xshift=3, yshift=0] {$b/2$};
    \draw [thick] (ma) -- (mb) node[midway, below, right, xshift=0, yshift=-8] {$c/2$};

    % incenter circle
    \draw [color=myred] (S) circle (\incenterradius) node[right, xshift=5, yshift=0] {$$};

    % Spieker Center
    \draw [color=myred, fill=myred] (S) circle (\pointradius) node[above, right, xshift=0, yshift=10] {$S$};

{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle-general-median-bisectors %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{3}
    \def\yc{-3}

    % Particular definitions
    \def\pointradius{0.05}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \def\a{sqrt((\xb-\xc)*(\xb-\xc) + (\yb-\yc)*(\yb-\yc))}
    \def\b{sqrt((\xc-\xa)*(\xc-\xa) + (\yc-\ya)*(\yc-\ya))}
    \def\c{sqrt((\xa-\xb)*(\xa-\xb) + (\ya-\yb)*(\ya-\yb))}
    \def\P{\a + \b + \c}
    \def\Area{sqrt((\a+\b+\c)*(-\a+\b+\c)*(\a-\b+\c)*(\a+\b-\c))/4}
    \coordinate (ma) at ({(\xb + \xc)/2}, {(\yb + \yc)/2});
    \coordinate (mb) at ({(\xc + \xa)/2}, {(\yc + \ya)/2});
    \coordinate (mc) at ({(\xa + \xb)/2}, {(\ya + \yb)/2});
    \coordinate (S) at ({(\a*(\xb + \xc)/2 + \b*(\xc + \xa)/2 + \c*(\xa + \xb)/2) / (\P)}, {(\a*(\yb + \yc)/2 + \b*(\yc + \ya)/2 + \c*(\ya + \yb)/2) / (\P)});
    \def\incenterradius{(\Area) / (\P)}

    %=============================================================

    % Axis
    %\draw [thick, {Stealth}-{Stealth}] ($(S)-(X)$) -- ($(S)+(X)$) node[anchor=north east]{$x$};
    %\draw [thick, {Stealth}-{Stealth}] ($(S)-(Y)$) -- ($(S)+(Y)$) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=0] {$$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=0, yshift=0] {$$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, above, xshift=0, yshift=0] {$$};

    % vertices
    \node[left] at (A) {$A$};
    \node[above] at (B) {$B$};
    \node[below] at (C) {$C$};

    % medians
    \draw [color=black, fill=black] (ma) circle (\pointradius) node[right, xshift=5, yshift=0] {$E$};
    \draw [color=black, fill=black] (mb) circle (\pointradius) node[below, xshift=0, yshift=-5] {$F$};
    \draw [color=black, fill=black] (mc) circle (\pointradius) node[above, xshift=-3, yshift=2] {$G$};

    % triangle
    \draw [thick] (mb) -- (mc) node[midway, xshift=0, yshift=0] {$$};
    \draw [thick] (mc) -- (ma) node[midway, xshift=0, yshift=0] {$$};
    \draw [thick] (ma) -- (mb) node[midway, xshift=0, yshift=0] {$$};

    % median triangle angle bisectors
    \draw [thick, color=myred] (S) -- (ma) node[midway, xshift=0, yshift=0] {$$};
    \draw [thick, color=myred] (S) -- (mb) node[midway, xshift=0, yshift=0] {$$};
    \draw [thick, color=myred] (S) -- (mc) node[midway, xshift=0, yshift=0] {$$};

    % Spieker Center
    \draw [color=myred, fill=myred] (S) circle (\pointradius) node[above, right, xshift=0, yshift=10] {$S$};

{% endtikz %}
</center>

It has some really nice properties, which I am going to assert without proof.

1. The Spieker center of $\triangle ABC$ is the **incenter** of the median triangle $\triangle EFG$.
2. The median triangle is similar to the original triangle, i.e. $\triangle EFG \sim \triangle ABC$, scaled by a factor of $\tfrac{1}{2}$.
3. The the **angle bisectors** of the median triangle $\triangle EFG$ are the lines $\overline{ES}$, $\overline{FS}$, and $\overline{GS}$.
4. All four subtriangles craeted by connecting the medians are congruent, i.e. $\triangle EFG \cong \triangle AGF \cong \triangle GBE \cong \triangle FEC$.

<br>

---

<br>

## Notes

$$
\begin{align}
    I_{xx} = &\left ( \tfrac{1}{12} M_a a_y^2 + M_a \overline{r}_{a, y}^2 \right ) + \left ( \tfrac{1}{12} M_b b_y^2 + M_b \overline{r}_{b, y}^2 \right ) + \left ( \tfrac{1}{12} M_c c_y^2 + M_c \overline{r}_{c, y}^2 \right ) \\[10pt]
    &= \tfrac{1}{12} \left [ a \left ( y_B - y_C \right )^2 + b\left ( y_C - y_A \right )^2 + c\left ( y_A - y_B \right )^2 \right ] + \left [ a \left ( \frac{y_B + y_C}{2} \right )^2 + b \left ( \frac{y_C + y_A}{2} \right )^2 + c \left ( \frac{y_A + y_B}{2} \right )^2 \right ] \\[10pt]
    &= \tfrac{1}{12} \left ( a \left [ (y_B - y_C)^2 + 3(y_B + y_C)^2 \right ] + b \left [ (y_C - y_A)^2 + 3(y_C + y_A)^2 \right ] + c \left [ (y_A - y_B)^2 + 3(y_A + y_B)^2 \right ] \right ) \\[10pt]
    &= \tfrac{1}{12} \left ( a \left [ 4y_B^2 + 4y_C^2 + 4y_B y_C \right ] + b \left [ 4y_C^2 + 4y_A^2 + 4y_C y_A \right ] + c \left [ 4y_A^2 + 4y_B^2 + 4y_A y_B \right ] \right ) \\[10pt]
    &= \tfrac{1}{3} \left ( a \left [ y_B^2 + y_C^2 + y_B y_C \right ] + b \left [ y_C^2 + y_A^2 + y_C y_A \right ] + c \left [ y_A^2 + y_B^2 + y_A y_B \right ] \right ) \\[10pt]
    &= \tfrac{1}{3} \left [ a \left ( \frac{y_B^3 - y_C^3}{y_B - y_C} \right ) + b \left ( \frac{y_C^3 - y_A^3}{y_C - y_A} \right ) + c \left ( \frac{y_A^3 - y_B^3}{y_A - y_B} \right ) \right ]
\end{align}
$$

I don't like this

$$
\begin{align}
    I_{xx} = &\left ( \tfrac{1}{12} M_a a_y^2 + M_a \overline{r}_{a, y}^2 \right ) + \left ( \tfrac{1}{12} M_b b_y^2 + M_b \overline{r}_{b, y}^2 \right ) + \left ( \tfrac{1}{12} M_c c_y^2 + M_c \overline{r}_{c, y}^2 \right ) \\[10pt]
    &= \tfrac{1}{12} \left ( a a_y^2 + b b_y^2 + c c_y^2 \right ] + \left [ a \left ( \frac{y_B + y_C}{2} \right )^2 + b \left ( \frac{y_C + y_A}{2} \right )^2 + c \left ( \frac{y_A + y_B}{2} \right )^2 \right ) \\[10pt]
    &= \tfrac{1}{12} \left [ a a_y^2 + b b_y^2 + c c_y^2 \right ] + \tfrac{1}{4} \left [ a \left ( y_B + y_C \right )^2 + b \left ( y_C + y_A \right )^2 + c \left ( y_A + y_B \right )^2 \right ] \\[10pt]
\end{align}
$$

<br>

---

<br>

$$
\b{m_a} = \frac{\b{B} + \b{C}}{2} = \frac{x_b + x_c}{2} \; \u{x} + \frac{y_b + y_c}{2} \; \u{y}
\\[10pt]
\b{m_b} = \frac{\b{C} + \b{A}}{2} = \frac{x_c + x_a}{2} \; \u{x} + \frac{y_c + y_a}{2} \; \u{y}
\\[10pt]
\b{m_c} = \frac{\b{A} + \b{B}}{2} = \frac{x_a + x_b}{2} \; \u{x} + \frac{y_a + y_b}{2} \; \u{y}
$$

$$
\b{S} = \frac{M_a \b{m_a} + M_b \b{m_b} + M_c \b{m_c}}{M} = \left ( \frac{a(x_b + x_c) + b(x_c + x_a) + c(x_a + x_b)}{2(a+b+c)} \right ) \; \u{x} + \left ( \frac{a(y_b + y_c) + b(y_c + y_a) + c(y_a + y_b)}{2(a+b+c)} \right ) \; \u{y}
$$

So we have this mini-triagle half the size of the original. The height of the angle bisector is given by the following, the proof is [here](https://proofwiki.org/wiki/Length_of_Angle_Bisector).

$$
h_A^2 = \frac{bc (a + b + c) (-a + b + c)}{(b+c)^2} 
\qquad
h_B^2 = \frac{ca (a + b + c) (a - b + c)}{(c+a)^2} 
\qquad
h_C^2 = \frac{ab (a + b + c) (a + b - c)}{(a+b)^2}
$$

Now, we know that the median triangle is just the original triangle but scaled down by a factor of $2$. Therefore

$$
h_{m_a}^2 = \frac{bc (a + b + c) (-a + b + c)}{4(b+c)^2} 
\qquad
h_{m_b}^2 = \frac{ca (a + b + c) (a - b + c)}{4(c+a)^2} 
\qquad
h_{m_c}^2 = \frac{ab (a + b + c) (a + b - c)}{4(a+b)^2}
$$

But we actually don't care about the length of the disector, we care about the distance $D_a$, etc. From [here](https://mathvox.com/geometry/triangles/chapter-8-the-angle-bisector-of-a-triangle/the-distance-from-the-vertex-to-the-incenter-formula-1/) (**TODO** get better source...I'm not sure if I believe it tbh) we know that

$$
D_a = \left ( \frac{b + c}{a + b + c} \right ) h_{m_a}
\qquad
D_b = \left ( \frac{c + a}{a + b + c} \right ) h_{m_b}
\qquad
D_c = \left ( \frac{a + b}{a + b + c} \right ) h_{m_c}
$$

Substituting in the above

$$
D_a^2 = \frac{bc (-a + b + c)}{4(a+b+c)} 
\qquad
D_b^2 = \frac{ca (a - b + c)}{4(a+b+c)} 
\qquad
D_c^2 = \frac{ab (a + b - c)}{4(a+b+c)} 
$$

Therefore

$$
I_{zz} = \tfrac{1}{12}(a^3 + b^3 + c^3) + \tfrac{1}{4} \left ( \frac{abc}{a+b+c} \right ) (a + b + c) = \tfrac{1}{12} ( a^3 + b^3 + c^3 + 3abc )
$$

<br>

## Moment of Inertia About Central Axis {#central-axis}

Suppose we have a general triangle whose [centroid](https://en.wikipedia.org/wiki/Centroid) is at the origin. Let $a$, $b$, $c$ denote its side lengths and $A$, $B$, $C$ denote the cooresponding vertices.

<center>
{% tikz triangle-general-3D %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (Y) at (0, 3, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \coordinate (AORend) at (0, 0, -1);
    \coordinate (AORstart) at (0, 0, 2.5);
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya, 0);
    \coordinate (B) at (\xb, \yb, 0);
    \coordinate (C) at (\xc, \yc, 0);

    %=============================================================

    % Axis (part 1)
    \draw [thick, -{Stealth}] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, -{Stealth}] (O) -- (Y) node[anchor=north west]{$y$};

    % triangle (part 1)
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, above, xshift=0, yshift=0] {$b$};

    % Axes (part 2)
    \draw [thick, -{Stealth}] (O) -- (Z) node[anchor=north west]{$z$};

    % Axis of rotate
    \draw [color=myred] (AORstart) -- (AORend);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-3] {$\omega$};

    % triangle (part 2)
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, below, xshift=15, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, right, xshift=0, yshift=0] {$c$};

    % vertices
    \node[above, color=paramColor] at (A) {$A$};
    \node[below, color=paramColor] at (B) {$B$};
    \node[left, color=paramColor] at (C) {$C$};

    % node just for spacing
    \node at (0, 0, -3) {$$};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle-general-2D %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Axis of rotation
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=0, yshift=0] {$b$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, above, xshift=0, yshift=0] {$c$};

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

    % rotation arrow
    \draw[very thick, color=myred, fill=myred] (O) circle (0.05);
    \draw[rotarrow, rotate around z=-30] ($(O) - (0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=28, yshift=-12] {$\omega$};

{% endtikz %}
</center>

As stated above, to find the moment of inertia of this triangle, we just sum the contributions of each individual line segment.

$$
\begin{align}
    I_{zz} 
    &= I_{a, zz} + I_{b, zz} + I_{c, zz} 
    = \left ( \tfrac{1}{12} M_a a^2 + M_a D_a^2 \right ) + \left ( \tfrac{1}{12} M_b b^2 + M_b D_b^2 \right ) + \left ( \tfrac{1}{12} M_c c^2 + M_c D_c^2 \right )
\end{align}
$$

Finding the values of $D_a$, $D_b$, and $D_c$ is not trivial. It will require some nice results from geometry. Let $m_{a}$, $m_{b}$, and $m_{c}$ be the lengths of the [medians](https://en.wikipedia.org/wiki/Median_(geometry)#:~:text=In%20geometry%2C%20a%20median%20of,other%20at%20the%20triangle's%20centroid.) of the triangle.

<!-- I am going to skim over some details but will provide a complete proof inthe [appendix](#appendix) at the end of the post.  -->


<br>

<center>
{% tikz triangle-general-cm-distance %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \coordinate (ma) at ({(\xb+\xc)/2}, {(\yb+\yc)/2});
    \coordinate (mb) at ({(\xc+\xa)/2}, {(\yc+\ya)/2});
    \coordinate (mc) at ({(\xa+\xb)/2}, {(\ya+\yb)/2});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % midlines / medians
    \draw [very thick] (O) -- (ma) node[right, xshift=0, yshift=0] {$D_a$};
    \draw [very thick] (O) -- (mb) node[below, xshift=0, yshift=0] {$D_b$};
    \draw [very thick] (O) -- (mc) node[above, xshift=0, yshift=0] {$D_c$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C);
    \draw [ultra thick, color=paramColor] (C) -- (A);
    \draw [ultra thick, color=paramColor] (A) -- (B);

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle-general-midlines %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);
    \coordinate (ma) at ({(\xb+\xc)/2}, {(\yb+\yc)/2});
    \coordinate (mb) at ({(\xc+\xa)/2}, {(\yc+\ya)/2});
    \coordinate (mc) at ({(\xa+\xb)/2}, {(\ya+\yb)/2});

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % midlines / medians
    \draw [very thick] (A) -- (ma) node[right, xshift=0, yshift=0] {$m_a$};
    \draw [very thick] (B) -- (mb) node[below, xshift=0, yshift=0] {$m_b$};
    \draw [very thick] (C) -- (mc) node[above, xshift=0, yshift=0] {$m_c$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C);
    \draw [ultra thick, color=paramColor] (C) -- (A);
    \draw [ultra thick, color=paramColor] (A) -- (B);

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

{% endtikz %}
</center>


The lengths of the median lines can be expressed in terms of the side lengths of the triangle using [Apollonius' Theorem](https://brilliant.org/wiki/apollonius-theorem/).

$$
m_{a} = \tfrac{1}{2} \sqrt{2b^2 + 2c^2 - a^2}
\qquad
m_{b} = \tfrac{1}{2} \sqrt{2c^2 + 2a^2 - b^2}
\qquad
m_{c} = \tfrac{1}{2} \sqrt{2a^2 + 2b^2 - c^2}
$$

Then, the [Centroid Theorem](https://new.math.uiuc.edu/public403/affine/centroid.html) says that the centroid of a triangle divides each median into segments with a ratio of $2{:}1$. In other words, we arrive at the following final expression 

$$
D_a = \tfrac{1}{3} m_a = \tfrac{1}{6} \sqrt{2b^2 + 2c^2 - a^2}
\qquad
D_b = \tfrac{1}{3} m_b = \tfrac{1}{6} \sqrt{2c^2 + 2a^2 - b^2}
\qquad
D_c = \tfrac{1}{3} m_c = \tfrac{1}{6} \sqrt{2a^2 + 2b^2 - c^2}
$$

Now we can express everything in terms of the side lengths of the triangle. Note that I am analyzing $\tfrac{1}{\lambda} I_{zz}$ so that I don't have to include the $\lambda$ term.

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz}
    &= \left [ \tfrac{1}{12} a^3 + \tfrac{1}{36} a (2b^2 + 2c^2 - a^2) \right ] + \left [ \tfrac{1}{12} b^3 + \tfrac{1}{36} b (2c^2 + 2a^2 - b^2) \right ] + \left [ \tfrac{1}{12} c^3 + \tfrac{1}{36} c (2a^2 + 2b^2 - c^2) \right ] \\[10pt]
    &= \tfrac{1}{12} (a^3 + b^3 + c^3) + \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2 - 3a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2 - 3b^3) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2 - 3c^2) \\[10pt]
    &= \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2) \\[10pt]
    &= \tfrac{1}{18} (a + b + c) (a^2 + b^2 + c^2)
\end{align}
$$

Recall that the total mass of the triangle is $M = \lambda \cdot (a + b + c)$. Therefore

$$
I_{zz} = \tfrac{1}{18} M (a^2 + b^2 + c^2)
$$

This is a really elegant result that I've never seen anywhere else before, so that's pretty cool.

<br>

## Inertia Tensor {#inertia-tensor}

We can calculate the entire inertia tensor, however it's not nearly as elegant. A general triangle has so much asymmetry, that we shouldn't expect it to be a nice formula. Below is the nicest form that I could get write everything, but if you find something better then please <a href="mailto:epkeilty@gmail.com">let me know</a>.

First, we need some extra definitions because $I_{xx}$, $I_{yy}$, and $I_{xy}$ cannot only be determined by the side lengths of the triangle. We have to encode information about orientation. There is probably a way to do this with angles (feel free to experiment for yourself), but I did it just with coordiantes and lengths. Consider the following definitions.

<center>
{% tikz triangle-general-2D-vectors %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 3);

    % Axis of rotation
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}
    
    % Curve Parameters
    \def\xa{-3}
    \def\ya{0.5}
    \def\xb{1}
    \def\yb{1.5}
    \def\xc{2}
    \def\yc{-2}

    % Particular definitions
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(Y)$) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, {Stealth}-, color=paramColor] (B) -- (C) node[midway, right, xshift=0, yshift=25] {$\boldsymbol{a} = a_x \; \hat{\boldsymbol{x}} + a_y \; \hat{\boldsymbol{y}}$};
    \draw [ultra thick, {Stealth}-, color=paramColor] (C) -- (A) node[midway, below, xshift=-40, yshift=-10] {$\boldsymbol{b} = b_x \; \hat{\boldsymbol{x}} + b_y \; \hat{\boldsymbol{y}}$};
    \draw [ultra thick, {Stealth}-, color=paramColor] (A) -- (B) node[midway, above, xshift=-30, yshift=10] {$\boldsymbol{c} = c_x \; \hat{\boldsymbol{x}} + c_y \; \hat{\boldsymbol{y}}$};

    % vertices
    \draw[very thick, -{Stealth}] (O) -- (A) node[left] {$\boldsymbol{A} = x_A \; \hat{\boldsymbol{x}} + y_B \; \hat{\boldsymbol{y}} $};
    \draw[very thick, -{Stealth}] (O) -- (B) node[above, xshift=30] {$\boldsymbol{B} = x_B \; \hat{\boldsymbol{x}} + y_B \; \hat{\boldsymbol{y}}$};
    \draw[very thick, -{Stealth}] (O) -- (C) node[below] {$\boldsymbol{C} = x_C \; \hat{\boldsymbol{x}} + y_C \; \hat{\boldsymbol{y}}$};

{% endtikz %}
</center>

<!-- $$
\begin{align}
    &\b{a} = a_x \; \u{x} + a_y \; \u{y}
    &\qquad
    &\b{A} = x_A \; \u{x} + y_A \; \u{y}
    \\[10pt]
    &\b{b} = b_x \; \u{x} + b_y \; \u{y}
    &\qquad
    &\b{B} = x_B \; \u{x} + y_B \; \u{y}
    \\[10pt]
    &\b{c} = c_x \; \u{x} + c_y \; \u{y}
    &\qquad
    &\b{C} = x_C \; \u{x} + y_C \; \u{y}
\end{align}
$$ -->

It's a bit redundant to use both. We could only use the values of the vertices $\b{A}$, $\b{B}$, and $\b{C}$, but including side lengths $\b{a}$, $\b{b}$, and $\b{c}$ shortens the formulas up a bit. From the diagram above, we can see an easy way to express the side lengths in terms of the vertices.

$$
\begin{align}
    &\b{a} = \b{B} - \b{C}
    &\implies\qquad
    &a_x = x_B - x_C
    &
    &a_y = y_B - y_C
    \\[10pt]
    &\b{b} = \b{C} - \b{A}
    &\implies\qquad
    &b_x = x_C - x_A
    &
    &b_y = y_C - y_A
    \\[10pt]
    &\b{c} = \b{A} - \b{B}
    &\implies\qquad
    &c_x = x_A - x_B
    &
    &c_y = y_A - y_B
\end{align}
$$

Note that you actually cannot go in the other direction. Just knowing the side lengths does not tell you the coordinates of the vertices. Intuitively, this is because rotating a triangle does not change the side lengths but does change the position of the vertices.

Now, we are ready to write the general inertia tensor for a triangle in the $xy$ plane.

$$
\m{I} = 
\begin{bmatrix}
    I_{xx} & -I_{xy} & 0 \\
    -I_{xy} & I_{yy} & 0 \\
    0 & 0 & I_{zz}
\end{bmatrix}
$$

where

$$
\begin{align}
    \tfrac{1}{\lambda} I_{xx} &= \tfrac{1}{3}(aa_y^2 + bb_y^2 + cc_y^2) + ay_b y_c + by_c y_a + cy_a y_b \\[10pt]
    \tfrac{1}{\lambda} I_{yy} &= \tfrac{1}{3}(aa_x^2 + bb_x^2 + cc_x^2) + ax_b x_c + bx_c x_a + cx_a x_b \\[10pt]
    \tfrac{1}{\lambda} I_{zz} &= \tfrac{1}{18} (a + b + c) (a^2 + b^2 + c^2) \\[10pt]
    \tfrac{1}{\lambda} I_{xy} &= \tfrac{1}{3} (a a_x a_y + b b_x b_y + c c_x c_y) - \tfrac{1}{2} \left ( x_a y_a + x_b y_b + x_c y_c \right )
\end{align}
$$

When calculating $I_{xy}$ be careful about the signs of $a_x$, $a_y$, $b_x$, $b_y$, $c_x$, and $c_y$. You just have to make sure you measure them consistently.

In theory, we could find the principal axes using standard eigenvector analysis. Doing this in general gives the following.

$$
I'_{xx}, I'_{yy} = \tfrac{1}{2} I_{zz} \pm \sqrt{ \left ( \frac{I_{xx} - I_{yy}}{2} \right )^2 + I_{xy}^2 }
$$

Best of luck to anyone who attempts to substitute the values in and simplify. I tried for about $10$ seconds until I realized the number of cross-terms I'd have to deal with. If you figure anything out, please <a href="mailto:epkeilty@gmail.com">let me know</a>. If you manage something, then also see if you can find an expression for the eigenvectors. Although, I suspect it's horribly verbose.

<br>

---

<br>

## Special Cases {#special-cases}

### Isosceles Triangle {#isoscelest-triangle}

When calculating the inertia tensor, the orientation of the triangle matters. Thus, I am going to analyze the most natural orientation. The triangle's apex is on the positive side of the $y$-axis and the base is parallel to the $x$-axis.

<center>
{% tikz triangle-isosceles %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 4);
    
    % Curve Parameters
    \def\b{3}
    \def\h{4}

    % Particular definitions
    \def\xa{-\b/2}
    \def\ya{-\h/3}
    \def\xb{0}
    \def\yb{2*\h/3}
    \def\xc{\b/2}
    \def\yc{-\h/3}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2.5) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=3, yshift=0] {$a$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=10, yshift=0] {$b$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, left, xshift=-3, yshift=0] {$a$};

    % vertices
    \node[left, color=paramColor] at (A) {$A$};
    \node[above, xshift=10, yshift=0, color=paramColor] at (B) {$B$};
    \node[below, color=paramColor] at (C) {$C$};

    % angle
    \draw pic[draw, -{Classical TikZ Rightarrow}, pic text=$\gamma$, very thick, angle radius={1.5cm}, angle eccentricity=1.4] {angle = O--B--C};

    % height
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt}] ($(\xc, \yb) + (0.5, 0)$) -- ($(C) + (0.5, 0)$) node [midway, right, xshift=10, yshift=0] {$h$};

{% endtikz %}
</center>

From the above diagram and some geometry, we can now write the particular values of $\b{A}$, $\b{B}$, $\b{C}$, $\b{a}$, $\b{b}$, and $\b{c}$.

$$
\begin{align}
    \b{A} &= -\tfrac{1}{2}b \; \u{x} - \tfrac{1}{3} h \; \u{y}
    &\qquad&
    \b{a} = \b{B} - \b{C} = -\tfrac{1}{2}b \; \u{x} + h \; \u{y} \\[10pt]
    \b{B} &= \tfrac{2}{3} h \; \u{y}
    &\implies \qquad&
    \b{b} = \b{C} - \b{A} = b \; \u{x} \\[10pt]
    \b{C} &= \tfrac{1}{2}b \; \u{x} - \tfrac{1}{3} h \; \u{y}
    &\qquad&
    \b{c} = \b{A} - \b{B} = -\tfrac{1}{2}b \; \u{x} - h \; \u{y} \\[10pt]
\end{align}
$$

<br>

I will spare you the algebra autopilot of substituting these values in for the general inertia tensor derived above, but feel free to verify for yourself. 

There are a few ways you can parameterize an isosceles triangle. The first and probably most natural is to use the base $b$ and height $h$ of the triangle. 

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{9}Mh^2 & 0 & 0 \\
    0 & \tfrac{1}{12}Mb^2 & 0 \\
    0 & 0 & \tfrac{1}{9}Mh^2 + \tfrac{1}{12}Mb^2
\end{bmatrix}
= \tfrac{1}{36} M \begin{bmatrix}
    4h^2 & 0 & 0 \\
    0 & 3b^2 & 0 \\
    0 & 0 & 4h^2 + 3b^2
\end{bmatrix}
$$

Alternatively, we can parameterize this in terms of the base $b$ and the side length $a$ of the triangle.

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{9}Ma^2 - \tfrac{1}{36}Mb^2 & 0 & 0 \\
    0 & \tfrac{1}{12}Mb^2 & 0 \\
    0 & 0 & \tfrac{1}{9}Ma^2 + \tfrac{1}{18}Mb^2
\end{bmatrix}
= \tfrac{1}{36} M \begin{bmatrix}
    4a^2 - b^2 & 0 & 0 \\
    0 & 3b^2 & 0 \\
    0 & 0 & 4a^2 + 2b^2
\end{bmatrix}
$$

Finally, we can consider the base length $b$ and the apex of the triangle $B$. Denote half of its angle by $\gamma$. Using basic trigonometry, we can see that $h = a \cos \gamma$ and $b = 2a \sin \gamma$.

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{9}Ma^2 \cos^2 \gamma & 0 & 0 \\
    0 & \tfrac{1}{3}Ma^2 \sin^2 \gamma & 0 \\
    0 & 0 & \tfrac{1}{9}Ma^2 (1 + 2 \sin^2 \gamma)
\end{bmatrix}
= \tfrac{1}{9} M a^2 \begin{bmatrix}
    \cos^2 \gamma & 0 & 0 \\
    0 & 3\sin^2 \gamma & 0 \\
    0 & 0 & 1 + 2 \sin^2 \gamma
\end{bmatrix}
$$

I've also seen $I_{zz}$ formulated as the following. I don't see any reason to prefer this over the former.

$$
I_{zz} = \tfrac{1}{9} M a^2 (3 - 2 \cos^2 \gamma)
$$

<br>

### Equilateral Triangle {#equilateral-triangle}

Finally, we finish with an equilateral triangle where all sides are equal length. 

<center>
{% tikz triangle-equilateral %}[scale=1.5, line width=1.5pt, font=\LARGE]
    \usetikzlibrary{angles,arrows.meta}
    
    % Colors
    \colorlet{myred}{red!65!black}
    \colorlet{myblue}{blue!65!black}
    \definecolor{brightblue}{HTML}{0096FF}
    \colorlet{paramColor}{myblue!25!brightblue}
    \colorlet{mygray}{gray!40}

    % Axes
    \coordinate (O) at (0, 0);
    \coordinate (X) at (4, 0);
    \coordinate (Y) at (0, 4);
    
    % Curve Parameters
    \def\S{3.5}
    \def\h{\S/2*1.7320508}

    % Particular definitions
    \def\xa{-\S/2}
    \def\ya{-\h/3}
    \def\xb{0}
    \def\yb{2*\h/3}
    \def\xc{\S/2}
    \def\yc{-\h/3}
    \coordinate (A) at (\xa, \ya);
    \coordinate (B) at (\xb, \yb);
    \coordinate (C) at (\xc, \yc);

    %=============================================================

    % Axis
    \draw [thick, {Stealth}-{Stealth}] ($(O)-(X)$) -- (X) node[anchor=north east]{$x$};
    \draw [thick, {Stealth}-{Stealth}] (0, -2.5) -- (Y) node[anchor=north west]{$y$};

    % triangle
    \draw [ultra thick, color=paramColor] (B) -- (C) node[midway, right, xshift=3, yshift=0] {$S$};
    \draw [ultra thick, color=paramColor] (C) -- (A) node[midway, below, xshift=10, yshift=0] {$S$};
    \draw [ultra thick, color=paramColor] (A) -- (B) node[midway, left, xshift=-3, yshift=0] {$S$};

{% endtikz %}
</center>

Here $a = b = S$. We simply plug into the second inertia tensor above.

$$
\m{I} = 
\begin{bmatrix}
    \tfrac{1}{12}MS^2 & 0 & 0 \\
    0 & \tfrac{1}{12}MS^2 & 0 \\
    0 & 0 & \tfrac{1}{6}MS^2
\end{bmatrix}
= \tfrac{1}{12} MS^2 \begin{bmatrix}
    1 & 0 & 0 \\
    0 & 1 & 0 \\
    0 & 0 & 2
\end{bmatrix}
$$

I find it really surprising that $I_{xx} = I_{yy}$. I can't think of an intuitive reason for why that should be the case.

<!-- <br>

---

<br>

## Appendix {#appendix}

There is a very nice property called the [Centroid Theorem](https://new.math.uiuc.edu/public403/affine/centroid.html), which says that the centroid is located as the arithmetic mean of the coordiantes. Written mathematically, if we let $\b{A}$, $\b{B}$, and $\b{C}$ be the vectors to the vertices of the triangle and $\b{G}$ be the coordinates of the centroid, then we have the following.

$$
\b{G} = \tfrac{1}{3} ( \b{A} + \b{B} + \b{C} )
$$

In our case, since we are assuming the centroid is located at the origin, $\b{G} = \b{0}$. -->

<!-- 
<br>

---

<br>

## Base on $x$-Axis

Base on $x$-axis vertically centered with top vertex.

### General Triangle

$$
I = \tfrac{1}{3} M \frac{a^3 + b_1^3 + b_2^3 + c^3}{a + b_1 + b_2 + c}
$$


$$
h^2 + b_1^2 = a^2 
\qquad\qquad
h^2 + b_2^2 = c^2 
$$

$$
\begin{align}
    I &= I_{a} + I_{b_1} + I_{b_2} + I_{c} 
    \\[10pt]
    
    &= \tfrac{1}{3} M_{a} \begin{bmatrix}
        b_1^2 & \tfrac{1}{2} b_1h & 0 \\
        \tfrac{1}{2} b_1h & h^2 & 0 \\
        0 & 0 & b_1^2 + h^2
    \end{bmatrix}
    + 
    \tfrac{1}{3}M_{b_1}b_1^2
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3}M_{b_2}b_2^2
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3} M_{c} \begin{bmatrix}
        b_2^2 & -\tfrac{1}{2} b_2h & 0 \\
        -\tfrac{1}{2} b_2h & h^2 & 0 \\
        0 & 0 & b_2^2 + h^2
    \end{bmatrix}
    \\[10pt]

    &= \tfrac{1}{3} a \begin{bmatrix}
        b_1^2 & \tfrac{1}{2} b_1h & 0 \\
        \tfrac{1}{2} b_1h & h^2 & 0 \\
        0 & 0 & a^2
    \end{bmatrix}
    + 
    \tfrac{1}{3}b_1^3
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3}b_2^3
    \begin{bmatrix}
        0 & 0 & 0 \\
        0 & 1 & 0 \\
        0 & 0 & 1
    \end{bmatrix}
    +
    \tfrac{1}{3} c \begin{bmatrix}
        b_2^2 & -\tfrac{1}{2} b_2h & 0 \\
        -\tfrac{1}{2} b_2h & h^2 & 0 \\
        0 & 0 & c^2
    \end{bmatrix}
    \\[10pt]
    
    &= \tfrac{1}{3} \begin{bmatrix}
        ab_1^2 + b_2^2c & - \tfrac{1}{2} (b_2c - ab_1) h & 0 \\
        - \tfrac{1}{2} (b_2c - ab_1) h & (a + c)h^2 + b_1^3 + b_2^3 & 0 \\
        0 & 0 & a^3 + b_1^3 + b_2^3 + c^3
    \end{bmatrix}
\end{align}
$$

<br>

### Isosceles Triangle

$$
\begin{align}
    I &= \tfrac{1}{3} \begin{bmatrix}
        2ab^2 & 0 & 0 \\
        0 & 2ah^2 + \tfrac{1}{4}b^3 & 0 \\
        0 & 0 & 2a^3 + \tfrac{1}{4}b^3
    \end{bmatrix}
\end{align}
$$

<br>

### Equilateral Triangle

$$
\begin{align}
    I &= \tfrac{1}{3} \begin{bmatrix}
        2S^3 & 0 & 0 \\
        0 & \tfrac{7}{4}S^3 & 0 \\
        0 & 0 & \tfrac{9}{4}S^3
    \end{bmatrix}
\end{align}
$$

<br>

---

<br>

<br>

---

<br>

## General - Coordiantes

If we are only interested in the rotational inertia around the $z$-axis, then there is a somewhat elegant way to describe this. Recall the coordiante formula for the rotational inertia of a line around the $z$-axis ([here](/blog/moments-of-inertia/lines-special-cases#coordiante-formula)).

**TODO** draw diagram

An identity I will use a number of times is the following, which is a version of the law of cosines. Really this is just a expanding the left-hand side.

$$
\abs{\b{A} - \b{B}}^2 = \abs{\b{A}}^2 + \abs{\b{B}}^2 - 2(\b{A} \cdot \b{B})
$$

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz} 
    &= \tfrac{1}{\lambda} I_{a} + \tfrac{1}{\lambda} I_{b} + \tfrac{1}{\lambda} I_{c} \\[10pt]
    &= \tfrac{1}{3} \abs{\b{B} - \b{C}} \left ( \abs{\b{B}}^2 + \abs{\b{C}}^2 + \b{B} \cdot \b{C} \right ) + \tfrac{1}{3} \abs{\b{C} - \b{A}} \left ( \abs{\b{C}}^2 + \abs{\b{A}}^2 + \b{C} \cdot \b{A} \right ) + \tfrac{1}{3} \abs{\b{A} - \b{B}} \left ( \abs{\b{A}}^2 + \abs{\b{B}}^2 + \b{A} \cdot \b{B} \right ) \\[10pt]
    &= \tfrac{1}{3} \abs{\b{B} - \b{C}} \left ( \abs{\b{B} - \b{C}}^2 + 3(\b{B} \cdot \b{C}) \right ) + \tfrac{1}{3} \abs{\b{C} - \b{A}} \left ( \abs{\b{C} - \b{A}}^2 + 3(\b{C} \cdot \b{A}) \right ) + \tfrac{1}{3} \abs{\b{A} - \b{B}} \left ( \abs{\b{A} - \b{B}}^2 + 3(\b{A} \cdot \b{B}) \right ) \\[10pt]
    &= \tfrac{1}{3} \left ( \abs{\b{B} - \b{C}}^3 + \abs{\b{C} - \b{A}}^3 + \abs{\b{A} - \b{B}}^3 \right ) + \abs{\b{B} - \b{C}} \; (\b{B} \cdot \b{C}) + \abs{\b{C} - \b{A}} \; (\b{C} \cdot \b{A}) + \abs{\b{A} - \b{B}} \; (\b{A} \cdot \b{B}) \\[10pt]
    &= \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right ) + a \; (\b{B} \cdot \b{C}) + b \; (\b{C} \cdot \b{A}) + c \; (\b{A} \cdot \b{B}) \\[10pt]
\end{align}
$$

Now, in order to simplify the analysis, we are going to assume the triangle's centroid is at the origin. Now, we can get an expression for the magnutides of $\b{A}$, $\b{B}$, $\b{C}$. We use [Apollonius Theorem](https://brilliant.org/wiki/apollonius-theorem/). Let $m_{A}$, $m_{B}$, and $m_{C}$ be the lengths of the medians. Then

$$
m_{A} = \tfrac{1}{2} \sqrt{2b^2 + 2c^2 - a^2}
\qquad
m_{B} = \tfrac{1}{2} \sqrt{2c^2 + 2a^2 - b^2}
\qquad
m_{C} = \tfrac{1}{2} \sqrt{2a^2 + 2b^2 - c^2}
$$

Then, we know that

$$
\abs{\b{A}} = \tfrac{2}{3} m_A
\qquad
\abs{\b{B}} = \tfrac{2}{3} m_B
\qquad
\abs{\b{C}} = \tfrac{2}{3} m_C
$$

$$
\begin{align}
    \b{B} \cdot \b{C} &= \tfrac{1}{2} \left ( \abs{\b{B}}^2 + \abs{\b{C}}^2 - \abs{\b{B} - \b{C}}^2 \right ) \\[10pt]
    &= \tfrac{1}{2} \left ( \tfrac{1}{9}(2c^2 + 2a^2 - b^2) + \tfrac{1}{9}(2a^2 + 2b^2 - c^2) - a^2 \right ) \\[10pt]
    &= \tfrac{1}{18} \left ( (2c^2 + 2a^2 - b^2) + (2a^2 + 2b^2 - c^2) - 9a^2 \right ) \\[10pt]
    &= \tfrac{1}{18} \left ( b^2 + c^2 - 5a^2 \right ) \\[10pt]
\end{align}
$$

Yiu can compute $\b{A} \cdot \b{B}$ and $\b{C} \cdot \b{A}$ symmetrically. Substituting into the above equation.

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz} 
    &= \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right ) + \tfrac{1}{18} a \left ( b^2 + c^2 - 5a^2 \right ) + \tfrac{1}{18} b \left ( c^2 + a^2 - 5b^2 \right ) + \tfrac{1}{18} c \left ( a^2 + b^2 - 5c^2 \right ) \\[10pt]
    &= \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right ) + \tfrac{1}{18} a \left ( b^2 + c^2 + a^2 \right ) + \tfrac{1}{18} b \left ( c^2 + a^2 + b^2 \right ) + \tfrac{1}{18} c \left ( a^2 + b^2 + c^2 \right ) - \tfrac{1}{3} \left ( a^3 + b^3 + c^3 \right )\\[10pt]
    &= \tfrac{1}{18} \left ( a + b + c \right ) \left ( b^2 + c^2 + a^2 \right ) \\[10pt]
\end{align}
$$

The mass of the triangle is $\lambda \cdot (a + b + c)$. Therefore

$$
I_{zz} = \tfrac{1}{18} M (a^2 + b^2 + c^2)
$$

This is beautiful, and I've never seen this formula anywhere else.

<br>

---

<br>

## General - Proof 2

We can do this a lot more simply without using coordinates

$$
\begin{align}
    \tfrac{1}{\lambda} I_{zz} 
    &= \tfrac{1}{\lambda} I_{a} + \tfrac{1}{\lambda} I_{b} + \tfrac{1}{\lambda} I_{c} \\[10pt]
    &= \tfrac{1}{12} M_a a^2 + M_a D_a^2 + \tfrac{1}{12} M_b b^2 + M_b D_b^2 + \tfrac{1}{12} M_c c^2 + M_c D_c^2 \\[10pt]
    &= \tfrac{1}{12} a^3 + \tfrac{1}{36} a (2b^2 + 2c^2 - a^2) + \tfrac{1}{12} b^3 + \tfrac{1}{36} b (2c^2 + 2a^2 - b^2)  + \tfrac{1}{12} c^3 + \tfrac{1}{36} c (2a^2 + 2b^2 - c^2) \\[10pt]
    &= \tfrac{1}{12} (a^3 + b^3 + c^3) + \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2 - 3a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2 - 3b^3) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2 - 3c^2) \\[10pt]
    &= \tfrac{1}{36} a (2b^2 + 2c^2 + 2a^2) + \tfrac{1}{36} b (2c^2 + 2a^2 + 2b^2) + \tfrac{1}{36} c (2a^2 + 2b^2 + 2c^2) \\[10pt]
    &= \tfrac{1}{18} (a + b + c) (a^2 + b^2 + c^2)
\end{align}
$$

The mass of the triangle is $M = \lambda \cdot (a + b + c)$. Therefore

$$
I_{zz} = \tfrac{1}{18} M (a^2 + b^2 + c^2)
$$

This is beautiful, and I've never seen this formula anywhere else. -->