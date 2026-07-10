#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Titularizare 2014*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Titularizare Var 2014],
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
  #text(size: 12pt)[Anul 2014 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Titularizare Varianta 3 (21 iulie 2014)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2014/tit_048_informatica_tehn_info_p_2014_var_03_lro.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2014/tit_048_informatica_tehn_info_p_2014_bar_03_lro.pdf)

== SUBIECTUL I (45 de puncte)

=== 1. Expunerea sistematică a cunoștințelor pentru secvențele A și B

==== Avantaje și limite
*Pentru secvența A - algoritmul lui Dijkstra*:
- *Avantaje*: permite prezentarea riguroasă a noțiunilor de graf ponderat, cost și drum minim; structurează logic pașii algoritmului; ajută elevii să urmărească demonstrația pe un exemplu numeric.
- *Limite*: poate reduce participarea elevilor dacă rămâne doar discursivă; nu garantează formarea deprinderii de implementare fără exercițiu practic.

*Pentru secvența B - diagrame și grafice în foi de calcul*:
- *Avantaje*: oferă o imagine clară a pașilor de creare a graficului; permite introducerea vocabularului corect: serie de date, axă, legendă, tip de diagramă; asigură economie de timp pentru prezentarea funcțiilor aplicației.
- *Limite*: elevii pot memora mecanic pașii fără să înțeleagă alegerea tipului de grafic; deprinderile TIC se formează insuficient dacă nu urmează activitate practică.

==== Activitate pentru secvența A
- *Activitate de învățare*: urmărirea algoritmului lui Dijkstra pe un graf cu 5 noduri.

*Scenariu*:
- Profesorul definește graful ponderat, costul unui drum și ideea de distanță minimă provizorie.
- Profesorul construiește pe tablă un tabel cu noduri, distanțe și noduri selectate.
- Elevii completează pas cu pas relaxările muchiilor după alegerea nodului cu distanță minimă.
- Profesorul fixează concluzia: algoritmul este corect pentru costuri nenegative și selectează treptat noduri cu distanță definitivă.

==== Activitate pentru secvența B
- *Activitate de învățare*: realizarea unei diagrame pe baza notelor obținute la un test.

*Scenariu*:
- Profesorul prezintă un tabel cu numele elevilor și punctajele obținute.
- Profesorul explică alegerea unei diagrame de tip coloană pentru compararea valorilor.
- Elevii selectează datele, inserează graficul, modifică titlul, legenda și etichetele axelor.
- Profesorul discută impactul social și moral al reprezentării datelor: graficul trebuie să fie corect, lizibil și să nu distorsioneze informația.

=== 2. Probleme practice interdisciplinare pentru secvența A
1. *Geografie și informatică*: Se dă harta rutieră a unor orașe, fiecare drum având lungimea exprimată în kilometri. Să se determine ruta minimă de la orașul de pornire la toate celelalte orașe folosind algoritmul lui Dijkstra. *Mijloace*: hartă/fișă cu graful rutier, calculator cu mediu de programare.
2. *Economie și informatică*: O firmă trimite colete între depozite, iar costurile de transport sunt date pe muchiile unui graf. Să se determine costul minim de livrare de la depozitul central. *Mijloace*: tabel de costuri, aplicație de calcul tabelar sau mediu de programare.

=== 3. Relația Competențe specifice - Valori și atitudini pentru secvența B
Orientarea elevilor spre conștientizarea impactului social, economic și moral al utilizării calculatorului este importantă deoarece graficele pot influența decizii și opinii. Un grafic realizat incorect poate manipula percepția datelor: axe trunchiate, titluri ambigue, alegerea nepotrivită a tipului de diagramă.

Competența de realizare a graficelor nu se limitează la executarea comenzilor tehnice. Ea trebuie corelată cu valori precum responsabilitatea, corectitudinea și respectarea adevărului datelor. Elevul competent alege tipul de diagramă potrivit, verifică sursa datelor și prezintă informația într-o formă clară și onestă.

== SUBIECTUL al II-lea (45 de puncte)

=== 1. Algoritm eficient: Cel mai mare număr de două cifre lipsă din fișier (O(N) timp, O(1) memorie)
- *Barem analitic propus pentru problemă (25p)*: operații cu fișierul 3p; citirea tuturor valorilor 3p; marcarea apariției numerelor de două cifre 6p; determinarea maximului lipsă 6p; afișare corectă 2p; declarări și corectitudine globală 3p; eficiență timp/memorie 2p.
- *Descriere*: Folosim un vector de apariții (frecvență) de dimensiune 100, inițializat cu `false`. Parcurgem șirul din fișier o singură dată. Dacă numărul citit $x \in [10, 99]$, marcăm `ap[x] = true`. La final, parcurgem indicii tabloului `ap` în ordine descrescătoare de la 99 la 10 și primul index pentru care `ap[i] == false` reprezintă rezultatul căutat.

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

int main() {
    ifstream fin("test.txt");
    int x;
    bool ap[100] = {false};
    while (fin >> x) {
        if (x >= 10 && x <= 99) {
            ap[x] = true;
        }
    }
    fin.close();

    for (int i = 99; i >= 10; --i) {
        if (!ap[i]) {
            cout << i << endl;
            break;
        }
    }
    return 0;
}
```

*Soluție Pascal:*
```pascal
program CelMaiMareLipsa;
var
  fin: text;
  x, i: integer;
  ap: array[10..99] of boolean;
begin
  for i := 10 to 99 do ap[i] := false;
  assign(fin, 'test.txt');
  reset(fin);
  while not eof(fin) do
  begin
    read(fin, x);
    if (x >= 10) and (x <= 99) then
      ap[x] := true;
  end;
  close(fin);

  for i := 99 downto 10 do
  begin
    if not ap[i] then
    begin
      writeln(i);
      break;
    end;
  end;
end.
```

*Justificarea eficienței*: Se citește fișierul o singură dată, deci timpul este $O(n)$, unde `n` este numărul valorilor din fișier. Memoria este $O(1)$, deoarece tabloul de apariții are dimensiune fixă, independentă de numărul de valori citite.

=== 2. Itemi de tip întrebare structurată pentru secvența D

*Caracteristici*:
- conține mai multe cerințe legate printr-un context comun;
- permite evaluarea gradată a cunoștințelor și deprinderilor;
- combină întrebări de identificare, explicare și aplicare.

*Reguli de proiectare*:
- contextul trebuie să fie clar și suficient pentru rezolvare;
- cerințele trebuie ordonate de la simplu la complex;
- fiecare cerință trebuie să aibă răspuns evaluabil obiectiv.

*Justificare*: Pentru conținuturile despre antet, subsol, stiluri, paginare și note de subsol, întrebarea structurată este potrivită deoarece elevul poate demonstra atât cunoașterea termenilor, cât și succesiunea operațiilor într-un procesor de text.

==== Item 1
*Enunț*: Într-un document de 5 pagini trebuie introdus numele autorului în antet și numărul paginii în subsol.
1. Precizați rolul antetului.
2. Precizați rolul subsolului.
3. Descrieți etapele introducerii numărului de pagină.

*Răspuns așteptat*:
1. Antetul este zona superioară repetată pe pagini, folosită pentru informații precum titlu sau autor.
2. Subsolul este zona inferioară repetată pe pagini, folosită frecvent pentru numărul paginii.
3. Inserare subsol / număr pagină, alegerea poziției și formatului, confirmarea aplicării în document.

==== Item 2
*Enunț*: Un elev redactează un referat și trebuie să aplice un stil pentru titluri și să introducă o notă de subsol pentru explicarea unui termen.
1. Precizați avantajul utilizării stilurilor.
2. Descrieți aplicarea unui stil de titlu.
3. Descrieți introducerea unei note de subsol.

*Răspuns așteptat*:
1. Stilurile asigură formatare unitară și permit modificarea rapidă a aspectului documentului.
2. Se selectează titlul și se alege un stil predefinit, de exemplu `Heading 1` / `Titlu 1`.
3. Se plasează cursorul după termen, se alege comanda de inserare notă de subsol și se redactează explicația în zona creată automat.
