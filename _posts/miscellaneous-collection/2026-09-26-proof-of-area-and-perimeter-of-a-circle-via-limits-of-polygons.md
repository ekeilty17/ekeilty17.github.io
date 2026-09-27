---
layout:     post
title:      "Proof of the Area and Perimeter of a Circle via Limits of Polygons"
date:       2026-09-26
categories: blog
permalink:  ":categories/:title/"
series:     miscellaneous
tags:       circles, limits
---

## Motivation

This is a cute proof that probably every mathematician does at some point in their life. I was stuck on a long flight, so I decided to write this post.

## Proof Strategy

We will approximate a circle using a regular $n$-gon. We will determine the formula for the area and perimeter of this regular $n$-gon as a function of $n$. Then we will take the limit as $n \rightarrow \infty$ to obtain the area and perimeter of a circle.

<center>
<div class="overflow-container">
<div class="overflow-content">
{% tikz 6-gon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{6}                    % just have to change this and everything else works
  \def\m{5}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\rotate{0}
  \def\r{2cm}
  \def\pointradius{0.05}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % draw circle
  \draw[color=black, thick] (O) circle (\r);

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \edef\xshift{ {15 * cos(\i * \angle + \rotate)} }
    \edef\yshift{ {15 * sin(\i * \angle + \rotate)} }
    \draw[color=black, fill=black] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz 10-gon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{10}                    % just have to change this and everything else works
  \def\m{9}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\rotate{0}
  \def\r{2cm}
  \def\pointradius{0.05}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % draw circle
  \draw[color=black, thick] (O) circle (\r);

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \edef\xshift{ {15 * cos(\i * \angle + \rotate)} }
    \edef\yshift{ {15 * sin(\i * \angle + \rotate)} }
    \draw[color=black, fill=black] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz 25-gon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{25}                    % just have to change this and everything else works
  \def\m{24}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\rotate{0}
  \def\r{2cm}
  \def\pointradius{0.05}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % draw circle
  \draw[color=black, thick] (O) circle (\r);

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \edef\xshift{ {15 * cos(\i * \angle + \rotate)} }
    \edef\yshift{ {15 * sin(\i * \angle + \rotate)} }
    \draw[color=black, fill=black] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
</div>
</div>
</center>

<br>

## Geometric Derivation

Consider the following diagram. 

<center>
{% tikz n-gon-diagram %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{5}                    % just have to change this and everything else works
  \def\m{4}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\rotate{-54}
  \def\r{3.5cm}
  \def\pointradius{0.05}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % draw circle
  \draw[color=black, thick] (O) circle (\r);

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \edef\xshift{ {15 * cos(\i * \angle + \rotate)} }
    \edef\yshift{ {15 * sin(\i * \angle + \rotate)} }
    \draw[color=black, fill=black] (\x, \y) circle (\pointradius);
  }

  \draw[color=black, fill=black] (O) circle (\pointradius);

  \coordinate (A) at ({\r * cos(4 * \angle + \rotate)}, {\r * sin(4 * \angle + \rotate)});
  \coordinate (B) at ({\r * cos(5 * \angle + \rotate)}, {\r * sin(5 * \angle + \rotate)});
  \coordinate (M) at ($(A)!0.5!(B)$);
  \draw pic[draw, black, -, pic text=$\theta_n$, pic text options={anchor=east, xshift=3.5pt, yshift=-4.5pt}, very thick, angle radius={0.5cm}, angle eccentricity=1.3] {angle = A--O--B};
  \draw[color=black, very thick] (O) -- (A);
  \draw[color=black, very thick] (O) -- (B);
  \draw[color=black, very thick, dashed] (O) -- (M) node[midway, below right] {$h_n$};

  \draw ($(M) + (0.25, 0)$) -- ++(0, 0.25) -- ++(-0.25,0);
  \draw (A) -- node[midway, below, text=blue] {$s_n$} (B);
  \draw (O) -- node[midway, above left] {$r$} (A);
  \draw (O) -- node[midway, above right] {$r$} (B);

{% endtikz %}
</center>

Notice that the _radius_ of the regular $n$-gon does not change with $n$. Therefore, we can treat it as constant. This is not true for the _central angle_, _side length_, and _altitude_ ($\theta_n$, $s_n$, and $h_n$ respectively). These values vary with $n$ and we must treat them accordingly. 

The central angle is a simple calculation as it only depends on $n$. Since there are $2\pi$ radians in a circle, it can be sub-divided into $n$ triangles each with central angle $\theta_n$. Therefore, $n \cdot \theta_n = 2 \pi$ and we get

$$
\theta_n = \frac{2 \pi}{n}
$$

The side length and altitude of the triangle depends on both $n$ and $r$. We can compute these using trigonometry on the half-triangle.

$$
\frac{s_n}{2} = r \sin \left ( \frac{\theta_n}{2} \right )
\qquad\qquad
h_n = r \cos \left ( \frac{\theta_n}{2} \right )
$$

### Perimeter Formula

By definition, the perimeter is the sum of all side lengths. Since this is a regular $n$-gon, all side-lengths are equal to $s_n$.

$$
P_n = n \cdot s_n = 2r \cdot n \sin \left ( \frac{\pi}{n} \right )
$$

Now, we take the limit as $n \rightarrow \infty$. This relies on the fact that $\lim_{n \rightarrow \infty} n \sin \left ( \frac{\pi}{n} \right ) = \pi$ which I justify in the lemmas section.

$$
P 
= \lim_{n \rightarrow \infty} P_n 
= 2r \cdot \lim_{n \rightarrow \infty} n \sin \left ( \frac{\pi}{n} \right ) 
= 2r \cdot \pi
$$

Therefore

$$
P = 2 \pi r
$$

as desired.

### Area Formula

First, we compute the area of the sub-triangle.

$$
A_{\triangle_n} = \tfrac{1}{2} s_n h_n = r^2 \sin \left ( \frac{\theta_n}{2} \right ) \cos \left ( \frac{\theta_n}{2} \right ) = \tfrac{1}{2} r^2 \sin \theta_n
$$

Substituting for $\theta_n$

$$
A_{\triangle_n} = \tfrac{1}{2} r^2 \sin \left ( \frac{2\pi}{n} \right )
$$

Finally, the $n$-gon can be sub-divided into $n$ congruent triangles. Therefore, the total area is the sum of the area of all the sub-triangles. Since this is a regular $n$-gon, these sub-triangles all have area $A_{\triangle_n}$.

$$
A_n = n \cdot A_{\triangle_n} = \tfrac{1}{2} r^2 \cdot n \sin \left ( \frac{2\pi}{n} \right )
$$

Now, we take the limit as $n \rightarrow \infty$. This relies on the fact that $\lim_{n \rightarrow \infty} n \sin \left ( \frac{2 \pi}{n} \right ) = 2 \pi$ which I justify in the lemmas section.

$$
A
= \lim_{n \rightarrow \infty} A_n 
= \tfrac{1}{2} r^2 \cdot \lim_{n \rightarrow \infty} n \sin \left ( \frac{2\pi}{n} \right )
= \tfrac{1}{2} r^2 \cdot 2 \pi
$$

Therefore

$$
A = \pi r^2
$$

as desired.

<br>

## Lemmas

### Lemma 1

$$
\cos x \ \leq \ \frac{\sin x}{x} \ \leq \ 1
\qquad
\forall x \in (-\tfrac{\pi}{2}, 0) \cup (0, \tfrac{\pi}{2})
$$

**Proof**: There are a few ways one could prove this and it boils down to your fundamental definition of the trigonometric functions. In modern analysis, the trigonometric functions are defined by their power series expansions. Using this definition the proof is almost trivial, but I feel like a bit unsatisfying for the scope of this post. Instead, I want to use the geometric definitions of the trigonometric functions. In particular, we can draw this picture.

<center>
{% tikz unit-circle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{3cm}
  \def\angle{40}
  \def\x{ {\r * cos(\angle)} }
  \def\y{ {\r * sin(\angle)} }
  \def\pointradius{0.02*\r}

  \coordinate (O) at (0,0);
  \coordinate (x) at (\x, 0);
  \coordinate (y) at (0, \y);
  \coordinate (xy) at (\x, \y);
  \coordinate (X) at (\r, 0);
  \coordinate (Y) at (0, \r);
  \coordinate (C) at (0, {\r * sec(\angle - 90)});
  \coordinate (S) at ({\r * sec(\angle)}, 0);
  \coordinate (T) at (
    \r,
    {\r * sin(\angle) * (sec(\angle) - 1) /
    (sec(\angle) - cos(\angle))}
  );

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % draw right angle marker of triangle
  \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);

  % draw right angle marker at (xy)
  \draw
    ($(xy) + ({-0.1*\r*cos(\angle)}, {-0.1*\r*sin(\angle)})$)
    -- ($(xy) + ({-0.1*\r*cos(\angle)}, {-0.1*\r*sin(\angle)}) + ({0.1*\r*sin(\angle)}, {-0.1*\r*cos(\angle)})$)
    -- ($(xy) + ({0.1*\r*sin(\angle)}, {-0.1*\r*cos(\angle)})$);

  % draw incident angle of triangle
  \coordinate (X) at (\r, 0);
  \draw pic[draw, black, ->, pic text=$x$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};

  % draw red arc from (X) to (xy)
  \draw[very thick, red] (X) arc[start angle=0, end angle=\angle, radius=\r] node[midway, below left=0.05] {$x$};

  % drawing lines
  \draw[very thick, dashed, green!50!teal] (X) -- (T);

  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \draw[very thick] (O) -- (xy) node[midway, above=1] {$1$};
  \draw[very thick, cyan] (xy) -- (x) node[below] {$\sin(x)$};
  \draw[very thick, deepmagenta] (xy) -- (y) node[left] {$\cos(x)$};

  \draw[very thick, green!50!teal] (xy) -- (S) node[midway, right=1.5] {$\tan(x)$};
  \draw[very thick] (O) -- (S) node[midway, below] {};

  % circle intersection point
  \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$$};
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz sin-x-tan %}
    \begin{axis}[
        axis lines = middle,
        xlabel = {$x$},
        ylabel = {$y$},
        xmin = -pi/2, xmax = pi/2,
        ymin = -3, ymax = 3,
        samples = 300,
        domain = -pi/2+0.01:pi/2-0.01,
        grid = both,
        xticklabels=\empty,
        yticklabels=\empty,
        legend pos = north west,
        legend style={
            legend cell align=left,
        }
    ]

    \addplot[cyan, thick] {sin(deg(x))};
    \addlegendentry{$y=\sin x$}

    \addplot[red, thick] {x};
    \addlegendentry{$y=x$}

    \addplot[
        green!50!teal,
        thick,
        unbounded coords=jump
    ] {tan(deg(x))};
    \addlegendentry{$y=\tan x$}

    \end{axis}
{% endtikz %}
</center>

The lines for $\sin x$ and $\cos x$ come from their geometric definitions. The $\tan x$ line can be shown using similar triangles. From the diagram, is it clear that $\sin x \leq x$ for all angles $x$ in the first quadrant. 

It's not as immediately clear that $x \leq \tan x$. Consider the tangent line of the unit circle at the intersection of the x-axis (the green dashed line). Clearly this dashed line will always be shorter than its counterpart in the bottom section of the solid tangent line. Furthermore, it is now visually clear that the upper part of the solid tangent line plus the dashed line is greater than the arc $x$.

Therefore, putting this all together.

$$
x \in (0, \tfrac{\pi}{2})
\quad
\implies
\quad
\sin x \leq x \leq \tan x
\quad
\implies
\quad
1 \leq \frac{x}{\sin x} \leq \frac{1}{\cos x}
\quad
\implies
\quad
\cos x \leq \frac{\sin x}{x} \leq 1
$$

For the case of $x \in (-\tfrac{\pi}{2}, 0)$, all of the above logic will hold except everything is negative. So the inequality signs flip. But also, now $\sin x$ will be negative, so when we divide through by $\sin x$ this will also flip the inequality signs.

$$
x \in (-\tfrac{\pi}{2}, 0)
\quad
\implies
\quad
\sin x \geq x \geq \tan x
\quad
\implies
\quad
1 \leq \frac{x}{\sin x} \leq \frac{1}{\cos x}
\quad
\implies
\quad
\cos x \leq \frac{\sin x}{x} \leq 1
$$

Thus, we have prove the result for all $x \in (-\tfrac{\pi}{2}, 0) \cup (0, \tfrac{\pi}{2})$.

### Lemma 2

$$
\lim_{x \rightarrow 0} \frac{\sin x}{x} = 1
$$

**Proof**: This is a famous result from calculus I. You can very quickly derive it using [L'H&ocirc;pital's rule](https://en.wikipedia.org/wiki/L%27H%C3%B4pital%27s_rule). However, it's more commonly proved using the [squeeze theorem](https://en.wikipedia.org/wiki/Squeeze_theorem). Taking the limit as $x \rightarrow 0$ of the inequality from lemma 2 gives

$$
\begin{align}
    \lim_{x \rightarrow 0} \cos x \ \leq \ &\lim_{x \rightarrow 0} \frac{\sin x}{x} \ \leq \ \lim_{x \rightarrow 0} 1 \\[10pt]
    1 \ \leq \ &\lim_{x \rightarrow 0} \frac{\sin x}{x} \ \leq \ 1
\end{align}
$$

Therefore, the target limit must be equal to $1$. 


### Lemma 3

$$
\lim_{n \rightarrow \infty} n \cdot \sin (k/n) = k
$$

**Proof**: We make the substitution $x = \frac{k}{n}$, and utilize lemma 1

$$
\lim_{n \rightarrow \infty} n \cdot \sin (k/n) = \lim_{x \rightarrow 0} (k/x) \sin x = k \cdot \left ( \lim_{x \rightarrow 0} \frac{\sin x}{x} \right ) = k \cdot 1 = k
$$

<br>

---

## Discussion About Extension to 3 Dimensions

I wondered if a similar approach could be taken to prove the formula for the surface area and volume of a sphere. I don't think this is possible, at least not without doing something much more clever. Famously, there are only 5 platonic solids. So the idea of the limit as $n \rightarrow \infty$ of some regular $n$-hedra is out the window. 

Our only hope would be to come up with some monohedral tiling of the surface of the sphere, then we could at least do the same argument of summing over all subdivisions. The problem arises with the fact that the surface of the sphere is curved. It's really tricky to ensure that the tiling actually converges to the surface of the sphere. For example, a [bipyramid](https://en.wikipedia.org/wiki/Bipyramid) design does not approach a sphere as $n \rightarrow \infty$.

I can't say for absolutely certainty that this is impossible. There might be something clever series of cuts that you can do, but now we are deviating from the entire point of this exercise.