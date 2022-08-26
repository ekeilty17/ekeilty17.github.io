$$
\begin{align}
    &(\overline{a \vee b}) \\
    &= (\overline{a \vee b}) \wedge \color{green}T
    &&
    &&\text{Identity} \\
    
    &= [(\overline{a \vee b}) \wedge \color{green}T] 
    &\wedge& [(\overline{a \vee b}) \wedge \color{green}T]
    &&\text{Idempotent} \\
    
    &= [(\overline{a \vee b}) \wedge (a \vee \overline{a})] 
    &\wedge& [(\overline{a \vee b}) \wedge (b \vee \overline{b})]
    &&\text{Excluded Middle} \\
    
    &= [(\overline{a \vee b}) \wedge \color{red}( (a \wedge (a \vee b)) \vee \overline{a} \color{red})] 
    &\wedge& [(\overline{a \vee b}) \wedge \color{red}( (b \wedge (a \vee b)) \vee \overline{b} \color{red})]
    &&\text{Absorption} \\

    &= [\color{red}( (\overline{a \vee b}) \wedge (a \wedge (a \vee b)) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( (\overline{a \vee b}) \wedge (b \wedge (a \vee b)) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Distributivity} \\

    &= [\color{red}( (\overline{a \vee b}) \wedge ((a \vee b) \wedge a) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( (\overline{a \vee b}) \wedge ((a \vee b) \wedge b) \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Commutativity} \\

    &= [\color{red}( ((\overline{a \vee b}) \wedge (a \vee b)) \wedge a \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( ((\overline{a \vee b}) \wedge (a \vee b)) \wedge b \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Associativity} \\

    &= [\color{red}( \color{red}F \wedge a \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}( \color{red}F \wedge b \color{red}) \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Noncontradiction} \\

    &= [\color{red}F \vee \color{red}( (\overline{a \vee b}) \wedge \overline{a} \color{red})] 
    &\wedge& [\color{red}F \vee \color{red}( (\overline{a \vee b}) \wedge \overline{b} \color{red})] 
    &&\text{Base} \\

    &= [ (\overline{a \vee b}) \wedge \overline{a} ] 
    &\wedge& [ (\overline{a \vee b}) \wedge \overline{b} ] 
    &&\text{Identity} \\

    &= ( (\overline{a \vee b}) \wedge (\overline{a \vee b}) ) \wedge (\overline{a} \wedge \overline{b} )
    &&
    &&\text{Associativity and Commutativity} \\

    &= (\overline{a \vee b}) \wedge (\overline{a} \wedge \overline{b} )
    &&
    &&\text{Idempotent} \\

    &\implies \overline{a} \wedge \overline{b}
    &&
    &&\text{Specialization} \\
\end{align}
$$