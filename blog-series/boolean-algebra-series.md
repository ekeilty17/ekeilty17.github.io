---
layout:     page
title:      Boolean Algebra Series
categories: blog
permalink:  /blog/boolean-algebra/
---

[Summary of Laws](/blog/boolean-algebra/summary-of-laws)

{% assign sorted_posts = site.posts | where: 'series', 'boolean-algebra' | sort: 'part' %}
{% for post in sorted_posts %}
  * Part {{ post.part }}) [ {{ post.title }} ]({{ post.url }})
{% endfor %}