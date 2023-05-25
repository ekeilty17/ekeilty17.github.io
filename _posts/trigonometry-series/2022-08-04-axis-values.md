---
layout:     series
title:      "Axis Values"
date:       2022-08-04
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       3
series:     trigonometry
tags:       trigonometry, reciprocal, ratio
---

Recall that given an $(x, y)$ coordinate on the circumference of the unit circle, by definition $x = \cos \theta$ and $y = \sin \theta$. From this, the values of the trigonometric functions on the axes are essentially given.

<center>
{% tikz unit-circle%}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\pointradius{0.02*\r}
    \coordinate (O) at (0,0);

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    \draw[very thick, fill=black] (\r, 0) circle (\pointradius) node[xshift=20, yshift=15] {$(1, 0)$};
    \draw[very thick, fill=black] (0, \r) circle (\pointradius) node[xshift=-20, yshift=10] {$(0, 1)$};
    \draw[very thick, fill=black] (-\r, 0) circle (\pointradius) node[xshift=-25, yshift=-10] {$(-1, 0)$};
    \draw[very thick, fill=black] (0, -\r) circle (\pointradius) node[xshift=25, yshift=-10] {$(0, -1)$};

    % draw the axes
    \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};
{% endtikz %}
</center>

<br>

From the above circle, we can obtain the values for $\sin$ and $\cos$. Then we can use the reciprocal and ratio identities, we can derive the rest. I won't bother doing all the tedious proofs since they are very easy. The results are summarized below.

| **angle**                 | **sin**   | **cos**   | **tan**       | **sec**       | **csc**       | **cot**       |
|:-------------------------:|:---------:|:---------:|:-------------:|:-------------:|:-------------:|:-------------:|
| $0^{\circ} = 0$           | $0$       | $1$       | $0$           | $1$           | _undefined_   | _undefined_   |
| $90^{\circ} = \pi/2$      | $1$       | $0$       | _undefined_   | _undefined_   | $1$           | $0$           |
| $180^{\circ} = \pi$       | $0$       | $-1$      | $0$           | $1$           | _undefined_   | _undefined_   |
| $270^{\circ} = 3\pi/2$    | $-1$      | $0$       | _undefined_   | _undefined_   | $1$           | $0$           |

<br>

The _undefined_ values are the result of division by zero. Depending on the context, both $+\infty$ or $-\infty$ could be reasonably assigned to these values, thus they have to remain undefined. Look back at the graphs of the trig functions in the [Intuition of Trigonometric Functions](/blog/trigonometry/intuition-of-trig-functions/) post, and notice that the asymptotes line up with the _undefined_ values.