---
layout: page
title: Committee
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
  - rolename: Webmaster
    people: 
      - name: Andrew MacKinlay
        affiliation: IBM Research
        page: http://researcher.ibm.com/researcher/view.php?person=au1-admackin
area_chairs:
  - area: Dialogue and Interactive Systems
    people: 
      - name: Asli Celikyilmaz
      - name: Verena Rieser
  - area:   Discourse and Pragmatics
    people:
      - name: Manfred Stede
      - name: Ani Nenkova
  - area:   Document Analysis
    people:
      - name: Hang Li
      - name: David Smith
      - name: Yiqun Liu
  - area:   Generation
    people:
      - name: Ioannis Konstas
      - name: Claire Gardent
  - area:   Information Extraction and Text Mining
    people:
      - name: Feiyu Xu
      - name: Kevin Cohen
      - name: Zhiyuan Liu
      - name: Ralph Grishman
      - name: Yi Yang
      - name: Nazli Goharian
  - area:   Linguistic Theories, Cognitive Modeling and Psycholinguistics
    people: 
      - name: Shuly Wintner
      - name: Tim O'Donnell
  - area:   Machine Learning
    people:
      - name: Andre Martins
      - name: Ariadna Quattoni
      - name: Jun Suzuki
  - area:   Machine Translation
    people:
      - name: Yang Liu
      - name: Matt Post
      - name: Lucia Specia
      - name: Dekai Wu
  - area:   Multidisciplinary (also for AC COI)
    people:
      - name: Yoav Goldberg
      - name: Anders Søgaard
      - name: Mirella Lapata
  - area:   Multilinguality
    people:
      - name: Bernardo Magnini
  - area: Phonology, Morphology and Word Segmentation
    people:
      - name: Graham Neubig
      - name: Hai Zhao
  - area:   Question Answering
    people:
      - name: Lluís Màrquez
      - name: Teruko Mitamura
      - name: Zornitsa Kozareva
      - name: Richard Socher
  - area:   Resources and Evaluation
    people:
      - name: Gerard de Melo
      - name: Karën Fort
  - area:   Sentence-level Semantics
    people:
      - name: Luke Zettlemoyer
      - name: Ellie Pavlick
  - area:   Sentiment Analysis and Argument Mining
    people:
      - name: Smaranda Muresan
      - name: Benno Stein
      - name: Yulan He
  - area:   Social Media
    people:
      - name: David Jurgens
      - name: Jing Jiang
  - area:   Summarization
    people:
      - name: Kathleen McKeown
      - name: Xiaodan Zhu
  - area: Tagging, Chunking, Syntax and Parsing
    people: 
      - name: Liang Huang
      - name: Weiwei Sun
      - name: Željko Agić
      - name: Yue Zhang
  - area:   Textual Inference and Other Areas of Semantics
    people:
      - name: Michael Roth
      - name: Fabio Massimo Zanzotto
  - area: Vision, Robotics, Multimodal, Grounding and Speech
    people:
      - name: Yoav Artzi
      - name: Shinji Watanabe
      - name: Timothy Hospedales    
  - area:   Word-level Semantics
    people:
      - name: Ekaterina Shutova
      - name: Roberto Navigli
      
---


### Organising Committee

{% for role in page.committee %}
#### {{ role.rolename }}

  {% for person in role.people %}
  * [{{ person.name }}]({{ person.page }}), {{ person.affiliation }}{% endfor %}
{% endfor %}

### Area Chairs
{% for areainfo in page.area_chairs %}
  * **{{ areainfo.area }}**:
  {% for person in areainfo.people %}    * {{ person.name }}
  {% endfor %}
{% endfor %}

