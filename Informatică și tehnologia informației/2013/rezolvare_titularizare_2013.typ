#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Titularizare 2013*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Titularizare Var 2013],
      align(right)[Pagina #context counter(page).display()],
    )
  ]
)
#set text(
  font: "Arial",
  size: 11pt,
  lang: "ro"
)
#set par(justify: true)

#align(center)[
  #text(size: 20pt, weight: "bold")[Rezolvare Completă și Detaliată] \
  #v(3mm)
  #text(size: 14pt, style: "italic")[Concursul Național pentru Ocuparea Posturilor Didactice] \
  #text(size: 12pt)[Anul 2013 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Titularizare Varianta 2 (30 iulie 2013)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2013/Tit_048_Informatica_tehn_info_P_2013_var_02_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2013/Tit_048_Informatica_tehn_info_P_2013_bar_02_LRO.pdf)

== SUBIECTUL al II-lea (45 de puncte)

=== 1. Proiectare itemi didactici (Subprograme - C și Foi de calcul - D)
- *Alegere duală (Subprograme)*:
  - *Enunț*: Variabilele declarate în corpul unui subprogram sunt globale și pot fi accesate direct din programul principal. (A/F)
  - *Răspuns*: Fals.
- *Întrebare structurată (Foi de calcul)*:
  - *Enunț*: Într-o foaie de calcul, introduceți în celula `A1` textul `Produs` și în celula `B1` valoarea `100`.
    1. Precizați ce tip de date conține celula `A1`, respectiv celula `B1`.
    2. Descrieți pașii necesari pentru a copia celula `B1` în celula `C1`.
  - *Răspuns*:
    1. `A1` conține tipul Text, iar `B1` conține tipul Numeric.
    2. Se selectează celula `B1`, se apasă `Ctrl+C`, se selectează celula `C1` și se apasă `Ctrl+V`.

=== 2. Evaluare prin Proiect
- *Temă*: Gestiunea datelor financiare ale unei mini-firme folosind foi de calcul tabelar.
- *Scop*: Evaluarea competențelor de introducere, sortare, formatare și aplicare a formulelor.
- *Bareme*: Distribuirea punctelor pe baza calității designului, corectitudinii formulelor și prezentării graficelor.
