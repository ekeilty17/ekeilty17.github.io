---
layout:     series
title:      "Inverse Trigonometric Functions"
date:       2022-08-17
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       16
series:     trigonometry
tags:       trigonometry, inverse
---

## What is an Inverse Function

Given a function $f : A \rightarrow B$, with image $D \subseteq B$, the inverse function is $f^{-1} : D \rightarrow A$ such that $f(f^{-1}(x)) = f^{-1}(f(x)) = x$. In plain English, it "undoes" the given function. Note that in this context, $f^{-1} (x) \neq (f(x))^{-1} = \frac{1}{f(x)}$. It's a bit of an abuse of notation, but usually it's easy to determine the intended meaning through context.

An inverse function only exists if $f$ is _injective_/_one-to-one_. This is a fancy word that means the function maps every input to a unique output. Written mathematically, we have.

$$f(x) = f(y) \quad\implies\quad x = y$$

Let's take the function $f(x) = x^2$ as an example. This function is **not** injective, since $f(1) = 1 = f(-1)$, but $1 \neq -1$. Thus, an inverse function does not exist. Why? What should be the value of $f^{-1}(1)$? It needs to be both $1$ and $-1$, which means it is not a function. In complex analysis, we call this a **multi-function**.

<br>

## Domain Restriction of a Function

Notice that all of the trigonometric functions are **not** injective, since they are all periodic. Then, how do we define an inverse function? There's a trick. If a function is not injective, then we can just take the part of it that is. To take $f(x) = x^2$ as an example again. This function is injective on the interval $[0, \infty)$.

To define this in rigorous mathematic notation, let $f : A \rightarrow B$ and $C \subseteq A$. Then the function $f$ **restricted** to $C$ is denoted $f \rvert_C : C \rightarrow B$. In particular, $f \rvert_C (x) = f(x) \quad \forall x \in C$ and $f \rvert_C (x)$ is left undefined for $x \in A \backslash C$.

Therefore, for $f(x) = x^2$, $f \rvert_{[0, \infty)} (x)$ is injective, so its inverse function $f^{-1} \rvert_{[0, \infty)} (x)$ exists. This inverse function is precisely $\sqrt{x}$. Notice that $\sqrt{(x^2)} = (\sqrt{x})^2 = x$ for all $x \in [0, \infty)$.


<br>

## Trigonometric Inverse Function

Using domain restriction on the trigonometric functions, we can make them injective and define the inverse functions as follows.

It's a bit of an abuse of notation to write $\sin^{-1} (x)$ since there is actually no inverse function for $\sin (x)$. Thus, many sources opt to write $\arcsin (x)$ instead. You will see both.


## Inverse Sine

$$\arcsin (x) \equiv (\sin \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$$

<center>
{% tikz sin-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2) -- (0, 2) node[above] {$\sin \theta$};
  \draw[scale=1, domain=-4:4, smooth, variable=\x, red, thick] plot ({\x}, {sin(180 * 0.318309887 * \x)});
  \draw[gray, dashed] (-1.570796325, -2) -- (-1.570796325, 2);
  \draw[gray, dashed] (1.570796325, -2) -- (1.570796325, 2);
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arcsin-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-2, 0) -- (2, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2) -- (0, 2) node[above] {$\sin^{-1} \theta$};
  \draw[scale=1, domain=-1.570796325:1.570796325, smooth, variable=\y, red, thick] plot ({sin(180 * 0.318309887 * \y)}, {\y});
{% endtikz %}
</center>

<br>


## Cosine

$$ \arccos (x) \equiv (\cos \rvert_{[0, \pi]})^{-1} (x)$$

<center>
{% tikz cos-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2) -- (0, 2) node[above] {$\cos \theta$};
  \draw[scale=1, domain=-4:4, smooth, variable=\x, darkblue, thick] plot ({\x}, {cos(180 * 0.318309887 * \x)});
  \draw[gray, dashed] (0.05, -2) -- (0.05, 2);
  \draw[gray, dashed] (3.14159265, -2) -- (3.14159265, 2);
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arccos-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-2, 0) -- (2, 0) node[right] {$\theta$};
  \draw[->, thick] (0, 0) -- (0, 3.1416) node[above] {$\cos^{-1} \theta$};
  \draw[scale=1, domain=0:3.14159265, smooth, variable=\y, darkblue, thick] plot ({cos(180 * 0.318309887 * \y)}, {\y});
{% endtikz %}
</center>

<br>


## Tangent

$$ \arctan (x) \equiv (\tan \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$$

<center>
{% tikz tan-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2) -- (0, 2) node[above] {$\tan \theta$};
  \draw[scale=1, domain=-4:-2, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
  \draw[scale=1, domain=-1.1:1.1, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
  \draw[scale=1, domain=2:4, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
  \draw[gray, dashed] (-1.570796325, -2) -- (-1.570796325, 2);
  \draw[gray, dashed] (1.570796325, -2) -- (1.570796325, 2);
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arctan-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2) -- (0, 2) node[above] {$\tan \theta$};
  \draw[scale=1, domain=-1.2:1.2, smooth, variable=\y, deepmagenta, thick] plot ({tan(180 * 0.318309887 * \y)}, {\y});
  %\draw[gray, dashed] (-3, -1.570796325) -- (3, -1.570796325);
  %\draw[gray, dashed] (-3, 1.570796325) -- (3, 1.570796325);
{% endtikz %}
</center>

<br>


## Cosecant

$$ \arccsc (x) \equiv (\csc \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$$

<center>
{% tikz csc-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2.5) -- (0, 2.5) node[above] {$\csc \theta$};
  \draw[scale=1, domain=-4:-3.58, smooth, variable=\x, cyan, thick] plot ({\x}, {sec(180 * 0.318309887 * \x - 90)});
  \draw[scale=1, domain=-2.70:-0.45, smooth, variable=\x, cyan, thick] plot ({\x}, {sec(180 * 0.318309887 * \x - 90)});
  \draw[scale=1, domain=0.45:2.70, smooth, variable=\x, cyan, thick] plot ({\x}, {sec(180 * 0.318309887 * \x - 90)});
  \draw[scale=1, domain=3.58:4, smooth, variable=\x, cyan, thick] plot ({\x}, {sec(180 * 0.318309887 * \x - 90)});
  \draw[gray, dashed] (-1.570796325, -2.5) -- (-1.570796325, 2.5);
  \draw[gray, dashed] (1.570796325, -2.5) -- (1.570796325, 2.5);
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arccsc-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -1.6) -- (0, 1.6) node[above] {$\csc \theta$};
  \draw[scale=1, domain=-1.570796325:-0.35, smooth, variable=\y, cyan, thick] plot ({sec(180 * 0.318309887 * \y - 90)}, {\y});
  \draw[scale=1, domain=0.35:1.570796325, smooth, variable=\y, cyan, thick] plot ({sec(180 * 0.318309887 * \y - 90)}, {\y});
{% endtikz %}
</center>

<br>


## Secant

$$ \arcsec (x) \equiv (\sec \rvert_{[0, \pi]})^{-1} (x)$$

<center>
{% tikz sec-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2.5) -- (0, 2.5) node[above] {$\sec \theta$};
  \draw[scale=1, domain=-4:-2, smooth, variable=\x, orange, thick] plot ({\x}, {sec(180 * 0.318309887 * \x)});
  \draw[scale=1, domain=-1.1:1.1, smooth, variable=\x, orange, thick] plot ({\x}, {sec(180 * 0.318309887 * \x)});
  \draw[scale=1, domain=2:4, smooth, variable=\x, orange, thick] plot ({\x}, {sec(180 * 0.318309887 * \x)});
  \draw[gray, dashed] (0.05, -2.5) -- (0.05, 2.5);
  \draw[gray, dashed] (3.14159265, -2.5) -- (3.14159265, 2.5);
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz arcsec-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-3, 0) -- (3, 0) node[right] {$\theta$};
  \draw[->, thick] (0, 0) -- (0, 3.2) node[above] {$\sec \theta$};
  \draw[scale=1, domain=0:1.15, smooth, variable=\y, orange, thick] plot ({sec(180 * 0.318309887 * \y)}, {\y});
  \draw[scale=1, domain=1.95:3.14159265, smooth, variable=\y, orange, thick] plot ({sec(180 * 0.318309887 * \y)}, {\y});
{% endtikz %}
</center>

<br>


## Cotangent

$$\arccot (x) = (\cot \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$$

<center>
{% tikz cot-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2.5) -- (0, 2.5) node[above] {$\cot \theta$};
  \draw[scale=1, domain=-4:-3.58, smooth, variable=\x, teal, thick] plot ({\x}, {-tan(180 * 0.318309887 * \x - 90)});
  \draw[scale=1, domain=-2.70:-0.45, smooth, variable=\x, teal, thick] plot ({\x}, {-tan(180 * 0.318309887 * \x - 90)});
  \draw[scale=1, domain=0.45:2.70, smooth, variable=\x, teal, thick] plot ({\x}, {-tan(180 * 0.318309887 * \x - 90)});
  \draw[scale=1, domain=3.58:4, smooth, variable=\x, teal, thick] plot ({\x}, {-tan(180 * 0.318309887 * \x - 90)});
  \draw[gray, dashed] (0.05, -2.5) -- (0.05, 2.5);
  \draw[gray, dashed] (3.14159265, -2.5) -- (3.14159265, 2.5);
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arccot-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-2.5, 0) -- (2.5, 0) node[right] {$\theta$};
  \draw[->, thick] (0, 0) -- (0, 2.5) node[above] {$\cot \theta$};
  \draw[scale=1, domain=0.4:2.7, smooth, variable=\y, teal, thick] plot ({-tan(180 * 0.318309887 * \y - 90)}, {\y});
{% endtikz %}
</center>