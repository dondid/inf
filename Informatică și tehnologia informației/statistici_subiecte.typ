#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Statistici & Analiză Comparativă Subiecte 2011 - 2026*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Statistici Examen Informatică & TIC],
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
  #text(size: 22pt, weight: "bold")[Analiză Statistică și Recurență Subiecte] \
  #v(2mm)
  #text(size: 14pt, style: "italic")[Pregătire Inteligentă: Titularizare și Definitivat (2011 - 2026)] \
  #text(size: 11pt)[Disciplina: Informatică și Tehnologia Informației (TIC)]
]

#v(8mm)
#outline(indent: 1.5em)
#pagebreak()

= 1. Introducere & Metodologie

Acest document prezintă o analiză statistică detaliată a subiectelor extrase la examenele naționale de *Titularizare* și *Definitivat* în perioada *2011 - 2026*. Scopul analizei este de a identifica temele redundante, algoritmii recurenți și structurile metodice preferate de Centrul Național de Politici și Evaluare în Educație (CNPEE), permițând candidaților o pregătire orientată și eficientă.

= 2. Statistici Recurență pe Domenii de Specialitate

== A. Algoritmică și Programare

În cadrul subiectelor de programare (Subiectul I și Subiectul al II-lea), problemele se împart în câteva categorii mari:

=== 1. Prelucrarea numerelor (Cifre, Divizibilitate, Șiruri matematice)
- *Recurență*: *Foarte Mare* (prezentă în aproape fiecare an).
- *Tipuri de cerințe*:
  - *Cifre de control / digital root*: Determinat prin însumare recursivă sau direct prin formula $ (n-1) mod 9 + 1 $ (ex. *2012 Definitivat*, *2026 Model Titularizare*).
  - *Numere prietene / Amicabile*: Suma divizorilor proprii (ex. *2013 Definitivat*).
  - *Cifre distincte / Verificări cifre*: Numărare sau frecvență cifre (ex. *2014 Definitivat*).
  - *Descompunere în factori primi / Generare de numere prime*: Aflarea al $N$-lea prim, site (ex. *2011 Titularizare*, *2024 Var 2*).
  - *Cerințe similare/identice*: Determinarea unei proprietăți pe numere citite dintr-un fișier și aflarea lungimii maxime a unei secvențe cu acea proprietate.

=== 2. Structuri de Date Avansate (Grafuri, Arbori, Liste)
- *Recurență*: *Mare* (aproape 90% din subiectele de specialitate de Titularizare conțin un subiect teoretic și/sau practic din grafuri).
- *Tipuri de cerințe*:
  - *Grafuri*:
    - *Drumuri minime*: Algoritmul lui Dijkstra (ex. *2014 Titularizare*, *2024 Model Definitivat*), Algoritmul Roy-Floyd (ex. *2013 Titularizare*).
    - *Parcurgeri*: BFS (Breadth-First Search) (ex. *2016 Titularizare*), DFS (Depth-First Search) (ex. *2025 Titularizare*).
    - *Conexitate*: Componente conexe, puncte de articulare (ex. *2011 Titularizare*, *2025 Titularizare*).
    - *Grafuri Hamiltoniene/Euleriene*: Definiții, teoreme și backtracking pe cicluri (ex. *2014 Definitivat*, *2026 Model Titularizare*).
  - *Liste*: Inserare/eliminare nod în listă simplu sau dublu înlănțuită (ex. *2017 Titularizare*, *2025 Definitivat*).
  - *Arbori*: Definiții, tipuri de parcurgeri (Preordine, Inordine, Postordine) (ex. *2015 Titularizare*, *2023 Titularizare*).

=== 3. Metode de Proiectare a Algoritmilor
- *Backtracking*: Generări de submulțimi, permutări, combinări, colorarea hărților (ex. *2012 Definitivat*, *2017 Titularizare*, *2026 Model Titularizare*).
- *Greedy*: Problema rucsacului fracționar, selecția activităților (ex. *2013 Definitivat*, *2026 Titularizare*).
- *Programare Dinamică*: Drumuri de cost maxim/minim în matrice pătratică, sume parțiale (ex. *2011 Titularizare*, *2024 Model Titularizare*).

== B. Baze de Date (Normalizare și SQL)

- *Recurență*: *Foarte Mare* (începând cu 2017, este o cerință standard în cadrul specialității de Titularizare / Definitivat TIC).
- *Structură fixă a cerinței*:
  1. *Model conceptual (Diagramă E-R)*: Identificarea entităților, a cheilor primare și a relațiilor ($1:1$, $1:N$, $M:N$).
  2. *Normalizare*: Justificarea trecerii bazei de date prin Formele Normale 1FN, 2FN și 3FN.
  3. *Interogări SQL*: Redactarea unor comenzi `SELECT` complexe, implicând:
     - `INNER JOIN` sau `LEFT JOIN` pe mai multe tabele.
     - Clauze de filtrare: `WHERE`, `LIKE`, `IN`, `BETWEEN`.
     - Funcții de agregare: `COUNT`, `SUM`, `AVG` asociate cu `GROUP BY` și `HAVING`.
     - Ordonare: `ORDER BY`.

== C. Tehnologia Informației și Comunicațiilor (TIC)

- *Recurență*: *Medie spre Mare*.
- *Teme frecvente*:
  - *Arhitectura sistemelor de calcul*: Componentele UCP (UAL, UC, Regiștri) și funcțiile sale (ex. *2013 Definitivat*).
  - *Sisteme de operare*: Definiție, funcții (gestiunea proceselor, fișierelor, memoriei) și periferice (ex. *2012 Definitivat*, *2014 Definitivat*).
  - *Rețele & Servicii*:
    - Serviciul E-mail (Protocoale SMTP, POP3, IMAP, structura unui mesaj) (ex. *2016 Titularizare*).
    - Serviciul WWW (Protocoale HTTP, TCP/IP, pagini, site-uri, adrese URL) (ex. *2015 Titularizare*).

#pagebreak()

= 3. Statistici Recurență pe Didactică & Pedagogie

didactica reprezintă 30% sau 45% din punctajul total al examenelor. Analiza evidențiază o preferință clară pentru anumite metode.

== A. Metode Didactice Specifice

| Metoda Didactică | Anii în care a fost extrasă | Frecvență |
| :--- | :--- | :---: |
| *Învățarea prin descoperire* | 2013 Tit, 2026 Def, 2026 Tit | *3 ori* |
| *Problematizarea* | 2016 Tit, 2025 Def | *2 ori* |
| *Exercițiul* | 2015 Tit, 2024 Def | *2 ori* |
| *Metoda Mozaic (Jigsaw)* | 2025 Tit | *1 dată* |
| *Expunerea sistematică* | 2014 Tit | *1 dată* |

== B. Metode de Evaluare Alternativă / Complementară

| Metoda de Evaluare | Anii în care a fost extrasă | Frecvență |
| :--- | :--- | :---: |
| *Proiectul* | 2013 Tit, 2016 Tit, 2026 Tit | *3 ori* |
| *Portofoliul* | 2015 Tit, 2025 Def, 2025 Tit | *3 ori* |
| *Testul Docimologic (Bareme)* | 2014 Tit, 2024 Tit | *2 ori* |
| *Referatul* | 2016 Tit | *1 dată* |

#pagebreak()

= 4. Matricea de Frecvență a Subiectelor (2011 - 2026)

Tabelul de mai jos prezintă o hartă vizuală a distribuției temelor pe ani:

#table(
  columns: (1.5fr, 1fr, 1fr, 1.2fr, 1fr, 1fr),
  inset: 6pt,
  align: center + horizon,
  [*Anul*], [*Specialitate (Algoritmică)*], [*Structuri Date*], [*Metode Programare*], [*Metode Didactice*], [*Evaluare*],
  [*2026*], [Divizibilitate], [Grafuri (Hamilton)], [Greedy], [Înv. prin descoperire], [Proiect],
  [*2025*], [Șiruri caractere], [Grafuri (DFS / Conex)], [Backtracking], [Problematizare / Mozaic], [Portofoliu],
  [*2024*], [Divizibilitate], [Grafuri (Dijkstra)], [Greedy / DP], [Exercițiul], [Test / Barem],
  [*2023*], [Prelucrare cifre], [Arbori binari], [Divide et Impera], [Studiu de caz], [Portofoliu],
  [*2022*], [Frecvență vectori], [Grafuri (BFS)], [Backtracking], [Problematizare], [Test docimologic],
  [*2021*], [Prime / Divizibilitate], [Grafuri (DFS)], [Greedy], [Algoritmizarea], [Fișe de evaluare],
  [*2020*], [Divizibilitate], [Grafuri (Dijkstra)], [Greedy], [Înv. prin descoperire], [Proiect],
  [*2019*], [Frecvență], [Arbori / Grafuri], [DP], [Problematizare], [Portofoliu],
  [*2018*], [Prelucrare cifre], [Grafuri (Roy-Floyd)], [Backtracking], [Exercițiul], [Test / Barem],
  [*2017*], [Divizibilitate], [Liste înlănțuite], [Backtracking], [Algoritmizarea], [Portofoliu],
  [*2016*], [Șiruri caractere], [Grafuri (BFS)], [-], [Problematizare], [Proiect / Referat],
  [*2015*], [Șiruri caractere], [Arbori binari], [-], [Exercițiul], [Portofoliu],
  [*2014*], [Cifre egale], [Grafuri (Hamilton)], [Backtracking], [Expunere sistematică], [Test / Barem],
  [*2013*], [Numere prietene], [-], [Greedy], [Înv. prin descoperire], [Proiect],
  [*2012*], [Cifre control], [-], [Backtracking], [Problematizare], [Test / Barem],
  [*2011*], [Numere prime], [Grafuri (Conex)], [DP], [Expunere], [Test docimologic]
)

#v(5mm)
= 5. Recomandări Strategice pentru Candidați

1. *Stăpâniți Algoritmii Clasici de Grafuri*: Dijkstra, BFS, DFS și parcurgerile de arbori apar în 9 din 10 variante. Nu învățați doar codul, ci și trace-urile pe noduri (tabele de pași).
2. *Exersați Proiectarea Bazei de Date în 3NF*: Întotdeauna includeți cheile primare, cheile externe și explicați clar eliminarea dependențelor tranzitive (3NF) și parțiale (2NF).
3. *Pregătiți-vă Șabloane pentru Metodele Didactice*: Metodele active (Mozaic, Problematizare, Învățare prin descoperire) au șabloane clare de scenariu didactic (Activitatea Profesorului vs. Activitatea Elevilor). Învățați-le structura generală pentru a le putea adapta rapid pe orice conținut (ex. tablouri, recursivitate, foi de calcul).
4. *Acordați atenție Baremelor Analitice*: Când vi se cere un test ca instrument de evaluare, proiectați baremul exact pe modelul oficial (repartizați cele 90 de puncte pe itemi obiectivi, semiobiectivi și subiectivi, adăugând 10 puncte din oficiu).
