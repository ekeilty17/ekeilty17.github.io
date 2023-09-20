---
layout:     post
title:      Constructing the Real Numbers
categories: blog
permalink:  /blog/constructing-the-real-numbers/
---

This series is still being developed

{% assign sorted_posts = site.posts | where: 'series', 'constructing-the-real-numbers' | sort: 'part' %}
{% for post in sorted_posts %}
  * Part {{ post.part }}) [ {{ post.title }} ]({{ post.url }})
{% endfor %}