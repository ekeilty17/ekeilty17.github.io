---
layout:     post
title:      Trigonometry Series
categories: blog
permalink:  /blog/trigonometry/
---

[Summary of Trigonometric Identities](/blog/trigonometry/summary-of-trig-identities)

{% assign sorted_posts = site.posts | where: 'series', 'trigonometry' | sort: 'part' %}
{% for post in sorted_posts %}
  * Part {{ post.part }}) [ {{ post.title }} ]({{ post.url }})
{% endfor %}