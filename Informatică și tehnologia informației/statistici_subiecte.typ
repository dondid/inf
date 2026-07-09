#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Statistici & Matricea de Recurență a Subiectelor (2011 - 2026)*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Analiză Statistică Completă - Informatică & TIC],
      align(right)[Pagina #context counter(page).display()],
    )
  ]
)
#set text(
  font: "Arial",
  size: 10pt,
  lang: "ro"
)
#set par(justify: true)

#align(center)[
  #text(size: 20pt, weight: "bold")[Matricea de Recurență și Frecvență] \
  #v(2mm)
  #text(size: 13pt, style: "italic")[Analiză Comparativă Detaliată: Ce s-a dat, de câte ori și în ce examene (2011 - 2026)] \
  #text(size: 10pt)[Examenul Național de Titularizare & Definitivat - Informatică și Tehnologia Informației]
]

#v(5mm)
#outline(indent: 1.5em)
#pagebreak()

= 1. Scopul Analizei

Pentru a optimiza procesul de învățare, această secțiune identifică cu precizie chirurgicală *ce structuri de probleme s-au repetat, de câte ori și în ce sesiuni specifice de examen* (Titularizare sau Definitivat). Analiza acoperă toate cele trei mari componente ale examenului: *Algoritmică și Programare*, *Baze de Date și TIC*, respectiv *Didactică și Evaluare*.

#v(3mm)
= 2. Tabelul Recurențelor în Algoritmică și Programare (Subiectul I & II)

Tabelul de mai jos inventariază tipurile de algoritmi care s-au repetat cel mai des:

#table(
  columns: (1.8fr, 1fr, 1.8fr, 1fr),
  inset: 5pt,
  align: left + horizon,
  [*Subiect / Algoritm Repetat*], [*Frecvență*], [*Sesiuni Specifice de Examen*], [*Grad Asemănare*],
  
  [*Prelucrarea cifrelor / Cifră de control*
   (Digital root / recursivitate sumă cifre)],
  [3 ori],
  [- 2012 Definitivat (Sub. I.3)\ - 2026 Model Titularizare (Sub. II.1)\ - 2024 Model Titularizare (Sub. II.1)],
  [*Identic ca logică* (sumarea cifrelor repetată până la o singură cifră sau sume de cifre)],
  
  [*Divizibilitate și Sume de Divizori*
   (Amicabile, perfecte, k-perechi)],
  [3 ori],
  [- 2013 Definitivat (Sub. I.3)\ - 2024 Var 2 Titularizare (Sub. I.3)\ - 2026 Model Definitivat (Sub. I.3)],
  [*Identic ca subalgoritm* (calcularea sumei divizorilor proprii în $O(sqrt(N))$)],
  
  [*Șirul numerelor prime*
   (Generare, site, verificări eficiente)],
  [3 ori],
  [- 2011 Titularizare (Sub. I.2)\ - 2024 Var 2 Titularizare (Sub. I.3)\ - 2025 Model Titularizare (Sub. I.3)],
  [*Foarte mare* (utilizează testul de primalitate în $O(sqrt(P))$ sau site)],
  
  [*Dijkstra (Drumuri minime)*
   (Determinarea drumurilor de cost minim în graf)],
  [3 ori],
  [- 2014 Titularizare (Sub. I)\ - 2024 Model Definitivat (Sub. I.1)\ - 2020 Model Titularizare (Sub. I.1)],
  [*Identic* (definitare, pași trace în tabel, implementare cod)],
  
  [*BFS / DFS (Parcurgeri grafuri)*
   (Parcurgerea în lățime / adâncime)],
  [3 ori],
  [- 2016 Titularizare (BFS - Sub. I.1)\ - 2025 Titularizare (DFS - Sub. I.1)\ - 2022 Model Definitivat (BFS)],
  [*Identic ca structură teoretică* (definiții, trace-uri și codul clasic)],
  
  [*Grafuri Hamiltoniene & Backtracking*
   (Cicluri hamiltoniene, generări)],
  [2 ori],
  [- 2014 Definitivat (Sub. I.1)\ - 2026 Model Titularizare (Sub. I.1)],
  [*Identic* (cerință de backtracking pentru determinarea ciclului hamiltonian)],
  
  [*Procesare șiruri: Variații pe vocale*
   (Șir vocalic, șir mijlociu, eliminări vocale)],
  [3 ori],
  [- 2015 Titularizare (Sub. II.1)\ - 2016 Titularizare (Sub. II.1)\ - 2025 Definitivat (Sub. II.1)],
  [*Foarte mare* (algoritmi pe cuvinte, determinare de perechi sau transformări pe vocale/consoane)],
  
  [*Diferențe simetrice / Interclasări*
   (Interclasare de fișiere ordonate sau dif. simetrice)],
  [2 ori],
  [- 2015 Titularizare (Sub. II.2)\ - 2026 Definitivat (Sub. II.2)],
  [*Aproape identic* (interclasare cu doi pointeri în timp liniar $O(N + M)$)]
)

#pagebreak()

= 3. Tabelul Recurențelor în Baze de Date și TIC

TIC și Bazele de Date prezintă cel mai stabil șablon din cadrul probelor scrise:

#table(
  columns: (1.8fr, 1fr, 1.8fr, 1fr),
  inset: 5pt,
  align: left + horizon,
  [*Subiect / Algoritm Repetat*], [*Frecvență*], [*Sesiuni Specifice de Examen*], [*Grad Asemănare*],
  
  [*Normalizare Baze de Date*
   (Tranziția prin 1FN, 2FN, 3FN)],
  [7 ori],
  [- 2026 Model Titularizare (Sub. II.2)\ - 2025 Titularizare (Sub. II.2)\ - 2025 Definitivat (Sub. II.2)\ - 2024 Model Titularizare (Sub. II.3)\ - 2023 Titularizare\ - 2017 Titularizare\ - 2026 Model Definitivat],
  [*Identic ca abordare teoretică* (explicarea regulilor de dependență funcțională tranzitivă și parțială)],
  
  [*SQL cu agregare și grupări*
   (SELECT cu GROUP BY, HAVING, JOIN)],
  [7 ori],
  [- 2026 Model Titularizare\ - 2025 Titularizare\ - 2025 Definitivat\ - 2024 Model Titularizare\ - 2023 Titularizare\ - 2017 Titularizare\ - 2026 Model Definitivat],
  [*Foarte mare* (structuri de interogare similare, diferă doar entitățile: festivaluri, radio, ciclism)],
  
  [*Arhitectura UCP (CPU)*
   (Componente ALU, UC, Regiștri, funcții)],
  [2 ori],
  [- 2013 Definitivat (Sub. I.2)\ - 2026 Model Definitivat (Sub. I.2)],
  [*Identic* (definirea componentelor interne și a fazelor ciclului de instrucțiuni)],
  
  [*Serviciul E-mail (Rețele)*
   (SMTP, POP3, IMAP, structură mesaje)],
  [2 ori],
  [- 2016 Titularizare (Sub. I.2)\ - 2026 Model Titularizare (Sub. I.2)],
  [*Identic* (comunicare asincronă, rolul protocoalelor, aplicații software specifice)]
)

#v(3mm)
= 4. Tabelul Recurențelor în Didactică și Evaluare (Subiectul III)

Didactica și Evaluarea reprezintă secțiunea unde cunoașterea frecvențelor oferă cel mai mare avantaj:

#table(
  columns: (1.8fr, 1fr, 1.8fr, 1fr),
  inset: 5pt,
  align: left + horizon,
  [*Subiect / Algoritm Repetat*], [*Frecvență*], [*Sesiuni Specifice de Examen*], [*Grad Asemănare*],
  
  [*Proiectul ca metodă de evaluare*
   (Evaluarea calității produsului și activității)],
  [3 ori],
  [- 2013 Titularizare (Sub. II.2)\ - 2016 Titularizare (Sub. III.2)\ - 2026 Titularizare (Sub. III.2)],
  [*Identic* (cerințe privind obiectivele, criteriile de evaluare a produsului și evaluarea activității echipei)],
  
  [*Portofoliul ca metodă de evaluare*
   (Structură, scop și criterii globale)],
  [3 ori],
  [- 2015 Titularizare (Sub. III.2)\ - 2025 Definitivat (Sub. III.2)\ - 2025 Titularizare (Sub. III.2)],
  [*Identic* (cerințe similare pentru baze de date sau editoare de texte)],
  
  [*Învățarea prin descoperire*
   (Metodă didactică activă)],
  [3 ori],
  [- 2013 Titularizare (Sub. I.3)\ - 2026 Definitivat (Sub. III.1)\ - 2026 Titularizare (Sub. III.1)],
  [*Identic* (caracteristici, tipuri și realizarea scenariului didactic detaliat)],
  
  [*Problematizarea*
   (Crearea de situații-problemă)],
  [2 ori],
  [- 2016 Titularizare (Sub. III.1)\ - 2025 Definitivat (Sub. III.1)],
  [*Identic* (etapele problematizării, activitatea profesorului și a elevilor pe algoritmi)]
)
