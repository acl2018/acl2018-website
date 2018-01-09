---
layout: page
title: Committee
top_index: 2
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
  - rolename: Student Research Workshop Organisers
    people:
    - name: Vered Shwartz
      affiliation: Bar-Ilan University
      page: http://u.cs.biu.ac.il/~havivv/
    - name: Jeniya Tabassum
      affiliation: Ohio State University
      page: https://sites.google.com/site/jeniyatabassum/
    - name: Rob Voigt
      affiliation: Stanford University
      page: https://nlp.stanford.edu/robvoigt/
  - rolename: Faculty Advisors to the Student Research Workshop
    people:
    - name: Marie-Catherine de Marneffe
      affiliation: Ohio State
      page: http://www.ling.ohio-state.edu/~demarneffe.1/
    - name: Wanxiang Che
      affiliation: Harbin Institute of Technology
      page: http://encs.hit.edu.cn/33/11/c5511a144145/page.htm
    - name: Malvina Nissim
      affiliation: University of Groningen
      page: https://www.rug.nl/staff/m.nissim/
  - rolename: Webmaster
    people: 
      - name: Andrew MacKinlay
        affiliation: IBM Research
        page: http://researcher.ibm.com/researcher/view.php?person=au1-admackin
---


### Organising Committee

{% for role in page.committee %}
#### {{ role.rolename }}

  {% for person in role.people %}
  * [{{ person.name }}]({{ person.page }}), {{ person.affiliation }}{% endfor %}
{% endfor %}

### Area Chairs
<ul>
{% for areainfo in site.data.area_chairs %}
  <li><strong>{{ areainfo.area }}</strong>:
    <ul>
      {% for person in areainfo.people %}
      <li>{{ person.name }}{% if person.senior %}<div class="text-label">Senior Chair</div>{% endif %}</li>
      {% endfor %}
    </ul>
  </li>
{% endfor %}
</ul>
