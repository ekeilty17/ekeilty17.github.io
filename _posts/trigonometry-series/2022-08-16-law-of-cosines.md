---
layout:     series
title:      "Law of Cosines"
date:       2022-08-16
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       15
series:     trigonometry
tags:       trigonometry, law-of-cosines
---

If $A$, $B$, and $C$ are the angles of a triangle and $a$, $b$, and $c$ are the corresponding opposing side lengths, then the Law of Cosines states

$$
a^2 = b^2 + c^2 - 2bc \cos(A) \\ 
b^2 = a^2 + c^2 - 2ac \cos(B) \\
c^2 = a^2 + b^2 - 2ab \cos(C)
$$

Interestingly, this gives us a set of formulas for the cosine of all the angles of a triangle given its side lengths.

Just like in the Law of Sines, we have to break the proof up into 3 cases: acute triangles, right triangles, and obtuse triangles.

<br>

## Acute Triangles

<center>
{% tikz LoC-acute-triangle %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (2, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (8, 0);
    \coordinate (hA) at (2, 0);

    \node[above] at (A) {$A$};
    \node[below left] at (B) {$B$};
    \node[below right] at (C) {$C$};

    \draw[thick] (B) -- (hA) node[midway, below] {$x$};
    \draw[thick] (hA) -- (C) node[midway, below] {$y$};
    \def\eps{1mm}
    \draw[decorate,decoration={brace,amplitude=10pt,raise=15pt, mirror},yshift=0pt] ($(B) + (\eps, 0)$) -- ($(C) - (\eps, 0)$) node [midway, xshift=0pt, yshift=-35pt]{$a$};
    
    %\draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, above left] {$c$};
    \draw[] (A) -- (hA) node[midway, right] {$h$};

    \draw ($(hA) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);

{% endtikz %}
</center>

Using the definition of $\sin$, the definition of $\cos$, and the Pythagorean Theorem, we have the following observations.

1. $x + y = a$
2. $x = c \cos B$
3. $h = c \sin B$ 
4. $x^2 + h^2 = c^2$

There are a couple of ways to do this. One way is to first substitute (1) into (4)

$$
(a - y)^2 + h ^2 = c^2
$$

Then substitute (2) and (3) into to get

$$
(a - b \cos C)^2 + (b \sin C)^2 = c^2
$$

Now, we do some algebra to simplify and utilize the Pythagorean identity ($\cos^2 \theta + \sin^2 \theta = 1$)

$$
\begin{align}
    c^2 
    &= (a - b \cos C)^2 + (b \sin C)^2 \\[10pt]
    &= a^2 - 2ab\cos C + b^2 \cos^2 C + b^2 \sin^2 C \\[10pt]
    &= a^2 + b^2 (\cos^2 C + \sin^2 C) - 2ab\cos C  \\[10pt]
    &= a^2 + b^2 - 2ab\cos C
\end{align}
$$

The argument works symmetrically for the other two laws.

<br>

## Right Triangles

<center>
{% tikz LoC-right-triangle %}
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

The right triangle case just reduces to the Pythagorean Theorem, which we have already proven to be true.

$$
b^2 = a^2 + c^2 - 2ac \cos(90^{\circ}) = a^2 + c^2 - 2ac \cdot 0 = a^2 + c^2 
$$

The proof for the other two angles is exactly the same as the acute triangle case.

<br>

## Obtuse Triangles

<center>
{% tikz LoC-obtuse-triangle %}
    \usetikzlibrary{calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (-2, 4);
    \coordinate (B) at (0, 0);
    \coordinate (C) at (6, 0);

    \node[above] at (A) {$A$};
    \node[xshift=0, yshift=-10] at (B) {$B$};
    \node[below right] at (C) {$C$};
    
    \draw[thick] (B) -- (C) node[midway, below] {$a$};
    \draw[thick] (C) -- (A) node[midway, above right] {$b$};
    \draw[thick] (A) -- (B) node[midway, left] {$c$};

    \draw[dashed] (A) -- (-2, 0) node[midway, left] {$h$};
    \draw[dashed] (-2, 0) -- (B) node[midway, below] {$x$};
    \draw ($(-2, 0) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);
{% endtikz %}
</center>

Using the definition of $\sin$, the definition of $\cos$, the Pythagorean Theorem, and the supplementary angle identity for $\cos$, we have the following observations.

1. $x = c \cos (180 - B) = - c \cos B$
2. $h = c \sin B$
3. $(a + x)^2 + h^2 = b^2$

Substituting (1) and (2) into (3) gives

$$
(c \cos B + a)^2 + (- c \sin B)^2 = b^2
$$

Now, we do some algebra to simplify and utilize the Pythagorean identity ($\cos^2 \theta + \sin^2 \theta = 1$)

$$
\begin{align}
    b^2 
    &= (a - c \cos B)^2 + (c \sin B)^2 \\[10pt]
    &=  a^2 - 2 ac \cos B + c^2 \cos^2 B + c^2 \sin^2 B \\[10pt]
    &= a^2 + c^2 (\cos^2 B + \sin^2 B) - 2 ac \cos B \\[10pt]
    &= a^2 + c^2 - 2 ac \cos B
\end{align}
$$

The proof for the other two angles is exactly the same as the acute triangle case.