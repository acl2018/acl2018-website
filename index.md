---
layout: page
title: About
news_posts: 8
---

The 56th Annual Meeting of the Association for Computational Linguistics will be held in [Melbourne, Australia](https://www.melbourne.org/?utm_source=Microsite&utm_campaign=Computational%20Linguistics) at
the [Melbourne Convention and Exhibition Centre](http://mcec.com.au/) from July 15th to 20th, 2018.


### Latest News

<ul>
  {% for post in site.posts %}
  {% if forloop.index < page.news_posts %}
    <li>
      {{ post.date | date: "%Y-%m-%d" }}: <a href="{{ post.url }}">{{ post.snippet }}</a>
    </li>
  {% endif %}
  {% endfor %}
</ul>

<p class="news-archive"><a href="{{ site.github_url }}/news">All News Items</a></p>

### Key Dates

<table class='conf-dates'>
{% for kd in site.key_dates %}
  <tr><td class='conf-date-label'>{{ kd.date }}</td> <td>{{ kd.event }}</td></tr>
{% endfor %}
</table>

_Deadlines refer to submissions to the main conference unless otherwise indicated._


### Committee

**General Chair:** [Claire Cardie](http://www.cs.cornell.edu/home/cardie/)

[Full Organising Committee List]({{ site.github.url }}/committee#organising-committee)

[Full Area Chair List]({{ site.github.url }}/committee#area-chairs)

### Sponsors

#### Student Volunteers Sponsor

<a href="https://www.data61.csiro.au/" title="Data 61" target="_blank">
    <span class="sponsor-image-wrapper">
        <img class="sponsor-image" alt="Data 61" src="{{ site.github.url }}/images/sponsors/data61.png"/>
        <img class="sponsor-image" alt="CSIRO" src="{{ site.github.url }}/images/sponsors/csiro.png"/>
    </span>
</a>

### Contact

For inquiries regarding the scientific program, please email <acl2018pc@ukp.informatik.tu-darmstadt.de>. 

For general inquiries about the conference, please email <acl2018local@lists.unimelb.edu.au>.
