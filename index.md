---
layout: page
title: About
top: true
key_dates:
  - date: February 22nd
    event: Submission Deadline
  - date: March 26th–28th
    event: Author Response Period
  - date: April 20th
    event: Notification of Acceptance
  - date: May 11th
    event: Camera-ready Due
  - date: July 15th–20th
    event: Main Conference
---

The 56th Annual Meeting of the Association for Computational Linguistics will be held in [Melbourne, Australia](https://www.melbourne.org/?utm_source=Microsite&utm_campaign=Computational%20Linguistics) at
the [Melbourne Convention and Exhibition Centre](http://mcec.com.au/) from July 15th to 20th, 2018.


### News

* [Please help us recruit the best area chairs, reviewers, and invited speakers](news/call-for-nominations)
* [ACL, COLING, EMNLP and NAACL 2018 are seeking tutorial proposals](news/joint-call-for-tutorials)


### Key Dates
{% for kd in page.key_dates %}
  * **{{ kd.date }}**: {{ kd.event }}{% endfor %}

_All deadlines are: 11:59pm UTC-12_

### Committee

**General Chair:** [Claire Cardie](http://www.cs.cornell.edu/home/cardie/)

[Full Organising Committee List]({{ "/committee#organising-committee" | prepend: site.github.url }})

[Full Area Chair List]({{ "/committee#area-chairs" | prepend: site.github.url }})



{% for role in page.committee %}
#### {{ role.rolename }}

  {% for person in role.people %}
  * [{{ person.name }}]({{ person.page }}), {{ person.affiliation }}{% endfor %}
{% endfor %}

