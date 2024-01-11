---
layout:     post
title:      "How Gauss Constructed the 17-Gon"
date:       2024-01-05
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       number-theory
---

## Table of Contents

- [Motivation](#motivation)
- [Background and Theory](#background-and-theory)
    - [Main Result](#main-result)
    - [What the Greeks Knew](#what-the-greeks-knew)
    - [A Connection to Algebra](#a-connection-to-algebra)
- [Converting the Problem to Number Theory](#converting-the-problem-to-number-theory)
    - [The Complex Plane](#the-complex-plane)
    - [The Cyclotomic Equation](#the-cyclotomic-equation)
- [Constructibility Proofs](#constructibility-proof)
    - [Helpful Properties](#helpful-properties)
    - [Constructibility Proof for a Regular Pentagon](#constructibility-proof-for-a-regular-pentagon)
    - [Constructibility Proof for a Regular Heptadecagon](#constructibility-proof-for-a-regular-heptadecagon)
    - [Why Is A Heptagon Not Constructible?](#why-is-a-heptagon-not-constructible)
- [Conclusion](#conclusion)

<br>

## Motivation {#motivation}

Using a ruler and compass, we **can** construct a regular heptadecagon ($17$-gon), but we **cannot** construct a regular heptagon ($7$-gon). Why? This fact is counter-intuitive as a $17$-gon seems much more complicated than a $7$-gon. How would one even prove such a claim?

<center>
{% tikz 17-gon-motivation %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{17}                    % just have to change this and everything else works
  \def\m{16}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\rotate{90}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

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

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \edef\xshift{ {15 * cos(\i * \angle + \rotate)} }
    \edef\yshift{ {15 * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz 7-gon-motivation %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{7}                     % just have to change this and everything else works
  \def\m{6}                     % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\rotate{90}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

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

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \edef\xshift{ {15 * cos(\i * \angle + \rotate)} }
    \edef\yshift{ {15 * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
</center>

<br>

All of this began with the ancient Greeks around 300 BC. They loved their ruler-and-compass constructions and were interested in regular polygons. The question became, which polygons are possible to construct and which are not? This problem remained unsolved until 1796 when 19-year-old <a href="https://en.wikipedia.org/wiki/Carl_Friedrich_Gauss" target="_blank">Carl Friedrich Gauss</a> came along to crack the problem wide open. 

In this post, I want to showcase Gauss's beautiful solution to this problem. The rigorous proof requires deep results from <a href="https://nrich.maths.org/1422" target="_blank">Galois theory</a>. My goal in this post is to give a high-level explanation of the result and give the reader a general intuition as to why it should be true.

<br>

--- 

## Background and Theory {#background-and-theory}

### Main Result {#main-result}

Gauss proved the following. A regular $n$-gon is constructible _if and only if_

$$
n = 2^{k} p_1 p_2 \ldots p_m
$$

where $k$ is any nonnegative integer and each $p_{\ell}$ are **distinct Fermat primes**, which is a prime of the form $p = 2^{2^i} + 1$ for some integer $i$.

The only current known Fermat primes are $3$, $5$, $17$, $257$, and $65537$. Thus, a $17$-gon can be constructed, but a $7$-gon cannot. Here is a list of all of the constructible regular $n$-gons under $300$.

$$
2, 3, 4, 5, 6, 8, 10, 12, 15, 16, 17, 20, 24, 30, 32, 34, 40, 48, 51, 60, 64, 68, \\ 
80, 85, 96, 102, 120, 128, 136, 160, 170, 192, 204, 240, 255, 256, 257, 272
$$

<br>

In this post, I am going to give a proof sketch of this result. It will not be 100% rigorous, but I hope it will be enough to convince you of why this is true. For a complete proof, I recommend reading Gauss's most famous book <a href="https://link.springer.com/book/10.1007/978-1-4939-7560-0" target="_blank">Disquisitiones Arithmeticae</a>.

<br>

### What the Greeks Knew {#what-the-greeks-knew}

In Euclid's infamous textbook <a href="https://en.wikipedia.org/wiki/Euclid%27s_Elements" target="_blank">The Elements</a>, he provided a few regular polygon constructions. First, he could construct an equilateral triangle, square, and regular pentagon. The equilateral triangle and square are quite simple. The regular pentagon is more complicated, but not too bad.

<center>
{% tikz equilateral-triangle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\n{3}
  \def\angle{360/\n}
  \def\rotate{90}
  \def\r{2cm}
  \def\pointradius{0.03*\r}

  \coordinate (O) at (0,0);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz square %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\n{4}
  \def\angle{360/\n}
  \def\rotate{45}
  \def\r{2cm}
  \def\pointradius{0.03*\r}

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz regular-pentagon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\n{5}
  \def\angle{360/\n}
  \def\rotate{90}
  \def\r{2cm}
  \def\pointradius{0.03*\r}

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
  
{% endtikz %}
</center>

<br>

Unfortunately, the resources I have found online for these are severely lacking. Maybe that means I have to do a series on this. If you know of a comprehensive resource on Greek ruler-and-compass constructions please <a href="mailto:epkeilty@gmail.com">let me know</a>. The best I could find are the following: <a href="https://mathbitsnotebook.com/Geometry/Constructions/CCconstructionEqui.html" target="_blank">equilateral triangle</a>, <a href="https://www.youtube.com/watch?v=8QaS6qNv1KM" target="_blank">square</a>, and <a href="https://www.wikihow.com/Construct-a-Regular-Pentagon" target="_blank">regular pentagon</a>.

<br>

Once you're able to construct these, there are regular polygons you can construct for free using two methods. In the first method, inscribe a regular $n$-gon into a circle and draw the <a href="https://www.youtube.com/watch?v=T0NCVVyu80c" target="_blank">perpendicular bisector</a>. Then, we can construct a regular $2n$-gon by extending the perpendicular bisector to the circle. Below is an example which constructs a regular hexagon using an equilateral triangle.

<center>
{% tikz equilateral-triangle-bisected %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\n{3}
  \def\angle{360/\n}
  \def\rotate{90}
  \def\r{3.5cm}
  \def\pointradius{0.03*\r}

  \coordinate (O) at (0,0);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
  
  % Drawing bisecting lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos((\i) * \angle + 30)} }
    \edef\y{ {\r * sin((\i) * \angle + 30)} }
    \draw[color=orange, thick] (O) -- (\x, \y);
  }

  % Drawing bisecting points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + 30)} }
    \edef\y{ {\r * sin(\i * \angle + 30)} }
    \draw[color=orange, very thick, fill=orange] (\x, \y) circle (\pointradius);
  }
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz regular-hexagon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\n{6}
  \def\angle{360/\n}
  \def\na{3}
  \def\anglea{360/\na}

  \def\rotate{90}
  \def\r{3.5cm}
  \def\pointradius{0.03*\r}

  \coordinate (O) at (0,0);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }
  \foreach \i in {1, 2, ..., \na} {
    \edef\xprev{ {\r * cos((\i-1) * \anglea + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \anglea + \rotate)} }
    \edef\x{ {\r * cos((\i) * \anglea + \rotate)} }
    \edef\y{ {\r * sin((\i) * \anglea + \rotate)} }
    \draw[color=gray, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 3, 5} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=orange, very thick, fill=orange] (\x, \y) circle (\pointradius);
  }
  \foreach \i in {2, 4, 6} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }

{% endtikz %}
</center>

<br>

In the second method, given a regular $p$-gon and $q$-gon which are <a href="https://en.wikipedia.org/wiki/Coprime_integers" target="_blank">coprime</a>, we can construct a regular $pq$-gon. Below is an example of constructing a regular $15$-gon from an equilateral triangle and a regular pentagon.

<center>
{% tikz equilateral-triangle-and-pentagon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\na{3}
  \def\anglea{360/\na}
  \def\nb{5}
  \def\angleb{360/\nb}
  \def\rotate{90}
  \def\r{3.5cm}
  \def\pointradius{0.03*\r}

  \coordinate (O) at (0,0);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \na} {
    \edef\xprev{ {\r * cos((\i-1) * \anglea + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \anglea + \rotate)} }
    \edef\x{ {\r * cos((\i) * \anglea + \rotate)} }
    \edef\y{ {\r * sin((\i) * \anglea + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }
  \foreach \i in {1, 2, ..., \nb} {
    \edef\xprev{ {\r * cos((\i-1) * \angleb + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angleb + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angleb + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angleb + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 2, ..., \na} {
    \edef\x{ {\r * cos(\i * \anglea + \rotate)} }
    \edef\y{ {\r * sin(\i * \anglea + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }
  \foreach \i in {1, 2, ..., \nb} {
    \edef\x{ {\r * cos(\i * \angleb + \rotate)} }
    \edef\y{ {\r * sin(\i * \angleb + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }

  % circling relevant points
  \def\txa{ {\r * cos(1 * \anglea + \rotate)} }
  \def\tya{ {\r * sin(1 * \anglea + \rotate)} }
  \draw[color=red, very thick] (\txa, \tya) circle (0.1*\r);

  \def\txb{ {\r * cos(2 * \anglea + \rotate)} }
  \def\tyb{ {\r * sin(2 * \anglea + \rotate)} }
  \draw[color=red, very thick] (\txb, \tyb) circle (0.1*\r);

  \def\pxa{ {\r * cos(2 * \angleb + \rotate)} }
  \def\pya{ {\r * sin(2 * \angleb + \rotate)} }
  \draw[color=red, very thick] (\pxa, \pya) circle (0.1*\r);

  \def\pxb{ {\r * cos(3 * \angleb + \rotate)} }
  \def\pyb{ {\r * sin(3 * \angleb + \rotate)} }
  \draw[color=red, very thick] (\pxb, \pyb) circle (0.1*\r);
  
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz regular-15-gon %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\n{15}
  \def\angle{360/\n}
  \def\na{3}
  \def\anglea{360/\na}
  \def\nb{5}
  \def\angleb{360/\nb}

  \def\rotate{90}
  \def\r{3.5cm}
  \def\pointradius{0.03*\r}

  \coordinate (O) at (0,0);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angle + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angle + \rotate)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }
  \foreach \i in {1, 2, ..., \na} {
    \edef\xprev{ {\r * cos((\i-1) * \anglea + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \anglea + \rotate)} }
    \edef\x{ {\r * cos((\i) * \anglea + \rotate)} }
    \edef\y{ {\r * sin((\i) * \anglea + \rotate)} }
    \draw[color=gray, very thick] (\xprev, \yprev) -- (\x, \y);
  }
  \foreach \i in {1, 2, ..., \nb} {
    \edef\xprev{ {\r * cos((\i-1) * \angleb + \rotate)} }
    \edef\yprev{ {\r * sin((\i-1) * \angleb + \rotate)} }
    \edef\x{ {\r * cos((\i) * \angleb + \rotate)} }
    \edef\y{ {\r * sin((\i) * \angleb + \rotate)} }
    \draw[color=gray, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \foreach \i in {1, 2, ..., \n} {
    \edef\x{ {\r * cos(\i * \angle + \rotate)} }
    \edef\y{ {\r * sin(\i * \angle + \rotate)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius);
  }

  % circling relevant points
  \def\txa{ {\r * cos(1 * \anglea + \rotate)} }
  \def\tya{ {\r * sin(1 * \anglea + \rotate)} }
  \draw[color=red, very thick] (\txa, \tya) circle (0.1*\r);

  \def\txb{ {\r * cos(2 * \anglea + \rotate)} }
  \def\tyb{ {\r * sin(2 * \anglea + \rotate)} }
  \draw[color=red, very thick] (\txb, \tyb) circle (0.1*\r);

  \def\pxa{ {\r * cos(2 * \angleb + \rotate)} }
  \def\pya{ {\r * sin(2 * \angleb + \rotate)} }
  \draw[color=red, very thick] (\pxa, \pya) circle (0.1*\r);

  \def\pxb{ {\r * cos(3 * \angleb + \rotate)} }
  \def\pyb{ {\r * sin(3 * \angleb + \rotate)} }
  \draw[color=red, very thick] (\pxb, \pyb) circle (0.1*\r);
{% endtikz %}
</center>

<br>

Place the equilateral triangle and regular pentagon at a common vertex (top of the circle). We make two observations. First, every point made by both the equilateral triangle and regular pentagon must lie on the regular $15$-gon. Second, since $3$ and $5$ are coprime, there must be some vertex in the triangle and some vertex in the pentagon which are adjacent (an exercise to the reader to prove why). These are circled in red. Thus, this will give us the length of one side of the regular $15$-gon, which allows us to generate the rest of it.

Euclid knew all of the above. Thus, the Greeks could theoretically construct regular $n$-gons of the form

$$
n = 2^{k} \cdot 3^{b_1} \cdot 5^{b_2}
$$

where $k$ is any nonnegative integer and $$b_1, b_2 \in \{0, 1\}$$ are binary values. However, this is where their knowledge stopped. No one could find a construction for any other regular $n$-gon that did not fall into the above pattern, nor knew whether it was even possible. 

<br>

### A Connection to Algebra {#a-connection-to-algebra}

Everything the Greeks did used strict Euclidean geometry. However, in order to thoroughly solve this problem, we need algebra. A major breakthrough came from René Descartes who formed a bridge between Greek constructions and algebra. In his book <a href="https://en.wikipedia.org/wiki/La_G%C3%A9om%C3%A9tries" target="_blank">La Géométrie</a>, he showed the following.

$$
\boxed{
    \text{a line segment of length } x \text{ is constructible with a ruler and compass} \qquad\\[15pt]
    \textit{if and only if} \\[15pt]
    \text{the number } x \text{ can be written as an algebraic expression} \\ 
    \text{involving only the operations } \ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }
}
$$

Such numbers are called **constructible numbers**. I will not give a proof of this. However, the intuition is that rulers can draw lines and compasses can draw circles. A ruler and compass construction plays with the intersections of lines and circles.

<center>
{% tikz line-line-intersection %}
  \draw[color=blue, ultra thick] (-2, -1) -- (2, 1);
  \draw[color=blue, ultra thick] (-0.5, -2) -- (0.5, 2);
  \draw[color=orange, very thick, fill=orange] (0, 0) circle (0.1cm);
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz line-circle-intersection %}
  \draw[color=blue, ultra thick] (0.75, -0.75) circle (1.5cm);
  \draw[color=blue, ultra thick] (-1.5, -1.5) -- (1.5, 1.5);
  \draw[color=orange, very thick, fill=orange] (-0.75, -0.75) circle (0.1cm);
  \draw[color=orange, very thick, fill=orange] (0.75, 0.75) circle (0.1cm);
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz circle-circle-intersection %}
  \draw[color=blue, ultra thick] (0, 0) circle (1.5cm);
  \draw[color=blue, ultra thick] (0.75, -0.75) circle (1.5cm);
  \draw[color=orange, very thick, fill=orange] (1.3672, 0.6172) circle (0.1cm);
  \draw[color=orange, very thick, fill=orange] (-0.6172, -1.3672) circle (0.1cm);
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
</center>

Recall the general formulas for lines and circles.

$$
y = mx + b \qquad\qquad (x - x_0)^2 + (y - y_0)^2 = r^2
$$

Since any length is constructed via a sequence of circle/line intersections, they are the result of equations involving only the operations $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$. Refer <a href="https://www.math.utah.edu/~bertram/courses/4030/Constructible.pdf" target="_blank">here</a> for a more detailed proof or study Galois theory. 

An important corollary is the following.

$$
\boxed{
    \text{an angle } \alpha \text{ is constructible with a ruler and compass} \\[15pt]
    \textit{if and only if} \\[15pt]
    \text{the number } \cos \alpha \text{ or } \sin \alpha \text{ can be written as an algebraic expression} \qquad \\ 
    \text{involving only the operations } \ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }
}
$$

This is pretty intuitive. If we can construct the length $\cos \alpha$ or $\sin \alpha$, then transport that length to a unit circle, raise the perpendicular line, and draw the corresponding triangle with angle $\alpha$. More detail is given <a href="https://math.stackexchange.com/questions/1355379/constructible-real-numbers" target="_blank">here</a>.


<br>

---

<br>

## Converting the Problem to Number Theory {#converting-the-problem-to-number-theory}

### The Complex Plane {#the-complex-plane}

Using Descartes' theorem, we will now convert the geometric problem into algebraic number theory. To do this, we imagine a regular $n$-gon inscribed inside the unit circle. Below are examples using a regular pentagon and a regular heptadecagon ($17$-gon).

<center>
{% tikz pentagon-in-unit-circle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{5}                     % just have to change this and everything else works
  \def\m{4}                     % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.5}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);
  \coordinate (XY) at (\x1, \y1);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % drawing angle
  \draw pic[draw, red, ->, pic text=$2 \pi / \n$, very thick, angle radius={0.3*\r}, angle eccentricity=\eccentricity] {angle = X--O--XY};
  \draw[color=black] (O)--(XY);

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle)} }
    \edef\x{ {\r * cos((\i) * \angle)} }
    \edef\y{ {\r * sin((\i) * \angle)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \draw[color=blue, very thick, fill=blue] (\r, 0) circle (\pointradius) node[xshift=25, yshift=8] at (\r, 0) {$\zeta^{0} = \zeta^{\n}$};
  \foreach \i in {1, 2, ..., \m} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
  
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz 17-gon-in-unit-circle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{17}                    % just have to change this and everything else works
  \def\m{16}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);
  \coordinate (XY) at (\x1, \y1);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % drawing angle
  \draw pic[draw, red, ->, pic text=$2 \pi / \n$, very thick, angle radius={0.3*\r}, angle eccentricity=\eccentricity] {angle = X--O--XY};
  \draw[color=black] (O)--(XY);

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle)} }
    \edef\x{ {\r * cos((\i) * \angle)} }
    \edef\y{ {\r * sin((\i) * \angle)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \draw[color=blue, very thick, fill=blue] (\r, 0) circle (\pointradius) node[xshift=25, yshift=8] at (\r, 0) {$\zeta^{0} = \zeta^{\n}$};
  \foreach \i in {1, 2, ..., \m} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
{% endtikz %}
</center>

Now, consider this regular $n$-gon in the <a href="https://en.wikipedia.org/wiki/Complex_plane" target="_blank">complex plane</a>. Recall that any complex number can be written in <a href="https://en.wikipedia.org/wiki/Cartesian_coordinate_system" target="_blank">Cartesian coordinates</a> and <a href="https://en.wikipedia.org/wiki/Polar_coordinate_system" target="_blank">Polar coordinates</a>.


$$
x + i y = r e^{i \theta}
$$

where $(x, y)$ gives the horizontal and vertical displacement of the complex number relative to the origin and $(r, \theta)$ gives the magnitude and angle of the complex number relative to the origin. Using polar notation, we see that the multiplication of two complex numbers is elegantly expressed as multiplying the magnitudes and adding the angles.

$$
(r_1 e^{i \theta_1}) \cdot (r_2 e^{i \theta_2}) = (r_1 \cdot r_2) e^{i (\theta_1 + \theta_2)}
$$

Now consider the angle $\zeta$ (labeled in red).

$$
\zeta = \cos(2 \pi/n) + i \sin(2 \pi/n) = e^{i \frac{2 \pi}{n}}
$$

Since the magnitude is $1$, multiplying $\zeta$ by itself results in rotation around the unit circle in increments of $2 \pi/n$. Therefore, each of the vertices of our regular $n$-gon can be represented by

$$
\zeta^k = \cos(2 \pi k/n) + i \sin(2 \pi k/n) = e^{i \frac{2 \pi k}{n}} \qquad \text{for all } k \in \mathbb{Z}
$$

<br>

Therefore, we have successfully converted the geometric polynomial into a set of algebraic variables. Now our goal is to find an exact formula for the values of the $\zeta$'s (in particular an expression for the quantity $\cos (\frac{2 \pi}{n})$). If we find that this expression only the operations $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$, then the associated regular $n$-gon must be constructible.

<br>

### The Cyclotomic Equation and Its Roots {#the-cyclotomic-equation}

Consider the polynomial 

$$
z^n - 1 = 0
$$

The <a href="https://www.youtube.com/watch?v=shEk8sz1oOw" target="_blank">fundamental theorem of algebra</a> tells us that this polynomial must have exactly $n$ complex roots. In fact, $\zeta^1, \zeta^2, \ldots, \zeta^{n-1}, \zeta^n$ are exactly these roots!

$$
(\zeta^k)^n = (\zeta^n)^k = 1^k = 1 \qquad \text{for all } k \in \mathbb{Z}
$$

Satisfying the above property means $\zeta^1, \zeta^2, \ldots, \zeta^{n-1}, \zeta^n$ are by definition the **nth roots of unity**.  

<br>

The root $\zeta^0 = \zeta^n = 1$ is called the **trivial root** and is not really of interest to us. Using high school algebra, we can factor out this root to get the polynomial.

$$
1 + z + z^2 + \ldots + z^{n-1} = 0
$$

This is called the **cyclotomic equation**, which is the polynomial whose roots are $\zeta^1, \zeta^2, \ldots, \zeta^{n-1}$.

<br>

What makes the cyclotomic equation special is that its roots are deeply connected. To see why, define the following notation.

$$
\langle a \rangle \equiv \{ a^i \ \mid \ i = 1, 2, \ldots, n \}
$$

In simple terms, this notation says to multiply $a$ by itself a bunch of times and see what you get. In technical terms, this is the cyclic subgroup generated by $a$. If $n$ is prime, then $\zeta^1, \zeta^2, \ldots, \zeta^{n-1}$ each satisfy the following property. 

$$
\langle \zeta^k \rangle = \langle \zeta^1 \rangle \simeq \mathbb{Z} / n \mathbb{Z} \qquad \text{for all } k \in \mathbb{Z}
$$

In simple terms, successive multiplication of any root will cycle around the unit circle and hit every vertex exactly once. In technical terms, $\zeta^k$ is a generator of the group $\mathbb{Z} / n \mathbb{Z}$. Below shows an example for $\zeta^3$ in the regular $7$-gon.

<center>
{% tikz 7-gon-cycle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{7}                     % just have to change this and everything else works
  \def\m{6}                     % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);
  \coordinate (XY) at (\x1, \y1);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle)} }
    \edef\x{ {\r * cos((\i) * \angle)} }
    \edef\y{ {\r * sin((\i) * \angle)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Draw cycle
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos(3*(\i-1) * \angle)} }
    \edef\yprev{ {\r * sin(3*(\i-1) * \angle)} }
    \edef\x{ {\r * cos(3*(\i) * \angle)} }
    \edef\y{ {\r * sin(3*(\i) * \angle)} }
    \draw[color=orange, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \draw[color=blue, very thick, fill=blue] (\r, 0) circle (\pointradius) node[xshift=30, yshift=0] at (\r, 0) {$\zeta^{0} = \zeta^{n}$};
  \foreach \i in {1, 2, ..., \m} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }

{% endtikz %}
</center>

$$
\langle \zeta^3 \rangle = \{ \zeta^{3}, \zeta^{6}, \zeta^{9}, \zeta^{12}, \zeta^{15}, \zeta^{18}, \zeta^{21} \} = \{ \zeta^{3}, \zeta^{6}, \zeta^{2}, \zeta^{5}, \zeta^{1}, \zeta^{4}, \zeta^{0} \} = \langle \zeta^1 \rangle
$$

<br>

A root which satisfies this property is called a **primitive root**. If $n$ is prime, then all roots of the cyclotomic equation are primitive roots. The intuition is that since we assumed $n$ is prime, no integer can evenly divide it, and therefore you could never get a subcycle. For more details, I recommend studying <a href="https://brilliant.org/wiki/group-theory-introduction/" target="_blank">group theory</a>, in particular cyclic groups and cyclic subgroups.

<br>

Side note, if $n$ is not prime, then we can decompose it into its primes, solve for the cyclotomic equation for each of these primes, and reconstruct the roots of $n$. Therefore, we only consider the case where $n$ is prime.

<br>


## Constructibility Proofs {#constructibility-proofs}

### Helpful Properties {#helpful-properties}

Before we can move on to constructibility proofs, there are two properties of interest. The first is the following. 

$$
\zeta + \zeta^2 + \ldots + \zeta^{n-1} = -1
$$

There are a few ways to derive this. The easiest is to use symmetry. From the graph, we can see that the center of mass of the points must be at the origin, Therefore, $\zeta + \zeta^2 + \ldots + \zeta^{n-1} + \zeta^n = 0$ and $\zeta^n = 1$.

<br>

The second property involves the complex conjugate of: $(\zeta^k)^* = \zeta^{n-k} = \zeta^{-k}$. Graphically, these correspond to the points of the polynomial on the mirrored side of the $x$-axis. Now, consider the following

$$
\zeta^1 + \zeta^{-1} = [\cos(2 \pi/n) + i \sin(2 \pi/n)] + [\cos(2 \pi/n) - i \sin(2 \pi/n)] = 2 \cos(2 \pi/n)
$$

And in general

$$
\zeta^k + \zeta^{-k} = 2 \cos(2 \pi k/n) \qquad\text{for each } k \in \mathbb{Z}
$$

Therefore, we have now isolated the quantity $\cos (\frac{2 \pi}{n})$, which is ultimately what we need to find an expression for.

<br>

### Constructibility Proof for a Regular Pentagon {#constructibility-proof-for-a-regular-pentagon}

Ultimately, we want to prove that a regular $17$-gon is constructible. As a warm-up, we are going to first prove this result for a regular pentagon. This will help show the main idea of these types of proofs, and make the proof of the regular $17$-gon less daunting. 

Recall that our goal is to derive the analytical expression for the angle of a regular pentagon (in particular the formula for $\cos(2 \pi / 5)$). If we can show that $\cos(2 \pi / 5)$ can be expressed only using the operations $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$, then we have proven that a regular pentagon is constructible.

<center>
{% tikz pentagon-in-unit-circle-2 %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{5}                     % just have to change this and everything else works
  \def\m{4}                     % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);
  \coordinate (XY) at (\x1, \y1);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % drawing angle
  \draw pic[draw, red, ->, pic text=$2 \pi / \n$, very thick, angle radius={0.3*\r}, angle eccentricity=\eccentricity] {angle = X--O--XY};
  \draw[color=black] (O)--(XY);

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle)} }
    \edef\x{ {\r * cos((\i) * \angle)} }
    \edef\y{ {\r * sin((\i) * \angle)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \draw[color=blue, very thick, fill=blue] (\r, 0) circle (\pointradius) node[xshift=15, yshift=8] at (\r, 0) {$\zeta^{0}$};
  \foreach \i in {1, 2} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
  \foreach \i in {-1, -2} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
{% endtikz %}
</center>

We consider the two pairs of conjugates and define the following

$$
\gamma_1 = \zeta^1 + \zeta^{-1} \qquad\qquad \gamma_2 = \zeta^2 + \zeta^{-2}
$$

Now, from the helpful properties above, we derive the following. Recall that $\zeta^{-k} = \zeta^{5-k}$ for the roots of a regular pentagon.

$$
\gamma_1 + \gamma_2 = \zeta^1 + \zeta^{-1} + \zeta^2 + \zeta^{-2} = \zeta^1 + \zeta^2 + \zeta^3 + \zeta^4 = -1
$$

Also

$$
\gamma_1 \cdot \gamma_2 = (\zeta^1 + \zeta^{-1}) \cdot (\zeta^2 + \zeta^{-2}) = \zeta^3 + \zeta^{-1} + \zeta^1 + \zeta^{-3} = \zeta^1 + \zeta^2 + \zeta^3 + \zeta^4 = -1
$$

<br>

Now comes the brilliant trick. Consider the following polynomial.

$$
(z - \gamma_1)(z - \gamma_2) = 0
$$

We know the roots must be $\gamma_1$ and $\gamma_2$. However, we can find the roots in a second way

$$
\begin{align}
  0 &= (z - \gamma_1)(z - \gamma_2) \\[10pt]
  &= z^2 - (\gamma_1 + \gamma_2)z + \gamma_1 \cdot \gamma_2 \\[10pt]
  &= z^2 + z - 1
\end{align}
$$

Therefore, using high school algebra, we know that the roots must be $\displaystyle \frac{-1 \pm \sqrt{5}}{2}$. You can convince yourself that that $\displaystyle \gamma_1 = \frac{-1 + \sqrt{5}}{2}$ and $\displaystyle \gamma_2 = \frac{- 1 - \sqrt{5}}{2}$. Therefore

$$
2 \cos(2 \pi / 5) = \gamma_1 = \frac{-1 + \sqrt{5}}{2} \qquad\implies\qquad \boxed{ \cos(2 \pi / 5) = \frac{-1 + \sqrt{5}}{4} }
$$

Therefore, since $\cos(2 \pi / 5)$ can be written as an algebraic expression involving only the operations $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$, a regular pentagon must be constructible (which we already knew).

<br>

### Constructibilty Proof for a Regular Heptadecagon {#constructibility-proof-for-a-regular-heptadecagon}

Now, let's do the same for a regular $17$-gon. It's going to be the same general idea as a regular pentagon but with a few more complications.

<center>
{% tikz 17-gon-in-unit-circle-2 %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{17}                    % just have to change this and everything else works
  \def\m{16}                    % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);
  \coordinate (XY) at (\x1, \y1);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % drawing angle
  \draw pic[draw, red, ->, pic text=$2 \pi / \n$, very thick, angle radius={0.3*\r}, angle eccentricity=\eccentricity] {angle = X--O--XY};
  \draw[color=black] (O)--(XY);

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle)} }
    \edef\x{ {\r * cos((\i) * \angle)} }
    \edef\y{ {\r * sin((\i) * \angle)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \draw[color=blue, very thick, fill=blue] (\r, 0) circle (\pointradius) node[xshift=15, yshift=8] at (\r, 0) {$\zeta^{0}$};
  \foreach \i in {1, 2, ..., 8} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
  \foreach \i in {-1, -2, ..., -8} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
{% endtikz %}
</center>

Consider the following variable definitions.

<center>
{% tikz 17-gon-derivation-tree %}
  \usetikzlibrary{positioning, calc}

  \tikzset{
    font={\fontsize{16pt}{16}\selectfont}
  }

  \node (A1) at (0, 0) {$\alpha_1 = \zeta^1 + \zeta^{-1}$};
  \node[below=0.5cm of A1] (A4) {$\alpha_4 = \zeta^4 + \zeta^{-4}$};
  \node[below=0.5cm of A4] (A8) {$\alpha_8 = \zeta^8 + \zeta^{-8}$};
  \node[below=0.5cm of A8] (A2) {$\alpha_2 = \zeta^2 + \zeta^{-2}$};
  \node[below=0.5cm of A2] (A3) {$\alpha_3 = \zeta^3 + \zeta^{-3}$};
  \node[below=0.5cm of A3] (A5) {$\alpha_5 = \zeta^5 + \zeta^{-5}$};
  \node[below=0.5cm of A5] (A7) {$\alpha_7 = \zeta^7 + \zeta^{-7}$};
  \node[below=0.5cm of A7] (A6) {$\alpha_6 = \zeta^6 + \zeta^{-6}$};
  
  \node[right=1.25cm of A1] (Z1) {};
  \node[right=1.25cm of A2] (Z2) {};
  \node[right=1.25cm of A3] (Z3) {};
  \node[right=1.25cm of A4] (Z4) {};
  \node[right=1.25cm of A5] (Z5) {};
  \node[right=1.25cm of A6] (Z6) {};
  \node[right=1.25cm of A7] (Z7) {};
  \node[right=1.25cm of A8] (Z8) {};

  \draw[thick] (A1.east) -- ++(0.75,0) |- ($(Z1)!0.5!(Z4)$) coordinate (Y1);
  \draw[thick] (A4.east) -- ++(0.75,0) |- ($(Z1)!0.5!(Z4)$) coordinate (Y2);
  \draw[thick] (A8.east) -- ++(0.75,0) |- ($(Z8)!0.5!(Z2)$) coordinate (Y3);
  \draw[thick] (A2.east) -- ++(0.75,0) |- ($(Z8)!0.5!(Z2)$) coordinate (Y4);
  \draw[thick] (A3.east) -- ++(0.75,0) |- ($(Z3)!0.5!(Z5)$) coordinate (Y5);
  \draw[thick] (A5.east) -- ++(0.75,0) |- ($(Z3)!0.5!(Z5)$) coordinate (Y6);
  \draw[thick] (A7.east) -- ++(0.75,0) |- ($(Z7)!0.5!(Z6)$) coordinate (Y7);
  \draw[thick] (A6.east) -- ++(0.75,0) |- ($(Z7)!0.5!(Z6)$) coordinate (Y8);

  \node[align=center, right=0.5cm of Y1] (B1) {$\beta_1 = \alpha_1 + \alpha_4 =$ \\[8pt] $\zeta^1 + \zeta^{-1} + \zeta^4 + \zeta^{-4}$};
  \node[align=center, right=0.5cm of Y3] (B2) {$\beta_2 = \alpha_8 + \alpha_2 =$ \\[8pt] $\zeta^8 + \zeta^{-8} + \zeta^2 + \zeta^{-2}$};
  \node[align=center, right=0.5cm of Y5] (B3) {$\beta_3 = \alpha_3 + \alpha_5 =$ \\[8pt] $\zeta^3 + \zeta^{-3} + \zeta^5 + \zeta^{-5}$};
  \node[align=center, right=0.5cm of Y7] (B4) {$\beta_4 = \alpha_7 + \alpha_6 =$ \\[8pt] $\zeta^7 + \zeta^{-7} + \zeta^6 + \zeta^{-6}$};

  \node[right=1.25cm of B1] (X1) {};
  \node[right=1.25cm of B2] (X2) {};
  \node[right=1.25cm of B3] (X3) {};
  \node[right=1.25cm of B4] (X4) {};

  \draw[thick] (B1.east) -- ++(0.75,0) |- ($(X1)!0.5!(X2)$) coordinate (W1);
  \draw[thick] (B2.east) -- ++(0.75,0) |- ($(X1)!0.5!(X2)$) coordinate (W2);
  \draw[thick] (B3.east) -- ++(0.75,0) |- ($(X3)!0.5!(X4)$) coordinate (W3);
  \draw[thick] (B4.east) -- ++(0.75,0) |- ($(X3)!0.5!(X4)$) coordinate (W4);

  \node[align=center, right=0.5cm of W1] (C1) {$\gamma_1 = \beta_1 + \beta_2 =$ \\[8pt] $\zeta^1 + \zeta^{-1} + \zeta^4 + \zeta^{-4} + \zeta^8 + \zeta^{-8} + \zeta^2 + \zeta^{-2}$};
  \node[align=center, right=0.5cm of W3] (C2) {$\gamma_2 = \beta_3 + \beta_4 =$ \\[8pt] $\zeta^3 + \zeta^{-3} + \zeta^5 + \zeta^{-5} + \zeta^7 + \zeta^{-7} + \zeta^6 + \zeta^{-6}$};

{% endtikz %}
</center>

These may seem like they came out of nowhere, but I assure you there are deep, deep mathematics behind them. Unfortunately, too much for me to cover in this already long post. I am planning on making a follow-up post. For further reading, I recommend studying <a href="https://nrich.maths.org/1422" target="_blank">Galois theory</a> and then reading <a href="https://people.reed.edu/~jerry/332/30kummer.pdf" target="_blank">this</a>.

<br>

Now, we are going to do a similar procedure to what we did for the regular pentagon in order to solve for $\alpha_1 = 2 \cos(2 \pi / 17)$. I will assert the following and leave it as an exercise for the reader to verify. Proving $\gamma_1 \cdot \gamma_2$ without using brute force is quite tricky. There is a good article <a href="https://crypto.stanford.edu/pbc/notes/numbertheory/gaussperiod.html" target="_blank">here</a>.

$$
\gamma_1 + \gamma_2 = \zeta^1 + \zeta^2 + \ldots + \zeta^{16} = -1 \qquad\qquad \gamma_1 \cdot \gamma_2 = 4 (\zeta^1 + \zeta^2 + \ldots + \zeta^{16}) = -4
$$

As before, we can consider the polynomial 

$$
\begin{align}
    0 &= (z - \gamma_1)(z - \gamma_2) \\
    &= z^2 - (\gamma_1 + \gamma_2)z + \gamma_1 \cdot \gamma_2 \\
    &= z^2 + z - 4
\end{align}
$$

and solve for it's roots

$$
\gamma_1 = \frac{-1 + \sqrt{17}}{2} \qquad\qquad \gamma_2 = \frac{-1 - \sqrt{17}}{2}
$$

Continuing, we do the same thing with $\beta_1$ and $\beta_2$. To save space, I am going to assert the necessary steps and the reader can fill in the gaps if they are inclined.

$$
\beta_1 + \beta_2 = \gamma_1 \qquad\qquad \beta_1 \cdot \beta_2 = \zeta^1 + \zeta^2 + \ldots + \zeta^{16} = -1
\\[10pt]
0 = (z - \beta_1)(z - \beta_2) = z^2 - \gamma_1 z - 1
\quad\implies\quad
\beta_1 = \frac{\gamma_1 + \sqrt{\gamma_1^2 + 4}}{2} = \frac{-1 + \sqrt{17} + \sqrt{34 - 2\sqrt{17}}}{4}
$$

We actually need the value of $\beta_3$, so we do the same procedure.

$$
\beta_3 + \beta_4 = \gamma_2 \qquad\qquad \beta_3 \cdot \beta_4 = \zeta^1 + \zeta^2 + \ldots + \zeta^{16} = -1
\\[10pt]
0 = (z - \beta_3)(z - \beta_4) = z^2 - \gamma_2 z - 1
\quad\implies\quad
\beta_3 = \frac{\gamma_2 + \sqrt{\gamma_2^2 + 4}}{2} = \frac{-1 - \sqrt{17} + \sqrt{34 + 2\sqrt{17}}}{4}
$$

Finally, we do this procedure one last time with $\alpha_1$ and $\alpha_4$. The reader can verify that

$$
\alpha_1 + \alpha_2 = \beta_1 \qquad\qquad \alpha_1 \cdot \alpha_4 = \zeta^5 + \zeta^{-3} + \zeta^3 + \zeta^{-5} = \beta_3
\\[10pt]
0 = (z - \alpha_1)(z - \alpha_4) = z^2 - \beta_1 z - \beta_3
\quad\implies\quad
\alpha_1 = \frac{\beta_1 + \sqrt{\beta_1^2 + 4\beta_3}}{2}
$$

Again, to save space I will leave it to the reader to simplify the final result. We know that $\alpha_1 = 2 \cos(2 \pi / 17)$. Therefore, we get

$$
\cos \frac{2\pi}{17} = \frac{1}{16} \left [-1 + \sqrt{17} + \sqrt{34 - 2\sqrt{17}} + 2\sqrt{17 + 3\sqrt{17} - \sqrt{34 - 2\sqrt{17}} - 2\sqrt{34 + 2\sqrt{17}}} \right ]
$$

<br>

Thus, since $\cos(2 \pi / 17)$ can be written as an expression involving only $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$, a regular heptadecagon must be constructible. This is what Gauss proved at 19 years old. For the actual construction of the regular heptadecagon, Numberphile has a great <a href="https://www.youtube.com/watch?v=87uo2TPrsl8" target="_blank">video</a>.

<br>

<!-- ### Why Does the Heptadecagon Constructibility Proof Work? {#why-does-the-heptadecagon-constructibility-proof-work}

It seems a bit magical how everything just magically reduces into something we calculated before. The trick is how we chose to partition the $\zeta$'s in the $\alpha$'s, $\beta$'s, and $\gamma$'s.

These are called **Gaussian Periods** and **Gaussian Sums**

$$
\gamma_{i+1} = \sum_{k = 0}^{7} \zeta^{3^{2k + i}} \qquad\text{for } i = 1, 2
$$

$$
\beta_{i+1} = \sum_{k = 0}^{3} \zeta^{3^{4k + i}} \qquad\text{for } i = 1, 2, 3, 4
$$

$$
\alpha_{i+1} = \sum_{k = 0}^{1} \zeta^{3^{8k + i}} \qquad\text{for } i = 1, 2, 3, 4, 5, 6, 7, 8
$$ -->

<!-- We need $n$ to be prime. If it is not, then the roots of unity (i.e. the vertices of the polygon) cannot be expressed in terms of the primitive root $\zeta$. Therefore, we don't get the property that $\zeta^i$ is located at the $i$th vertex of the regular $n$-gon. Thus, the proof will fail.

Furthermore, we need the prime to be of the form $2^{2^m} + 1$ (i.e. a Fermat prime) because we remove the root $\zeta^0$, then then we do the bracket thing where we consistently halve the summations until we can derive a formula for $\zeta^1 + \zeta^{-1}$. For example, let's see why a regular heptagon ($7$-gon) is not constructible. -->

### Why Is A Heptagon Not Constructible? {#why-is-a-heptagon-not-constructible}

Some may be wondering why this same procedure can't be used on a regular heptagon. Well it can, but the proof is going to fail. Let's see why.

<center>
{% tikz 7-gon-in-unit-circle %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  % INPUTS
  \def\n{7}                     % just have to change this and everything else works
  \def\m{6}                     % this is \n-1, it's annoying to have to write this, but it makes the forloops work
                                % for some reason, calculating {\n-1} doesn't work
  \def\eccentricity{1.8}        % You may also need to adjust this based on the size of the angle (for the label of the angle)

  \def\angle{360/\n}
  \def\r{3.5cm}
  \def\pointradius{0.02*\r}

  \def\x1{ {\r * cos(\angle)} }
  \def\y1{ {\r * sin(\angle)} }

  \coordinate (O) at (0,0);
  \coordinate (X) at (\r,0);
  \coordinate (Y) at (0, \r);
  \coordinate (XY) at (\x1, \y1);

  % draw the unit circle
  \draw[very thick] (O) circle (\r);

  % drawing angle
  \draw pic[draw, red, ->, pic text=$2 \pi / \n$, very thick, angle radius={0.3*\r}, angle eccentricity=\eccentricity] {angle = X--O--XY};
  \draw[color=black] (O)--(XY);

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};

  % Drawing lines
  \foreach \i in {1, 2, ..., \n} {
    \edef\xprev{ {\r * cos((\i-1) * \angle)} }
    \edef\yprev{ {\r * sin((\i-1) * \angle)} }
    \edef\x{ {\r * cos((\i) * \angle)} }
    \edef\y{ {\r * sin((\i) * \angle)} }
    \draw[color=blue, very thick] (\xprev, \yprev) -- (\x, \y);
  }

  % Drawing points
  \draw[color=blue, very thick, fill=blue] (\r, 0) circle (\pointradius) node[xshift=15, yshift=8] at (\r, 0) {$\zeta^{0}$};
  \foreach \i in {1, 2, ..., 3} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }
  \foreach \i in {-1, -2, ..., -3} {
    \edef\x{ {\r * cos(\i * \angle)} }
    \edef\y{ {\r * sin(\i * \angle)} }
    \edef\xshift{ {15 * cos(\i * \angle)} }
    \edef\yshift{ {15 * sin(\i * \angle)} }
    \draw[color=blue, very thick, fill=blue] (\x, \y) circle (\pointradius) node[xshift=\xshift, yshift=\yshift] at (\x, \y) {$\zeta^{\i}$};
  }

{% endtikz %}
</center>

As before, we are going to get 

$$
\gamma_1 = \zeta^{1} + \zeta^{-1} 
\qquad 
\gamma_2 = \zeta^{2} + \zeta^{-2}
\qquad
\gamma_3 = \zeta^{3} + \zeta^{-3}
$$

But now we have a problem. There is no way we can further combine these equations. The best we can do is the following

$$
0 = (z - \gamma_1)(z - \gamma_2)(z - \gamma_3) = z^3 - (\gamma_1 + \gamma_2 + \gamma_3)z^2 + (\gamma_1 \gamma_2 + \gamma_2 \gamma_3 + \gamma_3 \gamma_1)z - \gamma_1 \gamma_2 \gamma_3
$$

I will let the reader verify the following

$$
\gamma_1 + \gamma_2 + \gamma_3 = -1
\qquad
\gamma_1 \cdot \gamma_2 \cdot \gamma_3 = -1
\\[10pt]
\gamma_1 \cdot \gamma_2 = \zeta^1 + \zeta^3 + \zeta^4 + \zeta^6
\qquad
\gamma_2 \cdot \gamma_3 = \zeta^1 + \zeta^2 + \zeta^5 + \zeta^6
\qquad
\gamma_3 \cdot \gamma_1 = \zeta^2 + \zeta^3 + \zeta^4 + \zeta^5
$$

Therefore, we have the polynomial

$$
z^3 - z^2 - 2z + 1 = 0
$$

The factors of this are really gross, but the key point is that since it's a trinomial the solution will involve cube roots. A value involving a cube root cannot be constructed using a ruler and compass. Therefore, $\cos(2 \pi / 7)$ is not constructible.

<br>

---

<br>

## Conclusion {#conclusion}

At the beginning of this post, I asserted that a regular $n$-gon is constructible if and only if

$$
n = 2^{k} p_1 p_2 \ldots p_m
$$

where $k$ is any nonnegative integer and each $p_{\ell}$ are **distinct Fermat primes**, which is a prime of the form $p = 2^{2^i} + 1$ for some nonnegative integer $i$.

With all of our new knowledge and understanding of this problem, let's explain why this is true.

<br>

First, the $2^k$ part comes from starting with a regular polygon and bisecting each edge as many times as you like. We showed an example this by converting an equilateral triangle into a regular hexagon.

Second, the $p_1 p_2 \ldots p_m$ part comes from the fact that primes are obviously coprime with eachother. Therefore, given a regular $p$-gon and regular $q$-gon, we can construct a regulat $pq$-gon. We showed an example of this method by constructing a regular $15$-gon using an equilateral triangle and a regular pentagon. Therefore, all that remains to be explained is why the primes need to be Fermat primes.

Descartes provided a prided a bridge between ruler-and-compass constructions and algebra. He says that if a length can be expressed as a formula involving only $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$, then it is constructible (and vice versa). Thus, if we can construct $\cos(2 \pi / n)$, then we can construct the corresponding regular $n$-gon. 

Then, using number theory, we came up with a procedure for finding the exact formula of  $\cos(2 \pi / n)$ (assuming that $n$ is prime). In order to ensure that the solution involved only the operations $\ +, \ -, \ \times, \ \div, \text{ and } \sqrt{\ }$, we needed each step to involve finding the roots of a binomial. The only way to ensure that is for $n$ to be a Fermat prime. If it was not a Fermat prime, then eventually the procedure would produce a trinomial or larger, which would result in the solution involving cube root, or fifth root, etc. Therefore, it would not be constructible.