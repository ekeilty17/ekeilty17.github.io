---
layout:     series
title:      "Introduction"
date:       2022-01-01
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       0
series:     derivative-proofs
tags:       derivatives
---

## Purpose of this Series

In this series, I want to prove all of the main single-variable derivative relations from calculus. This has been done a thousand times in a thousand different ways, so I don't think I'm adding anything to the space. I guess this is mainly just for my own enjoyment.

I am going to keep the proofs at the level of first or second-year calculus. I don't want to get into Cauchy series, continuity, and delta-epsilon definitions. I think I will save those for a different series.

<br>

## Intuition of a Derivative

There is a precise delta-epsilon definition of a derivative, but again I don't want to get into that stuff in this series. Thus, I am going to just assert the limit definition and give a general intuition.

Often we are interested in the **rate of change** of a function. The meaning of this is exactly as the name would imply. It is a measure of how much the function is changing over some interval. Suppose $$f$$ is a function. Then the **average rate of change** between two points $a$ and $b$ is 

$$
\frac{\Delta f}{\Delta x} = \frac{f(b) - f(a)}{b - a}
$$

Geometrically, the average rate of change is the **slope of the secant line** through $f$ from $a$ and $b$.

<center>
{% tikz rate-of-change %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }
    
    \def\pointradius{0.08cm}
    \coordinate (c1) at (5, 1.5);
    \coordinate (c2) at (8, 3.048);
    \coordinate (c3) at (8, 1.5);

    % dashed lines
    \draw[dashed] (c1) -- (c3);
    \draw[dashed] (c2) -- (c3);

    % drawing braces
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt,mirror},yshift=0pt] ($(c1) + (\eps, 0)$) -- ($(c3) - (\eps, 0)$) node [midway, xshift=0pt, yshift=-20pt]{$b - a$};
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt},yshift=0pt] ($(c2) - (0, \eps)$) -- ($(c3) + (0, \eps)$) node [midway, xshift=50pt, yshift=0pt]{$f(b) - f(a)$};

    % drawing graph
    \draw[scale=1, domain=0:10, smooth, variable=\x, red, thick] plot ({\x}, {0.004*\x*\x*\x+1});

    % draw connecting line
    \draw[scale=1, domain=1:10, smooth, variable=\x, black, very thick] plot ({\x}, {0.516*\x-1.08});

    % draw the axes
    \draw[->] (-0.5, 0) -- (10, 0) node[right] {$x$};
    \draw[->] (0, -0.5) -- (0, 5) node[above] {$f(x)$};

    % draw points
    \draw[very thick, fill=black] (c1) circle (\pointradius) node[xshift=-30, yshift=15] {$(a, f(a))$};
    \draw[very thick, fill=black] (c2) circle (\pointradius) node[xshift=-20, yshift=15] {$(b, f(b))$};
{% endtikz %}
</center>

We want to define a notion of **instantaneous rate of change**, i.e. the amount a function is changing at a single point. On the surface, this doesn't make any sense. How can we define a change in $f$ if we don't have a change in $x$? We can imagine the coordinate $(b, f(b))$ sliding down the curve towards $(a, f(a))$. As it does so, the secant line approaches a line that just touches the function as a single point. This is called a **tangent line**. The **slope of the tangent line** is our instantaneous rate of change.

<center>
{% tikz instantaneous-rate-of-change %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }
    
    \def\pointradius{0.08cm}
    \coordinate (c1) at (5, 1.5);

    % drawing graph
    \draw[scale=1, domain=0:10, smooth, variable=\x, red, thick] plot ({\x}, {0.004*\x*\x*\x+1});

    % draw connecting line
    \draw[scale=1, domain=1:10, smooth, variable=\x, black, very thick] plot ({\x}, {0.3*\x});

    % draw the axes
    \draw[->] (-0.5, 0) -- (10, 0) node[right] {$x$};
    \draw[->] (0, -0.5) -- (0, 5) node[above] {$f(x)$};

    % draw points
    \draw[very thick, fill=black] (c1) circle (\pointradius) node[xshift=-30, yshift=15] {$(a, f(a))$};
{% endtikz %}
</center>

Intuitively, what we are saying is that if we zoom far enough into the point $(a, f(a))$, then the function $f$ will look like a straight line, which has a constant rate of change. Thus, the instantaneous rate of change is well-defined.

<br>

## The Definition of a Derivative

We can rigorously define this notation of "zooming in far enough" by considering a point very, very close to $(a, f(a))$. As we get closer and closer to $(a, f(a))$, the secant line will converge to a tangent line. That is the slope we are interested in. In other words, we want the limit as two points of a secant line become one point of a tangent line. There are two equivalent ways to define this.

$$
\frac{df}{dx}\bigg\rvert_{x=a} = f'(a) = \lim_{x \rightarrow a} \frac{f(x) - f(a)}{x - a} \qquad\qquad\qquad \frac{df}{dx} = f'(x) = \lim_{h \rightarrow 0} \frac{f(x+h) - f(x)}{h}
$$

Notice the different notations. I will be using both throughout the series.

In the left definition, we fix coordinate $(a, f(a))$ and we consider the secant line from that point to the point $(x, f(x))$. Then, we take the limit as $(x, f(x))$ comes closer and closer to $(a, f(a))$. In the right definition, we fix coordinate $(x, f(x))$. Then, we consider another coordinate a small distance away $(x+h, f(x+h))$ and the corresponding secant line. We see what happens as $h$ approaches $0$, and thus the secant line becomes a tangent line.

In practice, it turns out the right definition is easier to compute since we've decoupled the limit from the particular coordinate. Also, the limit of things approaching $0$ is simplier than approaching some arbitrary number $a$.

<br>

## Limit Laws

Limits have a precise and technical definition. However, I do not want to explain/prove this in the series. Thus, I will just assert these properties of limits, which we will use. Maybe I will prove them in another series.

Let $f$ and $g$ be functions. Let $c \in \mathbb{R}$ be any constant.

$$
\lim_{x \rightarrow a} (c \cdot f(x)) = c \cdot \left ( \lim_{x \rightarrow a} f(x) \right ) \\[10pt]
\lim_{x \rightarrow a} (f(x) + g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) + \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
\lim_{x \rightarrow a} (f(x) - g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) - \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
\lim_{x \rightarrow a} (f(x) \cdot g(x)) = \left ( \lim_{x \rightarrow a} f(x) \right ) \cdot \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
$$

Suppose $\lim_{x \rightarrow a} g(x) \neq 0$, then

$$
\lim_{x \rightarrow a} \frac{f(x)}{g(x)} = \frac{ \lim_{x \rightarrow a} f(x) }{ \lim_{x \rightarrow a} g(x) } \\[10pt]
$$

Let $n, m \in \mathbb{N}$ such that $m > 0$. If $m$ is even, then assume $\lim_{x \rightarrow a} f(x) > 0$.

$$
\lim_{x \rightarrow a} (f(x))^{n/m} = \left ( \lim_{x \rightarrow a} f(x) \right )^{n/m}
$$

If $f$ is continuous, then 

$$
\lim_{x \rightarrow a} f(x) = f(a) \\[10pt]
\lim_{x \rightarrow a} f(g(x)) = f \left ( \lim_{x \rightarrow a} g(x) \right ) \\[10pt]
$$

If both $f$ and $g$ are continuous, then 

$$
\lim_{x \rightarrow a} f(g(x)) = \lim_{g(x) \rightarrow g(a)} f(g(x))
$$

Suppose $f$ is a continuous two-variable function, then

$$
\lim_{x \rightarrow a} \lim_{y \rightarrow b} f(x, y) = \lim_{y \rightarrow b} \lim_{x \rightarrow a} f(x, y)
$$