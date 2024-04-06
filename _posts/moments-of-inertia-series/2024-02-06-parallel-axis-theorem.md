---
layout:     series
title:      "Parallel Axis Theorem"
date:       2024-02-06
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       5
series:     moments-of-inertia
tags:       moments-of-inertia, parallel-axis
---

## A Fixed Axis of Rotation

### Theorem

Suppose we know the moment of inertia of object $\mathcal{G}$ with respect to a fixed axis of rotation passing through its **center of mass**. Now consider another axis of rotation which is parallel to and a distance $D$ away from the original axis. 

**TODO** draw diagram

Then the **parallel axis theorem** says the following.

$$
I_{\text{parallel axis}} = I_{\text{central axis}} + MD^2
$$

<br>

### Proof

Define a Cartesian coordinate system with respect to any fixed origin. Fix some arbitrary point in object $\mathcal{G}$, and let $\b{r}$ be its position vector. Let $r_{\text{central axis}}$ and $r_{\text{parallel axis}}$ be the shortest distance from this fixed point to their respective axes.

**TODO** draw diagram

Notice that 

$$
r_{\text{parallel axis}} = r_{\text{central axis}} + D
$$ 

Now, let's find the moment of inertia with respect to the parallel axis of rotation.

$$
\begin{align}
    I_{\text{parallel axis}} 
    &= \int_{\mathcal{G}} r_{\text{parallel axis}}^2 \;dm \\[10pt]
    &= \int_{\mathcal{G}} (r_{\text{central axis}} + D)^2 \;dm \\[10pt]
    &= \int_{\mathcal{G}} (r_{\text{central axis}}^2 + D^2 + 2 D r_{\text{central axis}}) \;dm \\[10pt]
    &= \left ( \int_{\mathcal{G}} r_{\text{central axis}}^2 \;dm \right ) + \left ( \int_{\mathcal{G}} D^2 \;dm \right ) + \left ( \int_{\mathcal{G}} 2 D r_{\text{central axis}} \;dm \right ) \\[10pt]
    &= \left ( \int_{\mathcal{G}} r_{\text{central axis}}^2 \;dm \right ) + \left ( D^2 \int_{\mathcal{G}} \;dm \right ) + \left (  2 D \int_{\mathcal{G}} r_{\text{central axis}} \;dm \right ) \\[10pt]
    &= \left ( I_{\text{central axis}} \right ) + \left ( M D^2 \right ) + \left ( 0 \right ) \\[10pt]
    &= I_{\text{central axis}} +  M D^2
\end{align}
$$

<br>

Lastly, we just have to argue why 
$$
\displaystyle
\int_{\mathcal{G}} r_{\text{central axis}} \;dm = 0
$$.
Essentially this is due to symmetry, since a central axis of rotation (by definition) passes through the center of mass of the object. This completes the proof.

<br>

---

<br>

## Generalized Parallel Axis Theorem

### Theorem

We can generalize the parallel axis theorem so that it can be applied to an inertia tensor. Fix any coordinate system. Suppose we know the inertia tensor of a object $\mathcal{G}$ with mass $M$ such that its **center of mass** is positioned at the origin, denoted $\m{I_{\text{cm}}}$. Now suppose that object $\mathcal{G}$ is translated anywhere in the coordinate system such that its center of mass is now at coordinate $\b{D} = D_x \; \u{x} + D_y \; \u{y} + D_z \; \u{z}$. 

**TODO** draw diagram

Then, the generalized parallel axis theorem tells us the following.

$$
\m{ I_{\text{translated}} } = 
\m{I_{\text{cm}}} + M 
\begin{bmatrix}
    D_y^2 + D_z^2 & - D_xD_y & - D_xD_z \\
    - D_yD_x  & D_z^2 + D_x^2 & - D_yD_z \\
    - D_zD_x  & - D_zD_y & D_x^2 + D_y^2
\end{bmatrix}
$$

We can also express this compactly, where $\otimes$ denote the outer product and $\m{ \mathbb{I} }$ is the identity matrix. 

$$
\m{ I_{\text{translated}} } = 
\m{I_{\text{cm}}} + M (D^2 \m{\mathbb{I}} - \b{D} \otimes \b{D})
$$

<!-- Essentially, this theorem tells us how the moment of inertia of an object changes under any translation.  -->

### Proof

This is a bit more technical, but it's the same idea as the first proof. Fix some arbitrary point in object $\mathcal{G}$. Let $\b{r} = x \; \u{x} + y \; \u{y} + z \; \u{z}$ be its original position vector and let $\b{r}' = x' \; \u{x} + y' \; \u{y} + z' \; \u{z}$ denote its position vector after translated. 

**TODO** draw diagram

Therefore, $\b{r}' = \b{r} + \b{D}$. Unrolling this element-wise, we have

$$
x' = x + D_x
\qquad
y' = y + D_y
\qquad
z' = z + D_z
$$

Now, let's find the inertia tensor of the translated object.

$$
\begin{align}
    \m{ I_{\text{translated}} }
    &= \int_{\mathcal{G}} \begin{bmatrix}
        (y')^2 + (z')^2 & - x'y' & - x'z' \\
        - y'x'  & (z')^2 + (x')^2 & - y'z' \\
        - z'x'  & - z'y' & (x')^2 + (y')^2
    \end{bmatrix} \;dm \\[10pt]
    &= \int_{\mathcal{G}} \begin{bmatrix}
        (y + D_y)^2 + (z + D_z)^2 & - (x + D_x)(y + D_y) & - (x + D_x)(z + D_z) \\
        - (y + D_y)(x + D_x)  & (z + D_z)^2 + (x + D_x)^2 & - (y + D_y)(z + D_z) \\
        - (z + D_z)(x + D_x)  & - (z + D_z)(y + D_y) & (x + D_x)^2 + (y + D_y)^2
    \end{bmatrix} \;dm \\[10pt]
    &= \int_{\mathcal{G}} \begin{bmatrix}
        (y^2 + 2yD_y + D_y^2) + (z^2 + 2zD_z + D_z^2) & - xy - xD_x - yD_y - D_xD_y & - xz - xD_x - zD_z - D_xD_z \\
        - yx - yD_y - xD_x - D_yD_x & (z^2 + 2zD_z + D_z^2) + (x^2 + 2xD_x + D_x^2) & - yz - yD_y - zD_z - D_yD_z \\
        - zx - zD_z - xD_x - D_zD_x & - zy - zD_z - yD_y - D_zD_y & (x^2 + 2xD_x + D_x^2) + (y^2 + 2yD_y + D_y^2)
    \end{bmatrix} \;dm \\[10pt]
    &= \int_{\mathcal{G}} \begin{bmatrix}
        y^2 + z^2 & - xy & - xz \\
        - yx  & z^2 + x^2 & - yz \\
        - zx  & - zy & x^2 + y^2
    \end{bmatrix} \;dm 
    +
    D_x \begin{bmatrix}
          0 & - 1 & - 1 \\
        - 1  &  2 &  0 \\
        - 1  &  0 &  2
    \end{bmatrix}
    \int_{\mathcal{G}} x \; dm
    +
    D_y \begin{bmatrix}
          2 & - 1 &   0 \\
        - 1 &   0 & - 1 \\
          0 & - 1 &   2
    \end{bmatrix}
    \int_{\mathcal{G}} y \; dm
    +
    D_z \begin{bmatrix}
          2 &   0 & - 1 \\
          0 &   2 & - 1 \\
        - 1 & - 1 &   0
    \end{bmatrix}
    \int_{\mathcal{G}} z \; dm
    +
    \begin{bmatrix}
        D_y^2 + D_z^2 & - D_xD_y & - D_xD_z \\
        - D_yD_x  & D_z^2 + D_x^2 & - D_yD_z \\
        - D_zD_x  & - D_zD_y & D_x^2 + D_y^2
    \end{bmatrix}
    \int_{\mathcal{G}} \; dm
    \\[10pt]
    &= \m{I_{\text{cm}}} + M 
    \begin{bmatrix}
        D_y^2 + D_z^2 & - D_xD_y & - D_xD_z \\
        - D_yD_x  & D_z^2 + D_x^2 & - D_yD_z \\
        - D_zD_x  & - D_zD_y & D_x^2 + D_y^2
    \end{bmatrix}
\end{align}
$$

Just as before, we know that 

$$
\int_{\mathcal{G}} x \; dm = \int_{\mathcal{G}} y \; dm = \int_{\mathcal{G}} z \; dm = 0
$$

since object $\mathcal{G}$ is assumed to have its center of mass at the origin.

<br>

### An Alternative Formulation {#an-alternative-formulation}

This is an interesting reformation that I discovered, which I think it more elegant. Consider the translation vector $\b{D}$, and consider the angles it makes with respect to the $x$, $y$, and $z$ axes, which we label $\alpha_x$, $\alpha_y$, and $\alpha_z$, respectively.

<center>
{% tikz center-of-mass-lengths %}[scale=1.5, line width=1.5pt, font=\LARGE]
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

    % Points
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}

    % Point Parameters
    \def\x{3}
    \def\y{1.5}
    \def\z{2.75}

    % Particular definitions
    \coordinate (XYZ) at (\x, \y, \z);
    \coordinate (XY) at (\x, \y, 0);

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % displacement vector
    \draw [ultra thick, ->] (O) -- (XYZ) node[above, right, xshift=0, yshift=0] {$\boldsymbol{D}$};

    % line lengths
    \draw [thick, dashed] (\x, 0, 0) -- (XY) node[midway, below] {$D_y$};
    \draw [thick, dashed] (0, \y, 0) -- (XY) node[midway, right, xshift=3, yshift=-3] {$D_x$};
    \draw [thick, dashed] (XY) -- (XYZ) node[midway, right] {$D_z$};

\end{scope}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz center-of-mass-angles %}[scale=1.5, line width=1.5pt, font=\LARGE]
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

    % Points
    \tdplotsetrotatedcoords{30}{80}{0}
    \def\pointradius{0.1}

    % Point Parameters
    \def\x{3}
    \def\y{1.5}
    \def\z{2.75}

    % Particular definitions
    \coordinate (XYZ) at (\x, \y, \z);
    \coordinate (XY) at (\x, \y, 0);

    %=============================================================

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % y-axis angle
    \tdplotdefinepoints(0,0,0)(\x,\y,\z)(0,\y,0)
    \tdplotdrawpolytopearc[color=paramColor, {Classical TikZ Rightarrow}-]{0.85}{color=paramColor, xshift=7, yshift=5} {$\alpha_y$}

    % z-axis angle
    \tdplotdefinepoints(0,0,0)(\x,\y,\z)(0,0,\z)
    \tdplotdrawpolytopearc[color=paramColor, {Classical TikZ Rightarrow}-]{0.85}{color=paramColor, xshift=-13, yshift=5}{$\alpha_z$}

    % position vector
    \draw [ultra thick, ->] (O) -- (XYZ) node[above, right, xshift=0, yshift=0] {$\boldsymbol{D}$};

    % x-axis angle
    \tdplotdefinepoints(0,0,0)(\x,\y,\z)(\x,0,0)
    \tdplotdrawpolytopearc[color=paramColor, {Classical TikZ Rightarrow}-]{0.85}{color=paramColor, xshift=-10, yshift=3}{$\alpha_x$}

    % lines to axes
    %\draw [thick, dashed] (\x, 0, 0) -- (XYZ);
    %\draw [thick, dashed] (0, \y, 0) -- (XYZ);
    %\draw [thick, dashed] (0, 0, \z) -- (XYZ);

\end{scope}
{% endtikz %}
</center>

Using some geometry, you can prove that.

$$
\begin{align}
    D_y^2 + D_z^2 &= D \sin \alpha_x
    &\quad
    D_x &= D \cos \alpha_x
    \\[10pt]
    D_z^2 + D_x^2 &= D \sin \alpha_y 
    &\quad
    D_y &= D \cos \alpha_y 
    \\[10pt]
    D_x^2 + D_y^2 &= D \sin \alpha_z 
    &\quad
    D_z &= D \cos \alpha_z 
\end{align}
$$

Therefore, we can refactor the inertia tensor as the following.

$$
\m{I_{\text{translated}}} = \m{I_{\text{cm}}} + M D^2
    \begin{bmatrix}
        \sin^2 \alpha_x & - \cos \alpha_x \cos \alpha_y & - \cos \alpha_x \cos \alpha_z \\
        - \cos \alpha_y \cos \alpha_x & \sin^2 \alpha_y & - \cos \alpha_y \cos \alpha_z \\
        - \cos \alpha_z \cos \alpha_x & - \cos \alpha_z \cos \alpha_y & \sin^2 \alpha_z
    \end{bmatrix}
$$

This can be written compactly as follows, where $\b{\alpha} = [\alpha_x \ \ \alpha_y \ \ \alpha_z]^T$ and $\cos(\b{\alpha})$ is evaluated element-wise.

$$
\m{I_{\text{translated}}} = \m{I_{\text{cm}}} + M D^2 (\m{\mathbb{I}} - \cos(\b{\alpha}) \otimes \cos(\b{\alpha}))
$$

There are two nice things about this. First, the matrix that is left over is unitary, which means it is a pure rotation matrix. Second, when you start taking special cases usually the angle of the object with respect to the axis of rotation is easier to work with.

$$
\m{I_{\text{translated}}} = \m{I_{\text{cm}}} + M \m{D}
$$

<!-- <br>

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
$$ -->