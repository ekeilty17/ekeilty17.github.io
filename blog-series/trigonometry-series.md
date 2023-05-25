---
layout:     post
title:      Trigonometric Identities Derivations
categories: blog
permalink:  /blog/trigonometry/
---

[Summary Table of Trigonometric Identities](/blog/trigonometry/table-of-trig-identities)

{% assign sorted_posts = site.posts | where: 'series', 'trigonometry' | sort: 'part' %}
{% for post in sorted_posts %}
  * Part {{ post.part }}) [ {{ post.title }} ]({{ post.url }})
{% endfor %}