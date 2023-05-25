---
layout:     series
title:      "Convolution"
date:       2023-05-15
categories: blog laplace-transforms
permalink:  ":categories/:title/"
part:       14
series:     laplace-transforms
tags:       laplace-transform, convolution
---

## Background

We define the following operation called **convolution**.

$$
f(t) * g(t) = \int_{-\infty}^{\infty} f(t-\tau) g(\tau) \ d\tau
$$

Convolution is a bit of a funny operation, but it has a lot of great applications in signal processing (which is also a main aplication of Laplace Transforms). To understand what this operation is going, fix two functions $f(\tau)$ and $g(\tau)$. Horizontally flip $f$, i.e. $f(-\tau)$. Then put $f$ all the way on the left and $g$ all the way on the right. Now, move $f$ and $g$ towards and through each other. This "movement" is parameterized by the variables $t$. 

<center>
{% tikz convolution1 %}
    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \draw[thick, orange] (-1cm, 0) -- (1cm, 2cm);
    \draw[thick, orange] (1cm, 2cm) -- (1cm, 0) node[midway, xshift=17, yshift=15] {$f(\tau)$};

    \draw[->] (-5cm, 0) -- (5cm, 0) node[right] {$\tau$};
    \draw[->] (0, -0.5cm) -- (0, 3cm) node[above] {$$};
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz convolution2 %}
    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \draw[thick, blue] (-1cm, 0) -- (-1cm, 2cm) node[midway, xshift=-17, yshift=15] {$g(\tau)$};
    \draw[scale=1, domain=-1:5, smooth, variable=\x, blue, thick] plot ({\x}, {2^(-\x)});

    \draw[->] (-5cm, 0) -- (5cm, 0) node[right] {$\tau$};
    \draw[->] (0, -0.5cm) -- (0, 3cm) node[above] {$$};
{% endtikz %}
</center>

<center>
{% tikz convolution3 %}
    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \draw[thick, orange] (-4cm, 0) -- (-2cm, 2cm) node[xshift=-50, yshift=-15] {$f(t-\tau)$};
    \draw[thick, orange] (-2cm, 2cm) -- (-2cm, 0);

    \node[] at (-3cm, 0) {\small $\mid$};
    \node[] at (-3.1cm, -0.5cm) {$-t$};

    \draw[thick, blue] (-1cm, 0) -- (-1cm, 2cm);
    \draw[scale=1, domain=-1:5, smooth, variable=\x, blue, thick] plot ({\x}, {2^(-\x)});

    \draw[->] (-5cm, 0) -- (5cm, 0) node[right] {$\tau$};
    \draw[->] (0, -0.5cm) -- (0, 3cm) node[above] {$$};
{% endtikz %}
&emsp;&emsp;&emsp;
{% tikz convolution4 %}
    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \fill[yellow!50] (-1cm, 0) -- (-1cm, 0.5cm) -- (-0.283151, {2^(0.283151}) -- (-0.283151, 0) -- cycle;
    \fill[yellow!50, domain=-0.283151:0.5, variable=\x] 
        (-0.283151, 0) -- (-0.283151, {2^(0.283151}) -- plot ({\x}, {2^(-\x)}) -- (0.5cm, 0) -- cycle;

    \draw[thick, blue] (-1cm, 0) -- (-1cm, 2cm);
    \draw[scale=1, domain=-1:5, smooth, variable=\x, blue, thick] plot ({\x}, {2^(-\x)});

    \draw[thick, orange] (-1.5cm, 0) -- (0.5cm, 2cm);
    \draw[thick, orange] (0.5cm, 2cm) -- (0.5cm, 0);

    \node[] at (-0.5cm, 0) {\small $\mid$};
    \node[] at (-0.6cm, -0.5cm) {$-t$};

    \draw[->] (-5cm, 0) -- (5cm, 0) node[right] {$\tau$};
    \draw[->] (0, -0.5cm) -- (0, 3cm) node[above] {$$};
{% endtikz %}
</center>

The yellow region in the figure above is the convolution of $f$ and $g$ at $t$, i.e. the intersecting area between $f(t - \tau)$ and $g(\tau)$

If you are still unclear with the interpretation of convolution, Wikipidia's [page](https://en.wikipedia.org/wiki/Convolution) on convolution has excellent visualizations. Also 3Blue1Brown's [video](https://www.youtube.com/watch?v=KuXjwB4LzSA&t=29s) has far better visualizations than I could produce here.

<br>

## Restrictions on f and g

For our application, we are going to assume that $f(t)$ and $g(t)$ are $0$ for all $t < 0$. This is not an unreasonable assumption since $t$ typically represents time. What this means is that we can simplify our convolution definition.

$$
f(t) * g(t) = \int_{0}^{t} f(t-\tau) g(\tau) \ d\tau
$$

Why is this the same as the previous definition? At $\tau < 0$, $g(\tau) = 0$. Likewise, at $\tau > t$, $f(t - \tau) = 0$.

<br>

## The Laplace Transform Proof

Given functions $f(t)$ and $g(t)$ with Laplace Transforms $F(s)$ and $G(s)$, respectively.

$$
\begin{align}
    \mathcal{L}\{ f(t) * g(t) \} 
    &= \int_{0}^{\infty} [f(t) * g(t)] e^{-st} \ dt \\[10pt]

    &= \int_{0}^{\infty} \left [ \int_{0}^{t} f(t-\tau) g(\tau) \ d\tau \right ] e^{-st} \ dt \\[10pt]

    &= \int_{0}^{\infty} \int_{0}^{t} f(t-\tau) g(\tau) e^{-st} \ d\tau \ dt \\[10pt]
\end{align}
$$

We have to pause here because what we want to do is exchange the order of integration. To do this, lets consider the region that we are integrating over.

<center>
{% tikz integration-region %}
    \tikzset{
        font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (O) at (0,0);
    \coordinate (x) at (5cm, 0);
    \coordinate (y) at (0, 5cm);
    \coordinate (xy) at (5cm, 5cm);

    \fill[fill=orange!15] (O) -- (x) -- (xy) -- cycle;

    \draw[->] (-0.5cm, 0) -- (5cm, 0) node[right] {$t$};
    \draw[->] (0, -0.5cm) -- (0, 5cm) node[above] {$\tau$};

    \draw[thick] (O) -- (xy) node[midway, xshift=-15, yshift=15] {$\tau = t$};

{% endtikz %}
</center>

Thus, we can construct the region by integrating $\tau$ from $0$ to $\infty$. Then $t$ will range from $\tau$ to $\infty$.

$$
\begin{align}
    \mathcal{L}\{ f(t) * g(t) \} 
    &= \int_{0}^{\infty} \int_{\tau}^{\infty} f(t-\tau) g(\tau) e^{-st} \ dt \ d\tau \\[10pt]
    &= \int_{0}^{\infty} \left [ \int_{\tau}^{\infty} f(t-\tau) e^{-st} \ dt \right ] g(\tau) \ d\tau \\[10pt]
    &\text{let } u = t-\tau \implies du = dt \\[10pt]
    &= \int_{0}^{\infty} \left [ \int_{0}^{\infty} f(u) e^{-s(u+\tau)} \ du \right ] g(\tau) \ d\tau \\[10pt]
    &= \int_{0}^{\infty} \left [ \int_{0}^{\infty} f(u) e^{-su} \ du \right ] g(\tau)e^{-s\tau} \ d\tau \\[10pt]
    &= \left [ \int_{0}^{\infty} f(u) e^{-su} \ du \right ] \cdot \left [ \int_{0}^{\infty}  g(\tau)e^{-s\tau} \ d\tau \right ]\\[10pt]
    &= F(s) \cdot G(s)
\end{align}
$$