---
layout:     page
title:      Blog Archive
categories: blog
permalink:  /blog/
---

<br>

---

<br>

## Blog Series's

<!-- We check if the field `draft` exists, and if it does then we don't include the series -->
<!-- if jekyll.environment == "development" -->

{% for page in site.pages %}
    {% assign page_directory = page.path | split: '/' | first%}
    {% if page_directory == "blog-series" %}
        {% assign draft_status = page.draft | default: false %}
        {% if draft_status == false %}

<div class="post-link-container">
    <a href="{{ page.url }}" class="post-link-item"> 
        {{ page.title }} 
        {% if draft_status == true %}
            <span style="float: right; color: red;">DRAFT</span>
        {% endif %}
    </a>
</div>

        {% endif %}
    {% endif %}
{% endfor %}

<br>

---

<br>

## Standalone Posts

<!-- We check if the field `draft` exists, and if it does then we don't include the post -->
<!-- jekyll.environment == "development" -->

{% assign sorted_posts = site.posts | where: 'standalone', 'true' | sort: 'date' | reverse %}
{% for post in sorted_posts %}
    {% assign draft_status = post.draft | default: false %}
    {% assign appendix_status = post.appendix | default: false %}
    {% if draft_status == false and appendix_status == false%}

<div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        <div>
            {{ post.title }} 
            {% if draft_status == true %}
                <span style="float: right; color: red;">DRAFT</span>
            {% endif %}
        </div>
        <div>
            <div style="font-size: smaller; margin-top: 5px; margin-bottom: -15px; opacity: 0.4;">
                <time datetime="{{ post.date | date_to_xmlschema }}" class="post-link-date">{{ post.date | date_to_string }}</time>
            </div>
        </div>
    </a>
</div>
    {% endif %}
{% endfor %}