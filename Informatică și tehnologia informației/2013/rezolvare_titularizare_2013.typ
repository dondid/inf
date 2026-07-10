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

== SUBIECTUL I (45 de puncte)

=== 1. Activitate didactică pentru secvențele A și B

==== Secvența A: Algoritmul Roy-Floyd pentru drumuri minime
- *Formă de organizare*: activitate pe grupe mici, în laborator.
- *Justificare*: competențele cer descrierea și implementarea algoritmilor pentru grafuri. Lucrul pe grupe permite împărțirea sarcinilor: reprezentarea matricei costurilor, urmărirea pașilor algoritmului, implementarea și testarea pe exemple.
- *Activitate de învățare*: determinarea drumurilor minime între toate perechile de noduri folosind algoritmul Roy-Floyd.

*Scenariu didactic*:
- Profesorul prezintă un graf orientat ponderat cu 4 noduri și construiește matricea costurilor inițiale.
- Profesorul explică relația de recurență `d[i][j] = min(d[i][j], d[i][k] + d[k][j])`, subliniind rolul nodului intermediar `k`.
- Elevii completează pe grupe două iterații ale algoritmului și compară rezultatele.
- Elevii implementează algoritmul în C++/Pascal și verifică matricea finală pe exemplul discutat.

*Fragment C++*:
```cpp
for (int k = 1; k <= n; ++k)
  for (int i = 1; i <= n; ++i)
    for (int j = 1; j <= n; ++j)
      if (d[i][k] + d[k][j] < d[i][j])
        d[i][j] = d[i][k] + d[k][j];
```

==== Secvența B: Inserarea și formatarea tabelelor într-un document
- *Formă de organizare*: activitate individuală la calculator, urmată de verificare frontală.
- *Justificare*: competența TIC presupune deprinderi practice de utilizare avansată a editorului de texte. Fiecare elev trebuie să execute operațiile, nu doar să le descrie.
- *Activitate de învățare*: realizarea unui tabel de orar săptămânal cu antet, borduri, îmbinări de celule și aliniere.

*Scenariu didactic*:
- Profesorul demonstrează inserarea unui tabel `5 x 6`, modificarea lățimii coloanelor și aplicarea bordurilor.
- Elevii creează un tabel propriu, completează disciplinele, îmbină celulele pentru pauze și aplică formatare uniformă.
- Profesorul verifică produsele realizate și oferă feedback privind lizibilitatea, alinierea și coerența stilului.

=== 2. Integrarea unei platforme de e-learning pentru secvența A
1. *Momentul de actualizare a cunoștințelor*: profesorul poate folosi platforma pentru un quiz scurt despre reprezentarea grafurilor prin matrice de adiacență/costuri. Utilizarea este justificată deoarece oferă feedback imediat și permite identificarea rapidă a elevilor care au nevoie de sprijin.
2. *Momentul de fixare/evaluare formativă*: după implementarea algoritmului Roy-Floyd, elevii încarcă soluția sau completează un test cu pașii algoritmului. Platforma sprijină formarea competențelor prin exersare individuală, urmărirea progresului și acces la resurse suplimentare.

=== 3. Învățarea prin descoperire pentru secvența B
Metoda este potrivită deoarece elevii pot observa direct efectul comenzilor din editorul de texte. Profesorul nu oferă imediat toate procedurile, ci cere elevilor să descopere cum se inserează, se modifică și se formatează un tabel pornind de la o sarcină practică.

*Caracteristici*:
- elevul participă activ la construirea cunoștințelor, prin explorare și încercare;
- profesorul are rol de ghid, oferind indicii și feedback, nu doar explicații frontale.

Prin această metodă, elevii înțeleg mai bine relația dintre comenzi și rezultat: de exemplu, descoperă singuri diferența dintre îmbinarea celulelor, divizarea celulelor și schimbarea bordurilor.

== SUBIECTUL al II-lea (45 de puncte)

=== 1. Proiectare itemi didactici pentru secvențele C și D

#table(
  columns: (1.2fr, 2.4fr, 2.4fr),
  inset: 5pt,
  [*Tip item*], [*Secvența C: Subprograme*], [*Secvența D: Foi de calcul*],
  [Alegere duală], [*Enunț*: Variabilele declarate în corpul unui subprogram sunt globale și pot fi accesate direct din programul principal. (A/F)\ *Răspuns*: Fals.], [*Enunț*: O celulă dintr-o foaie de calcul poate conține număr, text sau formulă. (A/F)\ *Răspuns*: Adevărat.],
  [Întrebare structurată], [*Enunț*: Se consideră subprogramul `int f(int x) { return x*x; }`. 1. Precizați antetul subprogramului. 2. Indicați tipul valorii returnate. 3. Scrieți un apel pentru `x=5`.\ *Răspuns*: antetul este `int f(int x)`; tipul returnat este `int`; apel posibil: `f(5)`.], [*Enunț*: Într-o foaie de calcul, în `A1` este textul `Produs`, în `B1` valoarea `100`. 1. Precizați tipurile datelor. 2. Descrieți copierea lui `B1` în `C1`. 3. Indicați o formulă pentru dublarea valorii din `B1`.\ *Răspuns*: text/numeric; `Ctrl+C`, selectare `C1`, `Ctrl+V`; formula `=2*B1`.],
  [Eseu / rezolvare de problemă], [*Enunț*: Redactați un subprogram care primește un număr natural `n` și returnează suma cifrelor sale. Explicați rolul parametrului și al valorii returnate.\ *Răspuns*: subprogram corect cu parcurgerea cifrelor prin `%10` și `/10`, parametru de intrare `n`, rezultat returnat suma.], [*Enunț*: Realizați un tabel cu trei produse, preț și cantitate, calculați valoarea totală pe fiecare rând și totalul general.\ *Etape*: introducere date, formatare numerică, formule de tip `=B2*C2`, copiere formule, total cu `SUM`.]
)

=== 2. Evaluare prin Proiect
- *Temă*: Gestiunea datelor financiare ale unei mini-firme folosind foi de calcul tabelar.
- *Scop*: Evaluarea competențelor de introducere, formatare, sortare și prelucrare a datelor prin formule.
- *Cerințe*: tabel cu minimum 10 tranzacții, coloane pentru dată, tip operație, sumă, categorie; formule pentru total venituri, total cheltuieli și sold; sortare după dată; grafic pentru distribuția cheltuielilor.
- *Barem produs (50p)*: structură tabelară corectă 10p, formatare adecvată 10p, formule corecte 15p, sortare/filtrare 5p, grafic relevant 10p.
- *Barem activitate elev/elevi (40p)*: respectarea cerințelor 10p, autonomie în utilizarea aplicației 10p, colaborare și distribuirea sarcinilor 10p, prezentarea și argumentarea soluției 10p.
