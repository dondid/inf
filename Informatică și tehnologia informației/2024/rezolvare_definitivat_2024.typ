#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2024*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Model & Var 2024],
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
  #text(size: 12pt)[Anul 2024 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Model 2024

== SUBIECTUL I (60 de puncte)

=== 1. Algoritmul lui Dijkstra (Grafuri Ponderate)
==== a) Noțiuni preliminare:
- *Graf ponderat*: Un graf în care fiecărei muchii/arc i se asociază un număr real numit pondere sau cost.
- *Drum*: O succesiune de noduri în care fiecare două noduri consecutive sunt unite printr-o muchie/arc.
- *Cost al unui drum*: Suma ponderilor muchiilor/arcelor componente.

==== b) Descrierea algoritmului Dijkstra pe un graf cu 7 noduri
Fie graful orientat cu nodurile ${1, 2, 3, 4, 5, 6, 7}$ și nodul de start $1$.
Ponderile arcelor sunt:
$(1,2): 2$, $(1,3): 4$, $(2,3): 1$, $(2,4): 7$, $(3,5): 3$, $(4,6): 1$, $(5,4): 2$, $(5,7): 5$, $(6,7): 2$.

*Etapele algoritmului Dijkstra*:
1. Inițializăm vectorul de distanțe `d` cu $infinity$ pentru toate nodurile, cu excepția nodului de start $1$, pentru care `d[1] = 0`. Inițializăm o mulțime de noduri selectate $S = nothing$.
2. La fiecare pas $i$:
   - Alegem un nod $u$ neselectat cu `d[u]` minim.
   - Îl adăugăm în $S$.
   - Pentru fiecare vecin $v$ al lui $u$, relaxăm arcul $(u, v)$: `d[v] = min(d[v], d[u] + cost(u, v))`.
3. Repetăm pasul 2 de $N-1$ ori.

*Trace-ul algoritmului pentru graful ales:*
- *Inițial*: $d = (0, infinity, infinity, infinity, infinity, infinity, infinity)$
- *Pas 1*: Selectăm nodul $1$. Vecini: $2, 3$.
  - $d[2] = min(infinity, 0+2) = 2$
  - $d[3] = min(infinity, 0+4) = 4$
  - $d = (0, 2, 4, infinity, infinity, infinity, infinity)$
- *Pas 2*: Selectăm nodul $2$. Vecini: $3, 4$.
  - $d[3] = min(4, 2+1) = 3$
  - $d[4] = min(infinity, 2+7) = 9$
  - $d = (0, 2, 3, 9, infinity, infinity, infinity)$
- *Pas 3*: Selectăm nodul $3$. Vecin: $5$.
  - $d[5] = min(infinity, 3+3) = 6$
  - $d = (0, 2, 3, 9, 6, infinity, infinity)$
- *Pas 4*: Selectăm nodul $5$. Vecini: $4, 7$.
  - $d[4] = min(9, 6+2) = 8$
  - $d[7] = min(infinity, 6+5) = 11$
  - $d = (0, 2, 3, 8, 6, infinity, 11)$
- *Pas 5*: Selectăm nodul $4$. Vecin: $6$.
  - $d[6] = min(infinity, 8+1) = 9$
  - $d = (0, 2, 3, 8, 6, 9, 11)$
- *Pas 6*: Selectăm nodul $6$. Vecin: $7$.
  - $d[7] = min(11, 9+2) = 11$ (rămâne neschimbat)
  - $d = (0, 2, 3, 8, 6, 9, 11)$
- *Pas 7*: Selectăm nodul $7$. Distanțele finale sunt $d = (0, 2, 3, 8, 6, 9, 11)$.

==== c) Problemă completă (Dijkstra)
- *Enunț*: Să se determine drumul de cost minim de la nodul de start $1$ la toate celelalte noduri într-un graf ponderat cu $n$ noduri și $m$ arce.
- *Cod C++*:
  ```cpp
  #include <iostream>
  #include <vector>
  using namespace std;
  const int INF = 1000000000;
  int w[100][100], d[100];
  bool viz[100];
  int main() {
      int n, m, u, v, c;
      cin >> n >> m;
      for (int i = 1; i <= n; ++i) {
          d[i] = INF; viz[i] = false;
          for (int j = 1; j <= n; ++j) w[i][j] = INF;
      }
      for (int i = 0; i < m; ++i) {
          cin >> u >> v >> c; w[u][v] = c;
      }
      d[1] = 0;
      for (int pas = 1; pas <= n; ++pas) {
          int min_val = INF, u = -1;
          for (int i = 1; i <= n; ++i)
              if (!viz[i] && d[i] < min_val) { min_val = d[i]; u = i; }
          if (u == -1) break;
          viz[u] = true;
          for (int v = 1; v <= n; ++v)
              if (w[u][v] != INF && d[u] + w[u][v] < d[v]) d[v] = d[u] + w[u][v];
      }
      for (int i = 1; i <= n; ++i) cout << d[i] << " ";
      return 0;
  }
  ```

- *Cod Pascal*:
  ```pascal
  program Dijkstra;
  const INF = 1000000000;
  var
    n, m, u, v, c, i, j, pas, min_val, min_u: integer;
    w: array[1..100, 1..100] of integer;
    d: array[1..100] of integer;
    viz: array[1..100] of boolean;
  begin
    read(n, m);
    for i := 1 to n do
    begin
      d[i] := INF; viz[i] := false;
      for j := 1 to n do w[i, j] := INF;
    end;
    for i := 1 to m do
    begin
      read(u, v, c); w[u, v] := c;
    end;
    d[1] := 0;
    for pas := 1 to n do
    begin
      min_val := INF; min_u := -1;
      for i := 1 to n do
        if (not viz[i]) and (d[i] < min_val) then
        begin
          min_val := d[i]; min_u := i;
        end;
      if min_u = -1 then break;
      viz[min_u] := true;
      for v := 1 to n do
        if (w[min_u, v] <> INF) and (d[min_u] + w[min_u, v] < d[v]) then
          d[v] := d[min_u] + w[min_u, v];
    end;
    for i := 1 to n do write(d[i], ' ');
  end.
  ```

---

=== 2. Tehnologia Informației (TIC): Formatarea la nivel de pagină
- *Noțiuni preliminare*: Un document text este compus din secțiuni, pagini, paragrafe și caractere. Elemente de interfață într-un procesor de text: Rigla (ruler), bara de stare, meniul de configurare.
- *Personalizare pagină*:
  1. *Margini*: Ajustarea spațiului gol de pe margini (Top, Bottom, Left, Right, Gutter).
  2. *Orientare*: Portret (vertical) sau Peisaj (orizontal).
  3. *Dimensiune hârtie*: Ex. A4, Letter, A3.
  4. *Coloane*: Divizarea textului paginii pe mai multe coloane.
  5. *Antet și subsol (Header & Footer)*: Zona destinată titlurilor sau numerotării.
  6. *Fundal pagină*: Culori de fundal sau filigrane (watermarks).

---

=== 3. Programare: Cifră de control
- *Descriere*: Subprogramul `suma(n)` calculează suma cifrelor unui număr natural. Algoritmul din programul principal procesează elementele din fișierul `def2023.in`, le determină cifra de control în mod repetat și contorizează minimul obținut.

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

int suma(long long n) {
    int s = 0;
    while (n > 0) {
        s += n % 10;
        n /= 10;
    }
    return s;
}

int cifraControl(long long n) {
    if (n == 0) return 0;
    long long s = n;
    while (s >= 10) {
        s = suma(s);
    }
    return s;
}

int main() {
    ifstream fin("def2023.in");
    long long x;
    int min_cifra = 10;
    int count_min = 0;
    while (fin >> x) {
        int cc = cifraControl(x);
        if (cc < min_cifra) {
            min_cifra = cc;
            count_min = 1;
        } else if (cc == min_cifra) {
            count_min++;
        }
    }
    fin.close();
    cout << min_cifra << " " << count_min << endl;
    return 0;
}
```

*Soluție Pascal:*
```pascal
program CifraDeControl;
var
  fin: text;
  x: int64;
  min_cifra, count_min, cc: integer;

function suma(n: int64): integer;
var s: integer;
begin
  s := 0;
  while n > 0 do
  begin
    s := s + (n mod 10);
    n := n div 10;
  end;
  suma := s;
end;

function cifraControl(n: int64): integer;
var s: int64;
begin
  if n = 0 then cifraControl := 0
  else
  begin
    s := n;
    while s >= 10 do
      s := suma(s);
    cifraControl := s;
  end;
end;

begin
  assign(fin, 'def2023.in');
  reset(fin);
  min_cifra := 10;
  count_min := 0;
  while not eof(fin) do
  begin
    read(fin, x);
    cc := cifraControl(x);
    if cc < min_cifra then
    begin
      min_cifra := cc;
      count_min := 1;
    end
    else if cc = min_cifra then
      count_min := count_min + 1;
  end;
  close(fin);
  writeln(min_cifra, ' ', count_min);
end.
```

---

=== 4. Baze de date: Organizație de ciclism
- *Entități*:
  - `COMPETITIE`: `id_competitie` (PK), `denumire`, `oras_secretariat`, `telefon`, `email`, `site_web`.
  - `PROBA`: `id_proba` (PK), `id_competitie` (FK), `tip_proba`, `descriere_generala`, `descriere_particulara`, `data_desfasurare`, `categorie_participanti`.
- *SQL*:
  ```sql
  SELECT DISTINCT c.denumire
  FROM COMPETITIE c
  JOIN PROBA p ON c.id_competitie = p.id_competitie
  WHERE YEAR(p.data_desfasurare) = YEAR(CURDATE());
  ```

---

= II. Rezolvare Definitivat Varianta 2 (24 iulie 2024)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2024/Def_050_Informatica_P_2024_var_02_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2024/Def_050_Informatica_P_2024_bar_02_LRO.pdf)

*(Notă: Acest subiect este identic cu cel din Definitivat 2025 Model).*

== SUBIECTUL I
=== 1. Tablouri bidimensionale
Prezentarea detaliată a tabelelor bidimensionale, exemple de declarare și acces diagonale (vezi Definitivat 2025 - Secțiunea I.1).

=== 2. Dispozitive de stocare amovibile
Vezi Definitivat 2025 (Secțiunea I.2).

=== 3. Programare: Tonomat k-perechi
Codul C++ și Pascal de determinare a perechilor cu divizor count `k` în intervalul `[x, y]` citind din `def2024.in`.
*(Codul este identic cu cel din 2025, diferența fiind denumirea fișierului de intrare: `def2024.in`).*

=== 4. Baze de date: Emisiuni Radio
Vezi Definitivat 2025 (Secțiunea I.4).

== SUBIECTUL al II-lea
=== 1. Didactică: Asaltul de idei (Brainstorming)
Vezi Definitivat 2025 (Secțiunea II.1).

=== 2. Evaluare: Proiectare Test Greedy
Vezi Definitivat 2025 (Secțiunea II.2).
