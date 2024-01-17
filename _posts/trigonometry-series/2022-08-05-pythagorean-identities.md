---
layout:     series
title:      "Pythagorean Identities"
date:       2022-08-05
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       4
series:     trigonometry
tags:       trigonometry, pythagoras
---

## The Pythagorean Theorem

This is one of the older and more famous theorems in mathematics. It states that given a right triangle, the sum of the square of the legs equals the square of the hypotenuse. When I say "square" I mean _squared_ in the algebra sense, and a _square_ in the geometric sense. 

<center>
{% tikz pythagoraean-theorem %}
  \usetikzlibrary{angles,patterns,calc}
  \usetikzlibrary{decorations.pathreplacing,intersections}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\scale{0.75cm}
  \def\a{ {3 * \scale} }
  \def\b{ {4 * \scale} }
  \def\c{ {5 * \scale} }

  \definecolor{crimson}{rgb}{0.86, 0.08, 0.24}

  \coordinate (A) at (\a, \b);
  \coordinate (B) at (0, 0);
  \coordinate (C) at (\a, 0);

  \draw[very thick] (A) -- (B) node[midway, below, black] {$c$};
  \draw[very thick] (B) -- (C) node[midway, above, black] {$a$};
  \draw[very thick] (C) -- (A) node[midway, left, black] {$b$};

  % draw right angle indicator of triangle
  \draw ($(C) - (0.4,0)$) -- ++(0,0.4) -- ++(0.4,0);     % Q1

  % a^2
  \coordinate (a1) at (0, -\a);
  \coordinate (a2) at (\a, -\a);

  \draw[very thick] (B) -- (a1);
  \draw[very thick] (C) -- (a2);
  \draw[very thick] (a1) -- (a2);

  \node[black] (c1) at (barycentric cs:B=1,C=1,a2=1,a1=1) {\huge $a^2$};

  % b^2
  \coordinate (b1) at  ($(A) + (\b, 0)$);
  \coordinate (b2) at ($(C) + (\b, 0)$);

  \draw[very thick] (A) -- (b1);
  \draw[very thick] (C) -- (b2);
  \draw[very thick] (b1) -- (b2) node[midway, xshift=150, yshift=0] {\LARGE $a^2 + b^2 = c^2$};

  \node[black] (c2) at (barycentric cs:A=1,C=1,b2=1,b1=1) {\huge $b^2$};

  % c^2
  \coordinate (c1) at ($(A) + (-\b, \a)$);
  \coordinate (c2) at  (-\b, \a);
  
  \draw[very thick] (A) -- (c1);
  \draw[very thick] (B) -- (c2);
  \draw[very thick] (c2) -- (c1);

  \node[black] (c3) at (barycentric cs:A=1,B=1,c2=1,c1=1) {\huge $c^2$};

{% endtikz %}
</center>

<br>

There are literally hundreds of proofs of the theorem (this [book](https://www.amazon.com/Pythagorean-Proposition-Elisha-S-Loomis/dp/0873530365) lists 371 of them and [Cut the Knot](https://www.cut-the-knot.org/pythagoras/) also has many beautiful proofs). I will provide what I think is the simplest proof.

<center>
{% tikz pythagoras-proof1 %}
  \usetikzlibrary{angles,patterns,calc}
  \usetikzlibrary{decorations.pathreplacing,intersections}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\scale{0.75cm}
  \def\a{ {3 * \scale} }
  \def\b{ {4 * \scale} }
  \def\c{ {5 * \scale} }

  \definecolor{crimson}{rgb}{0.86, 0.08, 0.24}
  \definecolor{trueblue}{rgb}{0.0, 0.45, 0.81}

  \coordinate (A) at ($(0, 0) + (0, 0)$);
  \coordinate (B) at ($(\a, 0) + (\b, 0)$);
  \coordinate (C) at ($(\a, \a) + (\b, \b)$);
  \coordinate (D) at ($(0, \a) + (0, \b)$);

  \coordinate (E) at ($(A) + (\a, 0)$);
  \coordinate (F) at ($(B) + (0, \a)$);
  \coordinate (G) at ($(D) + (\b, 0)$);
  \coordinate (H) at ($(A) + (0, \b)$);

  \filldraw[fill=crimson] (A) -- (B) -- (C) -- (D) -- cycle;
  \filldraw[fill=trueblue] (E) -- (F) -- (G) -- (H) -- cycle;

  \draw[ultra thick] (A) -- (B);
  \draw[ultra thick] (B) -- (C);
  \draw[ultra thick] (C) -- (D);
  \draw[ultra thick] (D) -- (A);

  \draw[ultra thick] (E) -- (F);
  \draw[ultra thick] (F) -- (G);
  \draw[ultra thick] (G) -- (H);
  \draw[ultra thick] (H) -- (E);

  \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt},yshift=0pt] (H) -- (D) node [midway, xshift=-20pt, yshift=0pt]{\huge $a$};
  \draw[decorate,decoration={brace,amplitude=7pt,raise=3pt},yshift=0pt] (A) -- (H) node [midway, xshift=-20pt, yshift=0pt]{\huge $b$};

  \node[white] (c) at (barycentric cs:A=1,B=1,C=1,D=1) {\Huge $c^2$};

{% endtikz %}
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
{% tikz pythagoras-proof2 %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\scale{0.75cm}
  \def\a{ {3 * \scale} }
  \def\b{ {4 * \scale} }
  \def\c{ {5 * \scale} }

  \definecolor{crimson}{rgb}{0.86, 0.08, 0.24}
  \definecolor{trueblue}{rgb}{0.0, 0.45, 0.81}

  \coordinate (A) at ($(0, 0) + (0, 0)$);
  \coordinate (B) at ($(\a, 0) + (\b, 0)$);
  \coordinate (C) at ($(\a, \a) + (\b, \b)$);
  \coordinate (D) at ($(0, \a) + (0, \b)$);

  \coordinate (E) at ($(A) + (\a, 0)$);
  \coordinate (F) at ($(B) + (0, \a)$);
  \coordinate (G) at ($(D) + (\b, 0)$);
  \coordinate (H) at ($(A) + (0, \b)$);

  \coordinate (I) at ($(B) + (0, \b)$);
  \coordinate (J) at ($(D) + (\a, 0)$);
  
  \coordinate (K) at (\a, \b);

  \filldraw[fill=trueblue] (A) -- (B) -- (C) -- (D) -- cycle;
  \filldraw[fill=crimson]  (A) -- (E) -- (K) -- (H) -- cycle;
  \filldraw[fill=crimson]  (I) -- (C) -- (J) -- (K) -- cycle;

  \draw[ultra thick] (A) -- (B);
  \draw[ultra thick] (B) -- (C);
  \draw[ultra thick] (C) -- (D);
  \draw[ultra thick] (D) -- (A);

  \draw[ultra thick] (E) -- (K);
  \draw[ultra thick] (I) -- (K);
  \draw[ultra thick] (J) -- (K);
  \draw[ultra thick] (H) -- (K);

  \draw[ultra thick] (H) -- (E);
  \draw[ultra thick] (C) -- (K);

  \node[white] (c1) at (barycentric cs:D=1,H=1,K=1,J=1) {\Huge $a^2$};
  \node[white] (c2) at (barycentric cs:E=1,B=1,F=1,K=1) {\Huge $b^2$};
{% endtikz %}
</center>

<br>

We can see that in both diagrams, all we've done is change the positions of the red triangles. Thus, the blue regions have equal areas. In the left diagram, the blue region has area $c^2$. In the right diagram, the blue region has $a^2 + b^2$. Thus, we've proven the Pythagorean Theorem.

<br>

You can also prove it algebraically from these diagrams. Notice that the area of the blue region equals the area of the entire square minus the area of the red. Written algebraically,

$$
\begin{align}
  &c^2 = (a + b)^2 - 4 \cdot \frac{1}{2} ab \\[10pt]
  &c^2 = a^2 + 2ab + b^2 - 2ab \\[10pt]
  &c^2 = a^2 + b^2
\end{align}
$$

<br>

## Pythagoras Identities Derivations

Recall the canonical diagram for trigonometry

<center>
{% tikz unit-circle %}
  \usetikzlibrary{angles,patterns,calc}
  
  \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
  }

  \def\r{4cm}
  \def\angle{40}
  \def\x{ {\r * cos(\angle)} }
  \def\y{ {\r * sin(\angle)} }

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

  % draw triangle
  \draw[very thick] (O) -- (x) node[midway, below] {$\cos(\theta)$};
  \draw[very thick] (x) -- (xy) node[midway, xshift=25pt, yshift=-10pt, fill=white] {$\sin(\theta)$};
  \draw[very thick] (O) -- (xy) node[midway, above left=2] {$1$};

  % draw right angle indicator of triangle
  % I wanted to automate this so that I can vary \x and \y and this will be the right way around
  % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
  \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
  %\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
  %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
  %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

  % draw incident angle of triangle
  \pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};
{% endtikz %}
</center>

We see that we have a right triangle, so let's use Pythagoras!

$$
\sin^2 \theta + \cos^2 \theta = 1
$$

While simple, this is probably the most commonly used identity in trigonometry and higher mathematics. From this identity, we can derive a few others

$$
\begin{align}
  &\sin^2 \theta + \cos^2 \theta = 1 \\[10pt]
  &\frac{1}{\cos^2 \theta} [ \sin^2 \theta + \cos^2 \theta ] = \frac{1}{\cos^2 \theta} [1] \\[10pt]
  &\tan^2 \theta + 1 = \sec^2 \theta
\end{align}
$$

Likewise

$$
\begin{align}
  &\sin^2 \theta + \cos^2 \theta = 1 \\[10pt]
  &\frac{1}{\sin^2 \theta} [ \sin^2 \theta + \cos^2 \theta ] = \frac{1}{\sin^2 \theta} [1] \\[10pt]
  &1 + \cot^2 \theta = \csc^2 \theta
\end{align}
$$