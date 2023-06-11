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

**TODO**

First, let's introduce some notation. Let $f : A \rightarrow B$ and $C \subseteq A$. Then $f \rvert_C : C \rightarrow B$ is the function $f$ restricted to $C$. In particular, $f \rvert_C (x) = f(x) \quad \forall x \in C$ and $f \rvert_C (x)$ is left undefined for $x \in A \backslash C$.

$\sin^{-1} (x) = (\sin \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$

$\cos^{-1} (x) = (\cos \rvert_{[0, \pi]})^{-1} (x)$

$\tan^{-1} (x) = (\tan \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$

$\csc^{-1} (x) = (\csc \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$

$\sec^{-1} (x) = (\sec \rvert_{[0, \pi]})^{-1} (x)$

$\cot^{-1} (x) = (\cot \rvert_{[-\pi/2, \pi/2]})^{-1} (x)$

<center>
{% tikz arcsin-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-2, 0) -- (2, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -1.571) -- (0, 1.571) node[above] {$\sin^{-1} \theta$};
  \draw[scale=1, domain=-1.570796325:1.570796325, smooth, variable=\y, red, thick] plot ({sin(180 * 0.318309887 * \y)}, {\y});
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
{% endtikz %}
</center>

<br>

<center>
{% tikz arcsec-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, 0) -- (0, 3.2) node[above] {$\sec \theta$};
  \draw[scale=1, domain=0:1.2, smooth, variable=\y, orange, thick] plot ({sec(180 * 0.318309887 * \y)}, {\y});
  \draw[scale=1, domain=1.8:3.14159, smooth, variable=\y, orange, thick] plot ({sec(180 * 0.318309887 * \y)}, {\y});
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arccsc-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -1.6) -- (0, 1.6) node[above] {$\csc \theta$};
  \draw[scale=1, domain=-1.570796325:-0.2, smooth, variable=\y, cyan, thick] plot ({sec(180 * 0.318309887 * \y - 90)}, {\y});
  \draw[scale=1, domain=0.2:1.570796325, smooth, variable=\y, cyan, thick] plot ({sec(180 * 0.318309887 * \y - 90)}, {\y});
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz arccot-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, 0) -- (0, 2.5) node[above] {$\cot \theta$};
  \draw[scale=1, domain=0.2:2.9, smooth, variable=\y, teal, thick] plot ({-tan(180 * 0.318309887 * \y - 90)}, {\y});
{% endtikz %}
</center>