---
layout:     series
title:      "Introduction"
date:       2022-08-01
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       0
series:     trigonometry
tags:       trigonometry, angle, radians, degrees, definitions
---

## Purpose of this Series

In this series, I will be proving all of the trigonometric identities. I've found that the higher you go in mathematics, the more useful these identities become, as $\sin$ and $\cos$ are intimately related to $e$ and complex numbers.

I feel that because trigonometry is taught at a young age and is relatively simple compared to higher mathematics, there is often a lack of rigor in explanations. In this series, I want to derive all the trigonometric identities from first principles in a logical manner. Also, I hope to provide some beautiful and informative diagrams.

<br>

## Definition of an Angle

Intuitively, an **angle** between two lines that share one endpoint is the distance between them. However, the "distance between the lines" increases as you move farther away from the shared point as the figure below shows.

<center>
{% tikz angle-between-two-lines%}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (0, 0);
    \coordinate (B) at (5, 2);
    \coordinate (C) at (3, 4);

    \draw pic [draw, red, ->, pic text=$\theta_1$, very thick, angle radius={1cm}, angle eccentricity=1.4] {angle = B--A--C};
    \draw pic [draw, red, ->, pic text=$\theta_2$, very thick, angle radius={3cm}, angle eccentricity=1.15] {angle = B--A--C};

    \draw[very thick, ->] (A) -- (B);
    \draw[very thick, ->] (A) -- (C);
    \draw[very thick, fill=black] (A) circle (1mm);
{% endtikz %}
</center>

Thus, we need to do some normalization to have a consistent measure. First, rotate the lines until one of them is purely horizontal and pointing to the right. Then, to normalize the "distance between the lines" we consider a circle of radius $1$ centered at the shared point. This is called the **unit circle**. The **angle** between the lines is defined as **the length of the arc of this circle** between these two lines in the **counter-clockwise** direction. See the figures below.

<center>
{% tikz Q1angle%}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{2cm}
    \def\angle{30}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.04*\r}
    \def\linelength{2.5cm}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw origin point
    \draw[very thick, fill=black] (O) circle (\pointradius);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={\r}, angle eccentricity=1.2] {angle = X--O--xy};

    % draw lines
    \draw[very thick, ->] (O) -- (\linelength, 0);
    \draw[very thick, ->] (O) -- ({\linelength * cos(\angle)}, {\linelength * sin(\angle)});

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};
{% endtikz %}
&emsp;&emsp;
{% tikz Q2angle%}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{2cm}
    \def\angle{120}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.04*\r}
    \def\linelength{2.5cm}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw origin point
    \draw[very thick, fill=black] (O) circle (\pointradius);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={\r}, angle eccentricity=1.2] {angle = X--O--xy};

    % draw lines
    \draw[very thick, ->] (O) -- (\linelength, 0);
    \draw[very thick, ->] (O) -- ({\linelength * cos(\angle)}, {\linelength * sin(\angle)});

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};
{% endtikz %}
&emsp;&emsp;
{% tikz Q3angle%}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{2cm}
    \def\angle{240}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.04*\r}
    \def\linelength{2.5cm}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw origin point
    \draw[very thick, fill=black] (O) circle (\pointradius);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={\r}, angle eccentricity=1.2] {angle = X--O--xy};

    % draw lines
    \draw[very thick, ->] (O) -- (\linelength, 0);
    \draw[very thick, ->] (O) -- ({\linelength * cos(\angle)}, {\linelength * sin(\angle)});

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=20pt]{$1$};
{% endtikz %}
&emsp;&emsp;
{% tikz Q4angle%}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{2cm}
    \def\angle{330}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.04*\r}
    \def\linelength{2.5cm}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw origin point
    \draw[very thick, fill=black] (O) circle (\pointradius);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={\r}, angle eccentricity=1.2] {angle = X--O--xy};

    % draw lines
    \draw[very thick, ->] (O) -- (\linelength, 0);
    \draw[very thick, ->] (O) -- ({\linelength * cos(\angle)}, {\linelength * sin(\angle)});

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=20pt]{$1$};
{% endtikz %}
</center>

<br>

Why do we choose counter-clockwise and not clockwise? Ultimately, this convention comes from the convention that rightward and upward are positive. Rightward being considered positive most likely comes from the fact that western languages write left-to-right. Upward being considered positive most likely comes from gravity.

<br>

## Units of an Angle

The above definition of an angle gives a length in the units of **radians**. Another commonly used unit for measuring angles is **degrees**, which are defined as follows.

$$
\theta_{deg} = \frac{180}{\pi} \cdot \theta_{rad}
$$

Recall the circumference of a circle is $2 \pi r$. Thus, there are $2 \pi$ radians and $360$ degrees in a circle. Thus, an angle will always be in the interval $[0, 2\pi)$ radians or $[0, 360)$ degrees. Given an angle outside this range, we can always normalize it to be within the interval by adding or subtracting $2 \pi k$ for some integer $k$. Intuitively, this is akin to saying if you walk all the way around the circle, you are back to where you started and thus it's like you didn't move. We can summarize the above with the following statement.

$$
\theta \equiv \theta + 2 \pi k \qquad k \in \mathbb{Z}
$$

Here, $\equiv$ means _equivalent_, but not necessarily equal. For the purposes of trigonometry, equivalent angles are indistinguishable.

<br>

## Trigonometric Function Definitions

Now, consider the Cartesian plane. Place a circle with radius $r$ centered at the origin, $(0, 0)$. Extend a line from the origin with an angle $\theta$. This line intersects the circumference of the circle at some unique point. This point is described by the coordinates $(x, y)$. See the figures below.

<center>
{% tikz Q1circle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
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

    % draw the axes
    \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

    % draw the unit circle
    \draw[very thick] (O) circle (\r);

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = x--O--xy};

    % draw triangle
    \draw[very thick] (O) -- (x) node[midway, below] {$x$};
    \draw[very thick] (x) -- (xy) node[midway, left] {$y$};
    \draw[very thick] (O) -- (xy) node[midway, above] {$r$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$(x, y)$};

    % draw right angle indicator of triangle
    % I wanted to automate this so that I can vary \x and \y and this will be the right way around
    % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
    \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
    %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz Q2circle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\angle{120}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
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
    \draw pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};

    % draw triangle
    \draw[very thick] (O) -- (x) node[midway, below] {$x$};
    \draw[very thick] (x) -- (xy) node[midway, left] {$y$};
    \draw[very thick] (O) -- (xy) node[midway, above right] {$r$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above left=0.1] at (xy) {$(x, y)$};

    % draw right angle indicator of triangle
    % I wanted to automate this so that I can vary \x and \y and this will be the right way around
    % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
    %\draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
    \draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
    %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

{% endtikz %}
</center>

Notice that each pair $(r, \theta)$ uniquely defines a pair $(x, y)$ and vice versa. Trigonometry provides the link between $(r, \theta)$ and $(x, y)$. In particular, we look at the ratios between $x$, $y$, and $r$. There are six possible ratios and each of them is designated a function.

$$
\begin{align}

    &\cos(\theta) := \frac{x}{r}   \qquad\qquad &&\sec(\theta) := \frac{r}{x} \\[10pt]

    &\sin(\theta) := \frac{y}{r}    \qquad\qquad &&\csc(\theta) := \frac{r}{y} \\[10pt]
    
    &\tan(\theta) := \frac{y}{x}    \qquad\quad &&\cot(\theta) := \frac{x}{y}

\end{align}
$$

The origin and meanings of these functions will be discussed in the next post.

<br>

## Notation

Differentiating between the units _degrees_ and _radians_ can often be done just by context. Radians tend to have a factor of $\pi$ while degrees tend to be larger numbers. However, in order to minimize confusion, I will use the symbol $^{\circ}$ when the angle is in degrees. If the angle is in radians, then there will be no symbol. For example, $\cos(30^{\circ}) = \cos(\pi / 6)$.

Another bit of weird notation that is standard in trigonometry is that $\sin^2 \theta := (\sin \theta)^2$. This notation is also used for all other trigonometric functions and any exponent.