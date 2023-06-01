---
layout:     series
title:      "Law of Sines"
date:       2022-08-15
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       14
series:     trigonometry
tags:       trigonometry, law-of-sines
---

If $A$, $B$, and $C$ are the angles of a triangle and $a$, $b$, and $c$ are the corresponding opposing side lengths, then the Law of Sines states

$$
\frac{\sin A}{a} = \frac{\sin B}{b} = \frac{\sin C}{c}
$$

The easiest way to prove the Law of Sines is to break it up into 3 cases: acute, right, and obtuse triangles. An **acute** angle is an angle less than $90^{\circ}$. A **right angle** is an angle that is exactly $90^{\circ}$. An **obtuse angle** is an angle greater than $90^{\circ}$. An **acute triangle** is a triangle with all acute angles. A **right triangle** is a triangle with one right angle. An **obtuse triangle** is a triangle with one obtuse angle.

<br>

## Acute Triangles

<center>
{% tikz LoS-acute-triangle1 %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (2, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (6, 0);
    \coordinate (hA) at (2, 0);

    \node[above] at (A) {$A$};
    \node[below left] at (B) {$B$};
    \node[below right] at (C) {$C$};

    %\draw[thick] (B) -- (hA) node[midway, below] {$x$};
    %\draw[thick] (h) -- (C) node[midway, below] {$y$};
    %\def\eps{1mm}
    %\draw[decorate,decoration={brace,amplitude=10pt,raise=10pt, mirror},yshift=0pt] ($(B) + (\eps, 0)$) -- ($(C) - (\eps, 0)$) node [midway, xshift=0pt, yshift=-30pt]{$a$};
    
    \draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, above left] {$c$};
    \draw[] (A) -- (hA) node[midway, right] {$h_A$};

    \draw ($(hA) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);

{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz LoS-acute-triangle2 %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (2, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (6, 0);
    \def\b{5.656854}
    \coordinate (hB) at ({4.24264*cos(45)}, {4.24264*sin(45)});

    \node[above] at (A) {$A$};
    \node[below left] at (B) {$B$};
    \node[below right] at (C) {$C$};
    
    \draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, above left] {$c$};
    \draw[] (B) -- (hB) node[midway, xshift=15, yshift=-5] {$h_B$};

    \draw ($(hB) + ({-0.3*cos(45)}, {-0.3*sin(45)})$) -- ++({0.3*cos(45)}, {-0.3*sin(45)}) -- ++({0.3*cos(45)},{0.3*sin(45)});

{% endtikz %}
</center>

<br>

Using the definition of sine on the left triangle

$$
\sin B = \frac{h_A}{c} \qquad\qquad \sin C = \frac{h_A}{b}
$$

Therefore,

$$
\frac{\sin B}{b} = \frac{\sin C}{c}
$$

Likewise, using the definition of sine on the right triangle

$$
\sin A = \frac{h_B}{c} \qquad\qquad \sin C = \frac{h_B}{a}
$$

Therefore,

$$
\frac{\sin A}{a} = \frac{\sin C}{c}
$$

This completes the proof.

<br>

## Right Triangles

<center>
{% tikz LoS-right-triangle %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (0, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (6, 0);

    \node[above] at (A) {$A$};
    \node[below left] at (B) {$B$};
    \node[below right] at (C) {$C$};
    
    \draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, left] {$c$};

    \draw ($(B) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);
{% endtikz %}
</center>

<br>

Using the definition of sine on angles $A$, $B$, and $C$.

$$
\sin A = \frac{a}{b} \qquad \sin B = \sin 90^{\circ} = 1 \qquad \sin C = \frac{c}{b}
$$

Therefore

$$
\frac{\sin A}{a} = \frac{\sin C}{c} = \frac{1}{b} = \frac{\sin B}{b}
$$

<br>

## Obtuse Triangles

<center>
{% tikz LoS-obtuse-triangle1 %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (-2, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (6, 0);

    \node[above] at (A) {$A$};
    \node[below left] at (B) {$B$};
    \node[below right] at (C) {$C$};
    
    \draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, left] {$c$};

    \draw[dashed] (A) -- (-2, 0) node[midway, left] {$h_A$};
    \draw[dashed] (-2, 0) -- (B);
    \draw ($(-2, 0) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz LoS-obtuse-triangle2 %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (-2, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (6, 0);

    \node[above] at (A) {$A$};
    \node[below left] at (B) {$B$};
    \node[below right] at (C) {$C$};
    
    \draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, left] {$c$};

    \coordinate (hB) at ({2.6832 * cos(63.43)}, {2.6832 * sin(63.43)});
    \draw (B) -- (hB) node[midway, xshift=15, yshift=-5] {$h_B$};
    \draw ($(hB) + ({-0.3*cos(63.43)}, {-0.3*sin(63.43)})$) -- ++({0.3*cos(26.57)}, {-0.3*sin(26.57)}) -- ++({0.3*cos(63.43)},{0.3*sin(63.43)});
{% endtikz %}
</center>

<br>

This proof is the same as the acute triangle case. Using the definition of sine on the left triangle

$$
\sin B = \frac{h_A}{c} \qquad\qquad \sin C = \frac{h_A}{b}
$$

Therefore,

$$
\frac{\sin B}{b} = \frac{\sin C}{c}
$$

Likewise, using the definition of sine on the right triangle

$$
\sin A = \frac{h_B}{c} \qquad\qquad \sin C = \frac{h_B}{a}
$$

Therefore,

$$
\frac{\sin A}{a} = \frac{\sin C}{c}
$$

This completes the proof.