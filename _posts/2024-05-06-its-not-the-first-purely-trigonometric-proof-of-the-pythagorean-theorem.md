---
layout:     post
title:      "High School Level Math + The News = Nonsense"
date:       2024-05-06
categories: blog
permalink:  ":categories/:title/"
standalone: true
tags:       trigonometry, pythagorean-theorem, proof-theory
draft:      true
---


## Motivation

I don't understand why anyone watches a single second of the news give how laughably low their standards for journalism are. It's not that they are completely wrong in what they report, but their summarizations and interpretations are so reductionist and watered-down that the concept of "truth" loses all meaning. What also drives me crazy is the lack of fact-checking. These people's standard of evidence seems to be a vibe check. If there is any source cited (even if the source is itself nonsense), then for them that cements the claim is absolutely true. I am reminded of this quote.

> If you don't read the newspaper, you're uninformed. If you read the newspaper, you're mis-informed. <br> &ndash; Mark Twain

In this post, I investigate the claims made by a news story from about a year ago, claiming two high school students out-smarted 2000 years of mathematicians. I try to detangle the web of nonsense and along the way, hopefully we learn a little something about the foundations of mathematics and proof theory.

<br>

<!-- 
https://www.cut-the-knot.org/pythagoras/Proof100.shtml 
[AMC](https://meetings.ams.org/math/spring2023se/meetingapp.cgi/Paper/23621)
-->

---

<br>

## Background

### The Pythagorean Theorem

The [Pythagorean Theorem](/blog/trigonometry/pythagorean-identities) is one of the oldest and most famous theorems in mathematics. It states that the sum of the square of the lengths of the legs of a right triangle equals the square of its hypothenuse. Most lay people will know it as the algebraic formula $a^2 + b^2 = c^2$. Geometrically, it means the the area of the squares formed by the legs of a right triangle equals the area of the square formed by its hypothenuse.

<center>
{% tikz pythagoraean-theorem %}
  \usetikzlibrary{angles,patterns,calc}
  \usetikzlibrary{decorations.pathreplacing,intersections}

  \tikzset{
    font={\fontsize{12pt}{12}\selectfont}
  }

  \def\scale{0.75cm}
  \def\a{ {4 * \scale} }
  \def\b{ {3 * \scale} }
  \def\c{ {5 * \scale} }

  \coordinate (A) at (\a, \b);
  \coordinate (B) at (0, 0);
  \coordinate (C) at (\a, 0);

  \draw[very thick] (A) -- (B) node[midway, below, black] {$c$};
  \draw[very thick] (B) -- (C) node[midway, above, black] {$a$};
  \draw[very thick] (C) -- (A) node[midway, left, black] {$b$};

  % draw right angle indicator of triangle
  \draw ($(C) - (0.4,0)$) -- ++(0,0.4) -- ++(0.4,0);     % Q1

  % a^2
  \coordinate (a1) at (0, -\a);
  \coordinate (a2) at (\a, -\a);

  \draw[thick] (B) -- (a1);
  \draw[thick] (C) -- (a2);
  \draw[thick] (a1) -- (a2);

  \node[black] (c1) at (barycentric cs:B=1,C=1,a2=1,a1=1) {\huge $a^2$};

  % b^2
  \coordinate (b1) at  ($(A) + (\b, 0)$);
  \coordinate (b2) at ($(C) + (\b, 0)$);

  \draw[thick] (A) -- (b1);
  \draw[thick] (C) -- (b2);
  \draw[thick] (b1) -- (b2);

  \node[black] (c2) at (barycentric cs:A=1,C=1,b2=1,b1=1) {\huge $b^2$};

  % c^2
  \coordinate (c1) at ($(A) + (-\b, \a)$);
  \coordinate (c2) at  (-\b, \a);
  
  \draw[thick] (A) -- (c1);
  \draw[thick] (B) -- (c2);
  \draw[thick] (c2) -- (c1);

  \node[black] (c3) at (barycentric cs:A=1,B=1,c2=1,c1=1) {\huge $c^2$};


  \coordinate[shift={(4, 0)}] (A) at (b2);
  \coordinate[shift={(\a, \a)}] (Atr) at (A);
  \draw[thick] (A) -| (Atr);
  \draw[thick] (Atr) -| (A);
  \node[black] (Atext) at (barycentric cs:A=1,Atr=1) {\huge $a^2$};
  
  \node[black, shift={(2, 0)}] (plustext) at (Atext) {\huge $+$};

  \coordinate[shift={(0.5, 0)}] (B) at ($(plustext) - (0, 1.125)$);
  \coordinate[shift={(\b, \b)}] (Btr) at (B);
  \draw[thick] (B) -| (Btr);
  \draw[thick] (Btr) -| (B);
  \node[black] (Btext) at (barycentric cs:B=1,Btr=1) {\huge $b^2$};

  \node[black, shift={(1.625, 0)}] (equaltext) at (Btext) {\huge $=$};

  \coordinate[shift={(0.5, 0)}] (C) at ($(equaltext) - (0, 1.875)$);
  \coordinate[shift={(\c, \c)}] (Ctr) at (C);
  \draw[thick] (C) -| (Ctr);
  \draw[thick] (Ctr) -| (C);
  \node[black] (Ctext) at (barycentric cs:C=1,Ctr=1) {\huge $c^2$};

{% endtikz %}
</center>

There are literally hundreds of proofs of the theorem (this [book](https://www.amazon.com/Pythagorean-Proposition-Elisha-S-Loomis/dp/0873530365) lists 371 of them and [Cut the Knot](https://www.cut-the-knot.org/pythagoras/) also has many beautiful proofs).


### A New Proof?

Around last year, two high-school students came up with a novel proof of the Pythagorean Theorem. This is an accomplishment in and of itself. It's really hard to come up with a new proof for such an old and famous formula. I do not want to take away from their accomplishment. As someone who loves recriational mathematics, I want to encourage students to engage in these types of challenges.

[Polymathematic](https://www.youtube.com/@polymathematic) has a nice video [here](https://www.youtube.com/watch?v=p6j2nZKwf20) explaining the proof, which I will henceforth refer to as the **Waffle Cone Proof** (the name given by the students). I recommend you skim through the video just to get an idea of how the proof works. You don't need to fully understand all of the details.

### Sensationalizing the Proof

<!-- Personally, I think it was the catholic high-school [St. Mary's](https://smaneworleans.com/) (and for all we know the Catholic church) that really pushed this to make it a national story.  -->

The news media (for whatever reason) picked up this story. Of course, we know the media is not at all trustworthy. They skew and spin facts in order to create the most appealing narrative. In this case, the narrative is nicely summarized by this [Guardian article](https://www.theguardian.com/us-news/article/2024/may/06/pythagoras-theorem-proof-new-orleans-teens). Note that I have redacted names.

> For 2,000 years, mathematicians maintained that any alleged proof of the Pythagorean theorem that was based in trigonometry would constitute a logical fallacy known as circular reason – in essence, trying to validate an idea with the idea itself. But the bonus question on a math contest that [the students] took home to complete during the Christmas break of their final year at [their high school] served as the impetus for them to plot out a new way to demonstrate that one could indeed use trigonometry to prove Pythagoras’s theorem. 

I admit that it's a compelling story. The gatekeeping, elite academics couldn't find a purely trigonometric proof of the Pythagorean Theorem and therefore deemed it impossible. But against all odds, two wonder-teens with their outside perspective and youthful creativity found a proof that no one in 2000 years could have concieved of. Unfortunately, it's all complete nonsense, which I will demonstrate in this post.

<br>

---

<br>

## The Mathematical Claims

These high school students gave a presentation to the [American Mathematical Society](https://www.ams.org/home/page) show-casing their proof. The mathematical claims are nicely summarized in their [abstract](https://meetings.ams.org/math/spring2023se/meetingapp.cgi/Paper/23621).

> In the 2000 years since trigonometry was discovered it's always been assumed that any alleged proof of Pythagoras’s Theorem based on trigonometry must be circular. In fact, in the book containing the largest known collection of proofs (The Pythagorean Proposition by Elisha Loomis) the author flatly states that “There are no trigonometric proofs, because all the fundamental formulae of trigonometry are themselves based upon the truth of the Pythagorean Theorem.” But that isn’t quite true: in our lecture we present a new proof of Pythagoras’s Theorem which is based on a fundamental result in trigonometry — the Law of Sines — and we show that the proof is independent of the Pythagorean trig identity sin$^2$ x + cos$^2$ x = 1. 

This paragraph reminds me of [this meme](https://twitter.com/IanYorston/status/1267099676148486145). There is so much wrong, that it's hard to know where to begin. Let's first start by separating out the claims.

1. For 2000 years, mathematicians believed that the Pythagorean Theorem could not be proved using trigonometry without circularity.
2. Two high school students created a new proof of the Pythagorean Theorem, named the **Waffle Cone proof**.
3. The Waffle Cone proof **only** relies on the **Law of Sines**.
4. Therefore, the Waffle Cone proof is the **first** proof of the Pythagorean Theorem that is independent of the identity $\sin^2 x + \cos^2 x = 1$.

Claim 2) is absolutely true. The Waffle Cone proof is a perfectly valid proof of the Pythagorean Theorem. Again, watch [this video](https://www.youtube.com/watch?v=p6j2nZKwf20) to see their proof for yourself. Claim 1) is a bit of a sensationalist statement. I'd say it's mostly true, but it's a non sequitur for this discussion. 

Claims 3) and 4) are absolutely false on a number of different levels. It's not just a tiny detail that makes them incorrect. To say this as gently as possible, they show a lack of conceptual understanding of mathematics in general. I will now try to explain why.


### Incorrectness of Claim 4: It's Not the First

Let's pretend that the Waffle cone proof was a "purely trigonometric" proof of the Pythagorean Theorem, meaning it is independent of the identity $\sin^2 x + \cos^2 x = 1$. Well, it is not the first such proof. Jason Zimba published a [paper](https://forumgeom.fau.edu/FG2009volume9/FG200925.pdf) which (supposedly) achieved this in 2009. His proof is much cleaner and more straight-forward than the Waffle Cone proof, so you can't even claim that the students did it better than he did.

Unfortunately, Jason's proof also fails at being "purely trigonometric". But we will discuss that in the next section.

### Incorrectness of Claim 3: It Utilizes Limits

The Waffle Cone proof relies on constructing a larger triangle from an infinte series of smaller triangles. Strictly speaking, this is not "pure trigonometry". This requires concepts from calculus and real analysis. 

This is another way that Jason's proof from 2009 is better than the Waffle Cone proof, as he does not require limits.

You may want to say that the Waffle Cone proof may still be impressive because no one has thought to create an infinite series of triangles before. Unfortunately, you would be wrong. [Here](https://www.cut-the-knot.org/pythagoras/Proof100.shtml) is an example of a very similar proof from before 2018. In fact, I would say this is a much better proof using this style because 1) it's much more straight forward, and 2) it is much more clear that the infinite series of triangles converge to the larger triangle.

<br>

---

<br>

## Is a Purely Trigonometric Proof of the Pythagorean Theorem Possible?

This is actually quite a deep question. To answer this, we have to ask ourself, what does it mean for a proof to be "purely trigonometric"? In the students' abstract, they define it as being independent of the identity $\sin^2 x + \cos^2 x = 1$. Again, this isn't completely wrong, but it's missing a lot.

### Defining Trigonometry

Trigonometry is ultimately the study of triangles in Euclidean Geometry. 


<br>

---

I have already demonstrated that the Waffle Cone proof is not "purely trigonometric" because it relies on facts from calculus. Some will continue to cope and say "Let's ignore the fact that they use calculus in their proof. The Law of Sines is a trigonometric formula, therefore the proof is _mostly_ trigonometric". Again these people would be wrong.

Even if I ignore the argument from calculus, the Waffle Cone proof would **still** not be purely trigonometric.

The reason mathematics is so difficult is becauce you need to be maticulous about exactly what assumptions you have made. So we have to ask ourselves, what is being assumed when we use the Law of Sines? The Law of Sines is just a simple application of the trig function definitions and similar triangles.

This is by far the hardest part of this to explain because it requires an understanding of the foundations of mathematics.

<br> 

---

<br>

It's amazing to come up with something that no one in 2000 years has thought of before. More importantly, the proof is genuinely interesting and impressive for high school students to come up with. Both Calcea and Ne'Kiya were extremely kind and humble during their press tour. I wish both of them nothing but the best.

What I do want to criticize is something said by the media, and subsequently repeated by everyone reporting on this story. Namely, that this proof is special because it's one of only a few **purely trigonometric** proofs. In this post, I am going to explain why this statement does not make any sense.

Before continuing, please review their proof.  

<br>

It's known that the Pythagorean theorem is equivalent to the 5th Axiom

## What Do They Mean By "Purely Trigonometric"

I want to be as charitable as possible. This is my attempt to steel-man the position that this proof is "purely trigonometric". From my understanding, the media is saying that Calcea and Ne'Kiya's proof is "purely trigonometric" because it only assumes the Law of Sines, which is a result from trigonometry. Other proof of the Pythagorean theorem typically use an argument which compute the same area in two different ways. They do not consider this a "trigonometric proof", but rather a "geometric proof".

There is so much wrong with the above paragraph, I don't even know where to start.


## The Law of Sines

Essentially, the Law of Sines is just a special case of similar triangles. However, this only applies in Euclidean Geometry. So actually, this proof implicitly assumes the axioms of euclidean geoemtry. 

So actually, at their core, all proofs of Pythagorus need to assume the axioms of Euclidean geometry, and so they are all equivalent.

But you might think to yourself. Well, most proofs involve this argument using areas. This proof doesn't do that. Maybe it's still special? Welp unfortunately no. As I said before, this proof uses the Law of Sines, which essentially is just applying similar triangles. So IF you think a proof that only uses similar triangles is special, then I have a WAYYYY simplier proof than their proof.

**TODO** I can probably reformulate the proof only using Law of Sines.

### Better Proof

I didn't invent this proof. It's a variation of Einstein's boyhood proof. However, I'm pretty sure it even predates him. I couldn't track down who first came up with this, but it's so simple that I'm sure some variation has been around for a long time. I have simply taken the idea of the proof and slightly modified it.

<center>
{% tikz LoS-acute-triangle1 %}
    \usetikzlibrary{angles,calc}
    \usetikzlibrary{decorations.pathreplacing,intersections}

    \tikzset{
    font={\fontsize{14pt}{12}\selectfont}
    }

    \coordinate (A) at (0, 0);
    \coordinate (B) at (10, 0);
    \coordinate (C) at (2, 4);
    \coordinate (D) at (2, 0);

    \node[below left] at (A) {$A$};
    \node[below right] at (B) {$B$};
    \node[above] at (C) {$C$};
    \node[below] at (D) {$D$};
    
    \draw[thick] (A) -- (D) node[midway, below] {$x$};
    \draw[thick] (D) -- (B) node[midway, below] {$y$};
    \draw[thick] (B) -- (C) node[midway, above right] {$a$};
    \draw[thick] (C) -- (A) node[midway, above left] {$b$};
    \draw[] (C) -- (D);
    \draw[decorate,decoration={brace,amplitude=10pt,raise=20pt, mirror},yshift=0pt] ($(A) + (0.1, 0)$) -- ($(B) - (0.1, 0)$) node [midway, xshift=0pt, yshift=-40pt]{$c$};

    \draw ($(D) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);
    \draw[rotate=243.4349488] ($(C) + (0.3, 0)$) -- ++(0,0.3) -- ++(-0.3,0);

    % drawing angles
    %\draw pic [draw, -, angle radius={10}] {angle = B--A--C};
    %\draw pic [draw, -, angle radius={17}] {angle = D--C--B};

    %\draw pic [draw, -, angle radius={24}] {angle = C--B--A};
    %\draw pic [draw, -, angle radius={26}] {angle = C--B--A};
    %\draw pic [draw, -, angle radius={20}] {angle = A--C--D};
    %\draw pic [draw, -, angle radius={22}] {angle = A--C--D};

{% endtikz %}
</center>

Notice that we have three triangles: $\triangle ABC$, $\triangle ACD$, and $\triangle CBD$. In fact, these triangles are all **similar**, but I am not even going to use that fact in this proof. I am solely going to use the definition of the trigonometric function $\cos$.

$$
\triangle CBD \implies \cos A = \frac{x}{b}
\qquad
\triangle ABC \implies \cos A = \frac{b}{c}
$$

Therefore, 

$$
\frac{x}{b} = \frac{b}{c} \quad\implies\quad x = \frac{b^2}{c}
$$

Likewise,

$$
\triangle ACD \implies \cos B = \frac{y}{a}
\qquad
\triangle ABC \implies \cos B = \frac{a}{c}
$$

Therefore,

$$
\frac{y}{a} = \frac{a}{c} \quad\implies\quad y = \frac{a^2}{c}
$$

Now, sum the two expression together.

$$
c = x+y = \frac{b^2}{c} + \frac{a^2}{c} 
\quad\implies\quad
a^2 + b^2 = c^2
$$

As required.

This is actually a really deceptive proof. It seems like the only thing that I have assumed is the definition of the trig function $\cos$. In reality, I have assumed 1 more things. It would be a good exercise to the reader to try to figure out what else this proof assumes.

3

2

1

It's the **trigonometric functions themselves**. We are assuming an intepretation of the trigonometric functions, i.e. that they apply to right triangles. This assumes Euclidean Geometry.

For the $\cos$ function is that a right triangle with a hypotenuse of length $1$, then the angle uniquely determines the length of one of the legs. We are essentially utilizing SAS from geometry. This is not the case in Non-Euclidean geometries. 

Any "trigonometric proof" will fundamentally rely on geometry because trigonometry is fundamentally describing the relationship between the angles and the side lengths of a triangle, and triangle are geometric objects. I can't even write down the expression $\cos A = \tfrac{x}{b}$ without first drawing the diagram. Without the diagram, that equation doesn't mean anything! Our ability to draw that diagram IS geometry. 

<br>

---

<br>

## Trash

First of all, we need to understand what exactly the phrase "purely trigonometry" means. 

The term "purely trigonometry" is just a nonsense phrase; it doesn't actually mean anything. But what are they trying to say? To explain this, let's use an analogy. Consider the following proof.

$$
\begin{align}
    &(a + b) \cdot (a - b)      &&\\[5pt]
    &= a^2 - ab + ba - b^2        &&\text{distributive law} \\[5pt]
    &= a^2 - ab + ab - b^2        &&\text{commutative law of multiplication} \\[5pt]
    &= a^2 + 0 - b^2              &&\text{inverse element of addition} \\[5pt]
    &= a^2 - b^2                  &&\text{additive identity}
\end{align}
$$

This proof is "purely algebraic" because it only uses the laws of algebra in order to solve it.


$$
\begin{align}
    &\frac{1 + \sin \theta}{\cos \theta} &&\\[5pt]
    &= \frac{1 + \sin \theta}{\cos \theta} \cdot \frac{1 - \sin \theta}{1 - \sin \theta} \\[5pt]
    &= \frac{1 - \sin^2 \theta}{\cos \theta (1 - \sin \theta)} \\[5pt]
    &= \frac{\cos^2 \theta}{\cos \theta (1 - \sin \theta)} \\[5pt]
    &= \frac{\cos \theta}{1 - \sin \theta}
\end{align}
$$


<br>

## What Does a "Purely Trigonometric Proof" Mean?

Elisha Scott Loomis in this 1940 treatise _The Pythagorean Proposition_ stated the following.

> There are no trigonometric proofs [of the Pythagorean theorem], because all of the fundamental formulae of trigonometry are themselves based upon the truth of the Pythagorean theorem; because of this theorem we say sin$^2$ A + cos$^2$ A = 1 etc

This statement is both correct and incorrect depending on how you interpret it. But we will get to that later. For now, let's just understand what he means.

<br>

## What is Geometry?

In Euclid's famous textbook _The Elements_, he laid out the five famous postulates of Euclidean Geometry.
1. A straight line segment may be drawn from any given point to any other.
2. A straight line may be extended to any finite length.
3. A circle may be described with any given point as its center and any distance as its radius.
4. All right angles are congruent.
5. If a straight line intersects two other straight lines, and so makes the two interior angles on one side of it together less than two right angles, then the other straight lines will meet at a point if extended far enough on the side on which the angles are less than two right angles.

From these postulates (or axioms), all theorems in Euclidean Geometry can be derived, including the Pythagorean Theorem.

The keen among you will notice that the 5th postulate is much more complicated than the first four. This

TLDR; The Pythagorean Theorem does not hold in non-Euclidean Geometries.

<br>

## What is Trigonometry?

Trigonometry is the branch of math that describes the relationship between the angles and side lengths of a triangle. Essentially, it describe the rules when manipulating the functions $\sin$, $\cos$, $\tan$, $\sec$, $\csc$, and $\cot$.

Here's the problem, you can't define a triangle without assuming an underlying geometry. 
