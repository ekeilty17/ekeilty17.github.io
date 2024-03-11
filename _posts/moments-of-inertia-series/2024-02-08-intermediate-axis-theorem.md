---
layout:     series
title:      "Intermediate Axis Theorem"
date:       2024-02-08
categories: blog moments-of-inertia
permalink:  ":categories/:title/"
part:       7
series:     moments-of-inertia
tags:       moments-of-inertia, intermediate-axis
---

This doesn't really have anything to do with calculating moments of inertia, but it's a pretty interesting phenomenon in physics. This also goes by several other names, such as the **Dzhanibekov Effect** and the **Tennis Racket Theorem**.

In this post, I will be using the dot notation for time derivatives. In particular,

$$
\dot{x} \equiv \tfrac{d}{dt} x
\qquad\qquad
\ddot{x} \equiv \tfrac{d^2}{dt^2} x
$$

<br>

## Explanation of the Phenomenon

Consider a thin rectangular slab where $a > b > c$. For the best results, we want $c \ll b$ and $a \geq 2b$ at least. Otherwise, the dimensions are too similar for the phenomenon to work. Let $$\b{\omega}_{x}$$, $$\b{\omega}_{y}$$, and $$\b{\omega}_{z}$$ denote this object's perpedicular rotation about the $x$, $y$, and $z$ axes, respectively.

<!-- This is an idealized object that can proxy many everyday objects - your smartphone, a tennis racket, a skateboard, etc. Now consider the three perpendicular axes shown in the diagram below. -->

<center>
{% tikz intermediate-axis-theorem %}[scale=1.5, line width=1.5pt, font=\LARGE]
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
    \coordinate (X) at (6.5, 0, 0);
    \coordinate (Y) at (0, 3.5, 0);
    \coordinate (Z) at (0, 0, 3);

    % Axis of rotation
    \def\rotarrowradius{0.25};
    \def\rotarrowoffset{0.25};
    \tikzset{rotarrow/.style={-{Classical TikZ Rightarrow}, very thick, color=myred, decoration={amplitude=1mm, segment length=5mm, post length=1mm}, decorate}}

    % Curve Parameters
    \def\a{5}
    \def\b{1.5}
    \def\c{0.25}

    % Particular definitions

    %=============================================================

    % axis of rotation (part 1)
    \coordinate (AORend) at (-4, 0, 0);
    \draw [color=myred] (AORend) -- (O);

    \coordinate (AORend) at (0, -3, 0);
    \draw [color=myred] (AORend) -- (O);

    \coordinate (AORend) at (0, 0, -2);
    \draw [color=myred] (AORend) -- (O);

    % Axis
    \draw [thick, ->] (O) -- (X) node[anchor=north east]{$x$};
    \draw [thick, ->] (O) -- (Y) node[anchor=north west]{$y$};
    \draw [thick, ->] (O) -- (Z) node[anchor=south]{$z$};

    % corners
    \coordinate (A) at ({-\a/2}, {-\b/2}, {-\c/2});
    \coordinate (B) at ({\a/2}, {-\b/2}, {-\c/2});
    \coordinate (C) at ({\a/2}, {\b/2}, {-\c/2});
    \coordinate (D) at ({-\a/2}, {\b/2}, {-\c/2});

    \coordinate (E) at ({-\a/2}, {-\b/2}, {\c/2});
    \coordinate (F) at ({\a/2}, {-\b/2}, {\c/2});
    \coordinate (G) at ({\a/2}, {\b/2}, {\c/2});
    \coordinate (H) at ({-\a/2}, {\b/2}, {\c/2});
    
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

    % Label axes (part 1)
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (-\a/2, \b/2, -\c/2) -- (\a/2, \b/2, -\c/2) node [midway, right, xshift=5, yshift=-13] {$a$};

    % axis of rotation (part 2)
    \coordinate (AORstart) at (5.5, 0, 0);
    \draw [color=myred] (AORstart) -- (\a/2, 0, 0);
    \draw[rotarrow, rotate around y=90] ($(AORstart) - (\rotarrowoffset, 0, \rotarrowradius)$) arc (-90:210:\rotarrowradius) node[xshift=17, yshift=-30] {$\omega_x$};

    \coordinate (AORstart) at (0, 3, 0);
    \draw [color=myred] (AORstart) -- (0, \b/2, 0);
    \draw[rotarrow, rotate around x=90] ($(AORstart) - (\rotarrowradius, \rotarrowoffset, -0.5)$) arc (-90:210:\rotarrowradius) node[xshift=10, yshift=20] {$\omega_y$};

    \coordinate (AORstart) at (0, 0, 2.5);
    \draw [color=myred] (AORstart) -- (0, 0, \c/2);
    \draw[rotarrow, rotate around z=-30] ($(AORstart) - (0, \rotarrowradius, \rotarrowoffset)$) arc (-90:210:\rotarrowradius) node[xshift=23, yshift=-3] {$\omega_z$};

    % Label axes (part 2)
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (\a/2, \b/2, -\c/2) -- (\a/2, -\b/2, -\c/2) node [midway, below, xshift=-5, yshift=-10] {$b$};
    \draw[semithick,decorate,decoration={brace,amplitude=5pt,raise=5pt},color=paramColor] (\a/2, -\b/2, -\c/2) -- (\a/2, -\b/2, \c/2) node [midway, xshift=-20, yshift=0] {$c$};

\end{scope}
{% endtikz %}
</center>

Here's the interesting and somewhat unintutive part. Rotation around $$\b{\omega}_{x}$$ and $$\b{\omega}_{z}$$ is **stable**, but rotation around $$\b{\omega}_{y}$$ is **unstable**. In other words, it is easy to get this object to purely rotate around $$\b{\omega}_{x}$$ or $$\b{\omega}_{z}$$. However, it is practically impossible to obtain pure rotation around $$\b{\omega}_{y}$$. Free rotation about $$\b{\omega}_{y}$$ will almost always result in a twist about $$\b{\omega}_{x}$$.

### Real-Life Examples

This is an idealized object that can proxy many everyday objects. Below are a few examples.

**Your Smart Phone**: If you are daring enough to throw your smartphone in the air, you can see this phenomenon for yourself (maybe do it over your bed or a couch). Pure rotation about $$\b{\omega}_{x}$$ and $$\b{\omega}_{z}$$ is very easy. However, trying to rotate only around $$\b{\omega}_{y}$$ always results in an unwanted twist about $$\b{\omega}_{x}$$.

**Tennis Rackets**: If you don't want to risk damaging your phone, a tennis racket is a good object to use. In fact, it is one of the objects that motivated the discovery of this phenomenon. This [wikipedia article](https://en.wikipedia.org/wiki/Tennis_racket_theorem) has a good video showing each of the axes. As hard as you may try, it is nearly impossible to freely rotate the racket about $$\b{\omega}_{y}$$ without an extra twist about $$\b{\omega}_{x}$$.

**Skateboarding**: In skateboarding, rotation about $$\b{\omega}_{x}$$ is called a [kickflip](https://www.youtube.com/watch?v=cC7VEqn-mUM) and rotation about $$\b{\omega}_{z}$$ is called a [pop shove it](https://www.youtube.com/watch?v=WGaLuSbTtQ4). These are some of the first ground tricks you learn since the board rotation is so stable. However, rotation about $$\b{\omega}_{y}$$ is called the [impossible](https://www.youtube.com/watch?v=tT5dlPf4tVs) since the rotation is inherently unstable and for a long time no one could do the trick. It took the genius of [Rodney Mullen](https://en.wikipedia.org/wiki/Rodney_Mullen) to invent a method, which involves guiding the rotation about $$\b{\omega}_{y}$$ with your foot to prevent the unwanted rotation. Physics Girl has a really [good video](https://www.youtube.com/watch?v=yFRPhi0jhGc) about this.

<br>

## Intuitive Justification

The intermediate axis theorem is unintuitive. I don't think anyone would infer this phenomenon without directly observing it. An attempt at an intuitive explanation is too long to include here. Veritasium has a really good [video](https://www.youtube.com/watch?v=1VPfZ_XzisU) with his attempt that I recommend.

<br>

## Mathematical Proof

Luckily, the mathematical justification is pretty straightforward.

### Setup

Let $I_{x}$, $I_{y}$, and $I_{z}$ denote the rotational inertia about the $x$, $y$, and $z$ axes, respectively. From the [later post](/blog/moments-of-inertia/slab) when we derive the rotational inertia of a slab, we know the following.

$$
I_{x} = \tfrac{1}{12}M(b^2 + c^2)
\qquad
I_{x} = \tfrac{1}{12}M(c^2 + a^2)
\qquad
I_{z} = \tfrac{1}{12}M(a^2 + b^2)
$$

Additionally, we know that the object is positioned on a principal axis. Therefore the inertia tensor is diagonal.

$$
\m{I} = \begin{bmatrix}
    I_x & 0 & 0 \\
    0 & I_y & 0 \\
    0 & 0 & I_z
\end{bmatrix} 
$$

If we assume that $a > b > c$ (as drawn in the diagram), then

$$
a > b > c
\quad\implies\quad
b^2 + c^2 < c^2 + a^2 < a^2 + b^2 
\quad\implies\quad
I_{x} < I_{y} < I_{z}
$$

<br>

Now, we need to get an expression for the total torque on the system. In classical physics, this is given by the following.

$$
\b{\tau} = \frac{d \b{L}}{dt} = \frac{d (\m{I} \b{\omega})}{dt}
$$

The issue here is that as we rotate the object, the inertia tensor changes. So we actually can't assume the inertia tensor is a constant. We have to convert to a reference frame where the inertia tensor is constant. Here's where I'm going to do a bit of handwaving. [Euler's rotation equations](https://en.wikipedia.org/wiki/Euler%27s_equations_(rigid_body_dynamics)) do precisely this.

$$
\b{\tau} = \m{I} \dot{\b{\omega}} + \b{\omega} \times (\m{I} \b{\omega})
$$

Unrolling the vector definitions gives the following.

$$
\begin{align}
    &\tau_x = I_{x} \dot{\omega}_{x} + (I_{z} - I_{y}) \omega_{y} \omega_{z} \\[10pt]
    &\tau_y = I_{y} \dot{\omega}_{y} + (I_{x} - I_{z}) \omega_{z} \omega_{x} \\[10pt]
    &\tau_z = I_{z} \dot{\omega}_{z} + (I_{y} - I_{x}) \omega_{x} \omega_{y}
\end{align}
$$

Now, we assume that the net torque on the system is $0$ (i.e. we have free rotation). Also, define the following constants. I have set these up so that each constant is positive based on the geometry of the slab.

$$
k_{1} \equiv I_{z} - I_{y} > 0
\qquad
k_{2} \equiv I_{z} - I_{x} > 0
\qquad
k_{3} \equiv I_{y} - I_{x} > 0
$$

Rearranging gives the following.

$$
\begin{align}
    &I_{x} \dot{\omega}_{x} = -k_{1} \omega_{y} \omega_{z} \\[10pt]
    &I_{y} \dot{\omega}_{y} = \ \ \ k_{2} \omega_{z} \omega_{x} \\[10pt]
    &I_{z} \dot{\omega}_{z} = -k_{3} \omega_{x} \omega_{y}
\end{align}
$$

We can already see what makes the "intermediate" axis special. It's the only term with a negative coefficient.

<br>

### Stable Rotation Proof

Suppose that we are mostly rotating about $$\b{\omega}_x$$ with some perturbation. This means that the contribution due to $\omega_y$ and $\omega_z$ is small (but not necessarily $0$). In particular, $0 \approx \omega_y, \omega_z \ll \omega_x$ and  Therefore

$$
I_{x} \approx 0 
\quad\implies\quad
I_{x} \dot{\omega}_{x} \approx 0 
\quad\implies\quad
\omega_{x} \ \text{is constant}
$$

Thus, if we neglect the time dependency of $\omega_{x}$.

$$
\begin{align}
    &I_{y} \ddot{\omega}_{y} = \left ( k_{2} \omega_{x} \right ) \; \dot{\omega}_{z} \\[10pt]
    &I_{z} \ddot{\omega}_{z} = - \left ( k_{3} \omega_{x} \right ) \; \dot{\omega}_{y}
\end{align}
$$

Substituting for the first time derivative and some rearranging.

$$
\begin{align}
    &\ddot{\omega}_{y} = - \left ( \frac{ k_{2} k_{3} \omega_{x}^2 }{I_y I_z} \right ) \; \omega_{y} \\[10pt]
    &\ddot{\omega}_{z} = - \left ( \frac{ k_{2} k_{3} \omega_{x}^2 }{I_y I_z} \right ) \; \omega_{z} 
\end{align}
$$

Notice that every term in the brackets is positive. Even though $\omega_x$ may be either positive or negative, $\omega_x^2$ is always positive. Let $k_4^2 = \frac{ k_{2} k_{3} \omega_{x}^2 }{I_y I_z} > 0$.

$$
\ddot{\omega}_y = - k_4^2 \omega_y 
\quad\implies\quad 
\omega_y(t) = \omega_y(0) \cos(k_4 t) + \tfrac{1}{k_4}\dot{\omega}_y(0) \sin(k_4 t)
\\[10pt]
\ddot{\omega}_z = - k_4^2 \omega_z
\quad\implies\quad 
\omega_z(t) = \omega_z(0) \cos(k_4 t) + \tfrac{1}{k_4}\dot{\omega}_z(0) \sin(k_4 t)
$$

Therefore, since we assumed that $\omega_y$ and $\omega_z$ were initially small and we assumed no external torque (which implies $\dot{\omega}_y(0) = \dot{\omega}_z(0) = 0$), we see that $$\omega_y(t)$$ and $$\omega_z(t)$$ will remain very small. Thus, a small perturbation in the pure rotation about $$\b{\omega}_x$$ will not have a large effect on the motion.

The same analysis can be done to show that rotation around $$\b{\omega}_z$$ is also stable. The argument becomes different with rotation around $$\b{\omega}_y$$.

<br>

### Unstable Rotation Proof

The analysis is almost identical. Suppose that we are mostly rotating about $$\b{\omega}_y$$ with some perturbation. This means that the contribution due to $\omega_x$ and $\omega_z$ is small (but not necessarily $0$). In particular, $0 \approx \omega_x, \omega_z \ll \omega_y$ and  Therefore

$$
I_{y} \approx 0 
\quad\implies\quad
I_{y} \dot{\omega}_{y} \approx 0 
\quad\implies\quad
\omega_{y} \ \text{is constant}
$$

Thus, if we neglect the time dependency of $\omega_{y}$.

$$
\begin{align}
    &I_{x} \ddot{\omega}_{x} = - \left ( k_{1} \omega_{y} \right ) \; \dot{\omega}_{z} \\[10pt]
    &I_{z} \ddot{\omega}_{z} = - \left ( k_{3} \omega_{y} \right ) \; \dot{\omega}_{x}
\end{align}
$$

Substituting for the first time derivative and some rearranging.

$$
\begin{align}
    &\ddot{\omega}_{x} = \left ( \frac{ k_{1} k_{3} \omega_{y}^2 }{I_x I_z} \right ) \; \omega_{x} \\[10pt]
    &\ddot{\omega}_{z} = \left ( \frac{ k_{1} k_{3} \omega_{y}^2 }{I_x I_z} \right ) \; \omega_{z} 
\end{align}
$$

<br>

Notice that every term in the brackets is positive. Even though $\omega_y$ may be either positive or negative, $\omega_y^2$ is always positive. Let $k_5^2 = \frac{ k_{1} k_{3} \omega_{y}^2 }{I_x I_z} > 0$.

$$
\ddot{\omega}_x = k_5^2 \omega_x
\quad\implies\quad 
\omega_x(t) = \tfrac{1}{2}[\omega_x(0) + \tfrac{1}{k_5}\dot{\omega}_x(0)] e^{k_5 t} + \tfrac{1}{2}[\omega_x(0) - \tfrac{1}{k_5}\dot{\omega}_x(0)] e^{-k_5 t}
\\[10pt]
\ddot{\omega}_z = k_5 \omega_z
\quad\implies\quad 
\omega_z(t) = \tfrac{1}{2}[\omega_z(0) + \tfrac{1}{k_5}\dot{\omega}_z(0)] e^{k_5 t} + \tfrac{1}{2}[\omega_z(0) - \tfrac{1}{k_5}\dot{\omega}_z(0)] e^{-k_5 t}
$$

Like before, we assumed that $\omega_x$ and $\omega_z$ were initially small and we assumed no external torque (which implies $\dot{\omega}_x(0) = \dot{\omega}_z(0) = 0$). Therefore, the $e^{-k_5 t}$ will dissipate and the $e^{k_5 t}$ term will dominate. Therefore, the equations become

$$
\omega_x(t) \approx \tfrac{1}{2} \omega_x(0) e^{k_5 t} \\[10pt]
\omega_z(t) \approx \tfrac{1}{2} \omega_z(0) e^{k_5 t}
$$

Therefore, even though $\omega_x$ and $\omega_z$ are small, the growing exponential term will eventually dominate, causing a large angular velocity in both the $\omega_x$ and $\omega_z$ directions. In practice, this will cause a twist about $$\b{\omega}_x$$, since it has smaller rotational inertia than $$\b{\omega}_z$$.

<br>

### A Short Reflection

It's interesting to backtrack through the math to find where the asymmetry of $$\b{\omega}_y$$ comes from. It first showed up with these equations

$$
\begin{align}
    &I_{x} \dot{\omega}_{x} = - (I_{z} - I_{y}) \omega_{y} \omega_{z} = -k_{1} \omega_{y} \omega_{z} \\[10pt]
    &I_{y} \dot{\omega}_{y} = \ \ \ (I_{z} - I_{x}) \omega_{z} \omega_{x} = \ \ \ k_{2} \omega_{z} \omega_{x} \\[10pt]
    &I_{z} \dot{\omega}_{z} = - (I_{y} - I_{x}) \omega_{x} \omega_{y} = -k_{3} \omega_{x} \omega_{y}
\end{align}
$$

where $k_1$, $k_2$, and $k_3$ are positive constants. The fact that there is a negative in front of the second equation is ultimately why the analysis of $$\b{\omega}_y$$ is different than that of $$\b{\omega}_x$$ and $$\b{\omega}_z$$.

The coefficient in the second equation is $(I_{x} - I_{z})$ rather than $(I_{z} - I_{x})$ ultimately comes from unrolling the cross product of $\b{\omega} \times (\m{I} \b{\omega})$. Written out a bit more.

$$
\begin{bmatrix}
    \omega_x \\
    \omega_y \\
    \omega_z
\end{bmatrix} 
\times 
\begin{bmatrix}
    I_x \omega_x \\
    I_y \omega_y \\
    I_z \omega_z
\end{bmatrix} 
$$

In a way, this grouping order is ultimately just a fundamental property of the cross product. This is why an intuitive justification for the intermediate axis theorem is so difficult to find. It is the result of a quirk of mathematics coupled with the perfect geometry to exploit it.