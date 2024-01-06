---
layout:     series
title:      "Inverse Functions"
date:       2022-10-09
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       8
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, inverse, inverse-functions
---

Suppose that the limit of $f$ exists at $a \in \mathbb{R}$. Let $L \in \mathbb{R}$ such that $\displaystyle \lim_{x \rightarrow a} f(x) = L$. Therefore, by the definition of limits, we have

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

The above does not hold in general. The counter-example is a very strange function. Consider the constant function $f(x) = x$. Now, on the interval $(0, 1)$ we are going to separate the line in an interesting way. Consider the following function definition and graph.

$$
f(x) =
\begin{cases} 
    x                                   &\quad\text{if } x \leq 0 \\
    x + 2^{\lceil \log_2 x \rceil}    &\quad\text{if } 0 < x \leq \frac{1}{2} \\
    (x - \frac{1}{2}) + 2^{\lceil \log_2 (x - \frac{1}{2}) \rceil - 1}      &\quad\text{if } \frac{1}{2} < x \leq 1 \\
    x                                   &\quad\text{if } x > 1 \\
\end{cases}
$$ 

<!-- = \begin{cases} 
    x                          &\quad\text{if } x \leq 0 \\
    x - \frac{1}{2^{n+1}}      &\quad\text{if } 0 < x \leq \frac{1}{2} \\
    x + \frac{1}{2^{n}}        &\quad\text{if } \frac{1}{2} < x \leq 1 \\
    x                          &\quad\text{if } x > 1 \\
\end{cases}
\qquad = \qquad -->

<br>

<center>
{% tikz inverse-limit-counter-example %}
    \pgfplotsset{soldot/.style={color=red,only marks,mark=*},
             holdot/.style={color=red,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    width=15cm,
                    xmin=-0.5,xmax=1.25,
                    ymin=-0.5,ymax=1.25,
                    xtick={-0.25, 0.25, 0.5, 0.75, 1},
                    ytick={-0.25, 0.25, 0.5, 0.75, 1},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[blue, domain=-1:0, line width=1.15pt] {x};
        \foreach \n in {1, 2, 3, 4, ..., 10} {
            \edef\a{1/(2^(\n))}
            \edef\b{1/(2^(\n+1))}
            \addplot[red, domain=(\a):(\b), line width=1.15pt] {x + \a};
            \addplot[red, domain=(\a + 1/2):(\b + 1/2), line width=1.15pt] {x - 1/2 + \b};
        }
        \foreach \n in {1, 2, 3} {
            \edef\a{1/(2^(\n))}
            \edef\b{1/(2^(\n+1))}
            \addplot[soldot] coordinates{(\a, \a + \a)};
            \addplot[holdot] coordinates{(\b, \b + \a)};
            \addplot[soldot] coordinates{(\a + 1/2, \a + \b)};
            \addplot[holdot] coordinates{(\b + 1/2, \b + \b)};
        }
        \addplot[blue, domain=1:2, line width=1.15pt] {x};
        \addplot[color=blue,only marks,mark=*] coordinates{(0, 0)};
        \addplot[color=blue,fill=white,only marks,mark=*] coordinates{(1, 1)};

    \end{axis}
{% endtikz %}
</center>

<br>

The equation of $f(x)$ is much more confusing than it is conceptually. We have the line segment $f(x) = x$ on the interval $(0, 1]$. We chop the line up into an **infinite sequence of segments**, whose proportion is successively getting smaller as we go from the top right to the bottom left. The first two segments are $1/4^{\text{th}}$ the length, the second two segments are $1/8^{\text{th}}$ the length, and so on. Now, take these pairs which are equal in length and separate them. The first in the pair goes to the right and the second in the pair goes to the left. Do likewise for all pais. Now, we have two **infinite subsequences of segments**. The left subsequence is approaching the point $(0, 0)$ and the second subsequence is approaching the point $(\frac{1}{2}, 0)$.

An important detail is how the endpoints of each line segment are defined. They have to be constructed in such a way that allows $f$ to be bijective. Each line segment is open at the bottom left and closed at the top right. This is true for all segments (I only show this for the first few as the segments get too small). Additionally, it is important that $f(\frac{1}{2}) = \frac{3}{4}$ and does not equal $0$. Using a similar construction, but using floor instead of ceiling would result in $f$ not being injective.

I only gave the analytical equation so that you are convinced this function does exist. However, the graph should provide all of the intuition we need for the proof. 

<br>

Notice that through careful construction $f(x)$ is bijective and thus has a well-defined inverse function $f^{-1}(x)$. From the graph, it is clear that $\displaystyle \lim_{x \rightarrow 0} f(x) = 0$. We can also prove this from the analytical equations. Now, let's consider $\displaystyle \lim_{y \rightarrow 0} f^{-1}(y)$. As $y$ approaches $0$, the graph $f^{-1}(y)$ is going to oscillate infintely between the value $0$ and $\frac{1}{2}$. Thus, no value can be given to this limit, and therefore it does not exist!

<br>

## Other Discontinuities

In the above counter-example, we saw that the inverse limit did not exist due to an oscillating discontinuity. This is the nastiest type of discontinuity and does not occur in "normal" functions you'd see in most applications (evident by the complexity of the analytical equation in the counter-example). This begs the question, do other discontinuities cause us problems? The answer is no! I will leave it up to the reader to investigate why. 

Practically speaking, if a function has an inverse and that function's limit exists, then the limit of the inverse also likely exists.