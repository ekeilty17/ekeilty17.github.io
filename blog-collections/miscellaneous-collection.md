---
layout:     post
title:      Miscellaneous
categories: blog
permalink:  /blog/miscellaneous/
---

This is a collection of miscellaneous posts which I didn't feel were worthy enough to advertise on the main blog page. They can be read in any order.

{% assign sorted_posts = site.posts | where: 'series', 'miscellaneous' | sort: 'date' | reverse %}
{% for post in sorted_posts %}
  {% assign draft_status = post.draft | default: false %}
  {% if draft_status == false %}
  <div class="post-link-container">
    <a href="{{ post.url }}" class="post-link-item"> 
        <div>
            {{ post.title }} 
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
