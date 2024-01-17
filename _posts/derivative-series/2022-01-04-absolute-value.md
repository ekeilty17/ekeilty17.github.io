---
layout:     series
title:      "Absolute Value"
date:       2022-01-04
categories: blog derivative-proofs
permalink:  ":categories/:title/"
part:       3
series:     derivative-proofs
tags:       derivatives, absolute-value
---

The absolute value is defined as 

$$
\lvert x \rvert = \begin{cases}
x &\qquad \text{ if } x \geq 0 \\
-x &\qquad \text{ if } x < 0
\end{cases}
$$

This is not a continuous function, so we have to break the derivative up into two cases as well. The derivative will be discontinuous at $x=0$, and thus does not exist. Using the power rule, we can evaluate each case. 

If $x > 0$, then $\lvert x \rvert = x$, thus $\frac{d}{dx} \lvert x \rvert = 1 \cdot x^0 = 1$. If $x < 0$, then $\lvert x \rvert = -x$, thus $\frac{d}{dx} \lvert x \rvert = -1 \cdot x^0 = -1$. 

Therefore, the derivative is the following. There are a few ways we can express it.

$$
\frac{d}{dx} \lvert x \rvert =  \frac{x}{\lvert x \rvert} = \text{sign}(x) = \begin{cases}
1 &\qquad \text{ if } x > 0 \\
-1 &\qquad \text{ if } x < 0
\end{cases}
$$

Note that the derivative at $x=0$ does not exist, since the left-hand limit would give a value of ${-}1$ and the right-hand limit would give a value of ${+}1$.


<br>

<center>
{% tikz absolute-value %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-3,xmax=3,
                    ymin=-2,ymax=4,
                    xtick={-2, -1, 0, 1, 2},
                    ytick={-1, 1, 2, 3},
                    xlabel=\(x\),ylabel=\( \lvert x \rvert \),
                    samples=500
                ]
        \addplot[domain=0:4, blue, thick] {x};
        \addplot[domain=-4:0, blue, thick] {-x};
    \end{axis}
{% endtikz %}
&emsp;&emsp;&emsp;&emsp;
{% tikz absolute-value-derivative %}
    \pgfplotsset{soldot/.style={color=blue,only marks,mark=*},
             holdot/.style={color=black,fill=white,only marks,mark=*},
             compat=1.12}
    \begin{axis}[   grid=both,
                    axis lines=middle,
                    ticklabel style={fill=white},
                    xmin=-3,xmax=3,
                    ymin=-2,ymax=4,
                    xtick={-2, -1, 0, 1, 2},
                    ytick={-1, 1, 2, 3},
                    xlabel=\(x\),ylabel=\( \frac{d}{dx} \lvert x \rvert \),
                    samples=500
                ]
        \addplot[domain=0:4, blue, thick] {1};
        \addplot[domain=-4:0, blue, thick] {-1};
        \addplot[holdot] coordinates{(0, 1)};
        \addplot[holdot] coordinates{(0, -1)};
    \end{axis}
{% endtikz %}
</center>

<!-- ## Something Silly

Just for fun, lets take the second derivative of $\lvert x \rvert$. We know that this should be $0$, but let's see if the math works out. -->

