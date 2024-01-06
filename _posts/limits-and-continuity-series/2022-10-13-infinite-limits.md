---
layout:     series
title:      "Infinite Limits"
date:       2022-10-13
categories: blog limits-and-continuity
permalink:  ":categories/:title/"
part:       12
series:     limits-and-continuity
tags:       limits, continuity, delta-epsilon
---

## Limits that Equal Infinity

Consider the function $f(x) = \frac{1}{(x-3)^2}$.

<center>
{% tikz infinite-discontinuity-2 %}
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
        \addplot[domain=0:2.8, blue, thick] {(x-3)^(-2)};
        \addplot[domain=3.2:6, blue, thick] {(x-3)^(-2)};
        \addplot [dashed, color=black] coordinates {(3, -2) (3, 5)};
    \end{axis}
{% endtikz %}
</center>

We currently cannot describe what happens at $x = 3$. This limit does not approach a finite value. Thus, we have to extend the allowable values of $L$ to the extended real numbers $$\{ - \infty \} \cup \mathbb{R} \cup \{ \infty \}$$. Now, we have to define what it means for a limit to equal positive or negative infinity. Suppose $a \in \mathbb{R}$.

$$
\lim_{x \rightarrow a} f(x) = \infty 
\qquad \iff \qquad \forall M > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies f(x) > M
$$

$$
\lim_{x \rightarrow a} f(x) = -\infty 
\qquad \iff \qquad \forall M > 0 \quad \exists \delta > 0 \quad \text{s.t.} \quad 0 < \lvert x - a \rvert < \delta \implies f(x) < -M
$$

Intuitively, this is saying no matter what upperbound I give you, given a point sufficiently close to $a$, the function will surpass this threshold.

<center>
{% tikz infinite-discontinuity-3 %}
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
        \addplot[domain=0:2.8, blue, thick] {(x-3)^(-2)};
        \addplot[domain=3.2:6, blue, thick] {(x-3)^(-2)};
        
        % M
        \addplot [dashed, color=black] coordinates {(\pgfkeysvalueof{/pgfplots/xmax}, 2.5) (\pgfkeysvalueof{/pgfplots/xmin}, 2.5) } node[xshift=10, yshift=0, fill=white] {$M$};

        % delta
        \addplot [dashed, color=black] coordinates {(2.5, 4) (2.5, \pgfkeysvalueof{/pgfplots/ymin})} node[xshift=-2, yshift=5, fill=white] {$3 - \delta$};
        \addplot [dashed, color=black] coordinates {(3.5, 4) (3.5, \pgfkeysvalueof{/pgfplots/ymin})}  node[xshift=2, yshift=5, fill=white] {$3 + \delta$};

    \end{axis}
{% endtikz %}
</center>


Of course, you can break this up into its left- and right-handed limits just as we did before. Often you have to in order to properly analyze functions. For example, $f(x) = \frac{1}{x-3}$. 

$$
\lim_{x \rightarrow 3^-} \frac{1}{x-3} = -\infty \qquad\qquad \lim_{x \rightarrow 3^+} \frac{1}{x-3} = \infty
$$

Therefore, $\lim_{x \rightarrow 3} \frac{1}{x-3}$ is undefined (just as before).

<br>

## Limits that Approach Infinity

In the above, we assumed that $$L \in \{ -\infty, \infty \}$$ and $a \in \mathbb{R}$. If the limit exists under these conditions it is called an infinite discontinuity or a vertical asymptote. Here, we are going to assume the opposite, i.e. $$a \in \{ -\infty, \infty \}$$ and $L \in \mathbb{R}$. This will create a horizontal asymptote.

$$
\lim_{x \rightarrow \infty} f(x) = L
\qquad \iff \qquad \forall \epsilon > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x > N \implies 0 < \lvert f(x) - L \rvert < \epsilon
$$

$$
\lim_{x \rightarrow -\infty} f(x) = L
\qquad \iff \qquad \forall \epsilon > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x < -N \implies 0 < \lvert f(x) - L \rvert < \epsilon
$$

This is the same as before but flipped 90 degrees. No matter how close to $L$ we get, I can always find a large enough value of $x$ such that $f(x)$ falls within that range.

<br>

## All the Infinities

Finally, we can assume that both $$a, L \in \{ -\infty, \infty \}$$. There are four combinations.

$$
\lim_{x \rightarrow \infty} f(x) = \infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x > N \implies f(x) > M
$$

$$
\lim_{x \rightarrow -\infty} f(x) = \infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x < -N \implies f(x) > M
$$

$$
\lim_{x \rightarrow \infty} f(x) = -\infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x > N \implies f(x) < -M
$$

$$
\lim_{x \rightarrow -\infty} f(x) = -\infty
\qquad \iff \qquad \forall M > 0 \quad \exists N > 0 \quad \text{s.t.} \quad x < -N \implies f(x) < -M
$$

<br>

## Limit Laws

I am not going to prove it here (because it would take an entire new series), but all of the previous limit laws also hold for these limit definitions.