---
layout:     series
title:      "Trigonometric Functions"
date:       2022-10-12
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       11
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, trigonometry
---

## Sine

The continuity of all other trigonometric functions can be derived as a result of the continuity of $\sin(x)$. We need two facts for this proof, which I will prove at the end of the post.

$$
\lvert \cos(x) \rvert \leq 1 \qquad \forall x \in \mathbb{R}
$$

$$
\lvert \sin( x ) \rvert = \sin(\lvert x \rvert) \leq \lvert x \rvert \qquad \forall x \in \mathbb{R}
$$

It also utilizes the sum-to-product identity, which I prove in my [trigonometry series](/blog/trigonometry/sum-to-product/)

$$
\sin \alpha - \sin \beta = 2 \cos \left (\frac{ \alpha + \beta }{2} \right ) \sin \left (\frac{ \alpha - \beta }{2} \right )
$$

<br>

Fix any $\epsilon > 0$. Let $\delta = \epsilon$, then

$$
\begin{align}
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert x - a \rvert < \delta \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert x - a \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \frac{\lvert x - a \rvert}{2} < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \sin \left (\frac{\lvert x - a \rvert}{2} \right) < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \sin \left (\frac{ x - a }{2} \right ) \right \rvert < \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert \cos \left (\frac{ x + a }{2} \right ) \right \rvert \cdot \left \lvert \sin \left (\frac{ x - a }{2} \right ) \right \rvert < 1 \cdot \frac{\epsilon}{2} \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad 2 \cdot \left \lvert \cos \left (\frac{ x + a }{2} \right ) \right \rvert \cdot \left \lvert \sin \left (\frac{ x - a }{2} \right ) \right \rvert< \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \left \lvert 2 \cdot \cos \left (\frac{ x + a }{2} \right ) \cdot \sin \left (\frac{ x - a }{2} \right ) \right \rvert < \epsilon \\[10pt]
    &\exists \delta > 0 \quad\text{s.t.}\quad \lvert x - a \rvert < \delta \quad \implies \quad \lvert \sin (x) - \sin (a) \rvert < \epsilon \\[10pt]
\end{align}
$$

which completes the proof.

<br>

## Cosine

We use the property that $\cos(x) = \sin(\pi/2 - x)$ (which I prove in my [trigonometry series](/blog/trigonometry/complementary-supplementary-and-opposite-angles/)) and the continuity of $\sin(x)$

$$
\lim_{x \rightarrow a} \cos(x) = \lim_{x \rightarrow a} \sin(\pi/2 - x) = \sin(\pi/2 - a) = \cos(a)
$$

which completes the proof.

<br>

## The Rest

All other trignomoetric functions can be written in terms of $\sin$ and $\cos$, so their continuity is implied by the division and reciprocal properties.

$$
\lim_{x \rightarrow a} \tan(x) = \lim_{x \rightarrow a} \frac{\sin(x)}{\cos(x)} = \frac{\displaystyle \lim_{x \rightarrow a} \sin(x)}{\displaystyle \lim_{x \rightarrow a} \cos(x)} = \frac{\sin(a)}{\cos(a)} = \tan(a)
$$

$$
\lim_{x \rightarrow a} \sec(x) = \lim_{x \rightarrow a} \frac{1}{\cos(x)} = \frac{1}{\displaystyle \lim_{x \rightarrow a} \cos(x)} = \frac{1}{\cos(a)} = \sec(a)
$$

$$
\lim_{x \rightarrow a} \csc(x) = \lim_{x \rightarrow a} \frac{1}{\sin(x)} = \frac{1}{\displaystyle \lim_{x \rightarrow a} \sin(x)} = \frac{1}{\sin(a)} = \csc(a)
$$

$$
\lim_{x \rightarrow a} \cot(x) = \lim_{x \rightarrow a} \frac{\cos(x)}{\sec(x)} = \frac{\displaystyle \lim_{x \rightarrow a} \cos(x)}{\displaystyle \lim_{x \rightarrow a} \sin(x)} = \frac{\cos(a)}{\sin(a)} = \cot(a)
$$

<br>

## Inverse Trigonometric Functions

Since all of the trigonometric functions are continuous, their corresponding inverse functions must also be continuous. 

<br>

---

<br>

## Bounds on Sine and Cosine

If you look up these proofs online, you will see an argument based on the derivative of $\sin(x)$. However, I want to avoid circularity. It's actually very subtle. If you look at my proof [here](/blog/derivative-proofs/trigonometric-functions/), I use the fact that $\displaystyle \lim_{h \rightarrow 0} \frac{1 - \cos(h)}{h} = 0$. To prove this (given [here](/blog/derivative-proofs/squeeze-theorem/)), I use the fact that $\sin$ is continuous ($\displaystyle \lim_{x \rightarrow 0} \sin (x) = \sin(0) = 0$). Therefore, I cannot use the derivative of $\sin(x)$ to prove this bound.

### Sine

I will resort to first principles and use the geometric definition of $\sin$: the height of the right triangle formed by points on the unit circle.

<center>
{% tikz unit-circle-sine %}
  \usetikzlibrary{angles,patterns,calc}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\r{3.5cm}
  \def\angle{55}
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
  \draw pic[draw, red, ->, pic text=$x$, very thick, angle radius={0.2*\r}, angle eccentricity=1.4] {angle = X--O--xy};

  % drawing lines
  \draw[very thick] (O) -- (xy);
  \draw[thick, thick] (O) -- (x);
  \draw[thick, thick] (xy) -- (x) node[midway, right] {$\sin x$};

  % draw right angle indicator of triangle
  % I wanted to automate this so that I can vary \x and \y and this will be the right way around
  % but LaTeX isn't a programming language, so using \x and \y as variables is hard... will need to manually change this for each different quadrant
  \draw ($(x) - (0.1*\r,0)$) -- ++(0,0.1*\r) -- ++(0.1*\r,0);     % Q1

  % highlight the arc of the triangle
  \draw pic [draw, red, -, pic text=$x$, very thick, angle radius={\r}, angle eccentricity=1.1] {angle = X--O--xy};

  % circle intersection point
  \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$$};

  % draw the axes
  \draw[->] ($ (-\r,0) - (0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$$};
  \draw[->] ($ (0,-\r) - (0, 0.5cm) $) -- ($ (0,\r) + (0, 0.5cm) $) node[above] {$$};
{% endtikz %}
</center>

We will assume that the angle $x$ is in the first quadrant, i.e. that $x \in [0, \pi/2]$. The diagram shows that by definition $\sin(x)$ is the height of the right triangle. Furthermore, by definition, the length of the arc of the circle highlighted in red is equal to the angle $x$ measured in radians. 

Now, we can almost assert the bound without proof. Both the line and the arc travel from the point on the unit circle to the x-axis. The line $\sin(x)$ is the shortest distance from this point to the x-axis, and therefore it must be the case that $\sin(x) \leq x$ for all $x \in [0, \pi/2]$. 

Now, to get the rest of the values of $x$. By definition, we know that $\abs{\sin(x)} \leq 1$. Thus, if $\abs{x} \geq \pi/2$ it must be the case that $\abs{\sin(x)} \leq 1 < \pi/2 \leq \abs{x}$. Therefore, we have proven the result for all values of $x$. 

### Cosine

The bound for $\cos(x)$ comes from the definition of $\cos(x)$. It is obvious that the image of cosine cannot exceed the value of $1$.