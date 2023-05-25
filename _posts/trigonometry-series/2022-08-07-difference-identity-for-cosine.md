---
layout:     series
title:      "Difference Identity for Cosine"
date:       2022-08-07
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       6
series:     trigonometry
tags:       trigonometry, double-angle, cosine
---

We have to prove things in a bit of a funny order. First, we will prove the difference identity for cosine. Then we will detour to opposite angles, complementary angles, and supplementary angles. Finally, we will return to prove the remaining sum and difference identities.

<br>

## The Euclidean Distance Formula

For this proof, we need to be able to find the straight-line distance between two points on the 2D plane. Doing this is just a simple application of the Pythagorean Theorem. 

<center>
{% tikz distance-formula %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }
    
    \def\pointradius{0.08cm}
    \coordinate (c1) at (8, 2);
    \coordinate (c2) at (3, 4);

    % draw the axes
    \draw[->] (-0.5, 0) -- (10, 0) node[right] {$$};
    \draw[->] (0, -0.5) -- (0, 5) node[above] {$$};

    % draw points
    \draw[very thick, fill=black] (c1) circle (\pointradius) node[xshift=25, yshift=10] {$(x_1, y_1)$};
    \draw[very thick, fill=black] (c2) circle (\pointradius) node[xshift=-15, yshift=15] {$(x_2, y_2)$};

    % draw connecting line
    \draw[-, very thick] (c1) -- (c2) node[midway, above] {$d$};

    % dashed lines
    \draw[dashed] (8, 0) -- (c1);
    \draw[dashed] (0, 2) -- (c1);
    \draw[dashed] (3, 0) -- (c2);
    \draw[dashed] (0, 4) -- (c2);

    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt,mirror},yshift=0pt] ($(3, 2) + (\eps, 0)$) -- ($(8, 2) - (\eps, 0)$) node [midway, xshift=0pt, yshift=-20pt]{$x_2 - x_1$};
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt,mirror},yshift=0pt] ($(3, 4) - (0, \eps)$) -- ($(3, 2) + (0, \eps)$) node [midway, xshift=-40pt, yshift=0pt]{$y_2 - y_1$};

{% endtikz %}
</center>

<br>

Thus, $d^2 = (y_2 - y_1)^2 + (x_2 - x_1)^2$ or $d = \sqrt{ (y_2 - y_1)^2 + (x_2 - x_1)^2 }$. This is called the **Euclidean distance formula**.

<br>

## Derivation

Consider any isosceles triangle centered on the unit circle (left figure). Rotate this triangle so that one edge lies on the x-axis (right figure).

<center>
{% tikz triangle1 %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\pointradius{0.02*\r}

    \def\varalpha{120}
    \def\x{ {\r * cos(\varalpha)} }
    \def\y{ {\r * sin(\varalpha)} }
    
    \def\varbeta{40}
    \def\a{ {\r * cos(\varbeta)} }
    \def\b{ {\r * sin(\varbeta)} }

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (a) at (\a, 0);
    \coordinate (a) at (0, \b);
    \coordinate (ab) at (\a, \b);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the axes
    \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw incident angle of triangle
    \pic [draw, red, ->, pic text=$\beta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--ab};
    \pic [draw, red, ->, very thick, angle radius={0.2*\r}, angle eccentricity=1.3] {angle = X--O--xy};
    \pic [draw, red, pic text=$\alpha$, angle radius={0.2*\r}, angle eccentricity=1.5] {angle = ab--O--xy};

    % draw triangle
    \draw[very thick] (O) -- (ab) node[midway, xshift=20pt, yshift=5] {$1$};
    \draw[very thick] (ab) -- (xy) node[midway, above] {$d$};
    \draw[very thick] (O) -- (xy) node[midway, xshift=-10pt, yshift=5pt] {$1$};

    % triangle endpoints
    \draw[very thick, fill=black] (O) circle (\pointradius);
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[xshift=-30, yshift=15] {$(\cos \alpha, \sin \alpha)$};
    \draw[very thick, fill=black] (ab) circle (\pointradius) node[xshift=30, yshift=15] {$(\cos \beta, \sin \beta)$};
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz triangle2 %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\varalpha{80}
    \def\x{ {\r * cos(\varalpha)} }
    \def\y{ {\r * sin(\varalpha)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the axes
    \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw incident angle of triangle
    \pic [draw, red, ->, pic text=$\alpha-\beta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.7] {angle = X--O--xy};

    % draw triangle
    \draw[very thick] (O) -- (X) node[midway, below] {$1$};
    \draw[very thick] (X) -- (xy) node[midway, xshift=5pt, yshift=7pt] {$d$};
    \draw[very thick] (O) -- (xy) node[midway, xshift=-3pt, yshift=30pt] {$1$};

    % triangle endpoints
    \draw[very thick, fill=black] (O) circle (\pointradius);
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[xshift=80, yshift=10] {$(\cos(\alpha - \beta), \sin(\alpha - \beta))$};
    \draw[very thick, fill=black] (X) circle (\pointradius) node[below right] {$(1, 0)$};

{% endtikz %}
</center>

Since the triangles are congruent, the side length $d$ must be the same between the two. Thus, we will calculate $d$ in two different ways using the Euclidean distance formula.

Per the left figure, 

$$
d_{\text{left}} = \sqrt{(\cos \alpha - \cos \beta)^2 + (\sin \alpha - \sin \beta)^2}
$$

Per the right figure,

$$
d_{\text{right}} = \sqrt{(\cos (\alpha -\beta) - 0)^2 + (\sin (\alpha - \beta) - 1)^2}
$$

$$
\begin{align}
    d_{\text{left}} &= d_{\text{right}} \\[10pt]
    d_{\text{left}}^2 &= d_{\text{right}}^2 \\[10pt]
    (\cos \alpha - \cos \beta)^2 + (\sin \alpha - \sin \beta)^2 &= (\cos (\alpha -\beta) - 1)^2 + (\sin (\alpha - \beta) - 0)^2 \\[10pt]
    \cos^2 \alpha - 2 \cos \alpha \cos \beta + \cos^2 \beta + \sin^2 \alpha - 2 \sin \alpha \sin \beta + \sin^2 \beta &= \cos^2 (\alpha -\beta) - 2 \cos (\alpha - \beta) + 1 + \sin^2 (\alpha -\beta) \\[10pt]
    (\cos^2 \alpha + \sin^2 \alpha) + (\cos^2 \beta + \sin^2 \beta) - 2 \cos \alpha \cos \beta - 2 \sin \alpha \sin \beta &= (\cos^2 (\alpha -\beta) + \sin^2 (\alpha -\beta)) + 1 - 2 \cos (\alpha - \beta) \\[10pt]
    1 + 1 - 2 \cos \alpha \cos \beta - 2 \sin \alpha \sin \beta &= 1 + 1 - 2 \cos (\alpha - \beta) \\[10pt]
    - 2 \cos \alpha \cos \beta - 2 \sin \alpha \sin \beta &= - 2 \cos (\alpha - \beta) \\[10pt]
    \cos \alpha \cos \beta + \sin \alpha \sin \beta &= \cos (\alpha - \beta)
\end{align}
$$

Thus, we have shown 

$$
\boxed{\cos (\alpha - \beta) = \cos \alpha \cos \beta + \sin \alpha \sin \beta}
$$