---
layout:     page
title:      Blog Archive
categories: blog
permalink:  /blog/
---

<br>

---

<br>

## Blog Series'

{% for page in site.pages %}
    {% assign page_directory = page.path | split: '/' | first%}
    {% if page_directory == "blog-series" %}

<div class="post-link-container">
    <a href="{{ page.url }}" class="post-link-item"> 
        {{ page.title }} 
    </a>
</div>

    {% endif %}
{% endfor %}

<br>

---

<br>

## Standalone Posts

{% assign sorted_posts = site.posts | where: 'standalone', 'true' | sort: 'date' %}
{% for post in sorted_posts %}

<div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        {{ post.title }} 
        <!-- I'll play around with this later
        <time datetime="{{ post.date | date_to_xmlschema }}" class="post-link-date">{{ post.date | date_to_string }}</time>
        -->
    </a>
</div>

{% endfor %}