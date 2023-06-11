---
layout:     series
title:      "Squeeze Theorem"
date:       2022-01-06
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       5
series:     derivative-proofs
tags:       derivatives, squeeze-theorem
---

We don't prove any derivatives in this post, but we need these results in order to evaluate the trigonometric derivatives in the next part. We also get to showcase a very useful theorem in calculus.

<br>

## The Statement of the Squeeze Theorem

Let $a \leq c \leq b$. Suppose $g(x) \leq f(x) \leq h(x)$ for all $x \in (a, c) \cup (c, b)$. Then

$$
\lim_{x \rightarrow c} g(x) \leq \lim_{x \rightarrow c} f(x) \leq \lim_{x \rightarrow c} h(x)
$$

<br>

A corollary to the theorem is that if $\displaystyle \lim_{x \rightarrow c} g(x) = \lim_{x \rightarrow c} h(x) = L$, the $\displaystyle \lim_{x \rightarrow c} f(x) = L$.

Intuitively, $g(x)$ serves as a lower-bound and $h(x)$ an upper-bound for $f(x)$ in the neighborhood around $c$. Thus, these bounds are preserved in the limit. Thus, if the limits are equal, the upper and lower-bound _squeeze_ the limit of $f$ to a single number.

<br>

## Applying the Squeeze Theorem

First, we use the squeeze theorem to compute $\displaystyle \lim_{x \rightarrow 0} \frac{\sin x}{x}$. Notice that direct substitution yields $\frac{0}{0}$, which does not give us any information on the actual value of the limit.

The proof hinges on the inequality, $\displaystyle \cos x \leq \frac{\sin x}{x} \leq 1$ for all $x \in (-\frac{\pi}{2}, 0) \cup (0, \frac{\pi}{2})$. Then, we just apply the squeeze theorem to see that

$$
\begin{align}
    &\lim_{x \rightarrow 0} \cos x &\leq& \quad \lim_{x \rightarrow 0} \frac{\sin x}{x} &\leq& \quad \lim_{x \rightarrow 0} 1 \\[10pt]
    &1 &\leq& \quad \lim_{x \rightarrow 0} \frac{\sin x}{x} &\leq& \quad 1
\end{align} 
$$

Therefore, $\displaystyle \lim_{x \rightarrow 0} \frac{\sin x}{x} = 1$.

Now all that is left is to prove the original inequality. Consider the following construction on a unit circle. From this, we obtain three areas. Please refer to [this post](/blog/trigonometry/intuition-of-trig-functions/) for how the heights of the top and bottom triangles are derived. Hint: use the definitions of the trigonometric functions and similar triangles.

<center>
{% tikz unit-circle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{3.5cm}
  \def\angle{35}
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
  \coordinate (X) at (\r, 0);
  \draw pic[draw, red, ->, pic text=$x$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};

  % drawing lines
  \coordinate (T) at (\r, {\r * tan(\angle)});
  \draw[very thick] (O) -- (T);
  \draw[very thick] (xy) -- (X);
  \draw[thick, dashed] (xy) -- (x) node[below] {$$};
  \draw[very thick] (X) -- (T) node[midway, right] {$$};

  % draw right angle indicator of triangle
  % I wanted to automate this so that I can vary \x and \y and this will be the right way around
  % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
  \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1

  % circle intersection point
  \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$$};

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz areas %}
  \usetikzlibrary{angles,patterns,calc}
  \usetikzlibrary{decorations.pathreplacing,intersections}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{3.5cm}
  \def\angle{35}
  \def\x{ {\r * cos(\angle)} }
  \def\y{ {\r * sin(\angle)} }
  \def\pointradius{0.02*\r}

  \coordinate (O) at (0,0);
  \coordinate (x) at (\x, 0);
  \coordinate (y) at (0, \y);
  \coordinate (xy) at (\x, \y);
  \coordinate (X) at (\r, 0);
  \coordinate (Y) at (0, \r);

  %% AREA 1
  % draw incident angle of triangle
  \draw pic[draw, red, ->, pic text=$x$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};

  % drawing lines
  \coordinate (T) at (\r, {\r * tan(\angle)});
  \draw[very thick] (O) -- (xy);
  \draw[very thick] (xy) -- (X);
  \draw[thick, dashed] (xy) -- (x) node[below] {$$};
  \draw[very thick] (O) -- (X);

  % draw right angle indicator of triangle
  % I wanted to automate this so that I can vary \x and \y and this will be the right way around
  % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
  \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1

  \def\eps{1mm}
  \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};
  \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\r, \eps) -- (\r, {\y-\eps}) node [midway, xshift=30pt, yshift=0pt]{$\sin x$};


  %% AREA 2
  \def\shift2{2.5cm}
  \coordinate (O2) at (0,\shift2);
  \coordinate (x2) at (\x, \shift2);
  \coordinate (y2) at (0, {\y+\shift2});
  \coordinate (xy2) at (\x, {\y+\shift2});
  \coordinate (X2) at (\r, \shift2);
  \coordinate (Y2) at (0, {\r+\shift2});

  \draw pic[draw, black, -, pic text=$$, very thick, angle radius={\r}] {angle = X2--O2--xy2};
  \draw[very thick] (O2) -- (xy2) node[midway, xshift=5pt, yshift=15pt] {$1$};
  \draw[very thick] (O2) -- (X2) node[midway, xshift=10pt, yshift=10pt] {$1$};
  \draw pic[draw, red, ->, pic text=$x$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X2--O2--xy2};


  %% AREA 3
  \def\shift3{5cm}
  \coordinate (O3) at (0,\shift3);
  \coordinate (x3) at (\x, \shift3);
  \coordinate (y3) at (0, {\y+\shift3});
  \coordinate (xy3) at (\x, {\y+\shift3});
  \coordinate (X3) at (\r, \shift3);
  \coordinate (Y3) at (0, {\r+\shift3});
  \coordinate (T3) at (\r, {\r * tan(\angle) + \shift3});

  \draw[very thick] (O3) -- (X3) node[midway, xshift=15pt, yshift=10pt] {$1$};
  \draw[very thick] (X3) -- (T3) node[midway, xshift=20pt] {$\tan x$};
  \draw[very thick] (O3) -- (T3);
  \draw pic[draw, red, ->, pic text=$x$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X3--O3--xy3};


{% endtikz %}
</center>

<br>

Label the three areas $A_1$, $A_2$, and $A_3$ from bottom to top. We apply the appropriate area formulas to see that 

$$
\begin{align}
    &A_1 &\quad=\quad& \frac{1}{2}bh &\quad=\quad& \frac{1}{2} \cdot 1 \cdot \sin x &\quad=\quad& \frac{1}{2} \sin x \\[10pt]
    &A_2 &\quad=\quad& \frac{1}{2} r^2 \theta &\quad=\quad& \frac{1}{2} \cdot 1^2 \cdot x &\quad=\quad& \frac{1}{2} x\\[10pt]
    &A_3 &\quad=\quad& \frac{1}{2}bh &\quad=\quad& \frac{1}{2} \cdot 1 \cdot \tan x &\quad=\quad& \frac{1}{2} \tan x
\end{align}
$$

Clearly, $A_1 \leq A_2 \leq A_3$, since each area can be contained inside the other. Therefore,

$$
\begin{align}
    &A_1 \leq A_2 \leq A_3 \\[10pt]
    &\frac{1}{2} \sin x \leq \frac{1}{2}x \leq \frac{1}{2} \tan x \\[10pt]
    &\sin x \leq x \leq \tan x
\end{align}
$$

Now, this is only true on the interval, $(0, \frac{\pi}{2})$, since outside this interval, our geometric argument breaks down. Observe that $\sin x$, $x$, and $\tan x$ are all odd functions. Recall that any odd function $f$ has the property that $f(-x) = -f(x)$. Therefore,

$$
\begin{align}
    &\sin x \leq x \leq \tan x\\[10pt]
    &-\sin x \geq -x \geq -\tan x\\[10pt]
    &\sin (-x) \geq -x \geq \tan (-x) \\
\end{align}
$$

Thus, we get the following result

$$
\begin{cases}
    \sin x \leq x \leq \tan x &\qquad\text{if } 0 < x < \frac{\pi}{2} \\
    \sin x \geq x \geq \tan x &\qquad\text{if } -\frac{\pi}{2} < x < 0
\end{cases}
$$

Divide all parts of the equations by $\sin(x)$. Notice, that in the case where $-\frac{\pi}{2} < x < 0$, this value is always negative and thus the inequality will flip. Thus, both cases will be the same, and we get this result for all $x \in (-\frac{\pi}{2}, 0) \cup (0, \frac{\pi}{2})$.

$$
\begin{align}
    &1 \leq \frac{x}{\sin x} \leq \frac{1}{\cos x}\\[10pt]
    &1 \geq \frac{\sin x}{x} \geq \cos x
\end{align}
$$

Which is the result we needed to prove. Below is a graphical representation of this proof. We can see how the light blue line is bounded by the other two lines in the neighborhood around $0$.

<center>
{% tikz squeeze-1 %}
    \usetikzlibrary{angles,patterns,calc}

    \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}

    % axes
    \draw[->, thick] (-2, 0) -- (2, 0) node[right] {$x$};
    \draw[->, thick] (0, -2) -- (0, 2) node[above] {$$};
    \draw[scale=1, domain=-2:2, smooth, variable=\x, red, thick] plot ({\x}, {sin(180 * 0.318309887 * \x)});
    \draw[scale=1, domain=-1.8:1.8, smooth, variable=\x, cyan, thick] plot ({\x}, {\x});
    \draw[scale=1, domain=-1.1:1.1, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz squeeze-2 %}
    \usetikzlibrary{angles,patterns,calc}

    \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}

    % axes
    \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$x$};
    \draw[->, thick] (0, -2) -- (0, 2) node[above] {$$};
    \draw[scale=1, domain=-4:4, smooth, variable=\x, red, thick] plot ({\x}, {1});
    \draw[scale=1, domain=-4:4, smooth, variable=\x, cyan, thick, samples=500] plot ({\x}, {sin(180 * 0.318309887 * \x)/\x});
    \draw[scale=1, domain=-4:4, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {cos(180 * 0.318309887 * \x)});
{% endtikz %}
</center>

<br>

## Corollary

As a corollary, we can compute $\displaystyle \lim_{x \rightarrow 0} \frac{1 - \cos x}{x}$. Notice that direct substitution yields $\frac{0}{0}$, which does not give us any information on the actual value of the limit.

$$
\begin{align}
    \lim_{x \rightarrow 0} \frac{1 - \cos x}{x} 
    &= \lim_{x \rightarrow 0} \frac{1 - \cos x}{x} \cdot \frac{1 + \cos x}{1 + \cos x} \\[10pt]
    &= \lim_{x \rightarrow 0} \frac{1 - \cos^2 x}{x(1 + \cos x)} \\[10pt]
    &= \lim_{x \rightarrow 0} \frac{\sin^2 x}{x(1 + \cos x)} \\[10pt]
    &= \left ( \lim_{x \rightarrow 0} \frac{\sin x}{x} \right ) \left ( \lim_{x \rightarrow 0} \frac{\sin x}{1 + \cos x} \right ) \\[10pt]
    &= 1 \cdot \frac{0}{1+1} \\[10pt]
    &= 0
\end{align}
$$