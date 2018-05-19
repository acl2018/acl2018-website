---
title: Accepted Papers
nav_title: Papers
top_nav_category: Programme
redirect_from: /conference/accepted-papers/
tab_index: 1
---

This year, the ACL conference was super-competitive: We accepted 258 out of 1018 submitted long papers and 126 out of 526 short papers, with an overall acceptance rate of 24.9%.  The details of the review process will be published soon on the homepage. 
Congratulations to all authors for their fine work, and thanks to all the area chairs and reviewers for their great effort to ensure the high-quality review process!

_Authors of accepted papers should read the [instructions for camera-ready submissions]({{ site.github.url }}/2018/05/05/author-instructions)_

<nav class="table-contents">
    <h4>Jump to…</h4>
    <ul>
    <li><a href='#long-papers'>Long Papers</a></li>
    <li><a href='#short-papers'>Short Papers</a></li>
    <li><a href='#demo-papers'>Demo Papers</a></li>
    </ul>
</nav>


### Long Papers

<ul class="accepted-papers">
{% for paper in site.data.papers_long %}
    <li class="listing"><span class="paper-title">{{ paper.Title }}</span>. <span class="paper-authors">{{ paper.Authors }}</span>.</li>
{% endfor %}
</ul>

### Short Papers

<ul class="accepted-papers">
{% for paper in site.data.papers_short %}
    <li class="listing"><span class="paper-title">{{ paper.Title }}</span>. <span class="paper-authors">{{ paper.Authors }}</span>.</li>
{% endfor %}
</ul>

### Demo Papers

<ul class="accepted-papers">
{% for paper in site.data.papers_demo %}
    <li class="listing"><span class="paper-title">{{ paper.Title }}</span>. <span class="paper-authors">{{ paper.Authors }}</span>.</li>
{% endfor %}
</ul>
