---
layout:     series
title:      "Inverse Functions"
date:       2022-10-08
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       7
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, inverse, inverse-functions
---

**TODO**

Suppose that limit of $f$ exists at $a \in \mathbb{R}$. Let $L \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$. Therefore, by the definition of limits, we have

$$
\forall \epsilon_f > 0 \quad \exists \delta_f > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta_f \implies \lvert f(x) - L \rvert < \epsilon_f
$$

<br>

Suppose $f$ has a well-defined inverse function $f^{-1}$ such that $f^{-1}(f(x)) = x$ and $f(f^{-1}(y)) = y$. Note, this inverse function is often going to be defined on some subdomain of $f$, but this should not affect the limit within a small neighborhood of $a$. We want to determine when

$$
\lim_{y \rightarrow L} f^{-1}(y) = a
$$

In the limit form, this is 

$$
\forall \epsilon_{f^{-1}} > 0 \quad \exists \delta_{f^{-1}} > 0 \quad \text{s.t.} \quad 0 < \lvert y - L \rvert < \delta_{f^{-1}} \implies \lvert f^{-1}(y) - a \rvert < \epsilon_{f^{-1}}
$$


<br>


## Continuous Functions

If a function $f$ is continuous, then we can use the composition limit law to easily prove the result.

$$
\begin{align}
    &\lim_{y \rightarrow L} f(f^{-1}(y)) = \lim_{y \rightarrow L} y \\[10pt]
    &\lim_{y \rightarrow L} f(f^{-1}(y)) = L \\[10pt]
    &f \left ( \lim_{y \rightarrow L} f^{-1}(y) \right ) = L \\[10pt]
    &\lim_{y \rightarrow L} f^{-1}(y) = f^{-1}( L ) \\[10pt]
\end{align}
$$

<br>

Therefore, $f^{-1}$ is continuous. Furthermore, we can show that $f^{-1}(L) = a$, thus proving the result.

$$
\begin{align}
    &\lim_{x \rightarrow a} f^{-1}(f(x)) = \lim_{x \rightarrow a} x \\[10pt]
    &\lim_{x \rightarrow a} f^{-1}(f(x)) = a \\[10pt]
    &f^{-1} \left ( \lim_{x \rightarrow a} f(x) \right ) = a \\[10pt]
    &f^{-1}(L) = a
\end{align}
$$


<br>



## Counter-Example

The above does not hold in general. The counter-example is a very strange function. Consider the constant function $f(x) = x$. Now, on the interval $(0, 1)$ we are going to separate the line in an interesting way. For any value $x$, consider the interval $(\frac{1}{2^{n+1}}, \frac{1}{2^{n}})$ such that $x$ is contained within that interval. Now consider the following function definition and graph.

$$f(x) = \begin{cases} 
    x                          &\quad\text{if } x \leq 0 \\
    x - \frac{1}{2^{n+1}}      &\quad\text{if } 0 < x \leq \frac{1}{2} \\
    x + \frac{1}{2^{n}}        &\quad\text{if } \frac{1}{2} < x \leq 1 \\
    x                          &\quad\text{if } x > 1 \\
\end{cases}$$ 

<center>
{% tikz inverse-limit-counter-example %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    width=15cm,
                    xmin=-0.5,xmax=1.5,
                    ymin=-0.5,ymax=1.5,
                    xtick={-0.25, 0.25, 0.5, 0.75, 1, 1.25},
                    ytick={-0.25, 0.25, 0.5, 0.75, 1, 1.25},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[blue, domain=-1:0, line width=1.15pt] {x};
        \foreach \n in {1, 2, 3, 4, ..., 10} {
            \edef\a{1/(2^(\n))}
            \edef\b{1/(2^(\n+1))}
            \addplot[red, domain=\a:\b, line width=1.15pt] {x + \b};
            \addplot[red, domain=(1/2 + \a):(1/2 + \b), line width=1.15pt] {x - 1/2 + \a};
        }
        \addplot[blue, domain=1:2, line width=1.15pt] {x};
    \end{axis}
{% endtikz %}
</center>

<br>

Essentially, what we've done is separated the line segment in the interval $(0, 1)$ into two parts. Each part contains a countably infinite number of line segments.

Notice that $f(x)$ is bijective and thus has a well-defined inverse function $f^{-1}(x)$. From the graph, it is clear that $\displaystyle \lim_{x \rightarrow 0} f(x) = 0$. Now, let's consider $\displaystyle \lim_{y \rightarrow 0} f^{-1}(y)$. I claim that this limit does not exist. Why? As $y$ approaches $0$, the graph $f^{-1}(y)$ is going to oscillate infintely between the value $0$ and $1/2$. Thus, no value can be given to this limit.

<!-- ## Strictly Monotonic Functions

Suppose $f$ is strictly monotonically increasing. This means that the following property holds

$$
x_1 < x_2 \implies f(x_1) < f(x_2)
$$

You can think of it as the function preserves strict inequalities. -->