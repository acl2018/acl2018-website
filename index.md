---
layout: page
title: About
top: true
committee:
  - rolename: General Chair
    people:
    - name: Claire Cardie
      affiliation: Cornell University
      page: http://www.cs.cornell.edu/home/cardie/
  - rolename: Program Chairs
    people:
    - name: Iryna Gurevych
      affiliation: TU Darmstadt  
      page: https://www.ukp.tu-darmstadt.de/people/group-heads/prof-dr-iryna-gurevych/
    - name: Yusuke Miyao
      page: http://www.nii.ac.jp/en/faculty/digital_content/miyao_yusuke/
      affiliation: National Institute of Informatics
  - rolename: Workshop Chairs
    people:
    - name: Brendan O'Connor
      page: http://brenocon.com/
      affiliation: University of Massachusetts Amherst
    - name: Eva Maria Vecchi
      page: http://www.vecchi.com/eva/
      affiliation: University of Cambridge
  - rolename: Tutorial Chairs
    people:
    - name: Yoav Artzi
      page: http://yoavartzi.com/
      affiliation: Cornell University
    - name: Jacob Eisenstein
      page: http://www.cc.gatech.edu/~jeisenst/
      affiliation: Georgia Institute of Technology
  - rolename: Demo Chairs
    people:
    - name: Fei Liu
      page: http://www.cs.ucf.edu/~feiliu/
      affiliation: University of Central Florida
    - name: Thamar Solorio
      page: http://solorio.uh.edu/
      affiliation: University of Houston
  - rolename: Publications Chairs
    people:
    - name: Shay Cohen
      page: http://homepages.inf.ed.ac.uk/scohen/
      affiliation: University of Edinburgh
    - name: Kevin Gimpel
      page: http://www.ttic.edu/gimpel
      affiliation: Toyota Technological Institute at Chicago
    - name: Wei Lu
      page: http://www.statnlp.org/faculty/lu_wei
      affiliation: Singapore University of Technology and Design (Advisory)
  - rolename: Exhibits Coordinator
    people:
    - name: Karin Verspoor
      page: http://www.cis.unimelb.edu.au/people/staff.php?person_ID=458973
      affiliation: University of Melbourne
  - rolename: Conference Handbook Chairs
    people:
    - name: Jey Han Lau
      page: http://researcher.ibm.com/researcher/view.php?person=au1-jeyhan.lau
      affiliation: IBM Research
    - name: Trevor Cohn
      page: http://people.eng.unimelb.edu.au/tcohn/
      affiliation: University of Melbourne
  - rolename: Publicity Chair
    people:
    - name: Sarvnaz Karimi
      page: http://people.csiro.au/K/S/Sarvnaz-Karimi
      affiliation: CSIRO
  - rolename: Local Sponsorship Chair
    people:
    - name: Cecile Paris
      page: http://people.csiro.au/P/C/Cecile-Paris.aspx
      affiliation: CSIRO
  - rolename: Local Chairs
    people:
    - name: Tim Baldwin
      affiliation: University of Melbourne
      page: https://people.eng.unimelb.edu.au/tbaldwin/
    - name: Karin Verspoor
      affiliation: University of Melbourne
      page: http://www.cis.unimelb.edu.au/people/staff.php?person_ID=458973
    - name: Trevor Cohn
      affiliation: University of Melbourne
      page: http://people.eng.unimelb.edu.au/tcohn/
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

### Organising Committee

{% for role in page.committee %}
#### {{ role.rolename }}

  {% for person in role.people %}
  * [{{ person.name }}]({{ person.page }}), {{ person.affiliation }}{% endfor %}
{% endfor %}


### Support
**Webmaster:** [Andrew MacKinlay](http://researcher.ibm.com/researcher/view.php?person=au1-admackin), IBM Research
