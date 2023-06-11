---
layout:     series
title:      "Hyperbolic Trigonometric Functions"
date:       2022-08-20
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       19
series:     trigonometry
tags:       trigonometry, hyperbolic, hyperbola
---

**TODO**

## Definition of Hyperbolic Trigonometric Functions

<center>
{% tikz regular-unit-circle %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{3.5cm}
    \def\angle{30}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = x--O--xy};

    % draw triangle
    \draw[very thick] (O) -- (xy) node[midway, above] {$$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$(\cos \theta, \ \sin \theta)$};

    % draw the axes
    \draw[->] ($ (-\r,0) - (1cm, 0) $) -- ($ (\r, 0cm) + (1cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 1cm) $) -- ($ (0,\r) + (0, 1cm) $) node[above] {$$};

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};

{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz hyperbolic-unit-circle %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{3.5cm}
    \def\angle{80 * 0.017453293}
    \def\x{ {cosh(\angle)} }
    \def\y{ {sinh(\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    \fill[red!50, domain=0:1.39626344, variable=\a] 
        (0, 0) -- (1cm, 0) -- plot ({cosh(\a)}, {sinh(\a)}) -- cycle;
    \fill[red!50, domain=0:1.39626344, variable=\a] 
        (0, 0) -- (1cm, 0) -- plot ({cosh(\a)}, {-sinh(\a)}) -- cycle;

    % draw the unit hyperbola
    \draw[scale=1, domain=1:4, samples=500, smooth, variable=\a, very thick] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=1, domain=1:4, samples=500, smooth, variable=\a, very thick] plot ({\a}, {-sqrt(\a*\a-1)});
    \draw[scale=1, domain=-4:-1, samples=500, smooth, variable=\a, very thick] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=1, domain=-4:-1, samples=500, smooth, variable=\a, very thick] plot ({\a}, {-sqrt(\a*\a-1)});

    \node[red] at (1.5cm, 0.3cm) {$\alpha$};

    % draw incident angle of triangle
    %\draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = x--O--xy};

    % draw triangle
    \draw[very thick] (O) -- (xy) node[midway, above] {$$};
    \draw[very thick] (O) -- (\x, -\y) node[midway, above] {$$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[right, xshift=2] at (xy) {$(\cosh \alpha, \ \sinh \alpha)$};

    % draw the axes
    \draw[->] ($ (-\r,0) - (1cm, 0) $) -- ($ (\r, 0cm) + (1cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 1cm) $) -- ($ (0,\r) + (0, 1cm) $) node[above] {$$};

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] ({-1cm+\eps}, 0) -- (-\eps, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};

{% endtikz %}
</center>

Similar to how the trigonometric functions parameterize the coordinates on a circle, the hyperbolic trigonometric functions parameterize the coordinates on a hyperbola.

$$
\begin{align}
    &x^2 + y^2 = r^2  &\qquad\qquad&  (r \cos \theta, \ r \sin \theta) \qquad \theta \in [0, 2\pi) \\[15pt]
    &x^2 - y^2 = r^2  &\qquad\qquad&  (r \cosh \alpha, \ r \sinh \alpha) \qquad \alpha \in (\infty, \infty)
\end{align}
$$

<br>

## Relation to the Regular Trigonometric Functions

$$
\begin{align}
    &\sinh x = -i \sin (i x) &\qquad\qquad& \color{black}{\text{sech}} \ x = \sec (i x) \\[10pt]
    &\cosh x = \cos (i x) &\qquad\qquad& \color{black}{\text{csch}} \ x = i \csc (i x) \\[10pt]
    &\tanh x = -i \tan (i x) &\qquad\qquad& \coth x = i \cot (i x)
\end{align}
$$

Now, all properties and identities of the hyperbolic trigonometric functions can be easily derived from the regular trigonometric functions. 