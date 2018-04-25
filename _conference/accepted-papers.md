---
title: Accepted Papers
top_nav_category: Conference
layout: page
---

This year, the ACL conference was super-competitive: We accepted 258 out of 1018 submitted long papers and 126 out of 526 short papers, with an overall acceptance rate of 24.9%.  The details of the review process will be published soon on the homepage. 
Congratulations to all authors for their fine work, and thanks to all the area chairs and reviewers for their great effort to ensure the high-quality review process!

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