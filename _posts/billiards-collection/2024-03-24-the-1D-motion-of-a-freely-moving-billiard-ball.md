---
layout:     post
title:      "The 1D Motion of a Freely Moving Billiard Ball"
date:       2024-03-24
categories: blog billiards
permalink:  ":categories/:title/"
series:     billiards
tags:       billiards, physics, pool
---

## Introduction

**Billiards** refers to a wide variety of games, but in most variants a turn consists of using a **cue stick** to strike the **cue-ball** (CB) towards an **object-ball** (OB) in order to achieve some objective (usually pocketing the OB). Being skilled at these games means accurately and precisely controlling what happens to _both_ the CB and OB after contact by imparting precise **speed** and **spin** on the CB.

In this post, I analyze the behavior of a single billiard ball on an infinite $1\text{D}$ cloth table, accounting for the interplay between speed and top/bottom spin with the friction between the ball and the table.


<br>

---

<br>

## Notation and Physical Values

I think good definitions and notation is very important, especially in a post like this where there are a lot of moving parts. Here I will detail each variable used and its meaning. I recommend using it as a reference.

### Variables of Motion

- $t$ = time
- $x$ = linear displacement (horizontal)
- $y$ = linear displacement (vertical)
- $v$ = linear velocity
- $a$ = linear acceleration
- $\theta$ = angular displacement
- $\omega$ = angular velocity
- $\alpha$ = angular acceleration

### Variables of Force and Torque

- $F$ = net force
- $f$ = friction force
- $N$ = normal force
- $mg$ = force due to gravity
- $\tau$ = net torque
- $I$ = moment of inertia 

### Subscripts

The above variables may have subscripts to denote different instantiations, e.g., $v_0$, $v_s$, $v_r$, $v_{s \rightarrow r}$, $v_{\text{stop}}$. It's important to keep track of what these means. I have listed the meaning of each subscript; their full contexts will be explained as they are used.

- $0$ = initial (read "naught")
- $s$ = sliding / slipping
- $r$ = rolling / rolling without slipping
- $s \rightarrow r$ = at the moment of transition from sliding to rolling
- $\text{stop}$ = at the moment all motion stops

<br>

---

<br>

## Overview of Motion

<!-- https://billiards.colostate.edu/physics_articles/Hierrezuelo_PhysEd_95_article.pdf -->
<!-- Coulomb’s law of sliding friction is f_s = mu_s N -->

Suppose at time $t = 0$ and position $x = 0$, a cue strikes the CB instantaneously imparting an **initial translational velocity** (speed) of $v_0$ and an **initial rotational velocity** (spin) of $\omega_0$. The diagram below shows the complete $1\text{D}$ motion of the CB.

<center>

<embed src="/blog-assets/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/CB%20Motion.svg" type="image/svg+xml" width="450px" height="500px" />
</center>

The remaining of this post will be breaking down all of the components of this complete motion. In particular, we wish to find analytic equations for its **translational velocity** $v(t)$ and **rotational velocity** $\omega(t)$.

There are two key stages to the motion of a freely moving CB. Initially, $v(t)$ and $\omega(t)$ are _uncorrelated_, i.e. they are two independent equations. This stage is called **sliding**. Eventually, the sliding frictional force between the CB and the table ($f_s$) stabilizes the motion, bringing the $v(t)$ and $\omega(t)$ in sync with each other, related by $v(t) = R \, \omega(t)$. Once this occurs the CB is in the second stage called **rolling** (which is how you intuitively imagine a ball moving). Finally, rolling frictional forces between the CB and the table ($f_r$) cause the rolling CB to come to a stop. 

Let's do a deeper analysis of rolling vs sliding.


### Rolling

**Rolling** (sometimes called **rolling without slipping**) is a specific type of CB motion. It occurs when the CB has perfect traction with the cloth of the table. This is probably how you intuitively imagine a ball or wheel moving. For example, when driving a car in normal conditions, the wheels of the car are _rolling_ over the road. If the CB moves horizontally some distance, then it must also rotate by that distance. Mathematically, we can write this as the following, which are called the **no slip conditions**.

$$
x = R \, \theta
\qquad
v = R \, \omega
\qquad
a = R \, \alpha
$$

All three statements are equivalent to each other since $a = \dot{v} = \ddot{x}$ and $\alpha = \dot{\omega} = \ddot{\theta}$. In order to better understand what these equations mean, consider the following diagram, which visualizes the CB's motion over time.

<center>
<embed src="/blog-assets/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/rolling.svg" type="image/svg+xml" width="320px" height="350px" />
</center>

Here, I have labeled equidistant points on the circumference of the CB. Imagine the CB rolling and as the colored points contact the table, they stay at the contacted points. If we are rolling without slipping, then a full rotation of the CB will correspond to moving exactly the distance of its circumference ($2\pi R$).

### Sliding

**Sliding** (sometimes called **rolling with slipping**) is best defined as any CB motion that is not rolling. If the CB does one full rotation (neglecting friction) and did not move exactly the distance of its circumference, then its surface must have lost traction with the table at some point. This is what is meant by slipping. 

In particular, there are two types of slipping. First, the CB can be **skidding**, which occurs when $v > R \omega$. This is analogous to suddenly slamming on the breaks while driving, causing the tires to stop rotating, but the cars momentum continues it forward. Second, the CB can **spin-out**, which occurs when $v < R \omega$. This is analogous to suddenly flooring the gas pedal from a stationary position, causing the wheels to turn extremely fast, but not yet gaining traction with the road. 

The diagram below illustrates the two far extremes of skidding (left) and spinning-out (right), where $\omega = 0$ and $v = 0$, respectively. The opaque dots show the motion of a rolling CB to act as a reference.

<center>
<embed src="/blog-assets/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/sliding-simplified.svg" type="image/svg+xml" width="720px" height="350px" />
</center>

Again, the above diagrams represent the far extremes of the spectrum of skidding and spinning-out. Typically, there will be some contribution of both rotational and translational velocities. Below are diagrams of the more generic cases. Notice in the skidding case (left) the CB moves more than it spins, and in the spin-out case (right) the CB spins more than it moves.

<center>
<embed src="/blog-assets/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/sliding.svg" type="image/svg+xml" width="800px" height="350px" />
</center>

These concepts are critically important for determining the equations of $v(t)$ and $\omega(t)$. As you can see by the above diagrams, the frictional force ($f_s$) act differently depending on if we are rolling, skidding, or spinning-out. 

<br>

## Newtonian Analysis

With the goal of finding equations for $v(t)$ and $\omega(t)$, we split these into two phases: sliding denoted by the subscript $s$ and rolling denoted by the subscript $r$.

$$
v(t) = 
\begin{cases}
v_s(t)      \quad &\text{if } 0 \leq t < t_{s \rightarrow r} \\[10pt]
v_r(t)      \quad &\text{if } t_{s \rightarrow r} \leq t \leq t_{\text{stop}}
\end{cases}
\qquad\qquad
\omega(t) = 
\begin{cases}
\omega_s(t)      \quad &\text{if } 0 \leq t < t_{s \rightarrow r} \\[10pt]
\omega_r(t)      \quad &\text{if } t_{s \rightarrow r} \leq t \leq t_{\text{stop}}
\end{cases}
$$

$t_{s \rightarrow r}$ is the time when the billiard ball transitions from sliding to rolling, and $t_{\text{stop}}$ is the time when the billiard ball comes to a stop.

First, we analyze the sliding case. In this analysis, we will also justify why it is true that the billiard ball transitions from sliding to rolling.

<br>

### Phase 1: Sliding - Analysis 

In stage $1$, the CB is **sliding** across the table meaning it does not have traction with the cloth of the table. Therefore, the translational velocity $v_s(t)$ and the rotational velocity $\omega_s(t)$ of the CB while sliding are _uncorrelated_. There are three cases:

<center>
<embed src="/blog-assets/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/sliding-cases.svg" type="image/svg+xml" width="600px" height="200px" />
</center>

The left diagram is the _skidding_ case which occurs when the rotational velocity is impeding the translational motion, i.e. $v_0 > R \omega_0$. In billiards, this case occurs in draw, stun, and weak follow shots. The middle diagram is the _rolling_ case, which occurs when the translational and rotational velocity are moving perfectly in sync, i.e. $v_0 = R \omega_0$. In billiards, this case occurs with rolling follow. Finally, the right diagram is the _spin-out_ case which occurs when rotational velocity is propelling the translational motion, i.e. $v_0 < R \omega_0$. In billiards, this case occurs with power follow.

As a special case, we will rigorously analyze _skidding_. Then we will generalize it to model all billiard ball sliding.

#### <u>Special Case: Skidding</u>

Suppose the CB is _skidding_ which means $v_0 > R \omega_0$. In this case, the **frictional force due to sliding** ($f_s$) points in the opposite direction of the CB's motion. There are many ways to model $f_s$. The most accurate way is to consider the deformation of the table due to the CB and do a geometric analysis. If you are interested, this is done [here](https://billiards.colostate.edu/physics_articles/Hierrezuelo_PhysEd_95_article.pdf). However, I want to keep things simple, so I am going to use **Coulomb’s law of friction** which says

$$
f_s = u_s N
$$

where $\mu_s$ is the **coefficient of sliding friction** between the ball and the cloth of the table and $N$ is the **normal force** between the CB and the table.

Now we apply Newton's second law for both 
<span class="tooltip">translational motion
    <span class="tooltiptext"> 
        $$
        \sum \boldsymbol{F} = m \boldsymbol{a}
        $$
    </span>
</span> and
<span class="tooltip">rotational motion
    <span class="tooltiptext"> 
        $$
        \sum \boldsymbol{\tau} = I \boldsymbol{\alpha}
        $$
    </span>
</span> to solve for the translational and angular accelerations. Consider the following force diagrams.

<center>
<embed src="/blog-assets/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/force-diagram.svg" type="image/svg+xml" width="500px" height="150px" />
</center>

Their corresponding net force and net torque equations are the following.

$$
\begin{align}
    &\textbf{Translational Motion} 
    &\qquad&\textbf{Rotational Motion}
    \\[10pt]
    &0 = \sum F_y = N - mg \implies N = mg
    &\qquad&I \alpha_s = \sum \tau_z = R f_s \implies \left ( \tfrac{2}{5} m R^2 \right ) \alpha_s = R ( m \mu_s g )
    \\[10pt]
    &ma_s = \sum F_x = -f_s = - \mu_s N \implies \boxed{ a_s = -\mu_s g }
    && \implies \boxed{ \alpha_s = \tfrac{5}{2} \tfrac{\mu_s g}{R} }
\end{align}
$$

Since $a_s$ and $\alpha_s$ are constant, we can write the equations of motion by integrating over time. Note that we are assuming that $x_0 = 0$ and $\theta_0 = 0$.

$$
\begin{align}
    &a_s(t) = - \mu_s g
    \qquad\qquad
    &&\alpha_s(t) = \tfrac{5}{2} \tfrac{\mu_s g}{R} \\[10pt]
    &v_s(t) = v_0 + a_s t = v_0 - \mu_s g t
    \qquad\qquad
    &&\omega_s(t) = \omega_0 + \alpha_s t = \omega_0 + \tfrac{5}{2} \tfrac{\mu_s g}{R} t \\[10pt]
    &x_s(t) = v_0t + \tfrac{1}{2} a_s t^2 =  v_0t - \tfrac{1}{2} \mu_s g t^2
    \qquad\qquad
    &&\theta_s(t) = \omega_0 t + \tfrac{1}{2} \alpha_s t^2 = \omega_0 t + \tfrac{5}{4} \tfrac{\mu_s g}{R} t^2
\end{align}
$$

A keen observer will notice that $v_s(t)$ began large and is becoming smaller, while $\omega_s(t)$ began small and is become larger. If we graph these functions, we notice something very interesting.

<center>
{% tikz velocity-plot %} [scale=1.5]
    \definecolor{mygreen}{RGB}{0,128,0}
    \pgfmathsetmacro{\g}{9.8}
    \pgfmathsetmacro{\us}{0.2}
    \pgfmathsetmacro{\ur}{0.015}
    \pgfmathsetmacro{\k}{0.7}
    \pgfmathsetmacro{\v}{3}
    \pgfmathsetmacro{\Rw}{-2}
    \pgfmathsetmacro{\tsr}{(2/7)/\us/\g * (\v - \Rw)/\k}
    \pgfmathsetmacro{\vsr}{(5/7)*\v + (2/7)*\Rw}
    \pgfmathsetmacro{\tf}{\tsr+(2/5)*(1/\g/\ur)*\vsr/\k}
    \begin{axis}[
                    grid=both,
                    axis lines=middle,
                    %axis equal,
                    xmin=-1,xmax=9,
                    ymin=-3,ymax=4,
                    xtick style={draw=none},
                    ytick style={draw=none},
                    xtick={1, 2, 3, 4, 5, 6, 7, 8},
                    ytick={-2, -1, 1, 2, 3},
                    xticklabels={},
                    yticklabels={},
                    xlabel=\(t\),ylabel=\(v \text{,} \, R \omega\),
                    samples=200,
                    extra y ticks={\v, \Rw},
                    extra y tick labels={$v_0$, $R\, \omega_0$},
                    extra y tick style={grid=major, yticklabel style={anchor=east, fill=white}},
                ]
        
        \addplot[domain=0:\tsr, blue, thick] {\v - (\us*\g)*x*\k};
        \addlegendentry{$v_s(t)$}

        \addplot[domain=0:\tsr, mygreen, thick] {\Rw + (5*\us*\g/2)*x*\k};
        \addlegendentry{$R \, \omega_s(t)$}

        \addplot[domain=\tsr:\tf, purple, thick] {\vsr - (5*\ur*\g/2)*(x-\tsr)*\k};
        \addlegendentry{$v_r(t) = R \, \omega_r(t)$}
    \end{axis}
{% endtikz %}
</center>

They intersect! What is the meaning of this intersection point? It is the exact point at which the translational motion and the rotational motion of the CB become in sync with each other. This is exactly the definition of **rolling without slipping**. Once this occurs, it would not make sense for the translational velocity to continue losing speed while the spin continues to increase. Instead, we have entered a second stage of it's motion, describe by different equations.

Before we analyze the second stage, let's first calculate when exactly the CB stops sliding and begins rolling without slipping. Let $t_{s \rightarrow r}$ denote the time at which this occurs. The **no slip condition** occurs when the following relationship holds.

$$
v_s(t) = R \omega_s(t)
$$

Therefore, we can easily calculate $t_{s \rightarrow r}$.

$$
\begin{align}
    &v_s(t_{s \rightarrow r}) = R \omega_s(t_{s \rightarrow r}) \\[10pt]
    &v_0 - \mu_s g \, t_{s \rightarrow r} = R\omega_0 + \tfrac{5}{2} \mu_s g \, t_{s \rightarrow r} \\[10pt]
    &\boxed{ t_{s \rightarrow r} = \tfrac{2}{7} \tfrac{1}{\mu_s g} (v_0 - R\omega_0) } \\[10pt]
\end{align}
$$ 

Let $v_{s \rightarrow r}$ be the velocity of the CB when it starts rolling without slipping.

$$
v_{s \rightarrow r} = v_s(t_{s \rightarrow r}) = v_0 - \mu_s g \left ( \tfrac{2}{7} \tfrac{1}{\mu_s g} (v_0 - R\omega_0) \right )
\implies \boxed{ v_{s \rightarrow r} = v_0 - \tfrac{2}{7} (v_0 - R\omega_0) = \tfrac{5}{7} v_0 + \tfrac{2}{7} R \omega_0 }
$$

Of course, $\omega_{s \rightarrow r} = v_{s \rightarrow r}/R$. Next, we calculate how far the CB travels while sliding, denoted $x_{s \rightarrow r}$. Note that we are assuming $x_0 = 0$.

$$
x_{s \rightarrow r} = x_s(t_{s \rightarrow r}) = v_0 \left ( \tfrac{2}{7} \tfrac{1}{\mu_s g} (v_0 - R\omega_0) \right ) - \tfrac{1}{2} \mu_s g \left ( \tfrac{2}{7} \tfrac{1}{\mu_s g} (v_0 - R\omega_0) \right )^2 \\[10pt]
\implies
\boxed{ x_{s \rightarrow r} = \tfrac{2}{49} \tfrac{1}{\mu_s g} (6v_0 + R\omega_0) (v_0 - R\omega_0) }
$$

Finally, we calculate how much the CB rotated while sliding, denoted $\theta_{s \rightarrow r}$. Note that we are assuming $\theta_0 = 0$.

$$
\theta_{s \rightarrow r} = \theta_s(t_{s \rightarrow r}) = \omega_0 \left ( \tfrac{2}{7} \tfrac{1}{\mu_s g} (v_0 - R\omega_0) \right ) + \tfrac{5}{4} \tfrac{\mu_s g}{R} \left ( \tfrac{2}{7} \tfrac{1}{\mu_s g} (v_0 - R\omega_0) \right )^2 \\[10pt]
\implies
\boxed{\theta_{s \rightarrow r} = \tfrac{1}{49} \tfrac{1}{\mu_s g} \tfrac{1}{R} (5v_0 + 9R\omega_0) (v_0 - R\omega_0) }
$$

<br>

#### <u>The General Solution</u>

Solving the general solution is exactly the same as the above special case.

Using Newton's second law, we get the translational and rotational accelerations, which essentially define the complete motion of this stage.

$$
a_s = \begin{cases}
    -\mu_s g    &\quad\text{if } v_0 > R \omega_0 \\[10pt]
    0           &\quad\text{if } v_0 = R \omega_0 \\[10pt]
    +\mu_s g    &\quad\text{if } v_0 < R \omega_0 \\[10pt]
\end{cases}
\qquad\qquad
\alpha_s = \begin{cases}
    +\tfrac{5}{2} \tfrac{\mu_s g}{R}    &\quad\text{if } v_0 > R \omega_0 \\[10pt]
    0                                   &\quad\text{if } v_0 = R \omega_0 \\[10pt]
    -\tfrac{5}{2} \tfrac{\mu_s g}{R}    &\quad\text{if } v_0 < R \omega_0 \\[10pt]
\end{cases}
$$

To clean these cases up a bit, define the following.

$$
\abs{x} = \begin{cases}
    -x  \quad &\text{if } x < 0 \\[5pt]
    0   \quad &\text{if } x = 0 \\[5pt]
    x   \quad &\text{if } x > 0
\end{cases}
\qquad\qquad
\texttt{sgn}(x) = \frac{x}{\abs{x}} = \begin{cases}
    -1  \quad &\text{if } x < 0 \\[5pt]
    0   \quad &\text{if } x = 0 \\[5pt]
    1   \quad &\text{if } x > 0
\end{cases}
$$

Then we can condense the equations. And now, we just integrate like we did before.

$$
\begin{align}
    &a_s = - \texttt{sgn}(v_0 - R \omega_0) \mu_s g
    &\qquad
    &\alpha_s = \texttt{sgn}(v_0 - R \omega_0) \tfrac{5}{2} \tfrac{\mu_s g}{R}
    \\[10pt]


    &v_s(t) = v_0 - \texttt{sgn}(v_0 - R \omega_0) \mu_s g t
    &\qquad
    &\omega_s(t) = \omega_0 + \texttt{sgn}(v_0 - R \omega_0) \tfrac{5}{2} \tfrac{\mu_s g}{R} t
    \\[10pt]
    
    &x_s(t) = v_0t - \texttt{sgn}(v_0 - R \omega_0) \tfrac{1}{2} \mu_s g t^2
    &\qquad
    &\theta_s(t) = \omega_0 t + \texttt{sgn}(v_0 - R \omega_0) \tfrac{5}{4} \tfrac{\mu_s g}{R} t^2
\end{align}
$$

Since the math is almost identical to the special case we analyzed above, I will just assert the values for all $s \rightarrow r$ values.

$$
\begin{align}
    t_{s \rightarrow r} &= \tfrac{2}{7} \tfrac{1}{\mu_s g} \abs{v_0 - R \omega_0}
    \\[10pt]

    v_{s \rightarrow r} = R\omega_{s \rightarrow r} &= v_0 - \tfrac{2}{7} (v_0 - R\omega_0) = \tfrac{5}{7} v_0 + \tfrac{2}{7} R \omega_0
    \\[10pt]

    x_{s \rightarrow r} &= \tfrac{2}{49} \tfrac{1}{\mu_s g} (6v_0 + R\omega_0) \abs{v_0 - R\omega_0}
    \\[10pt]

    \theta_{s \rightarrow r} &= \tfrac{1}{49} \tfrac{1}{\mu_s g} \tfrac{1}{R} (5v_0 + 9R\omega_0) \abs{v_0 - R\omega_0}
\end{align}
$$

<!-- I will refer to these sets of equations as 

$$
\Omega_s(t; \; v_0, \omega_0; \; R, \mu_s, g) = \{ a_s(t), \, v_s(t), \,  x_s(t), \, \alpha_s(t), \, \omega_s(t), \, \theta_s(t), \, t_{s \rightarrow r}, \, v_{s \rightarrow r}, \, x_{s \rightarrow r}, \, \omega_{s \rightarrow r}, \, \theta_{s \rightarrow r} \}
$$ -->

<br>

### Stage 2: Rolling - Analysis 

Now we analyze stage 2 where the CB **rolls without slipping**. In this stage, the translational velocity and rotational velocity are in sync, i.e. we have the following relationship.

$$
a_r = R \, \alpha_r
\qquad\qquad
v_r(t) = R \, \omega_r(t)
$$

Just like before, we can write the net force and net torque equations.

$$
\begin{align}
    &\textbf{Translational Motion} 
    &\qquad&\textbf{Rotational Motion}
    \\[10pt]
    &0 = \sum F_y = N - mg \implies N = mg
    &\qquad&I \alpha_r = \sum \tau_z = - R f_r \implies \left ( \tfrac{2}{5} m R^2 \right ) \alpha_r = - R ( m \mu_r g )
    \\[10pt]
    &
    && \implies \boxed{ \alpha_r = - \tfrac{5}{2} \tfrac{\mu_r g}{R} } \implies \boxed{ a_r = - \tfrac{5}{2} \mu_r g }
\end{align}
$$

Now the above analysis assumes that $v_{s \rightarrow r}$ is moving in the positive $x$-direction (to the right). However, it is possible to put so much draw on the ball to cause it to end up rolling backwards in the negative $x$-direction (to the left). In this case, the translational and angular velocities become negative. Thus, the general solution is the following.

$$
a_r = R \alpha_r = - \texttt{sgn}(v_{s \rightarrow r}) \mu_r g
$$

And again we integrate to get the equations of motion. Recall that rolling without slipping starts at time $t_{s \rightarrow r}$.

$$
\begin{align}
    v_r(t) = R \omega_r(t) &= v_{s \rightarrow r} - \texttt{sgn}(v_{s \rightarrow r}) \tfrac{5}{2} \mu_r g (t - t_{s \rightarrow r})
    \\[10pt]
    
    x_r(t) = R \theta_r(t) &= x_{s \rightarrow r} + v_{s \rightarrow r} (t - t_{s \rightarrow r}) - \texttt{sgn}(v_{s \rightarrow r}) \tfrac{5}{4} \mu_r g (t - t_{s \rightarrow r})^2
\end{align}
$$

Finally, we can calculate the time at which the CB stops rolling by setting $v_r(t) = 0$ and solving for $t$. 

$$
t_{\text{stop}} = t_{s \rightarrow r} + \tfrac{2}{5} \tfrac{1}{\mu_r g} \abs{v_{s \rightarrow r}}
$$

and evaluating $x_{\text{stop}} = x_r(t_{\text{stop}})$ gives

$$
x_{\text{stop}} = R \theta_{\text{stop}} = x_{s \rightarrow r} + \texttt{sgn}(v_{s \rightarrow r}) \tfrac{1}{5} \tfrac{1}{\mu_r g} v_{s \rightarrow r}^2
$$

<!-- Therefore, the above set of equations can be summarized as 

$$
\Omega_r(t; \; t_{s \rightarrow r}, v_{s \rightarrow r}, x_{s \rightarrow r}; \; R, \mu_r, g) = \{ a_r(t), \, v_r(t), \,  x_r(t), t_{\text{stop}}, \, x_{\text{stop}} \}
$$

Technically, $t_{s \rightarrow r}, v_{s \rightarrow r}, x_{s \rightarrow r}$ can all be expressed solely in terms of the inputs $v_0$ and $\omega_0$. But I don't think that simplifies into anything nice looking. -->

<br>

## Summarizing the Results

Therefore, the entire motion of any billiard ball can be modeled by the following equations.

$$
v(t) = 
\begin{cases}
    v_0 - \texttt{sgn}(v_0 - R \omega_0) \mu_s g t
        \quad &\text{if } 0 \leq t < t_{s \rightarrow r} \\[5pt]
    v_{s \rightarrow r} - \texttt{sgn}(v_{s \rightarrow r}) \tfrac{5}{2} \mu_r g (t - t_{s \rightarrow r})
        \quad &\text{if } t_{s \rightarrow r} \leq t \leq t_{\text{stop}}
\end{cases}

\\[20pt]

\omega(t) = 
\begin{cases}
    \omega_0 + \texttt{sgn}(v_0 - R \omega_0) \tfrac{5}{2} \tfrac{\mu_s g}{R} t
        \quad &\text{if } 0 \leq t < t_{s \rightarrow r} \\[5pt]
    \omega_{s \rightarrow r} - \texttt{sgn}(\omega_{s \rightarrow r}) \tfrac{5}{2} \tfrac{\mu_s g}{R} (t - t_{s \rightarrow r})
        \quad &\text{if } t_{s \rightarrow r} \leq t \leq t_{\text{stop}}
\end{cases}
$$

where

$$
\begin{align}
    t_{s \rightarrow r} &= \tfrac{2}{7} \tfrac{1}{\mu_s g} \abs{v_0 - R \omega_0}
    \\[10pt]

    v_{s \rightarrow r} = R\omega_{s \rightarrow r} &= v_0 - \tfrac{2}{7} (v_0 - R\omega_0) = \tfrac{5}{7} v_0 + \tfrac{2}{7} R \omega_0
    \\[10pt]

    t_{\text{stop}} &= t_{s \rightarrow r} + \tfrac{2}{5} \tfrac{1}{\mu_r g} \abs{v_{s \rightarrow r}}
\end{align}
$$

I have made a fun interactive [Desmos plot](https://www.desmos.com/calculator/zlhc6x8jgk) so you can play around with different initial conditions.

Probably way more complicated than you expected. And we haven't even considered CB/OB contact yet!