#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2025*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Model & Var 2025],
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
  #text(size: 14pt, style: "italic")[Examenul Național pentru Definitivare în Învățământ] \
  #text(size: 12pt)[Anul 2025 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Model 2025

== SUBIECTUL I (60 de puncte)

=== 1. Tablouri bidimensionale (Matrice)
==== a) Exemple de declarare
*1. Declarare cu inițializare cu date (alocare statică):*
- *C++*:
  ```cpp
  int A[3][3] = {
      {1, 2, 3},
      {4, 5, 6},
      {7, 8, 9}
  };
  ```
- *Pascal*:
  ```pascal
  const
    A: array[1..3, 1..3] of integer = (
      (1, 2, 3),
      (4, 5, 6),
      (7, 8, 9)
    );
  ```

*2. Declarare cu alocare dinamică de memorie:*
- *C++*:
  ```cpp
  int** A = new int*[linii];
  for(int i = 0; i < linii; ++i) {
      A[i] = new int[coloane];
  }
  ```
- *Pascal*:
  ```pascal
  type
    TLinie = array[1..100] of integer;
    PMatrice = ^array[1..100] of ^TLinie;
  ```

==== b) Accesul la elemente și relațiile pe diagonale
Fie o matrice pătratică `A` cu indicii de linie `i` și coloană `j` (1-indexed de la $1$ la $n$):
- *Accesul*: `A[i][j]` (C++) sau `A[i, j]` (Pascal).
- *Diagonala Principală*: $i = j$.
  - Deasupra (dreapta): $i < j$.
  - Dedesubt (stânga): $i > j$.
- *Diagonala Secundară*: $i + j = n + 1$.
  - Deasupra (stânga): $i + j < n + 1$.
  - Dedesubt (dreapta): $i + j > n + 1$.

==== c) Problemă completă (Suma elementelor de sub diagonala principală)
- *Enunț*: Să se calculeze suma elementelor situate strict dedesubtul diagonalei principale a unei matrice pătratice de dimensiune $n$.
- *Cod C++*:
  ```cpp
  #include <iostream>
  using namespace std;
  int main() {
      int n, A[100][100], sum = 0;
      cin >> n;
      for (int i = 0; i < n; ++i)
          for (int j = 0; j < n; ++j) {
              cin >> A[i][j];
              if (i > j) sum += A[i][j];
          }
      cout << "Suma: " << sum << endl;
      return 0;
  }
  ```
- *Cod Pascal*:
  ```pascal
  program SumaMatrice;
  var
    n, i, j, sum: integer;
    A: array[1..100, 1..100] of integer;
  begin
    read(n);
    sum := 0;
    for i := 1 to n do
      for j := 1 to n do
      begin
        read(A[i, j]);
        if i > j then sum := sum + A[i, j];
      end;
    writeln('Suma: ', sum);
  end.
  ```

=== 2. Dispozitive de stocare amovibile/detașabile
- *Memorie internă vs externă*: Memoria internă (RAM, Cache) este rapidă, volatilă și direct accesibilă procesorului. Memoria externă (HDD, SSD, Stick USB) este nevolatilă, are capacitate mare și păstrează datele pe termen lung, comunicând cu procesorul prin intermediul controlerelor și magistralelor de date.
- *Parametri*:
  1. *Viteza de transfer (Read/Write Speed)*: Exprimată în MB/s sau GB/s. Determină rapiditatea accesului la date.
  2. *Capacitatea*: Volumul maxim de date stocat (GB/TB).
- *Dispozitive amovibile*:
  1. *Stick USB (Flash Drive)*: Stocare pe cipuri de memorie Flash (EEPROM). Conectare prin port USB. Avantaj: Portabilitate extremă.
  2. *SSD Extern*: Stocare pe cipuri NAND Flash. Conectare prin USB-C sau Thunderbolt. Avantaj: Viteze mari de transfer.

=== 3. Programare: Tonomat k-perechi
- *Descriere*: Subprogramul `codGen` calculează numărul de divizori ai lui `n` în $O(sqrt(n))$. Programul principal citește intervalul, sortează capetele crescător și parcurge elementele consecutiv, contorizând perechile care au numărul de divizori egal cu `k`.

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;

int codGen(int n) {
    int cnt = 0;
    for (int d = 1; d * d <= n; ++d) {
        if (n % d == 0) {
            cnt++;
            if (d * d < n) cnt++;
        }
    }
    return cnt;
}

int main() {
    ifstream fin("def2025.in");
    int k, x, y;
    if (!(fin >> k >> x >> y)) return 0;
    fin.close();

    int st = min(x, y);
    int dr = max(x, y);

    int count_pairs = 0;
    if (st < dr) {
        int prev_divs = codGen(st);
        for (int i = st; i < dr; ++i) {
            int curr_divs = codGen(i + 1);
            if (prev_divs == k && curr_divs == k) {
                count_pairs++;
            }
            prev_divs = curr_divs;
        }
    }

    cout << count_pairs << endl;
    return 0;
}
```

*Soluție Pascal:*
```pascal
program TonomatKPerechi;
uses math;

var
  fin: text;
  k, x, y, st, dr, i, prev_divs, curr_divs, count_pairs: integer;

function codGen(n: integer): integer;
var
  d, cnt: integer;
begin
  cnt := 0;
  d := 1;
  while d * d <= n do
  begin
    if n mod d = 0 then
    begin
      cnt := cnt + 1;
      if d * d < n then
        cnt := cnt + 1;
    end;
    d := d + 1;
  end;
  codGen := cnt;
end;

begin
  assign(fin, 'def2025.in');
  reset(fin);
  read(fin, k, x, y);
  close(fin);

  st := min(x, y);
  dr := max(x, y);
  count_pairs := 0;

  if st < dr then
  begin
    prev_divs := codGen(st);
    for i := st to dr - 1 do
    begin
      curr_divs := codGen(i + 1);
      if (prev_divs = k) and (curr_divs = k) then
        count_pairs := count_pairs + 1;
      prev_divs := curr_divs;
    end;
  end;

  writeln(count_pairs);
end.
```

=== 4. Baze de date: Emisiuni Radio
- *Entități*:
  - `PIESA`: `id_piesa` (PK), `titlu`, `compozitor`, `solist`, `gen_muzical`, `an_aparitie`, `durata`.
  - `EMISIUNE`: `id_emisiune` (PK), `denumire`, `frecventa`, `descriere`.
  - `DIFUZARE`: `id_difuzare` (PK), `id_piesa` (FK), `id_emisiune` (FK), `data_ora`.
- *SQL Afișare cronologică*:
  ```sql
  SELECT d.data_ora
  FROM DIFUZARE d
  JOIN PIESA p ON d.id_piesa = p.id_piesa
  WHERE p.titlu = 'Anotimpurile - Vara' 
    AND p.compozitor = 'Antonio Vivaldi'
    AND YEAR(d.data_ora) = YEAR(CURDATE())
  ORDER BY d.data_ora ASC;
  ```

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Proiectarea unei activități didactice: Asaltul de idei (Brainstorming)
- *Secvența A (Greedy)*: Profesorul scrie pe tablă o problemă de optimizare (ex: Nunta lui Zamfira sau Problema Rucsacului - varianta continuă). Elevii sunt încurajați să propună orice idei de selectare a elementelor (după profit, după greutate, după raport). Ideile sunt colectate fără critică inițială, urmând a fi analizate și structurate ulterior pentru a defini tehnica Greedy.

=== 2. Test practic (Greedy)
1. *Item 1*: Implementarea funcției de selecție a activităților în C++/Pascal. (30p)
2. *Item 2*: Argumentarea orală a corectitudinii algoritmului propus. (30p)
3. *Item 3*: Modificarea structurii de date pentru a obține o complexitate $O(N log N)$. (30p)

#pagebreak()

= II. Rezolvare Definitivat Varianta 2 (8 iulie 2025)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2025/Def_050_Informatica_P_2025_var_02_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2025/Def_050_Informatica_P_2025_bar_02_LRO.pdf)

*(Notă: Subiectul este identic din punct de vedere științific cu cel prezentat în modelul 2026).*

== SUBIECTUL I

=== 1. Structura de date: Listă simplu înlănțuită
Identic cu rezolvarea oferită pentru Definitivat 2026 (Secțiunea I.1). Prezintă parcurgerea, cele 4 operații specifice de inserare (la început, la sfârșit, înainte și după un nod intermediar) și crearea prin inserare ordonată.

=== 2. Securitate: Viruși și Antivirus
Identic cu rezolvarea de la Definitivat 2026 (Secțiunea I.2).

=== 3. Programare: Generare etichete sală spectacol
Codul C++ și Pascal este identic cu cel din modelul 2026 (Secțiunea I.3).

=== 4. Baze de date: Asociație Festivaluri
Proiectarea bazei de date în 3NF este identică cu cea prezentată la Definitivat 2026 (Secțiunea I.4).

== SUBIECTUL al II-lea

=== 1. Proiectarea unei activități didactice
Identic cu abordarea didactică propusă pentru Definitivat 2026 (Secțiunea II.1).

=== 2. Evaluare: Proba scrisă
Identic cu răspunsurile din Definitivat 2026 (Secțiunea II.2).
