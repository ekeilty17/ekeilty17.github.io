---
layout:     series
title:      "Intuition of Limits and Continuity"
date:       2022-10-02
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       1
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon, intuition, discontinuity
---

## Discontinuity

The easiest way to understand **continuity** is to understand **discontinuity**. There are four types of discontinuities - removable, jump, infinite, and oscillating - which we will showcase here.

<br>
The function below shows a **removeable discontinuity** at $x = 3$.

<center>
{% tikz removeable-discontinuity %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=0.23:6, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 28)};
        \addplot[holdot] coordinates{(3, 2)};
        \addplot[soldot] coordinates{(3, 3)};
    \end{axis}
{% endtikz %}
</center>

<br>

The function is equal to the blue curve, except at $x = 3$. Instead of an equation equal to $2$ as the blue curve would suggest, it instead is equal to $2$. The function is also sometimes said to contain a **hole** at $x = 3$.

<br>

The function below is said to contain an **finite/jump discontinuity** at $x = 3$.

<center>
{% tikz jump-discontinuity %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=0.23:3, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 38)};
        \addplot[domain=3:6, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 18)};
        \addplot[holdot] coordinates{(3, 1)};
        \addplot[soldot] coordinates{(3, 3)};
    \end{axis}
{% endtikz %}
</center>

In this example, the function stops at the point $(3, 1)$ and starts back up again at a different point $(3, 3)$.

<br>

The function below is said to contain an **infinite discontinuity** at $x = 3$.

<center>
{% tikz infinite-discontinuity %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=0:2.8, blue, thick] {(x-3)^(-1)+2};
        \addplot[domain=3.2:6, blue, thick] {(x-3)^(-1)+2};
        \addplot [dashed, color=black] coordinates {(3, -2) (3, 5)};
    \end{axis}
{% endtikz %}
</center>

In this example, there is a vertical asymptote at $x = 3$, meaning the function tends to infinity around $x = 3$.

<br>

The function below is said to contain an **oscillating discontinuity** at $x = 3$.

<center>
{% tikz oscillating-discontinuity %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=500
                ]
        \addplot[domain=0:6, blue, thick] {2*sin(200*(x-3)^(-1))+2};
        %\addplot[domain=3.01:6, blue, thick] {2*sin(200*(x-3)^(-1))+2};
    \end{axis}
{% endtikz %}
</center>

In this example, the value of $f(x)$ is undefined at $x = 3$ because the function oscillates between the $y$-values $0$ and $4$. As the function gets closer to the point $x = 3$, it oscillates more and more, tending towards infinity. Thus, there is no definable value for the function to take at $x = 3$.

<br>

## Intuition of Limits

Consider the removeable discontinuity example, denote the function $f(x)$. Even though by definition $f(x) = 3$, there is a sense that saying $f(x) = 2$ is more useful information. If you consider the point $f(x + \epsilon)$ for a very small $\epsilon$, you would be much closer to the point $(3, 2)$ than $(3, 3)$. In other words, if we approach $x = 3$ along the curve of the function, we will approach the point $(3, 2)$. 

<center>
{% tikz limit-intuition-1 %}
    \usepgfplotslibrary{fillbetween}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1.5,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=2.117:4.185, yellow, line width=2mm] {0.1*(x*x*x - 10*x*x + 37*x - 28)};
        
        \addplot[domain=0.23:6, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 28)};
        \addplot[holdot] coordinates{(3, 2)};
        \addplot[soldot] coordinates{(3, 3)};

        % epsilon
        \addplot [dashed, color=black] coordinates {(2.117, 1.5) (\pgfkeysvalueof{/pgfplots/xmin}, 1.5)} node[xshift=10, yshift=0, fill=white] {$2 - \epsilon$};
        \addplot [dashed, color=black] coordinates {(4.185, 2.5) (\pgfkeysvalueof{/pgfplots/xmin}, 2.5) } node[xshift=10, yshift=0, fill=white] {$2 + \epsilon$};

        % delta
        \addplot [dashed, color=black] coordinates {(2.5, 1.7625) (2.5, \pgfkeysvalueof{/pgfplots/ymin})} node[xshift=-2, yshift=5, fill=white] {$3 - \delta$};
        \addplot [dashed, color=black] coordinates {(3.5, 2.1875) (3.5, \pgfkeysvalueof{/pgfplots/ymin})}  node[xshift=2, yshift=5, fill=white] {$3 + \delta$};
    \end{axis}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz limit-intuition-2 %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1.5,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=4.185:5.2278, yellow, line width=2mm] {0.1*(x*x*x - 10*x*x + 37*x - 28)};

        \addplot[domain=0.23:6, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 28)};
        \addplot[holdot] coordinates{(3, 2)};
        \addplot[soldot] coordinates{(3, 3)};

        % epsilon
        \addplot [dashed, color=black] coordinates {(4.185, 2.5) (\pgfkeysvalueof{/pgfplots/xmin}, 2.5)} node[xshift=11, yshift=0, fill=white] {$3 - \epsilon$};
        \addplot [dashed, color=black] coordinates {(5.2278, 3.5) (\pgfkeysvalueof{/pgfplots/xmin}, 3.5)} node[xshift=11, yshift=0, fill=white] {$3 + \epsilon$};
    \end{axis}
{% endtikz %}
</center>

<br>

Consider the jump discontinuity example. There is actually no definable limit in this situation. From the perspective of the left curve, the limit seems to tend towards $1$ as $x$ approaches $3$. However, from the perspective of the right curve, the limit seems to tend towards $3$ as $x$ approaches $3$. Thus, the total limit does not exist. However, this should give an intuition for the concept of a _left-handed_ and _right-handed_ limit.

<center>
{% tikz limit-intuition-3 %}
    \usepgfplotslibrary{fillbetween}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1.5,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=2.117:3, yellow, line width=2mm] {0.1*(x*x*x - 10*x*x + 37*x - 38)};
        
        \addplot[domain=0.23:3, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 38)};
        \addplot[domain=3:6, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 18)};
        \addplot[holdot] coordinates{(3, 1)};
        \addplot[soldot] coordinates{(3, 3)};

        % epsilon
        \addplot [dashed, color=black] coordinates {(2.117, 0.5) (\pgfkeysvalueof{/pgfplots/xmin}, 0.5)} node[xshift=10, yshift=0, fill=white] {$1 - \epsilon$};
        \addplot [dashed, color=black] coordinates {(\pgfkeysvalueof{/pgfplots/xmax}, 1.5) (\pgfkeysvalueof{/pgfplots/xmin}, 1.5) } node[xshift=10, yshift=0, fill=white] {$1 + \epsilon$};

        % delta
        \addplot [dashed, color=black] coordinates {(2.5, 0.7625) (2.5, \pgfkeysvalueof{/pgfplots/ymin})} node[xshift=-2, yshift=5, fill=white] {$3 - \delta$};
        %\addplot [dashed, color=black] coordinates {(3.5, 3.1875) (3.5, \pgfkeysvalueof{/pgfplots/ymin})}  node[xshift=2, yshift=5, fill=white] {$3 + \delta$};
    \end{axis}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz limit-intuition-4 %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-1.5,xmax=6,
                    ymin=-2,ymax=5,
                    xtick={1, 2, 3, 4, 5},
                    ytick={-1, 1, 2, 3, 4},
                    xlabel=\(x\),ylabel=\(y\),
                    samples=200
                ]
        \addplot[domain=3:4.185, yellow, line width=2mm] {0.1*(x*x*x - 10*x*x + 37*x - 18)};

        \addplot[domain=0.23:3, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 38)};
        \addplot[domain=3:6, blue, thick] {0.1*(x*x*x - 10*x*x + 37*x - 18)};
        \addplot[holdot] coordinates{(3, 1)};
        \addplot[soldot] coordinates{(3, 3)};

        % epsilon
        \addplot [dashed, color=black] coordinates {(\pgfkeysvalueof{/pgfplots/xmax}, 2.5) (\pgfkeysvalueof{/pgfplots/xmin}, 2.5)} node[xshift=11, yshift=0, fill=white] {$2 - \epsilon$};
        \addplot [dashed, color=black] coordinates {(4.185, 3.5) (\pgfkeysvalueof{/pgfplots/xmin}, 3.5)} node[xshift=11, yshift=0, fill=white] {$2 + \epsilon$};

        % delta
        %\addplot [dashed, color=black] coordinates {(2.5, 0.7625) (2.5, \pgfkeysvalueof{/pgfplots/ymin})} node[xshift=-2, yshift=5, fill=white] {$3 - \delta$};
        \addplot [dashed, color=black] coordinates {(3.5, 3.1875) (3.5, \pgfkeysvalueof{/pgfplots/ymin})}  node[xshift=2, yshift=5, fill=white] {$3 + \delta$};
    \end{axis}
{% endtikz %}
</center>

<br>

The infinite discontinuity occurs due to limits that tend towards infinity, which I am going to cover at the [end of the series](/blog/limits-and-continuity/infinite-limits/). The oscillating discontinuity is actually pretty complex. There is a really good video analyzing this function <a href="https://www.youtube.com/watch?v=1QAqxiO8VHM" target="_blank">here</a>.

<br>

## Definition of Finite Limits

Let $f$ be any function, $a \in \mathbb{R}$ not necessarily in the domain of $f$, and $L \in \mathbb{R}$ not necessarily in the range of $f$.

The notation $\displaystyle \lim_{x \rightarrow a^-} f(x) = L$ defines the **left-hand limit**, and it means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad x > a - \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

<br>

The notation $\displaystyle \lim_{x \rightarrow a^+} f(x) = L$ defines the **right-hand limit**, and it means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad x < a + \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

<br>

The notation $\displaystyle \lim_{x \rightarrow a} f(x) = L$ defines the **limit**, and it means

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) - L \rvert < \epsilon
$$

<br>

Notice that $\displaystyle \lim_{x \rightarrow a} f(x) = L$ if and only if $\displaystyle \lim_{x \rightarrow a^-} f(x) = L$ and $\displaystyle \lim_{x \rightarrow a^+} f(x) = L$

<br>

**If** such an $L$ satisfies the above, then the limit **exists** and is equal to $L$, otherwise, the limit does not exist and equality is left undefined.

<br>

## Definition of Continuity

We say that $f$ is **continuous** at $a$ if $\displaystyle \lim_{x \rightarrow a} f(x) = f(a)$. Written using the limit definition, 

$$
\forall \epsilon > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies \lvert f(x) - f(a) \rvert < \epsilon
$$

<br>

We say that $f$ is **continuous** if it is continuous for all $a$ in the domain of $f$.

<br>

Intuitively, a function is continuous if you can draw it without picking up your pencil. This is what the definition is essentially saying. If the limit is always equal to the value of the function, then locally the function always equals what it is approaching. 