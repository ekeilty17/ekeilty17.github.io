---
layout:     series
title:      "Complementary, Supplementary, and Opposite Angles"
date:       2022-08-08
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       7
series:     trigonometry
tags:       trigonometry, opposite, complementary, supplementary
---

For all of these formulas, we will use the difference identity for cosine to prove them (and avoid circularity). However, their truth is easily seen via an appropriate diagram.

<br>

## Complementary Angles

The **complement** of an angle $\theta$ is the angle that when combined $\theta$ produces a **right angle** ($90$ degree angle), i.e. it is $90^{\circ} - \theta$.

<center>
{% tikz complementary-angle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\angle{20}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\a{ {\r * cos(-\angle)} }
    \def\b{ {\r * sin(-\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);
    \coordinate (nX) at (-\r, 0);

    % draw the axes
    \draw[->] ($ (-0.5,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-0.5) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.35*\r}, angle eccentricity=1.3] {angle = x--O--xy};
    \draw pic [draw, red, ->, pic text=$90^{\circ} - \theta$, very thick, angle radius={0.2*\r}, angle eccentricity=2] {angle = xy--O--Y};

    % draw triangle
    \draw[very thick] (O) -- (xy);

{% endtikz %}
</center>

First, we prove the identity for cosine.

$$
\begin{align}
    \cos(\pi/2 - \theta) 
    &= \cos(\pi/2)\cos(\theta) + \sin(\pi/2)\sin(\theta) \\[10pt]
    &= 0 \cdot \cos(\theta) + 1 \cdot \sin(\theta) \\[10pt]
    &= \sin(\theta)
\end{align}
$$

Then, we use this result to prove the identity for sine.

$$
\begin{align}
    \sin(\pi/2 - \theta)
    &= \cos(\pi/2 - (\pi/2 - \theta)) \\[10pt]
    &= \cos(\theta)
\end{align}
$$

Now, that we've shown the result for sine and cosine, all other functions are forced using the reciprocal and ratio identities. I just assert the results below.

$$
\begin{align}
    &\sec(\pi/2 - \theta) = \csc(\theta)    \qquad&&\csc(\pi/2 - \theta) = \sec(\theta) \\[10pt]
    &\tan(\pi/2 - \theta) = \cot(\theta)    \qquad&&\cot(\pi/2 - \theta) = \tan(\theta)
\end{align}
$$

These identities confirm the dual nature of $$\{ \sin \theta, \sec \theta, \tan \theta \}$$ and $$\{\cos \theta, \csc \theta, \cot \theta \}$$, as we saw in the post [Intuition of Trigonometric Functions](http://127.0.0.1:4000/blog/trigonometry/intuition-of-trig-functions/). First, on the unit circle, they are symmetric about the line $y = x$. Second, when graphing these they are really the same functions, just shifted by $90^{\circ}$.

<br>

## Supplementary Angles

The **supplement** of an angle $\theta$ is the angle that when combined $\theta$ produces a **straight angle** ($180$ degree angle), i.e. it is $180^{\circ} - \theta$.

<center>
{% tikz supplementary-angle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\angle{110}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\a{ {\r * cos(-\angle)} }
    \def\b{ {\r * sin(-\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);
    \coordinate (nX) at (-\r, 0);

    % draw the axes
    \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-0.5) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.15*\r}, angle eccentricity=1.7] {angle = X--O--xy};
    \draw pic [draw, red, ->, pic text=$180^{\circ} - \theta$, very thick, angle radius={0.25*\r}, angle eccentricity=2] {angle = xy--O--nX};

    % draw triangle
    \draw[very thick] (O) -- (xy);

{% endtikz %}
</center>

We prove this similarly to complementary angles.

$$
\begin{align}
    \cos(\pi - \theta) 
    &= \cos(\pi)\cos(\theta) + \sin(\pi)\sin(\theta) \\[10pt]
    &= -1 \cdot \cos(\theta) + 0 \cdot \sin(\theta) \\[10pt]
    &= - \cos(\theta)
\end{align}
$$

Now, we just use some clever algebra and the complementary identity for cosine.

$$
\begin{align}
    \sin(\pi - \theta) 
    &= \sin(\pi/2 - (\theta - \pi/2)) \\[10pt]
    &= \cos(\theta - \pi/2) \\[10pt]
    &= \cos(\theta)\cos(\pi/2) + \sin(\theta)\sin(\pi/2) \\[10pt]
    &= \cos(\theta) \cdot 0 + \sin(\theta) \cdot 1 \\[10pt]
    &= \sin(\theta)
\end{align}
$$

Again, since we've shown the result for sine and cosine, all other functions are forced using the reciprocal and ratio identities. I just assert the results below.

$$
\begin{align}
    &\sec(\pi - \theta) = -\sec(\theta)    \qquad&&\csc(\pi - \theta) = \csc(\theta) \\[10pt]
    &\tan(\pi - \theta) = -\tan(\theta)    \qquad&&\cot(\pi - \theta) = -\cot(\theta)
\end{align}
$$

<br>

<br>

## Opposite Angles

Recall that $\theta \equiv \theta + 2 \pi k$ for any integer $k$, and in particular $(2 \pi - \theta) \equiv - \theta$.

<center>
{% tikz opposite-angle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\angle{30}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\a{ {\r * cos(-\angle)} }
    \def\b{ {\r * sin(-\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);
    \coordinate (a) at (\a, 0);
    \coordinate (b) at (0, \b);
    \coordinate (ab) at (\a, \b);

    % draw the axes
    \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.25] {angle = x--O--xy};
    \draw pic [draw, red, <-, pic text=$-\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.25] {angle = ab--O--a};

    % draw triangle
    \draw[very thick] (O) -- (x) node[midway, below, xshift=15] {$x$};
    \draw[very thick] (O) -- (xy);
    \draw[thick] (x) -- (xy) node[midway, left] {$y$};
    \draw[very thick] (O) -- (ab);
    \draw[thick] (a) -- (ab) node[midway, left] {$-y$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$$};
    \draw[very thick, fill=black] (ab) circle (\pointradius) node[above right=0.1] at (xy) {$$};

    % draw right angle indicator of triangle
    \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1

{% endtikz %}
</center>

Using geometry and the symmetry from the figure above, the result is obvious, but let's prove it rigorously.

$$
\begin{align}
    \cos(2\pi -\theta) = \cos(-\theta) 
    &= \cos(0 - \theta) \\[10pt]
    &= \cos(0)\cos(\theta) + \sin(0)\sin(\theta) \\[10pt]
    &= 1 \cdot \cos(\theta) + 0 \cdot \sin(\theta) \\[10pt]
    &= \cos(\theta)
\end{align}
$$

Here, we use the fact that $-\pi/2 \equiv (-\pi/2 + 2 \pi) = 3\pi/2$.

$$
\begin{align}
    \sin(2\pi -\theta) = \sin(-\theta) 
    &= \cos(\pi/2 - (-\theta)) \\[10pt]
    &= \cos(\theta - (-\pi/2)) \\[10pt]
    &= \cos(\theta)\cos(-\pi/2) + \sin(\theta)\sin(-\pi/2) \\[10pt]
    &= \cos(\theta)\cos(3\pi/2) + \sin(\theta)\sin(3\pi/2) \\[10pt]
    &= \cos(\theta) \cdot 0 + \sin(\theta) \cdot (-1) \\[10pt]
    &= - \sin(\theta)
\end{align}
$$

Again, we can now assert the results for all the other functions

$$
\begin{align}
    &\sec(2\pi -\theta) = \sec(- \theta) = \sec(\theta)    \qquad&&\csc(2\pi -\theta) = \csc(- \theta) = -\csc(\theta) \\[10pt]
    &\tan(2\pi -\theta) = \tan(- \theta) = -\tan(\theta)    \qquad&&\cot(2\pi -\theta) = \cot(- \theta) = -\cot(\theta)
\end{align}
$$

<br>

These identities seem trivial, but they actually have profound results. They show that $\cos(\cdot)$ and $\sec(\cdot)$ are **even functions** while $\sin(\cdot)$, $\csc(\cdot)$, $\tan(\cdot)$, and $\cot(\cdot)$ are **odd functions**. These facts are used a lot in higher mathematics, especially when taking integrals. 