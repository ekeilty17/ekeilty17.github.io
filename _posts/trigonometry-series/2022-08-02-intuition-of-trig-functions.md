---
layout:     series
title:      "Intuition of Trigonometric Functions"
date:       2022-08-02
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       1
series:     trigonometry
tags:       trigonometry, etymology, unit-circle, chord, secant, tangent
---

## The Etymology of Sine

The English word "sine" originates from Hindu works which used the Sanskrit word _jya-ardha_ meaning "half chord". This was often shortened to _jya_ or _jiva_. Later, the Arabs translated the word phonetically as _jiba_, which is meaningless in Arabic. Since, the Arabic language use accents instead of characters to represent vowels, over time the consonants _jb_ were mistakened for the word _jaib_, meaning bosom or breast. When Arabic works were eventaully translated into Latin, _jaib_ was translated into the equivalent Latin word _sinus_. Finally, this Latin word was anglicized into the word _sine_, which we now use in English.

<br>

## Relationship to the Unit Circle

I'm not sure how helpful these diagrams are in terms of a greater understanding of trigonometry, but they at least help explain where the rest of the trigonometric functions get their names.

<center>
{% tikz interpretation1 %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{4cm}
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

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % draw incident angle of triangle
  \coordinate (X) at (\r, 0);
  \draw pic[draw, black, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};

  % drawing lines
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[very thick] (O) -- (xy);
  \draw[very thick, orange] (xy) -- (x) node[below] {$\sin(\theta)$};
  \draw[very thick, darkblue] (xy) -- (y) node[left] {$\cos(\theta)$};

  \def\eps{0.8mm}
  \coordinate (C) at ({\r * cot(\angle) - \eps}, {\r});
  \draw[very thick, teal] (Y) -- (C) node[midway, above] {$\cot(\theta)$};
  \draw[very thick, cyan] (0, \eps) -- (C) node[midway, xshift=-30, yshift=-5] {$\csc(\theta)$};

  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \coordinate (T) at (\r, {\r * tan(\angle)});
  \draw[very thick, deepmagenta] (X) -- (T) node[midway, right] {$\tan(\theta)$};
  \draw[very thick, red] (O) -- (T) node[midway, xshift=10, yshift=-15] {$\sec(\theta)$};

  % draw right angle indicator of triangle
  % I wanted to automate this so that I can vary \x and \y and this will be the right way around
  % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
  %\draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
  %\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
  %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
  %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

  % circle intersection point
  \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$$};

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz interpretation2 %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{4cm}
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

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % draw incident angle of triangle
  \coordinate (X) at (\r, 0);
  \draw pic[draw, black, ->, pic text=$\theta$, very thick, angle radius={0.3*\r}, angle eccentricity=1.3] {angle = X--O--xy};

  % drawing lines
  \definecolor{darkblue}{rgb}{0.0, 0.0, 0.55}
  \draw[very thick] (O) -- (xy);
  \draw[very thick, orange] (xy) -- (x) node[midway, left] {$\sin(\theta)$};
  \draw[very thick, darkblue] (xy) -- (y) node[midway, above] {$\cos(\theta)$};

  \coordinate (C) at (0, {\r * sec(\angle - 90)});
  \draw[very thick, cyan] (O) -- (C) node[midway, left] {$\csc(\theta)$};
  \draw[very thick, teal] (C) -- (xy) node[midway, right=1.5] {$\cot(\theta)$};

  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \coordinate (S) at ({\r * sec(\angle)}, 0);
  \draw[very thick, red] (O) -- (S) node[midway, below] {$\sec(\theta)$};
  \draw[very thick, deepmagenta] (xy) -- (S) node[midway, right=1.5] {$\tan(\theta)$};

  % draw right angle indicator of triangle
  % I wanted to automate this so that I can vary \x and \y and this will be the right way around
  % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
  %\draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1
  %\draw ($(x) + (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(-0.1*\r,0);    % Q2
  %\draw ($(x) + (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(-0.1*\r,0);   % Q3
  %\draw ($(x) - (0.1*\r,0)$) -- ++(0,-0.1*\r) -- ++(0.1*\r,0);    % Q4

  % circle intersection point
  \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$$};
{% endtikz %}
</center>


These relationships can be easily proved using similar triangles and the definitions of the functions. I will leave that for the reader to work out.

<br>

## Where the Trigonometric Functions Get Their Names

First, I need to give some definitions.

<center>
{% tikz terms %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{2cm}
  \def\pointradius{0.04*\r}
  \coordinate (O) at (0,0);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);
  \draw[very thick, fill=black] (O) circle (\pointradius);

  % tangent
  \def\angle1{340}
  \def\x1{ {\r * cos(\angle1)} }
  \def\y1{ {\r * sin(\angle1)} }
  \draw[very thick, ->, red] (\x1, \y1) --  ( $({1.5 * cos(\angle1 - 90)}, {1.5 * sin(\angle1 - 90)}) + (\x1, \y1)$ );
  \draw[very thick, ->, red] (\x1, \y1) --  ( $({1.5 * cos(\angle1 + 90)}, {1.5 * sin(\angle1 + 90)}) + (\x1, \y1)$ );
  \draw[very thick, fill=black] (\x1, \y1) circle (\pointradius) node[below right, red] {Tangent};

  % secant
  \def\angle2{110}
  \def\x2{ {0.9 * \r * cos(\angle2)} }
  \def\y2{ {0.9 * \r * sin(\angle2)} }
  \draw[very thick, ->, cyan] (\x2, \y2) --  ( $({1.7 * cos(\angle2 - 90)}, {1.5 * sin(\angle2 - 90)}) + (\x2, \y2)$ );
  \draw[very thick, ->, cyan] (\x2, \y2) --  ( $({1.7 * cos(\angle2 + 90)}, {1.5 * sin(\angle2 + 90)}) + (\x2, \y2)$ );
  \draw[very thick, fill=black] ( $({0.97 * cos(\angle2 - 90)}, {0.97 * sin(\angle2 - 90)}) + (\x2, \y2) - (0, 0.05)$ ) circle (\pointradius);
  \draw[very thick, fill=black] ( $({0.8 * cos(\angle2 + 90)}, {0.8 * sin(\angle2 + 90)}) + (\x2, \y2) + (-0.05, 0.01)$ ) circle (\pointradius);
  \node[above=10, cyan] at (\x2, \y2) {Secant};

  % chord
  \def\angle3{170}
  \def\angle4{240}
  \def\x3{ {\r * cos(\angle3)} }
  \def\y3{ {\r * sin(\angle3)} }
  \def\x4{ {\r * cos(\angle4)} }
  \def\y4{ {\r * sin(\angle4)} }
  % Idk why \x3 and \y3 doesn't work, so I just calculated it manually
  \draw[very thick, teal] (-1.969615506cm, 0.347296355cm) -- (\x4, \y4) node[midway, xshift=-30, yshift=-10] {Chord};
  \draw[very thick, fill=black] (-1.969615506cm, 0.347296355cm) circle (\pointradius);
  \draw[very thick, fill=black] (\x4, \y4) circle (\pointradius);

{% endtikz %}
</center>

A **tangent** intersects the circumference of a circle at one point. A **chord** is a line segment whose endpoints both lie on the circumference of the circle. A **secant** is the extension of a chord.

Now, hopefully, the names of the rest of the trigonometric functions are clear. "Sine" and "cosine" are both half-chords of the circle (which is ultimately the origin of their confused etymology). "Secant" and "Cosecant" are both half-secants of the circle. Finally, "Tangent" and "cotangent" are both half-tangents of the circle. 

Also notice that $$\{ \sin \theta, \sec \theta, \tan \theta \}$$ and $$\{\cos \theta, \csc \theta, \cot \theta \}$$ are duals of each other. You will see in the identities of later posts, there is always a symmetry between these functions, which is a direct result of the symmetry of their geometry.

<br>

## Graphs

Finally, I provide the graphs of the trigonometric functions. It's nice to keep these in mind when interpreting the consequences of trig identities.

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
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
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
{% endtikz %}
</center>

<br>

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
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
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
{% endtikz %}
</center>

<br>

<center>
{% tikz tan-graph%}
  \usetikzlibrary{calc}
  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % axes
  \definecolor{deepmagenta}{rgb}{0.8, 0.0, 0.8}
  \draw[->, thick] (-4, 0) -- (4, 0) node[right] {$\theta$};
  \draw[->, thick] (0, -2.5) -- (0, 2.5) node[above] {$\tan \theta$};
  \draw[scale=1, domain=-4:-2, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
  \draw[scale=1, domain=-1.1:1.1, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
  \draw[scale=1, domain=2:4, smooth, variable=\x, deepmagenta, thick] plot ({\x}, {tan(180 * 0.318309887 * \x)});
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
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
{% endtikz %}
</center>

<br>

Notice the asymptotes in $\sec$, $\csc$, $\tan$, and $\cot$. See if you can determine which values of $\theta$ cause these asymptotes.