---
title: Invited Talks
nav_title: Invited Talks
top_nav_category: Programme
tab_index: 2
---

{% for talk in site.data.invited_speakers %}
<div class="invited-talk">
    <h3>{{ talk.title }}</h3>
    <p class="speaker">{{ talk.speaker }}</p>
    <div class="talk-abstract">{{ talk.abstract }}</div>
    <div class="bio"><strong>Bio: </strong>{{ talk.bio }}</div>
</div>
{% endfor %}

