$(a \vee b) \wedge (\overline{a} \vee c) \wedge (b \vee c) = (a \vee b) \wedge (\overline{a} \vee c)$

$$
\begin{align}
    &(a \vee b) \wedge (\overline{a} \vee c) \wedge (b \vee c) 
    && \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( \color{green}T \vee (b \vee c) \color{red})
    && \text{Identity} \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( (a \wedge \overline{a}) \vee (b \vee c) \color{red})
    && \text{Noncontradiction} \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( (a \vee (b \vee c)) \wedge (\overline{a} \vee (b \vee c)) \color{red})
    && \text{Distributivity} \\

    &= \color{red}( (a \vee b) \wedge (\overline{a} \vee c) \color{red}) \wedge \color{red}( ((a \vee b) \vee c) \wedge ((\overline{a} \vee c) \vee b) \color{red})
    && \text{Associativity and Commutativity} \\

    &= \color{red}( (a \vee b) \wedge ((a \vee b) \vee c) \color{red}) \wedge \color{red}((\overline{a} \vee c) \wedge ((\overline{a} \vee c) \vee b) \color{red})
    && \text{Associativity and Commutativity} \\

    &= (a \vee b) \wedge (\overline{a} \vee c)
    && \text{Absorption 2 times} \\
\end{align}
$$