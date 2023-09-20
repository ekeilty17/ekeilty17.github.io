---
layout:     page
title:      Blog Archive
categoties: blog
permalink:  /blog/
---

## Series

{% for page in site.pages %}
    {% assign page_directory = page.path | split: '/' | first%}
    {% if page_directory == "blog-series" %}

* [ {{ page.title }} ]({{ page.url }})

    {% endif %}
{% endfor %}

---

## Stand Alone

{% assign sorted_posts = site.posts | where: 'standalone', 'true' | sort: 'date' %}
{% for post in sorted_posts %}

* [ {{ post.title }} ]({{ post.url }})

{% endfor %}