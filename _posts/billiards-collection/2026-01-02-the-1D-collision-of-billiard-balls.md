---
layout:     post
title:      "The 1D Collision of Billiard Balls"
date:       2026-01-02
categories: blog billiards
permalink:  ":categories/:title/"
series:     billiards
tags:       billiards, physics, pool
draft:      true
---

## Introduction

**Billiards** refers to a wide variety of games, but in most variants a turn consists of using a **cue stick** to strike the **cue-ball** (CB) towards an **object-ball** (OB) in order to achieve some objective (usually pocketing the OB). Being skilled at these games means accurately and precisely controlling what happens to _both_ the CB and OB after contact by imparting precise **speed** and **spin** on the CB.

In a [previous post](/blog/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/), I analyzed the $1\text{D}$ motion of a freely moving billiard ball. In this post, I will analyze what happens when that freely moving billiard ball collides with **TODO**.

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

### Variables of Force

- $F$ = generic force
- $f$ = friction force
- $N$ = normal force
- $mg$ = force due to gravity

### Subscripts

**TODO**

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

<br>

---

<br>

## Collision Between the Cue Ball and Object Ball

During a shot in any billiard game, the CB will be hit towards some OB. The CB will collide with the OB, causing both the CB and OB to go in different directions. The goal of billiards is to control _both_ trajectories (beginner players are usually only concerned with the OB). In this section, I give a mathematical analysis of the 1D case.

### Overview

Suppose a cue strikes the CB imparting an **initial translational velocity** of $v_0$ and an **initial rotational velocity** (spin) of $\omega_0$. The CB travels according to the motion described in a [previous post](/blog/billiards/the-1D-motion-of-a-freely-moving-billiard-ball/), eventually colliding with the OB. Suppose this occurs at time $t_c$ and position $x_c$ with translational velocity $v_c$ and rotational velocity $\omega_c$. We will assume this collision occurs instantaneously over a very small length of time $\Delta t \approx 0$. There is an energy exchange between the CB and OB, altering their translational and rotational velocities. Finally, post-collision the CB and OB travel freely according to their laws of motion. This is summarized in the diagram below, which shows the collision of a draw shot.

<center>
<embed src="/blog-assets/billiards/the-1D-collision-of-billiard-balls/ball-ball-collision-overview.svg" type="image/svg+xml" width="600px" height="600px" />
</center>

### Idealized Analysis

As a first-order approximation (which is actually not that far off from reality), we will assume that the collision between the CB and OB is **perfectly elastic**. This means we are assuming the balls are perfectly rigid, meaning there is no compression upon collision. Mathematically, this means kinetic energy is conserved. Additionally, we will also assume there is no friction between the CB and OB (and therefore no spin-transfer).

This is a classic conservation of momentum and conservation of kinetic energy problem.

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

Solving both simultaneous equations gives two solutions, but only one that can reasonably occur physically. This is

$$
v_{\text{CB}} = 0
\qquad
v_{\text{OB}} = v_c
$$

In particular, since we are assuming the collision is perfectly elastic, the momentum from the CB is completely transferred to the OB. Furthermore, since we are assuming there is no friction between the CB and OB, we have

$$
\omega_{\text{CB}} = \omega_c
\qquad
\omega_{\text{OB}} = 0
$$



<br>

### Accounting for Billiard Ball Compression

Even though billiard balls are very rigid, there is no such thing as a perfectly elastic collision. When a billiard ball collides with another, the semi-elasticness of the collision is measured by the **coefficient of restitution**, $e_b$. Now, kinetic energy is not conserved, and instead we have the following relationship.

$$
e_b = \frac{v_{\text{CB}} - v_{\text{OB}}}{v_c}
$$

Combining with the equation from the conservation of linear momentum $v_c = v_{\text{CB}} + v_{\text{OB}}$, we can solve

$$
v_{\text{CB}} = \left ( \frac{1 - e_b}{2} \right ) v_c
\qquad
v_{\text{OB}} = \left ( \frac{1 + e_b}{2} \right ) v_c
$$

For standard billiard balls, $e_{b} \in [0.92, 0.98]$. Note, the coefficient of restitution is a unitless value. Thus, the effect of billiard ball compression is essentially negligible compared to our idealized analysis.

<br>

### Accounting for Spin Transfer

Even though billiard balls are very smooth, there is still some friction between them. As an approximation let's again use **Coulomb’s law of friction**

$$
f_b = \mu_b F_c
$$

where $\mu_{b}$ is the frictional force between the OB and CB, and $F_c$ is the force at impact between the OB and CB. We will assume this is an impulse force lasting some small amount of $\Delta t$. Therefore

$$
F_c = \tfrac{m v_c}{\Delta t_c}
$$

We basically do a linear approximation to obtain the final velocity since $\Delta t_c$ is so small, even though the friction force is definitely not linear. The acceleration during the impulse is

$$
a_{\text{impulse}} = \tfrac{\mu_b v_c}{\Delta t_c} 
\qquad
\alpha_{\text{impulse}} = \tfrac{2}{5}
$$

Therefore, we have the following equations of motion of the impulse. Note, these are occurring in the $y$-direction

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

### Calculating Hop (just because we can)

Given enough top spin, it's actually possible for the CB to _climb_ the OB, resulting in the CB to **hop** after contact. Since this collision is not elastic, energy is not conserved. Instead we use work. Recall that $f_b = \mu_b F_c = \mu_b \tfrac{m v_c}{\Delta t_c}$ and $y_{\text{impulse}}(\Delta t_c) = \tfrac{1}{2} \mu_b v_c \Delta t_c$.

$$
% W_{\text{net}} = \Delta \text{KE} \\[10pt]
\begin{align}
    W_{\text{nc}} &= \Delta \text{KE} + \Delta \text{PE} \\[10pt]

    f_b \cdot y_{\text{impulse}}(\Delta t_c) &= \left (\Delta \text{KE}_{\text{CB}} + \Delta \text{KE}_{\text{OB}} \right ) + (\Delta \text{PE}_{\text{CB}} + \Delta \text{PE}_{\text{OB}}) \\[10pt]

    \tfrac{1}{2} \mu_b^2 m v_c^2 &= \left ( \tfrac{1}{2} m v_{\text{CB}}^2 + \tfrac{1}{2} m v_{\text{OB}}^2 - \tfrac{1}{2} m v_c^2 \right ) + (mgh_{\text{CB}} + mgh_{\text{OB}}) \\[10pt]

    \tfrac{1}{2} \mu_b^2 v_c^2 &= \tfrac{1}{2} \left ( v_{\text{CB}}^2 + v_{\text{OB}}^2 - v_c^2 \right ) + g(h_{\text{CB}} + h_{\text{OB}})
\end{align}
$$

Now, if we assume the collision is perfectly elastic ($v_{\text{CB}} = 0$ and $v_{\text{OB}} = v_c$), then 

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
h_{\text{CB}} + h_{\text{OB}} \approx \left ( 0.0003 + 0.0039 \right ) v_c^2 \approx 0.004 v_c^2
$$

or

$$
h_{\text{CB}} + h_{\text{OB}} \approx \left ( 0.0003 + 0.0039 \right ) v_c^2 \approx 0.004 v_c^2
$$

A medium shot is about $1$ m/s, therefore, if the CB is spinning sufficiently quickly, then it will hop by $0.004 \, m = 4 \, mm$. Anecdotally, this sounds about right for medium speed.

<br>

---

<br>

## Collision Between the Cue Ball and the Cushion

<br>

---

<br>

## Conclusion

In this post, I analyzed the $1\text{D}$ motion of a cue ball striking an object ball. I think it's astounding that just two balls hitting each other can be so complicated.

I believe this analysis provides a good foundation for understanding the behavior of billiard balls, with concepts that extrapolate to the 2D case and other more complicated situations. If nothing else, this was a nice application of classic Newtonian mechanics.

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
