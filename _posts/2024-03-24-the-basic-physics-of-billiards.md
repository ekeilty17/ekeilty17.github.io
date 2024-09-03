---
layout:     post
title:      "The Basic Physics of Billiards"
date:       2024-03-24
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       billiards, physics, pool
draft:      true
---

<!-- This is probably the best article for the full breakdown of a cueball collision: https://arxiv.org/html/2402.13258v1 -->

## Introduction

**Billiards** refers to a wide variety of games. North America typically plays [pool](https://en.wikipedia.org/wiki/Pool_(cue_sports)), the UK typically plays [snooker](https://en.wikipedia.org/wiki/Snooker), Russia typically plays [Russian pyramid](https://en.wikipedia.org/wiki/Russian_pyramid), and France and the Phillipines typically play [Carom](https://en.wikipedia.org/wiki/Carom_billiards). In each of these variants, a turn consists of using a **cue stick** to strike the **cue-ball** (CB) towards an **object-ball** (OB) in order to achieve some objective (usually pocketing the OB). Being skilled at these games means accurately and precisely controlling what happens to _both_ the CB and OB after contact. 

In this post, I am going to do a simplified analysis the physics of billiards. In particular, I am going to analyze a $1\text{D}$ system, calculating the trajectories of the CB and OB accounting for the effects of top and bottom spin. This analysis is a really nice application of high-school physics, requiring kinematics, Coulomb's law of friction, conservation of momentum, semi-elastic collisions, and the work-energy theorem.

This analysis may seem limiting as I am neglecting side-spin and the left/right trajectories of the CB and OB. This is true; however, I still feel this analysis will be very useful for beginner to intermiate players. First, it demonstrates how complex billiards actually is, and how many moving parts are involved in seeminly simple shots. Second, side-spin is so complicated that it should only be used by advanced players. Thus, the casual player only needs to understanding the effects of top and bottom spin. Third, often when controlling the CB after contact, its left/right trajectory is less important than getting the pace and spin correct. Finally, even in this simplified analysis, interesting and important concepts emerge such as CB/OB spin transfer and why the CB sometimes hops after contact.


<br>

---

<br>

## Notation and Physical Values

I think good definitions and notation is very important, especially in a post like this where there are a lot of moving parts. Here I will detail each variable used and its meaning. I recommend using it as a reference. It does not necessarily need to be read in great detail.

### Variables of Motion

- $t$ = time
- $x$ = linear displacement (horizontal)
- $y$ = linear displacement (vertical)
- $v$ = linear velocity
- $a$ = linear acceleration
- $\theta$ = angular displacement
- $\omega$ = angular velocity
- $\alpha$ = angular acceleration

### Variables of Force

- $F$ = generic force
- $f$ = friction force
- $N$ = normal force
- $mg$ = force due to gravity

### Subscripts

The above variables will have subscripts to denote different instances. For example, $v_0$, $v_s$, $v_r$, $v_{s \rightarrow r}$, $v_{\text{stop}}$, $v_{c_0}$, $v_{c}$, and $v_{c_f}$. It's important to keep track of what these means. I have listed what word each subscript represents. Their full contexts will be explained as they are used.

- $0$ = initial (read "naught")
- $s$ = sliding / slipping
- $r$ = rolling / rolling without slipping
- $s \rightarrow r$ = at the moment of transition from sliding to rolling
- $\text{stop}$ = at the moment all motion stops
- $b$ = ball-ball
- $c_0$ = at the instant of collision
- $c$ = during the collision
- $c_f$ = at the instant after the collision

When doing before/after momentum and energy analysis, I will use the subscript $i$ to mean before and subscript $f$ to mean after.

### Physical and Mathematical Constants

$$
\begin{align}
    &\bullet \text{Acceleration due to gravity on the surface of Earth:} && g = 9.8 \, \text{m} / \text{s}^2 \\[5pt]
    &\bullet \text{Ratio of a circle's circumference to its diameter:} && \pi = 3.14159
\end{align}
$$

### Pool Constants

In this post, I am going to solve everything in general terms. Some may find it enlightening to substitute the real-world values of these variables into the equations. Thus, below I have provided some ranges for these variables ([source](https://billiards.colostate.edu/faq/physics/physical-properties/)). Note that these apply specifically to North American pool. However, the values will be very similar for other variants.

$$
\begin{align}
    &\bullet \text{Radius of a standard pool ball:} && R = 1.125 \, \text{in} = 0.028575 \, \text{m} \\[5pt]
    &\bullet \text{Mass of a standard pool ball:} && m = 6 \, \text{oz} = 0.17 \, \text{kg} \\[5pt]
    &\bullet \text{Mass moment of inertia of a standard pool ball (sphere):} && I = \tfrac{2}{5}mR^2 = 5.55 \times 10^{-5} \, \text{kg} \, \text{m}^2 \\[5pt]
    &\bullet \text{ball-cloth coefficient of sliding friction:} && \mu_s \in [0.15, 0.4] \\[3pt]
    &\bullet \text{ball-cloth coefficient of rolling friction:} && \mu_r \in [0.005, 0.015] \\[5pt]
    &\bullet \text{ball-ball coefficient of friction:} && \mu_{b} \in [0.03, 0.08] \\[5pt]
    &\bullet \text{ball-ball coefficient of restitution:} && e_{b} \in [0.92, 0.98] \\[5pt]
    &\bullet \text{ball-ball collision time:} && \Delta t_c \in [250, 300] \ \mu \text{s}
\end{align}
$$

<!-- - ball-rail coefficient of restitution: $e_{\text{rail}} \in [0.6, 0.9]$ -->

### Typical Pool Ball Velocities

The following are the typical ranges of billiard ball speeds ([source](https://billiards.colostate.edu/faq/speed/typical)).

$$
\begin{align}
    &\bullet \text{Soft:} && < 1 \, \text{mph} && < 1.5 \, \text{fps} && < 0.45 \, \text{m}/\text{s} \\[5pt]
    &\bullet \text{Slow:} && 1 - 2 \, \text{mph} && 1.5 - 2.9 \, \text{fps} && 0.45 - 0.89 \, \text{m}/\text{s} \\[5pt]
    &\bullet \text{Medium:} && 2 - 4 \, \text{mph} && 2.9 - 5.9 \, \text{fps} && 0.89 - 1.9 \, \text{m}/\text{s} \\[5pt]
    &\bullet \text{Fast:} && 4 - 7 \, \text{mph} &&  5.9 - 10.3 \, \text{fps} &&  1.9 - 3.2 \, \text{m}/\text{s} \\[5pt]
    &\bullet \text{Power Shot:} && 7 - 10 \, \text{mph} && 10.3 - 14.7 \, \text{fps} && 3.2 - 4.5 \, \text{m}/\text{s} \\[5pt]
    &\bullet \text{Power Break:} && 25 - 30 \, \text{mph} && 37 - 44 \, \text{fps} && 11 - 13 \, \text{m}/\text{s} \\[5pt]
    &\bullet \text{Ridiculous:} && \geq 35 \, \text{mph} && \geq 51 \, \text{fps} && \geq 16 \, \text{m}/\text{s}
\end{align}
$$

### Typical Pool Ball Spins

I could not find a source of empirical data on typical spin rates of billiard shots. There is a video where Florian Kohler calculates the spin on one of his crazy [draw shots](https://www.youtube.com/watch?v=UG92u3rClhA), which clocked in at $3000$ RPMs $\approx 314$ rad/s. Therefore, I estimate that maximum draw/follow from a parallel cue should be something like $1500$ RPMs $\approx 157$ rad/s. If you know of any other sources on this, please <a href="mailto:epkeilty@gmail.com">let me know</a>.

<br>

---

<br>

## The Motion of the Freely Moving Billiard Ball

Before we can describe what happens when the CB and OB collide, we first need a complete description of the motion of a billiard ball moving freely down the table. 

### Overview

<!-- https://billiards.colostate.edu/physics_articles/Hierrezuelo_PhysEd_95_article.pdf -->
<!-- Coulomb’s law of sliding friction is f_s = mu_s N -->

Suppose a cue strikes the CB, instantaneously imparting an **initial velocity** of $v_0$ and an **initial spin** (rotational velocity) of $\omega_0$. The diagram below shows the complete $1\text{D}$ motion of the CB. 

<center>
<embed src="/svg/the-basic-physics-of-billiards/CB%20Motion.svg" type="image/svg+xml" width="450px" height="500px" />
</center>

There are two key stages to the motion of a freely moving CB. Initially, the translational velocity and rotational velocity are uncorrolated, which I denote as **sliding**. Eventually, the frictional force stabilizes the motion, bringing the translational velocity and rotational velocity in sync with eachother. Once this occurs the CB is in the second stage called **rolling** (which is how you intuitively image a ball moving). Finally, frictional forces eventually cause the rolling CB to come to a stop. 

Let's do a deeper analysis of these stages.

<br>

### Sliding vs Rolling

**Rolling** (sometimes called **rolling without slipping**) is a specific type of CB motion. It occurs when the CB has perfect traction with the cloth of the table. This is probably how you intuitively image a ball or wheel moving. For example, when driving a car in normal conditions, the wheels of the car are _rolling_ over the road. Stated more precisely, the translational velocity and the rotational velocity are perfectly in sync. If the CB moves horizontally some distance, then it must also rotate by that distance. Mathematically, we can write this as the following, which are sometimes called **no slip conditions**.

$$
x = R \, \theta
\qquad
v = R \, \omega
\qquad
a = R \, \alpha
$$

All three statements are equivalent to each other since $a = \dot{v} = \ddot{x}$ and $\alpha = \dot{\omega} = \ddot{\theta}$. In order to better visualize what these equations mean, consider the following diagram, which visualizes the CB's motion over time.

<center>
<embed src="/svg/the-basic-physics-of-billiards/rolling.svg" type="image/svg+xml" width="320px" height="350px" />
</center>

Here, I have labeled equidistant points on the circumference of the CB. If we are rolling without slipping, then a full rotation of the CB will correspond to moving exactly the distance of its circumference. 

<br>

**Sliding** (sometimes called **rolling with slipping**) is best defined as any CB motion that is not rolling. If the CB does one full rotation (neglecting friction) and did not move exactly the distance of its circumference, then its surface must have lost traction with the table at some point. This is what is meant by slipping. 

In particular, there are two types of slipping. First, the CB can be **skidding**, which occurs when $v > R \omega$. This is analogous to suddenly slamming on the breaks while driving, causing the tires to stop rotating, but the cars momentum continues it forward. Second, the CB can **spin-out**, which occurs when $v < R \omega$. This is analogous to suddenly flooring the gas pedal from a stationary position, causing the wheels to turn extemely fast, but not yet gaining traction with the road. The diagram below illustrates these two simple examples (left is skidding and right is spinning-out). The opaque dots show the motion of a rolling CB to act as a reference.

<center>
<embed src="/svg/the-basic-physics-of-billiards/sliding-simplified.svg" type="image/svg+xml" width="720px" height="350px" />
</center>

The above diagrams are special cases. Below I have visualized the general case of skidding and spinning-out. 

<center>
<embed src="/svg/the-basic-physics-of-billiards/sliding.svg" type="image/svg+xml" width="800px" height="350px" />
</center>

These concepts are critically important for our analysis. As you can see by the above diagrams, the frictional force ($f_s$) act differently depending on if we are rolling, skidding, or spinning-out.

<br>

### Phase 1: Sliding - Analysis 

In stage $1$, the CB is **sliding** across the table meaning it does not have traction with the cloth of the table. Therefore, the translational velocity $v_s(t)$ and the rotational velocity $\omega_s(t)$ of the CB while sliding are _uncorrolated_. By this I mean that there is not a general formula that can related them (unlike rolling). However, whether $v_s(t) < R \, \omega_s(t)$ or $v_s(t) > R \, \omega_s(t)$ influences the direction of the frictional force. 

The general formula contains two cases ($v_0 < R \, \omega_0$ and $v_0 > R \, \omega_0$). Therefore, I will first ananlyze a particular case to give an intuition of the overall dynamics of the system.

<br>

#### <u>Special Case: Draw Shot</u>

In this special case, we take $\omega_0$ to be rolling in the opposite direction of the CB's motion. We will assume the CB is initially hit towards the right (positive velocity), with counter-clockwise spin (negative angular velocity). Thus, this corresponds to _skidding_ where $v_0 > R \omega_0$.

**TODO** diagram

There are many ways to model the frictional force due to sliding. The most accurate way is to consider the deformation of the table due to the CB and do a geometric analysis. If you are interested, this is done [here](https://billiards.colostate.edu/physics_articles/Hierrezuelo_PhysEd_95_article.pdf). However, I want to keep things simple, so I am going to use **Coulomb’s law of friction** which says

$$
f_s = u_s N
$$

where $\mu_s$ is the **coefficient of sliding friction** between the ball and the cloth of the table.

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
</span> to solve for the translational and angular accelerations.

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

Now we can write the equations of motion. Note that we are assuming that $x_0 = 0$ and $\theta_0 = 0$.

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

A keen observer will notice that $v_s(t)$ began large and is becoming smaller, while $\omega_s(t)$ began small (negative) and is become larger. If we graph these functions, we notice something very interesting.

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

**TODO** diagrams

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

$v_0 < R \omega_0$ represents the case of **power follow**, where the top spin actually exceeds the rolling spin. The case $v_0 = R \omega_0$ represents **rolling follow** where the CB does not slide. Finally, The case $v_0 > R \omega_0$ represents all other shot types: **weak follow**, **stun**, and **draw**. Since the math is almost identical to the special case we analyzed above, I will just assert the remaining expressions.

$$
\begin{align}
    &\omega_s(t) = \begin{cases}
        \omega_0 + \tfrac{5}{2} \tfrac{\mu_s g}{R} t    &\quad\text{if } v_0 > R \omega_0 \\[10pt]
        \omega_0                                        &\quad\text{if } v_0 = R \omega_0 \\[10pt]
        \omega_0 - \tfrac{5}{2} \tfrac{\mu_s g}{R} t    &\quad\text{if } v_0 < R \omega_0 \\[10pt]
    \end{cases}
    &\qquad
    &t_{s \rightarrow r} = \tfrac{2}{7} \tfrac{1}{\mu_s g} \abs{v_0 - R \omega_0}
    \\[15pt]
    &\theta_s(t) = \begin{cases}
        \omega_0t + \tfrac{5}{4} \tfrac{\mu_s g}{R} t^2 &\quad\text{if } v_0 > R \omega_0 \\[10pt]
        0                                               &\quad\text{if } v_0 = R \omega_0 \\[10pt]
        \omega_0t - \tfrac{5}{4} \tfrac{\mu_s g}{R} t^2 &\quad\text{if } v_0 < R \omega_0 \\[10pt]
    \end{cases}
    &\qquad
    &\theta_{s \rightarrow r} = \tfrac{1}{49} \tfrac{1}{\mu_s g} \tfrac{1}{R} (5v_0 + 9R\omega_0) \abs{v_0 - R\omega_0}
    \\[15pt]
    &v_s(t) = \begin{cases}
        v_0 - \mu_s g t    &\quad\text{if } v_0 > R \omega_0 \\[10pt]
        v_0                &\quad\text{if } v_0 = R \omega_0 \\[10pt]
        v_0 + \mu_s g t    &\quad\text{if } v_0 < R \omega_0 \\[10pt]
    \end{cases}
    &\qquad
    &v_{s \rightarrow r} = R\omega_{s \rightarrow r} = v_0 - \tfrac{2}{7} (v_0 - R\omega_0) = \tfrac{5}{7} v_0 + \tfrac{2}{7} R \omega_0
    \\[15pt]
    &x_s(t) = \begin{cases}
        v_0t - \tfrac{1}{2} \mu_s g t^2    &\quad\text{if } v_0 > R \omega_0 \\[10pt]
        0                                  &\quad\text{if } v_0 = R \omega_0 \\[10pt]
        v_0t + \tfrac{1}{2} \mu_s g t^2    &\quad\text{if } v_0 < R \omega_0 \\[10pt]
    \end{cases}
    &\qquad
    &x_{s \rightarrow r} = \tfrac{2}{49} \tfrac{1}{\mu_s g} (6v_0 + R\omega_0) \abs{v_0 - R\omega_0}
    
    
\end{align}
$$

<br>

I will refer to these sets of equations as 

$$
\Omega_s(t; \; v_0, \omega_0; \; R, \mu_s, g) = \{ a_s(t), \, v_s(t), \,  x_s(t), \, \alpha_s(t), \, \omega_s(t), \, \theta_s(t), \, t_{s \rightarrow r}, \, v_{s \rightarrow r}, \, x_{s \rightarrow r}, \, \omega_{s \rightarrow r}, \, \theta_{s \rightarrow r} \}
$$

<br>

### Stage 2: Rolling - Analysis 

Now we analyze stage 2 where the CB **rolls without slipping**. In this stage, the translational velocity and rotational velocity are in sync, i.e. we have the following relationship.

$$
a_r = R \, \alpha_r
\qquad\qquad
v_r(t) = R \, \omega_r(t)
$$

Note that in this section, we are going to assume that the ball starts rolling without slipping at $t = 0$, and then afterwards we can just shift the time by $t_{s \rightarrow r}$.

**TODO** draw diagram

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
a_r = \begin{cases}
    +\tfrac{5}{2} \mu_r g   &\quad\text{if } v_{s \rightarrow r} < 0 \\
    0                       &\quad\text{if } v_{s \rightarrow r} = 0 \\
    -\tfrac{5}{2} \mu_r g   &\quad\text{if } v_{s \rightarrow r} > 0 \\
\end{cases}
\qquad\qquad
\alpha_r = a_r / R
$$

And now we do very similar math to before to get the general equations of motion.

$$
\begin{align}
    &v_r(t) = \begin{cases}
        v_{s \rightarrow r} + \tfrac{5}{2} \mu_r g t    &\quad\text{if } v_{s \rightarrow r} < 0 \\
        0                                               &\quad\text{if } v_{s \rightarrow r} = 0 \\
        v_{s \rightarrow r} - \tfrac{5}{2} \mu_r g t    &\quad\text{if } v_{s \rightarrow r} > 0 \\
    \end{cases}
    &\qquad
    &t_{\text{stop}} = \tfrac{2}{5} \tfrac{1}{\mu_r g} \abs{v_{s \rightarrow r}}
    \\[20pt]
    &x_r(t) = \begin{cases}
        x_{s \rightarrow r} + v_{s \rightarrow r} t + \tfrac{5}{4} \mu_r g t^2      &\quad\text{if } v_{s \rightarrow r} < 0 \\
        x_{s \rightarrow r}                                                         &\quad\text{if } v_{s \rightarrow r} = 0 \\
        x_{s \rightarrow r} + v_{s \rightarrow r} t - \tfrac{5}{4} \mu_r g t^2      &\quad\text{if } v_{s \rightarrow r} > 0 \\
    \end{cases}
    &\qquad
    &x_{\text{stop}} = \begin{cases}
        x_{s \rightarrow r} - \tfrac{1}{5} \tfrac{1}{\mu_r g} v_{s \rightarrow r}^2   &\quad\text{if } v_{s \rightarrow r} < 0 \\
        x_{s \rightarrow r}                                                                 &\quad\text{if } v_{s \rightarrow r} = 0 \\
        x_{s \rightarrow r} + \tfrac{1}{5} \tfrac{1}{\mu_r g} v_{s \rightarrow r}^2   &\quad\text{if } v_{s \rightarrow r} > 0 \\
    \end{cases}
\end{align}
$$

Notice that the above has expressed $v_{s \rightarrow r}$ in terms of the inputs $v_0$ and $\omega_0$, which means we could technically plug that in and express everything here in terms of the inputs as well...but no thank you.

Therefore, the above set of equations can be summarized as 

$$
\Omega_r(t; \; v_{s \rightarrow r}, x_{s \rightarrow r}; \; R, \mu_r, g) = \{ a_r(t), \, v_r(t), \,  x_r(t), t_{\text{stop}}, \, x_{\text{stop}} \}
$$

<br>

### Summarizing the Results

Therefore, the entire motion of the CB is described by

$$
\Omega(t; \; v_0, \omega_0; \; R, \mu_s, \mu_r, g) = \Omega_s(t; \; v_0, \omega_0; \; R, \mu_s, g) \, \cup \, \Omega_r(t - t_{s \rightarrow r}; \; v_{s \rightarrow r}, x_{s \rightarrow r}; \; R, \mu_r, g)
$$

I have made a fun interactive [Desmos plot](https://www.desmos.com/calculator/zlhc6x8jgk) so you can play around with different initial conditions.

<br>

---

<br>

## Collision Between the Cue Ball and Object Ball

During a shot in any billiard game, the CB will be hit towards some OB. The CB will collide with the OB, causing both the CB and OB to go in different directions. The goal of billiards is to control _both_ trajectories (beginner players are usually only concerned with the OB). In this section, I give a mathematical analysis of the 1D case. This is not as limiting of an analysis as you may think. Many shots in billiards simply need just a touch of forward or backspin.

### Overview

Suppose a cue strikes the CB imparting an **initial velocity** $v_0$ and an **initial spin** (rotational velocity) $\omega_0$ (same as before). The CB travels according to the motion described in the previous section, eventually colliding with the OB. Suppose this occurs at time $t_c$ and position $x_c$. Also suppose the CB have translational velocity $v_c$ and angular velocity $\omega_c$. 

**TODO** add diagram

For now, we are going to make some simplifying assumptions (which we will later refine). First, we will assume the collision is perfectly elastic (therefore, the collision occured instantaniously, so $\Delta t_c = 0$). Second, we will assume that there is no friction between the CB and OB. Below shows the overall diagram of this collision.

### Idealized Analysis

As a first-order approximation (which is actually not that far off from reality), we will assume that the collision between the CB and OB is **perfectly ellastic** (intuitively this means there is no compression, mathematically this means kinetic energy is conserved). We will also assume there is no friction between the CB and OB (and therefore no spin-transfer).

This is a classic conservation of momentum and conservation of kinetic energy problem.

**TODO** diagram

$$
\begin{align}
    \sum p_i &= \sum p_f 
    &&\implies\quad m v_c = m v_{\text{CB}} + m v_{\text{OB}} 
    &&\implies\quad v_c = v_{\text{CB}} + v_{\text{OB}}
    \\[10pt]
    \sum \text{KE}_i &= \sum \text{KE}_f 
    &&\implies\quad \tfrac{1}{2} m v_c^2 = \tfrac{1}{2} m v_{\text{CB}}^2 + \tfrac{1}{2} m v_{\text{OB}}^2
    &&\implies\quad v_c^2 = v_{\text{CB}}^2 + v_{\text{OB}}^2
\end{align}
$$

Solving boths simultaneous equations gives two solutions, but only one that can reasonably occur physically. This is

$$
v_{\text{CB}} = 0
\qquad
v_{\text{OB}} = v_c
$$

In particular, since we are assuming the collision is perfectly elastic, the momentum from the CB is completely transfered to the OB. Furthermore, since we are assuming there is no friction between the CB and OB, we have

$$
\omega_{\text{CB}} = \omega_c
\qquad
\omega_{\text{OB}} = 0
$$

Now, each balls motion evolves precisely as we described from the above equations.

<br>

### Accounting for Billiard Ball Compression

Even though billiard balls are very rigid, there is no such thing as a perfectly elastic collision. When a billiard ball collides with another, the semi-elasticness of the collision is measured by the **coefficient of resitution**, $e_b$. Now, kinetic energy is not conserved, and instead we have the following relationship.

$$
e_b = \tfrac{v_{\text{CB}} - v_{\text{OB}}}{v_c}
$$

Combining with conservation of momentum, we have

$$
v_{\text{CB}} = \left ( \frac{1 - e_b}{2} \right ) v_c
\qquad
v_{\text{OB}} = \left ( \frac{1 + e_b}{2} \right ) v_c
$$

<br>

### Accounting for Spin Transfer

Even though billiard balls are very smooth, there is still some friction between them. This friction actually does play an important role in some shots (which we will see soon). 

We will model this using sliding friction, very similar to how we did before. Let $\mu_b$ be the sliding fricitonal force between the OB and CB. We will assume the CB is spinning fast enough at impact such that sliding friction is dominant (rather than rolling friction).

$$
f_b = \mu_b F_c
$$

where $F_c$ is the force at impact between the OB and CB. We will assume this is an impulse force lasting some small amount of $\Delta t_c$. Therefore

$$
F_c = \tfrac{m v_c}{\Delta t_c}
$$

We basically do a linear approximation to obtain the final velocity since $\Delta t_c$ is so small, even though the friction force is definitely not linear. The acceleration during the impulse is

$$
a_{\text{impulse}} = \tfrac{\mu_b v_c}{\Delta t_c} 
\qquad
\alpha_{\text{impulse}} = \tfrac{2}{5}
$$

Therefore, we have the following equations of motion of the impulse. Note, these are occuring in the $y$-direction

$$
v_{\text{impulse}}(t) = a_{\text{impulse}} t = \tfrac{\mu_b v_c}{\Delta t_c} t
\qquad
y_{\text{impulse}}(t) = \tfrac{1}{2} a_{\text{impulse}} t^2 = \tfrac{\mu_b v_c}{2 \Delta t_c} t^2
$$

Therefore, after the impulse, we have an updated velocity after contact

$$
v_{\text{impulse}}(\Delta t_c) = \mu_b v_c
\qquad
y_{\text{impulse}}(\Delta t_c) = \tfrac{1}{2} \mu_b v_c \Delta t_c
$$

### Hop

Given enough top spin, it's actually possible for the CB to _climb_ the OB, resulting in the CB to **hop** after contact. Since this collision is not ellastic, energy is not conserved. Instead we use work. Note that $d = y_{\text{impulse}}(\Delta t_c) = \tfrac{1}{2} \mu_b v_c \Delta t_c$. 

$$
W_{\text{net}} = \Delta \text{KE} \\[10pt]
W_{\text{nc}} = \Delta \text{KE} + \Delta \text{PE} \\[10pt]
f_b \cdot d = \left ( \tfrac{1}{2} m v_{\text{CB}}^2 + \tfrac{1}{2} m v_{\text{OB}}^2 - \tfrac{1}{2} m v_c^2 \right ) + (mgh_{\text{CB}} + mgh_{\text{OB}}) \\[10pt]
\tfrac{1}{2} \mu_b^2 v_c^2 = \tfrac{1}{2} \left ( v_{\text{CB}}^2 + v_{\text{OB}}^2 - v_c^2 \right ) + g(h_{\text{CB}} + h_{\text{OB}})
$$

Now, if we assume the collision is perfectly elastic, then 

$$
h_{\text{CB}} + h_{\text{OB}} = \frac{\mu_b^2 v_c^2}{2 g}
$$

If we take into account the semi-elasticity of the collision, then we get the following

$$
\tfrac{1}{2} \mu_b^2 v_c^2 = \tfrac{1}{2} \left ( \tfrac{1}{4}(1 - e_b)^2 v_c^2 + \tfrac{1}{4}(1 + e_b)^2 v_c^2 - v_c^2 \right ) + g(h_{\text{CB}} + h_{\text{OB}}) \\[10pt]
\tfrac{1}{2} \mu_b^2 v_c^2 = \tfrac{1}{4} (e_b^2 - 1) v_c^2 + gh \\[10pt]
h_{\text{CB}} + h_{\text{OB}} = \left ( \frac{\mu_b^2}{2g} + \frac{1 - e_b^2}{4g} \right ) v_c^2
$$

If we plug in real values, we get

$$
h_{\text{CB}} + h_{\text{CB}} \approx \left ( 0.0003 + 0.0039 \right ) v_c^2 \approx 0.004 v_c^2
$$

or

$$
h_{\text{CB}} + h_{\text{CB}} \approx \left ( 0.0003 + 0.0039 \right ) v_c^2 \approx 0.004 v_c^2
$$

A medium shot is about $1$ m/s, therefore, if the CB is spinning sufficiently quickly, then it will hop by $0.004 \, m = 4 \, mm$ 

It's interesting that the contribution due to the frictional force and due to the compression of the CB can be calculated independently. Also, what exactly does this 


<br>

---

<br>

## Conclusion

In this post, I fully analyzed the $1\text{D}$ motion of a cue ball striking an object ball. I believe this analysis provides a good foundation for understanding the behavior of billiard balls, with concepts that easily extrapolate to more complicated situations. And if nothing else, this was a nice application of Newtonian mechanics.

<!-- ## Equations

$$
\begin{align}
    &a(t) = \begin{cases}
        0   &\quad\text{if } t = 0 \\[10pt]
        a_s &\quad\text{if } 0 < t \leq t_{s \rightarrow r} \\[10pt]
        a_r &\quad\text{if } t_{s \rightarrow r} < t < t_{\text{stop}} \\[10pt]
        0   &\quad\text{if } t \geq t_{\text{stop}}
    \end{cases}
    \qquad
    &&\alpha(t) = \begin{cases}
        0   &\quad\text{if } t = 0 \\[10pt]
        \alpha_s &\quad\text{if } 0 < t \leq t_{s \rightarrow r} \\[10pt]
        \alpha_r = a_r / R &\quad\text{if } t_{s \rightarrow r} < t < t_{\text{stop}} \\[10pt]
        0   &\quad\text{if } t \geq t_{\text{stop}}
    \end{cases}
    \\[10pt]
    &v(t) = \begin{cases}
        0   &\quad\text{if } t = 0 \\[10pt]
        v_s(t) = v_0 + a_s t &\quad\text{if } 0 < t \leq t_{s \rightarrow r} \\[10pt]
        v_r(t - t_{s \rightarrow r}) = v_{s \rightarrow r} + a_r (t - t_{s \rightarrow r}) &\quad\text{if } t_{s \rightarrow r} < t < t_{\text{stop}} \\[10pt]
        0   &\quad\text{if } t \geq t_{\text{stop}}
    \end{cases}
    \qquad
    &&\omega(t) = \begin{cases}
        0   &\quad\text{if } t = 0 \\[10pt]
        \omega_s(t) = \omega_0 + \alpha_s t &\quad\text{if } 0 < t \leq t_{s \rightarrow r} \\[10pt]
        \omega_r(t - t_{s \rightarrow r}) = v_r(t - t_{s \rightarrow r})/R &\quad\text{if } t_{s \rightarrow r} < t < t_{\text{stop}} \\[10pt]
        0   &\quad\text{if } t \geq t_{\text{stop}}
    \end{cases}
\end{align}
$$

$$
x(t) = \begin{cases}
    0   &\quad\text{if } t = 0 \\[10pt]
    x_s(t) = v_0 t + \tfrac{1}{2} a_s t^2 &\quad\text{if } 0 < t \leq t_{s \rightarrow r} \\[10pt]
    x_r(t - t_{s \rightarrow r}) = x_{s \rightarrow r} + v_{s \rightarrow r}(t - t_{s \rightarrow r}) + \tfrac{1}{2} a_r (t - t_{s \rightarrow r})^2 &\quad\text{if } t_{s \rightarrow r} < t < t_{\text{stop}} \\[10pt]
    x_{\text{stop}}   &\quad\text{if } t \geq t_{\text{stop}}
\end{cases}
$$ -->


<!-- ### Rolling Without Slipping

Rolling without slipping means that the cue ball is not sliding across the table. Instantaneously, the velocity at the point of contact is always $0$. Mathematically, we can express this as 

$$
v_{\text{cm}} = R \omega_{\text{cm}}
\quad\implies\quad
a_{\text{cm}} = R \alpha_{\text{cm}}
$$

In other words, the center of mass is moving exactly in sync with the rotation of the ball. Now, friction is notoriously complicated to model, so I am going to do the most simplistic thing and claim that 

$$
f_r = \mu_r N
$$

where $\mu_r$ is the **coefficient of rolling friction**. Using Newton's second law we get the following.

$$
0 = \sum F_y = N - mg
\quad\implies\quad
N = mg
$$

and

$$
I_{\text{sphere}} \alpha_{\text{cm}}  = \sum \tau_z = R f_r
\quad\implies\quad
(\tfrac{2}{5}mR^2) (a_{\text{cm}} / R) = - R (\mu_r m g)
\quad\implies\quad
a_{\text{cm}} = - \tfrac{5}{2} \mu_r g
$$

Why did I not write down $\sum F_x = m a_{\text{cm}}$. It's a bit complicated, but the correct way to model $f_r$ is as a rolling phenomanon. So if writing $- f_r = m a_{\text{cm}}$ is actually not correct. The effective force that the center of mass is feeling is going to be something different.

Now, we can write down the equations of motion.

$$
v(t) = v_0 - \tfrac{5}{2} \mu_r g t \\[10pt]
x(t) = v_0 t - \tfrac{5}{4} \mu_r g t^2
$$

Therefore, the ball will come to a stop when $v(t) = 0$, which is at time

$$
t_{\text{stop}} = \left ( \frac{2}{5 \mu_r g} \right ) v_0 \approx 4.08 v_0
$$

Also, we can find how far the ball will travel

$$
x_{\text{stop}} = \frac{v_f^2-v_0^2}{2a} = \frac{-v_0^2}{-5\mu_r g} = \left ( \frac{1}{5\mu_r g} \right ) v_0^2 \approx 2.04 v_0^2
$$

### Rolling With Slipping - Stun

Suppose the CB initially has no spin. This gets a little more complicated, but not too much. We do very similar as before, except now we cannot assume that $v_{\text{cm}} = R \omega_{\text{cm}}$. The translational motion and rotational motion are _independent_, and we have to analyze each separately.

During this phase of motion, we have $f_s = \mu_s N$ where $\mu_s$ is the **coefficient of sliding friction**. This is different than rolling friction.

**Translational Motion**

$$
0 = \sum F_y = N - mg
\quad\implies\quad
N = mg
$$

$$
m a_{\text{cm}} = \sum F_x = - f_s
\quad\implies\quad
- \mu_s mg = m a_{\text{cm}}
\quad\implies\quad
a_{\text{cm}} = - \mu_s g
$$

Therefore, we can solve the equation for translational velocity

$$
v_{\text{cm}}(t) = v_0 - \mu_s g t
$$

**Rotational Motion**

The analysis here is exactly the same as before, except we cannot substitute in for $a_{\text{cm}}$.

$$
I_{\text{sphere}} \alpha_{\text{cm}}  = \sum \tau_z = R f_r
\quad\implies\quad
(\tfrac{2}{5}mR^2) \alpha_{\text{cm}} = - R (\mu_s m g)
\quad\implies\quad
\alpha_{\text{cm}} = - \frac{5 \mu_s g}{2 R} 
$$

Therefore, we can solve the equation for rotational velocity. Recall, since we are assuming stun, $\omega_0 = 0$

$$
\omega_{\text{cm}}(t) = \left ( \frac{5 \mu_s g}{2 R} \right ) t
$$

Now, when does the ball stop slipping? Exactly when our non-slip condition is met. Therefore

$$
v_{\text{cm}}(t) = R \omega_{\text{cm}}(t)
\quad\implies\quad
v_0 - \mu_s g t = \tfrac{5}{2} \mu_s g t
\quad\implies\quad
t_{\text{rolling}} = \left ( \frac{2}{7 \mu_s g} \right ) v_0 \approx 0.14577 v_0
$$

Again, we can figure out how far the ball travels

$$
v_{\text{rolling}} = v_0 - \mu_s g \left ( \frac{2 v_0}{7 \mu_s g} \right ) = \tfrac{5}{7} v_0
$$

$$
x_{\text{rolling}} = v_0 \cdot \left ( \frac{2 v_0}{7 \mu_s g} \right ) - \tfrac{1}{2} \mu_s g \left ( \frac{2 v_0}{7 \mu_s g} \right )^2 = \left ( \frac{12}{49 \mu_s g} \right ) v_0^2 \approx 0.125 v_0^2
$$

### Rolling with Slipping - Full Solution

Generally a player will put spin on the CB. There are two cases. Either the spin is less than rolling spin - i.e. a draw shot, stun shot, or weak follow - or the spin is greater than the rolling spin - i.e. a strong follow. 

The deriviation is extremely similar to the previous case, so I will spare you the details and just assert the equations of motion.

### Summary

The cue strikes the CB with an impulse force instantaneously accelerating the CB with a translational velocity of $v_0$ and rotational velocity of $\omega_0$

$$
v_{\text{cm}}(t) = \begin{cases}
    0 \quad&\text{if } t = 0 &&\leftarrow \text{impact}\\
    v_0 - \mu_s g t \quad&\text{if } 0 < t \leq t_{\text{rolling}} &&\leftarrow \text{sliding}\\
    v_{\text{rolling}} - \tfrac{5}{2} \mu_r g (t - t_{\text{rolling}}) \quad&\text{if } t_{\text{rolling}} < t \leq t_{\text{stop}} &&\leftarrow \text{rolling}\\
    0 \quad&\text{if } t_{\text{stop}} < t &&\leftarrow \text{stop}
\end{cases}
$$

$$
\omega_{\text{cm}}(t) = \begin{cases}
    0 \quad&\text{if } t = 0 &&\leftarrow \text{impact}\\
    \omega_0 - \frac{5\mu_s g}{2R} t \quad&\text{if } 0 < t \leq t_{\text{rolling}} &&\leftarrow \text{sliding}\\
    v_{\text{cm}}(t)/R \quad&\text{if } t_{\text{rolling}} < t \leq t_{\text{stop}} &&\leftarrow \text{rolling}\\
    0 \quad&\text{if } t_{\text{stop}} < t &&\leftarrow \text{stop}
\end{cases}
$$

Assume the CB starts at $x_0 = 0$.

$$
x_{\text{cm}}(t) = \begin{cases}
    0 \quad&\text{if } t = 0 &&\leftarrow \text{impact}\\
    v_0t - \tfrac{1}{2}\mu_s g t^2 \quad&\text{if } 0 < t \leq t_{\text{rolling}} &&\leftarrow \text{sliding}\\
    x_{\text{rolling}} + v_{\text{rolling}}(t - t_{\text{rolling}}) - \tfrac{5}{4} \mu_r g (t - t_{\text{rolling}})^2 \quad&\text{if } t_{\text{rolling}} < t \leq t_{\text{stop}} &&\leftarrow \text{rolling}\\
    x_{\text{stop}} \quad&\text{if } t_{\text{stop}} < t &&\leftarrow \text{stop}
\end{cases}
$$

$$
\begin{align}
    t_{\text{rolling}} &= \frac{2(v_0 - R\omega_0)}{7\mu_s g} \approx 0.14577 v_0 - 0.00208 \omega_0 \\[10pt]
    v_{\text{rolling}} &= \tfrac{5}{7} v_0 + \tfrac{2}{7} R \omega_0 \approx 0.712 v_0 + 0.00816 \omega_0 \\[10pt]
    \omega_{\text{rolling}} &= v_{\text{rolling}} / R = \tfrac{5}{7R}v_0 + \tfrac{2}{7} \omega_0 \approx  \\[10pt]
    x_{\text{rolling}} &=  \approx \\[20pt]
    t_{\text{stop}} &= \left ( \frac{2}{5 \mu_r g} \right ) v_{\text{rolling}} + t_{\text{rolling}} \approx 4.08 v_{\text{rolling}} + t_{\text{rolling}}\\[10pt]
    x_{\text{stop}} &= \left ( \frac{1}{5\mu_r g} \right ) v_{\text{rolling}}^2 + x_{\text{rolling}} \approx 2.04 v_{\text{rolling}}^2 + x_{\text{rolling}}
\end{align}
$$

<br>

---

<br>

## A Simple Elastic Collision

We are going to build up towards a model that is actually useful when playing pool. First, we will analyze the simplest possible situation. Suppose the CB is sent towards a stationary OB with velocity $v$. Assume the CB and OB are perfectly rigid, which means we neglect any deformation between them at contact. Also, neglect the friction of the felt and neglect any spin on the CB or OB. 

**TODO**: draw diagram

We use conservation of momentum and conservation of kinetic energy in order to solve for the system

$$
\begin{align}
    p_i &= p_f \\[10pt]
    mu_{\text{CB}} + mu_{\text{OB}} &= mv_{\text{CB}} + mv_{\text{OB}} \\[10pt]
    u_{\text{CB}} &= v_{\text{CB}} + v_{\text{OB}} \\[10pt]
\end{align}
$$

$$
\begin{align}
    \text{KE}_i &= \text{KE}_f \\[10pt]
    \tfrac{1}{2}mu_{\text{CB}}^2 + \tfrac{1}{2}mu_{\text{OB}}^2 &= \tfrac{1}{2}mv_{\text{CB}}^2 + \tfrac{1}{2}mv_{\text{OB}}^2 \\[10pt]
    u_{\text{CB}}^2 &= v_{\text{CB}}^2 + v_{\text{OB}}^2 \\[10pt]
\end{align}
$$

Solving both equations, we get two possible solutions. Either $v_{\text{CB}} = u_{\text{CB}}$ and $v_{\text{OB}} = 0$, or $v_{\text{CB}} = 0$ and $v_{\text{OB}} = u_{\text{CB}}$. The former doesn't make physical sense, so it must be the latter. This means that all of the momentum of the CB was transfered to the OB. 

Therefore

$$
v_{\text{CB}}(t) = \begin{cases}
    v_{\text{CB}}(0)    &\text{if } \ t < t_{\text{impact}} \\
    0                   &\text{if } \ t \geq t_{\text{impact}}
\end{cases}
\qquad\qquad
v_{\text{OB}}(t) = \begin{cases}
    0                   &\text{if } \ t < t_{\text{impact}} \\
    v_{\text{CB}}(0)    &\text{if } \ t \geq t_{\text{impact}}
\end{cases}
$$

<br> -->

<!-- ## Accounting for Cue Ball Spin

Let's see what happens when a CB moves across the tables. For now, we are not considering the object ball. We just want to be able to accurately describe the motion of the CB. 

### No Initial Spin (Stun)

You will find this class physics problem usually formulated with a bowling ball. We assume that the  -->
