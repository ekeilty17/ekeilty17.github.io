---
layout:     series
title:      "Complex Numbers"
date:       2022-08-18
categories: blog trigonometry
permalink:  ":categories/:title/"
part:       17
series:     trigonometry
tags:       trigonometry, imaginary-numbers, complex-numbers
---

I originally wasn't going to make a post about this topic, but I realized that trigonometry is so connected to complex numbers, that it is a natural follow-up.

<br>

## Definitions of the Complex Numbers

The normal numbers that we use on a daily basis ($0$, $1$, $2$, $-1/12$, $\pi$, etc) are called **real numbers**. The set of all real numbers is denoted with the symbol $\mathbb{R}$. One property of squaring real numbers is that the result is always positive. There is seemingly no square root of a negative real number. Thus, mathematicians decided to define such a number into existence. The variable $i$ is defined as

$$
i^2 + 1 = 0 \qquad\text{or}\qquad i^2 = -1
$$

$i$ is called an **imaginary number**. The set of all imaginary numbers is denoted with the symbol $\mathbb{I}$. Now, suppose we want to take the square root of $-64$, we can do that as follows

$$
\sqrt{-64} \ = \ \sqrt{64 \cdot (-1)} \ = \ \sqrt{64} \cdot \sqrt{-1} \ = \ 8i
$$

Consider what happens when we combine real and imaginary numbers.

$$
z = x + iy      \qquad\text{For any } x, y \in \mathbb{R}
$$

Notice that there is no way to further simplify the right-hand side because real numbers and imaginary numbers do not interact via addition/subtraction. We call $z$ a **complex number** because it contains a real number component and an imaginary number component. The set of all real numbers is denoted with the symbol $\mathbb{C}$.

<br>

## The Complex Plane

Since the real and imaginary components of complex numbers are independent of each other, we can think of complex numbers as points on the 2D plane. The x-axis is the real number line, and the y-axis is the imaginary number line. This is called the **complex plane**.

<center>
{% tikz complex-plane %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{3cm}
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
    \draw[->] ($ (-0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$\mathbb{R}$};
    \draw[->] ($ (0, -0.5cm) $) -- ($ (0,2) + (0, 0.5cm) $) node[above] {$\mathbb{I}$};

    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$x + iy$};

    \draw[dashed] (xy) -- (x) node[below] {$a$};
    \draw[dashed] (xy) -- (y) node[left] {$bi$};

{% endtikz %}
</center>

This should look very familiar. We could instead express this same point using the real 2D plane.

<center>
{% tikz real-plane %}
    \usetikzlibrary{angles,patterns,calc}

    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \def\r{3cm}
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
    \draw[->] ($ (-0.5cm, 0) $) -- ($ (\r, 0cm) + (0.5cm, 0) $) node[right] {$\mathbb{R}$};
    \draw[->] ($ (0, -0.5cm) $) -- ($ (0,2) + (0, 0.5cm) $) node[above] {$\mathbb{I}$};

    \draw[very thick] (O) -- (xy) node[midway, above] {$r$};
    \draw[very thick, fill=black] (xy) circle (\pointradius) node[above right=0.1] at (xy) {$(r \cos \theta, r \sin \theta)$};

    % draw incident angle
    \pic [draw, red, ->, pic text=$\theta$, very thick, angle radius={0.4*\r}, angle eccentricity=1.3] {angle = X--O--xy};

{% endtikz %}
</center>

Therefore, we can instead express complex numbers as the following

$$
z = r\cos \theta + i r \sin \theta = r(\cos \theta + i \sin \theta) \qquad\text{For } r, \theta \in \mathbb{R} \text{ and } r > 0
$$

Now, instead of thinking of complex numbers as one real component and one imaginary component, we can think of them as a magnitude and a direction in the complex plane. Thus, the above is often shorted as $z = r \ cis \ (\theta)$. 

We now have two different, but equivalent, ways to write a complex number. $z = x + iy$ is call the **Cartesian form** and $z = r \ cis \ \theta$ is called **polar form**. It's important to know how to translate between them because they are useful in different situations. This is just a simple application of trigonometry and the Pythagorean theorem.

$$
\begin{align}
    &x = r \cos \theta   &\qquad\qquad&    r = \sqrt{x^2 + y^2} \\[10pt]
    &y = r \sin \theta   &\qquad\qquad&    \tan \theta = \frac{y}{x}
\end{align}
$$

<br>

## Addition, Multiplication, and Exponentiation of Complex Numbers

The addition of complex numbers occurs component-wise, thus we should use Cartesian form. If $z = x + i y$ and $w = a + i b$, then

$$
z + w = (x + a) + i (y + b)
$$

<br>

Multiplication of complex numbers is where things get interesting. Here, it is best to use polar forms. If $z = r(\cos \theta + i \sin \theta)$ and $w = s (\cos \phi + i \sin \phi)$, then

$$
\begin{align}
    z \cdot w 
    &= r(\cos \theta + i \sin \theta) \cdot s (\cos \phi + i \sin \phi) \\[10pt]
    &= rs(\cos \theta \cos \phi + i \sin \theta \cos \phi + i \sin \phi \cos \theta + i^2 \sin \theta \sin \phi) \\[10pt]
    &= rs((\cos \theta \cos \phi - \sin \theta \sin \phi) + i (\sin \theta \cos \phi + \sin \phi \cos \theta)) \\[10pt]
    &= rs(\cos (\theta + \phi) + i \sin (\theta + \phi)) \\[10pt]
\end{align}
$$

Thus, multiplying $z$ by $w$ **rotated** $z$ by the angle of $w$ and **scaled** $z$ by the magnitude of $w$.

<br>

Finally, we take a special case of the multiplication rule to get the **power rule**. If $z = r (\cos \theta + i \sin \theta)$ is a complex number, and $n$ is a positive integer, then

$$
z^n = r^n (\cos(n \theta) + i \sin(n \theta))
$$

<br>