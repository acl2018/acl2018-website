---
layout: page
title: Tutorials
---

Tutorials will be held on July 15th, 2018. All tutorials will run for a half-day and the full schedule will be updated shortly.

{% for tute in site.data.tutorials %}
### {{ tute.title }}

<div class="tutorial-presenters">{{ tute.presenters | markdownify }}</div>

{{ tute.description | markdownify }}

{% if tute.materials %}<div class="further-info"><a href="{{ tute.materials }}" target="_blank" title="Additional Information about '{{ tute.title }}' (opens in external site)">Further Information</a></div>{% endif %}

{% endfor %}
