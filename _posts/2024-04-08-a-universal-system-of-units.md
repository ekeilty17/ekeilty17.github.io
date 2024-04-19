---
layout:     post
title:      "A Universal System of Units"
date:       2024-04-08
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       units
draft:      true
---

Everyone holds the metric system up as the gold standard for a system of measurements. While I agree it's great, it's definitely a human-centered system of measurements. The meter is ultimately derived from the median of the Earth. And the fact everything operates on increments of $10$ is just because we use a base-$10$ number system, which ultimately is due to humans having $10$ fingers. 

In this post, I want to derive a **universal system of units**. I this to be independent of humans, and possible for, say, an alien civilization to derive.

<br>

## High-Level Process

For every type of measurement, we are going to find the smallest possible unit that has any significance in quantum mechanics. This is called the **Planck unit**. From there, we will derive all the remaining units.

The metric system does this by multiplying by a factor of $10$ to get the next unit. This makes sense for humans since a vast majority of our number systems are base-$10$. However, from a universalist perspective, $10$ is an arbitrary choice. To me, the only choice that is not arbitrary is to choose a factor of $2$. 

Therefore, we will start at the Planck unit and iteratively multiply by $2$ in order to get larger and larger units.

If we take the standard meters for example, we have the prefixed $\mu m$, $mm$, $m$, $km$, and $Mm$. These each translate to $m \times 10^{-6}$, $m \times 10^{-3}$, $m \times 10^{0}$, $m \times 10^{3}$, and $m \times 10^{6}$.

I will steal the notation from computer science. We instead of the prefixes $\mu i m$, $mim$, $m$, $kim$, and $Mim$. These each translate to $m \times 2^{-6}$, $m \times 2^{-3}$, $m \times 2^{0}$, $m \times 2^{3}$, and $m \times 2^{6}$.

<br>

## Distance

We define our base unit, the **Planck length**

$1 \, \ell_{P} = \sqrt{\frac{\hslash G}{c^3}} = 1.616255 \times 10^{−35} \, m $

Now, we get an upper bound.

$$
\text{Length of observable universe} = 96 \times 10^9 \, \text{light-years} = 8.8 \times 10^{26} \, m \approx 2^{206} \ell_{P}
$$

Therefore, the logarithmic middle is $2^{103} \, \ell_{P}$, so this will be our base unit.

I am using $2^8 = 4^3$ as my increment.

| universal     | metric                    | imperial          | approximate scale                         |
| ------------- | ------------------------- | ----------------- | ----------------------------------------- |
| $1 \, miU_d$  | $6.40 \times 10^{-7} m$   | -                 | size of a virus |
| $1 \, U_d$    | $1.64 \times 10^{-4} m$   | -                 | smallest thing visible by the naked eye |
| $1 \, kiU_d$  | $0.04196 m$               | $1.65$ in         | length of a small paperclip |
| $1 \, MiU_d$  | $10.74 m$                 | $35.24$ ft        | length of an RV |
| $1 \, GiU_d$  | $2750 m$                  | $1.7$ miles       | length of the golden gate bridge |
| $1 \, TiU_d$  | $7.04 \times 10^{5} m$    | -                 | distance from Boston to DC by highway |
| $1 \, PiU_d$  | $1.80 \times 10^{8} m$    | -                 | circumference of uranus |
| $1 \, EiU_d$  | $4.61 \times 10^{10} m$   | $0.308$ AU        | distance from the Sun to Mercury |
| $1 \, ZiU_d$  | $1.18 \times 10^{13} m$   | -                 |  |
| $1 \, YiU_d$  | $3.02 \times 10^{15} m$   | $0.319$ light years |  |
| $1 \, RiU_d$  | $7.74 \times 10^{17} m$   | - |  |
| $1 \, QiU_d$  | $1.98 \times 10^{20} m$   | - |  |