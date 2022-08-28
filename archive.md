---
layout: page
title: Archive
permalink: /archive/
---

## Blog Posts

<!-- Boolean Algebra Series -->
{% assign sorted_posts = site.posts | where: 'categories', 'boolean-algebra' | sort: 'part' %}
{% for post in sorted_posts %}
  * Part {{ post.part }}) [ {{ post.title }} ]({{ post.url }})
{% endfor %}
