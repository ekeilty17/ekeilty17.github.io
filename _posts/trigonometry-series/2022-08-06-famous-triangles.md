---
layout:     series
title:      "Famous Triangles"
date:       2022-08-06
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       5
series:     trigonometry
tags:       trigonometry, triangles, 30-60-90, 45-45-90
---

These triangles are so commonly found in geometry, trigonometry, and higher mathematics, they deserve their own post. They form the building blocks of other more complicated structures.

<br>

## 30-60-90 Triangles

Consider an **equilateral triangle** with all side-lengths of $s$. A result in geometry is that all the internal angles of a triangle add up to $180^{\circ} = \pi \ \text{rad}$. By symmetry, it must be the case that all the angles of an equilateral triangle are equal, and thus must be $60^{\circ} = \pi/3 \ \text{rad}$.

Now, draw the perpendoicular bisector of one of the angles, which will cut the triangle in half. The result is a $30{-}60{-}90$ triangle.

<center>
{% tikz 30-60-90-triangle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{6cm}
    \def\angle{60}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);
    
    % draw triangle sides
    \draw[very thick] (O) -- (X) node[midway] {$\mid$};
    \draw[very thick] (X) -- (xy) node[midway] {$\slash$};
    \draw[very thick] (O) -- (xy) node[midway] {$\backslash$};

    % label triangle angles
    \draw pic [draw, black, -, pic text=$60^{\circ}$, thick, angle radius={0.17*\r}, angle eccentricity=1.6] {angle = X--O--xy};

    \coordinate (shift) at (8, 0);
    \coordinate (O2) at ($(O) + (shift)$);
    \coordinate (x2) at ($(x) + (shift)$);
    \coordinate (y2) at ($(y) + (shift)$);
    \coordinate (xy2) at ($(xy) + (shift)$);
    \coordinate (X2) at ($(X) + (shift)$);
    \coordinate (Y2) at ($(Y) + (shift)$);

    % draw second triangle sides
    \draw[very thick] (O2) -- (x2) node[midway, below] {$s/2$};
    \draw[very thick] (x2) -- (xy2) node[midway, right] {$h$};
    \draw[very thick] (O2) -- (xy2) node[midway, xshift=-10, yshift=3] {$s$};

    % right angle indicator
    \draw ($(x2) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);

    % label triangle angles
    \draw pic [draw, black, -, pic text=$60^{\circ}$, thick, angle radius={0.17*\r}, angle eccentricity=1.6] {angle = X2--O2--xy2};
    \draw pic [draw, black, -, pic text=$30^{\circ}$, thick, angle radius={0.17*\r}, angle eccentricity=1.6] {angle = O2--xy2--x2};

{% endtikz %}
</center>

Using the Pythagorean theorem, we can easliy compute the value of $h$.

$$
\begin{align}
    (s/2)^2 + h^2 &= s^2 \\[10pt]
    \frac{1}{4}s^2 + h^2 &= s^2 \\[10pt]
    h^2 = \frac{3}{4} s^2 \\[10pt]
    h = \frac{\sqrt{3}}{2} s
\end{align}
$$

Now, consider a $30{-}60{-}90$ triangle on the unit circle.

<center>
{% tikz 30-60-90-unit-circle1 %}
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

    % draw triangle
    \draw[very thick] (O) -- (x) node[midway, yshift=-12] {$\frac{\sqrt{3}}{2}$};
    \draw[very thick] (O) -- (xy) node[midway, xshift=-10, yshift=5] {$1$};
    \draw[thick] (x) -- (xy) node[midway, xshift=6, yshift=-4] {$\frac{1}{2}$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$(\cos 30^{\circ}, \sin 30^{\circ})$};

    % draw right angle indicator of triangle
    % I wanted to automate this so that I can vary \x and \y and this will be the right way around
    % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
    \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
    %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$30^{\circ}$, very thick, angle radius={0.3*\r}, angle eccentricity=1.6] {angle = x--O--xy};
{% endtikz %}
&emsp;&emsp;
{% tikz 30-60-90-unit-circle2 %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\angle{60}
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

    % draw triangle
    \draw[very thick] (O) -- (x) node[midway, yshift=-12] {$\frac{1}{2}$};
    \draw[very thick] (O) -- (xy) node[midway, xshift=-10, yshift=5] {$1$};
    \draw[thick] (x) -- (xy) node[midway, right] {$\frac{\sqrt{3}}{2}$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$(\cos 60^{\circ}, \sin 60^{\circ})$};

    % draw right angle indicator of triangle
    \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$60^{\circ}$, very thick, angle radius={0.2*\r}, angle eccentricity=1.6] {angle = x--O--xy};
{% endtikz %}
</center>

<br>

Thus, we've now learned that all of the following specific values.

$$
\begin{align}
    &\sin 30^{\circ} = \sin \frac{\pi}{6} = \frac{1}{2} 
        \qquad\qquad &&\sin 60^{\circ} = \sin \frac{\pi}{3} = \frac{\sqrt{3}}{2}\\[10pt]
    &\cos 30^{\circ} = \cos \frac{\pi}{6} = \frac{\sqrt{3}}{2} 
        \qquad\qquad &&\cos 60^{\circ} = \cos \frac{\pi}{3} = \frac{1}{2}\\[10pt]
    &\tan 30^{\circ} = \tan \frac{\pi}{6} = \frac{1}{\sqrt{3}}
        \qquad\qquad &&\tan 60^{\circ} = \tan \frac{\pi}{3} = \sqrt{3}\\[10pt]
    &\sec 30^{\circ} = \sec \frac{\pi}{6} = 2 
        \qquad\qquad &&\sec 60^{\circ} = \sec \frac{\pi}{3} = \frac{2}{\sqrt{3}}\\[10pt]
    &\csc 30^{\circ} = \csc \frac{\pi}{6} = \frac{2}{\sqrt{3}} 
        \qquad\qquad &&\csc 60^{\circ} = \csc \frac{\pi}{3} = 2\\[10pt]
    &\cot 30^{\circ} = \cot \frac{\pi}{6} = \sqrt{3}
        \qquad\qquad &&\cot 60^{\circ} = \cot \frac{\pi}{3} = \frac{1}{\sqrt{3}}
\end{align}
$$

<br>

## 45-45-90 Triangles

Consider a **right, isosceles triangle**. Given the length of the hypotenuse there is only one way to construct this triangle, which is given below.

 <center>
{% tikz 45-45-90-triangle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{6cm}
    \def\angle{45}
    \def\x{ {\r * cos(\angle)} }
    \def\y{ {\r * sin(\angle)} }
    \def\pointradius{0.02*\r}

    \coordinate (O) at (0,0);
    \coordinate (x) at (\x, 0);
    \coordinate (y) at (0, \y);
    \coordinate (xy) at (\x, \y);
    \coordinate (X) at (\r, 0);
    \coordinate (Y) at (0, \r);
    
    % draw triangle sides
    \draw[very thick] (O) -- (x) node[midway] {$\mid$};
    \draw[very thick] (x) -- (xy) node[midway, below] {---};
    \draw[very thick] (O) -- (xy) node[midway, xshift=-10, yshift=10] {$s$};

    \draw (O) -- (x) node[midway, yshift=-20] {$x$};
    \draw (x) -- (xy) node[midway, xshift=20, yshift=-7] {$x$};

    % draw right angle indicator of triangle
    \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1

    % label triangle angles
    \draw pic [draw, black, -, pic text=$45^{\circ}$, thick, angle radius={0.17*\r}, angle eccentricity=1.6] {angle = X--O--xy};
    \draw pic [draw, black, -, pic text=$45^{\circ}$, thick, angle radius={0.17*\r}, angle eccentricity=1.6] {angle = O--xy--x};

{% endtikz %}
</center>

Again, using the Pythagorean theorem, we can easliy compute the value of $x$.

$$
\begin{align}
    x^2 + x^2 = s^2 \\[10pt]
    2x^2 = s^2 \\[10pt]
    x = \frac{1}{\sqrt{2}} s
\end{align}
$$

Now, consider a $45{-}45{-}90$ triangle on the unit circle.

<center>
{% tikz 45-45-90-unit-circle %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{4cm}
    \def\angle{45}
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

    % draw triangle
    \draw[very thick] (O) -- (x) node[midway, yshift=-12] {$\frac{1}{\sqrt{2}}$};
    \draw[very thick] (O) -- (xy) node[midway, xshift=-10, yshift=5] {$1$};
    \draw[thick] (x) -- (xy) node[midway, xshift=10, yshift=-4] {$\frac{1}{\sqrt{2}}$};

    % triangle intersects circle
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$(\cos 45^{\circ}, \sin 45^{\circ})$};

    % draw right angle indicator of triangle
    % I wanted to automate this so that I can vary \x and \y and this will be the right way around
    % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
    \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
    %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
    %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

    % draw incident angle of triangle
    \draw pic [draw, red, ->, pic text=$45^{\circ}$, very thick, angle radius={0.25*\r}, angle eccentricity=1.5] {angle = x--O--xy};
{% endtikz %}

</center>

<br>

Thus, we've now learned that all of the following specific values.

$$
\begin{align}
    &\sin 45^{\circ} = \sin \frac{\pi}{4} = \frac{1}{\sqrt{2}} = \frac{\sqrt{2}}{2} \\[10pt]
    &\cos 45^{\circ} = \cos \frac{\pi}{4} = \frac{1}{\sqrt{2}} = \frac{\sqrt{2}}{2} \\[10pt]
    &\tan 45^{\circ} = \tan \frac{\pi}{4} = 1 \\[10pt]
    &\sec 45^{\circ} = \sec \frac{\pi}{4} = \sqrt{2} \\[10pt]
    &\csc 45^{\circ} = \csc \frac{\pi}{4} = \sqrt{2} \\[10pt]
    &\cot 45^{\circ} = \cot \frac{\pi}{4} = 1
\end{align}
$$