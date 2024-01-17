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

<!-- https://betterexplained.com/articles/hyperbolic-functions/ -->

The hyperbolic trigonometric functions are kind of weird. I think the confusion lies in the fact that the notation begs you to interpret them geometrically, but most of their applications stem from the exponential definitions. Attempting to explain their geometric meaning is convoluted and does not lead to any deeper mathematical insight (unlike the standard trig functions). By contrast, their exponential definitions (which are very simple) provide their fundamental meaning, so there is no deeper truth to discover. For me, this leads to an unsatisfying feeling.

I am going to attempt to present hyperbolic trig functions in the most engaging way possible (no promises).

<br>

## The Exponential Interpretation

### Odd and Even Functions

A function $f$ is called **even** if $f(-x) = f(x) \ \forall x$. Alternatively, a function $f$ is called **odd** if $f(-x) = -f(x) \ \forall x$. Don't dwell too much on the names _even_/_odd_. Ultimately the terms come from the fact that $f_n(x) = x^n$ is even if $n$ is even and odd if $n$ is odd. There are some properties that coincide with the term and others that don't. 

Note that a function need not be even or odd. For example, $e^x$ is neither. However, given an arbitrary function $f$, we can separate it into its even and odd parts

$$
f_{\text{even}}(x) = \frac{f(x) + f(-x)}{2}
\qquad\qquad
f_{\text{odd}}(x) = \frac{f(x) - f(-x)}{2}
$$

I leave it as an exercise to the reader to verify that $f_{\text{even}}$ is even, $f_{\text{odd}}$ is odd, and $f = f_{\text{even}} + f_{\text{odd}}$.

<br>

### Exponential Definition of Hyperbolic Trigonometric Functions

Let $f(x) = e^x$ and consider its odd and even parts.

$$
\cosh(x) \equiv \mathcal{Even}\{ e^{x} \}
\qquad\qquad
\sinh(x) \equiv \mathcal{Odd}\{ e^{x} \}
$$

Using the formulas above, we can get exact formulas.

$$
\cosh x = \frac{e^{x} + e^{-x}}{2} = \frac{e^{2x} + 1}{2e^{x}} = \frac{1 + e^{-2x}}{2e^{-x}} \\[10pt]
\sinh x = \frac{e^{x} - e^{-x}}{2} = \frac{e^{2x} - 1}{2e^{x}} = \frac{1 - e^{-2x}}{2e^{-x}}
$$

Therefore

$$
e^x = \cosh(x) + \sinh(x)
$$

<br>

The remaining hyperbolic trig functions are defined exactly the same as the standard trig functions.

$$
\tanh x = \frac{\sinh x}{\cosh x} = \frac{e^{x} - e^{-x}}{e^{x} + e^{-x}} = \frac{e^{2x} - 1}{e^{2x} + 1} \\[15pt]
\csch x = \frac{1}{\sinh x}
\qquad\qquad
\sech x = \frac{1}{\cosh x}
\qquad\qquad
\coth x = \frac{1}{\tanh x} = \frac{\cosh x}{\sinh x}
$$

<br>

Recall the famous Euler identity from the previous post: $$e^{ix} = \cos(x) + i \sin(x)$$. Using this, we have a similar interpretation of the standard trig functions.

$$
\cos(x) = \mathcal{Re}\{ e^{-ix} \}
\qquad\qquad
\sin(x) = \mathcal{Im}\{ e^{-ix} \}
$$

This even lets us write an expression for a general complex exponential

$$
e^{x + iy} = (\cosh x + \sinh x) (\cos y + i \sin y)
$$

<br>

### Relationship to Standard Trigonometric Functions

By combining imaginary numbers and the exponential functions, we can relate the standard and hyperbolic trig functions.

$$
\sinh (i x) = \frac{e^{ix} - e^{-ix}}{2} = \frac{(\cos(x) + i \sin(x)) - (\cos(x) - i \sin(x))}{2} = i \sin(x)
$$

$$
\cosh (i x) = \frac{e^{ix} + e^{-ix}}{2} = \frac{(\cos(x) + i \sin(x)) + (\cos(x) - i \sin(x))}{2} = \cos (x)
$$

The rest of the hyperbolic trig functions can be derived by combining $\sinh$ and $\cosh$. We can summarize the relationships below.

$$
\begin{align}
    &\sinh x = -i \sin (i x) &\qquad\qquad& \sin x = -i \sinh(ix) \\[10pt]
    &\cosh x = \cos (i x) &\qquad\qquad& \cos x = \cosh(ix) \\[10pt]
    &\tanh x = -i \tan (i x) &\qquad\qquad& \tan x = -i \tanh(ix) \\[10pt]
    &\sech x = \sec (i x) &\qquad\qquad& \sec x = \sech(ix) \\[10pt]
    &\csch x = i \csc (i x) &\qquad\qquad& \csc x = i \csch(ix) \\[10pt]
    &\coth x = i \cot (i x) &\qquad\qquad& \cot x = i \coth(ix)
\end{align}
$$

I find it very interesting that their relationship is symmetrical. If anyone has deeper insight on this, please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

## The Geometric Interpretation

### The Unit Hyperbola

Similar to the unit circle for standard trig functions, there is a unit hyperbola for hyperbolic trig functions

<center>
{% tikz unit-circle %}
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
{% tikz unit-hyperbola %}
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
    %\fill[red!50, domain=0:1.39626344, variable=\a] 
    %    (0, 0) -- (1cm, 0) -- plot ({cosh(\a)}, {-sinh(\a)}) -- cycle;

    % draw the unit hyperbola
    \draw[scale=1, domain=1:4, samples=500, smooth, variable=\a, very thick] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=1, domain=1:4, samples=500, smooth, variable=\a, very thick] plot ({\a}, {-sqrt(\a*\a-1)});
    \draw[scale=1, domain=-4:-1, samples=500, smooth, variable=\a, very thick] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=1, domain=-4:-1, samples=500, smooth, variable=\a, very thick] plot ({\a}, {-sqrt(\a*\a-1)});

    \node[red, thick] at (1.65cm, 0.4cm) {$\alpha/2$};

    % draw area
    \draw[very thick] (O) -- (xy) node[midway, above] {$$};
    %\draw[very thick] (O) -- (\x, -\y) node[midway, above] {$$};

    % area intersects hyperbola
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[right, xshift=2] at (xy) {$(\cosh \alpha, \ \sinh \alpha)$};

    % draw the axes
    \draw[->] ($ (-\r,0) - (1cm, 0) $) -- ($ (\r, 0cm) + (1cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 1cm) $) -- ($ (0,\r) + (0, 1cm) $) node[above] {$$};

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({1cm-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};

{% endtikz %}
</center>

In the unit circle, the argument $\theta$ corresponds to the angle formed by the circular wedge. Unfortunately, the argument of the unit hyperbola $\alpha$ does not have such an elegant interpretation. The best you can say is that the area of the shaded region is $\alpha/2$. However, this is not unique to the unit hyperbola. This fact is also true for the unit circle (recall that the area of a wedge is $\frac{1}{2} \theta r^2$).

The proof of this for the unit hyperbola requires calculus (which I want to avoid in this series). For those interested, this <a href="https://www.youtube.com/watch?v=h-gKfQkHQSA" target="_blank">video</a> derives this fact. If you know of a non-calculus proof, then please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

Analogous to the $\cos$ and $\sin$ for the unit circle, the hyperbolic trig functions $\cosh$ and $\sinh$ parameterize the unit hyperbola.

$$
\begin{align}
    &x^2 + y^2 = r^2  &\qquad\qquad&  (r \cos \theta, \ r \sin \theta) && \theta \in [0, 2\pi) \\[15pt]
    &x^2 - y^2 = r^2  &\qquad\qquad&  (r \cosh \alpha, \ r \sinh \alpha) && \alpha \in (-\infty, \infty)
\end{align}
$$

We can verify this using the exponential definitions

$$
\begin{align}
    (r \cosh \alpha)^2 - (r \sinh \alpha)^2
    &= r^2 \left [ \cosh^2 \alpha - \sinh^2 \alpha \right ] \\[10pt]
    &= r^2 \left [ \left ( \frac{e^{\alpha} + e^{-\alpha}}{2} \right )^2 - \left ( \frac{e^{\alpha} - e^{-\alpha}}{2} \right )^2 \right ] \\[10pt]
    &= \frac{r^2}{4} \left [ (e^{2\alpha} + 2 + e^{-2\alpha}) - (e^{2\alpha} - 2 + e^{-2\alpha}) \right ] \\[10pt]
    &= \frac{r^2}{4} \left [ 4 \right ] \\[10pt]
    &= r^2
\end{align}
$$

<br>

### Relationship of the Rest to the Unit Hyperbola

Every standard trig function on the unit circle has a geometric interpretation which aligns extremely well with their notation and name. The hyperbolic trig functions, on the other hand, do not. As I stated in the preamble, their true meaning comes from the exponential definitions. While their notation and names only exist to mimic the standard trig functions. There are geometric interpretations, but they are not as elegant.

<center>
{% tikz hyperbolic-trig-geometric-interpretation %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{2cm}
    \def\angle{90 * 0.017453293}
    \def\x{ {\r * cosh(\angle)} }
    \def\y{ {\r * sinh(\angle)} }
    \def\pointradius{0.04*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit hyperbola
    \draw[scale=2, domain=1:3, samples=500, smooth, variable=\a, very thick] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=2, domain=1:1.1, samples=500, smooth, variable=\a, very thick] plot ({\a}, {-sqrt(\a*\a-1)});

    % draw the unit hyperbola
    \draw[scale=2, domain=1:3, samples=500, smooth, variable=\a, very thick, dashed, color=gray] plot ({sqrt(\a*\a-1)}, {\a});
    \draw[scale=2, domain=1:1.1, samples=500, smooth, variable=\a, very thick, dashed, color=gray] plot ({-sqrt(\a*\a-1)}, {\a});

    % draw line
    \draw[very thick] (O) -- (xy) node[midway, above] {$$};

    % draw lines
    \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
    \draw[very thick, color=orange] (xy) -- (x) node[midway, right] {$\sinh \alpha$};
    \draw[very thick, color=darkblue] (y) -- (xy) node[midway, above] {$\cosh \alpha$};

    \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
    \def\t{ {\r * tanh(\angle)} }
    \draw[very thick, color=deepmagenta] (X) -- (\r, \t) node[midway, right, xshift=5pt] {$\tanh \alpha$};
    %\draw[very thick, fill=black] (\r, \t) circle (\pointradius);

    \def\c{ {\r / tanh(\angle)} }
    \draw[very thick, color=teal] (Y) -- (\c, \r) node[midway, below, xshift=-5pt] {$\coth \alpha$};
    %\draw[very thick, fill=black] (\c, \r) circle (\pointradius);

    % line intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius);

    % draw the axes
    \draw[->] (-1cm, 0) -- ($ (3.5cm, 0cm) + (2cm, 0) $) node[right] {$$};
    \draw[->] (0, -1cm) -- ($ (0, 3.5cm) + (0, 2cm) $) node[above] {$$};

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (0, {\r-\eps}) -- (0, \eps) node [midway, xshift=-20pt, yshift=0pt]{$1$};

{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz hyperbolic-trig-geometric-interpretation-2 %}
    \usetikzlibrary{angles,patterns,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{2cm}
    \def\angle{90 * 0.017453293}
    \def\x{ {\r * cosh(\angle)} }
    \def\y{ {\r * sinh(\angle)} }
    \def\pointradius{0.04*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);

    % draw the unit hyperbola
    \draw[scale=2, domain=1:3, samples=500, smooth, variable=\a, very thick] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=2, domain=1:1.1, samples=500, smooth, variable=\a, very thick] plot ({\a}, {-sqrt(\a*\a-1)});

    % draw the unit hyperbola
    \draw[scale=2, domain=1:3, samples=500, smooth, variable=\a, very thick, dashed, color=gray] plot ({sqrt(\a*\a-1)}, {\a});
    \draw[scale=2, domain=1:1.1, samples=500, smooth, variable=\a, very thick, dashed, color=gray] plot ({-sqrt(\a*\a-1)}, {\a});

    % draw line
    \draw[very thick] (O) -- (xy) node[midway, above] {$$};

    % draw lines
    \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
    \draw[very thick, color=orange] (xy) -- (x) node[midway, right] {$\sinh \alpha$};
    \draw[very thick, color=darkblue] (y) -- (xy) node[midway, above] {$\cosh \alpha$};

    \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
    \def\t{ {\r * tanh(\angle)} }
    \draw[thick] (X) -- (\r, \t);

    \def\c{ {\r / tanh(\angle)} }
    \draw[thick] (Y) -- (\c, \r);

    \draw (0, 0) -- (\x, \r);
    \draw (0, 0) -- (\r, \y);

    \def\csc{ {\r / sinh(\angle)} }
    \draw[very thick, color=cyan] (Y) -- (\csc, \r) node[midway, above, xshift=-5pt, yshift=5pt] {$\csch \alpha$};
    \draw[very thick, fill=black] (\csc, \r) circle (\pointradius);

    \def\sec{ {\r / cosh(\angle)} }
    \draw[very thick, color=red] (\r, \sec) -- (X) node[midway, right, xshift=5pt] {$\sech \alpha$};
    \draw[very thick, fill=black] (\r, \sec) circle (\pointradius);

    % line intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius);

    % draw the axes
    \draw[->] (-1cm, 0) -- ($ (3.5cm, 0cm) + (2cm, 0) $) node[right] {$$};
    \draw[->] (0, -1cm) -- ($ (0, 3.5cm) + (0, 2cm) $) node[above] {$$};

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({\r-\eps}, 0) node [midway, xshift=0pt, yshift=-20pt]{$1$};
    \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt, mirror},yshift=0pt] (0, {\r-\eps}) -- (0, \eps) node [midway, xshift=-20pt, yshift=0pt]{$1$};

{% endtikz %}
</center>

I will leave it as an exercise to the reader to prove these diagrams are correct (it's not too hard using similar triangles). As you can see, the $\sech$ and $\csch$ do not correspond to secants of the hyperbola as the names would suggest (unlike the standard trig functions). 

<!-- There are ways you can force the issue, but the constructions are convoluted. You can see a diagram <a href="https://math.stackexchange.com/questions/451034/geometric-construction-of-hyperbolic-trigonometric-functions" target="_blank">here</a>. -->

<br>

### Connection to the Reciprocal Function

Consider the function $2 x y = r^2$. It turns out, this is equivalent to a hyperbola but rotated $45^{\circ}$. 

<center>
{% tikz reciprocal-function %}
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

    % draw asymptotes
    \draw[dashed, color=gray] (-\r, -\r) -- (\r, \r);
    \draw[dashed, color=gray] (-\r, \r) -- (\r, -\r);

    % draw the unit circle
    \draw[very thick] (O) circle (1);

    % draw the unit hyperbola
    \draw[scale=1, domain=1:4, samples=500, smooth, variable=\a, very thick, color=blue] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=1, domain=1:4, samples=500, smooth, variable=\a, very thick, color=blue] plot ({\a}, {-sqrt(\a*\a-1)});
    \draw[scale=1, domain=-4:-1, samples=500, smooth, variable=\a, very thick, color=blue] plot ({\a}, {sqrt(\a*\a-1)});
    \draw[scale=1, domain=-4:-1, samples=500, smooth, variable=\a, very thick, color=blue] plot ({\a}, {-sqrt(\a*\a-1)});

    % draw the reciprocal function
    \draw[scale=1, domain=0.12:4.5, samples=500, smooth, variable=\a, very thick, color=orange] plot ({\a}, {0.5/\a});
    \draw[scale=1, domain=0.12:4.5, samples=500, smooth, variable=\a, very thick, color=orange] plot ({-\a}, {-0.5/\a});

    % draw the axes
    \draw[->] ($ (-\r,0) - (1cm, 0) $) -- ($ (\r, 0cm) + (1cm, 0) $) node[right] {$$};
    \draw[->] ($ (0,-\r) - (0, 1cm) $) -- ($ (0,\r) + (0, 1cm) $) node[above] {$$};

    % labeling radius
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=4pt,raise=3pt, mirror},yshift=0pt] (\eps, 0) -- ({1cm-\eps}, 0) node [midway, xshift=0pt, yshift=-15pt]{$r$};

{% endtikz %}
</center>

The easiest way to prove this is to use complex numbers. Recall that multiplication of complex numbers results in the magnitudes multiplying and the angles adding. Therefore, to rotate $45^{\circ}$, we want to multiply by a complex number with a magnitude of $1$ and an angle of $\pi/4$. After some thought, you can convince yourself that $e^{i \frac{\pi}{4}} = \frac{1+i}{\sqrt{2}}$ is that number.

$$
\frac{1+i}{\sqrt{2}} \cdot (x + i y) = \frac{x - y}{\sqrt{2}} + i \frac{x + y}{\sqrt{2}}
$$

Therefore, given any aribtrary coordinate $(x, y)$, its transformed coordinate $(x', y')$ is

$$
(x', y') = \left ( \frac{x - y}{\sqrt{2}}, \frac{x + y}{\sqrt{2}}\right )
$$

Therefore, the equation $2 x y = r^2$ becomes

$$
r^2 = 2 x' y' = 2 \left ( \frac{x - y}{\sqrt{2}} \right ) \cdot \left ( \frac{x + y}{\sqrt{2}} \right ) = x^2 - y^2
$$

<br>

## Graphs

Notice that these graphs do not oscillate like the standard trig functions. Instead, $\sinh$ and $\cosh$ grow exponentially, and the rest decay exponentially to a horizontal asymptote.

<center>
{% tikz sinh-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\alpha$};
  \draw[->, thick] (0, -4) -- (0, 4) node[above] {$\sinh \alpha$};
  \draw[scale=1, domain=-2:2, smooth, variable=\x, orange, thick] plot ({\x}, {sinh(\x)});
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz cosh-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\alpha$};
  \draw[->, thick] (0, -4) -- (0, 4) node[above] {$\cosh \alpha$};
  \draw[scale=1, domain=-2:2, smooth, variable=\x, darkblue, thick] plot ({\x}, {cosh(\x)});
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz tanh-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\alpha$};
  \draw[->, thick] (0, -4) -- (0, 4) node[above] {$\tanh \alpha$};
  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \draw[scale=1, domain=-3:3, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tanh(\x)});
{% endtikz %}
</center>

<br>

<center>
{% tikz sech-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\alpha$};
  \draw[->, thick] (0, -4) -- (0, 4) node[above] {$\sech \alpha$};
  \draw[scale=1, domain=-3:3, smooth, variable=\x, red, thick] plot ({\x}, {1/cosh(\x)});
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz csch-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\alpha$};
  \draw[->, thick] (0, -4) -- (0, 4) node[above] {$\csch \alpha$};
  \draw[scale=1, domain=-3:-0.3, smooth, variable=\x, cyan, thick] plot ({\x}, {1 / sinh(\x)});
  \draw[scale=1, domain=0.3:3, smooth, variable=\x, cyan, thick] plot ({\x}, {1 / sinh(\x)});
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz coth-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\alpha$};
  \draw[->, thick] (0, -4) -- (0, 4) node[above] {$\coth \alpha$};
  \draw[scale=1, domain=-3:-0.3, smooth, variable=\x, teal, thick] plot ({\x}, {1 / tanh(\x)});
  \draw[scale=1, domain=0.3:3, smooth, variable=\x, teal, thick] plot ({\x}, {1 / tanh(\x)});
{% endtikz %}
</center>