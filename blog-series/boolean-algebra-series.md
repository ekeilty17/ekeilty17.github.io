---
layout:     page
title:      Boolean Algebra Series
categories: blog
permalink:  /blog/boolean-algebra/
---

{% assign sorted_posts = site.posts | where: 'series', 'boolean-algebra' | sort: 'part' %}
{% for post in sorted_posts %}
  * Part {{ post.part }}) [ {{ post.title }} ]({{ post.url }})
{% endfor %}