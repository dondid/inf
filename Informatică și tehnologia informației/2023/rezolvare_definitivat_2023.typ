#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2023*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Model & Var 2023],
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
  #text(size: 12pt)[Anul 2023 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Model 2023

== SUBIECTUL I (60 de puncte)

=== 1. Algoritmul de sortare prin Inserție (Insertion Sort)
==== a) Descriere în limbaj natural și exemplificare pe 7 numere
- *Descriere*: Algoritmul pornește de la al doilea element al tabloului și îl consideră pe rând drept „cheie”. Elementul cheie este comparat cu elementele din stânga sa (deja sortate) și deplasat spre stânga până când își găsește poziția corectă (când se întâlnește un element mai mic sau egal cu el).
- *Exemplificare pentru tabloul:* `[35, 12, 45, 8, 20, 15, 30]` (N = 7)
  1. *Pasul 1* (cheie = 12): `12 < 35`, deplasăm 35. Tabloul devine: `[12, 35, 45, 8, 20, 15, 30]`.
  2. *Pasul 2* (cheie = 45): `45 > 35`, rămâne pe loc. Tabloul: `[12, 35, 45, 8, 20, 15, 30]`.
  3. *Pasul 3* (cheie = 8): `8 < 45`, `8 < 35`, `8 < 12`. Deplasăm toate elementele. Tabloul: `[8, 12, 35, 45, 20, 15, 30]`.
  4. *Pasul 4* (cheie = 20): `20 < 45`, `20 < 35`, `20 > 12`. Deplasăm 45 și 35. Tabloul: `[8, 12, 20, 35, 45, 15, 30]`.
  5. *Pasul 5* (cheie = 15): `15 < 45`, `15 < 35`, `15 < 20`, `15 > 12`. Deplasăm 45, 35, 20. Tabloul: `[8, 12, 15, 20, 35, 45, 30]`.
  6. *Pasul 6* (cheie = 30): `30 < 45`, `30 < 35`, `30 > 20`. Deplasăm 45 și 35. Tabloul final sortat: `[8, 12, 15, 20, 30, 35, 45]`.

==== b) Complexitatea algoritmului
- *Cazul cel mai nefavorabil (Worst case)*: Vectorul este sortat descrescător. Pentru fiecare element de la poziția $i$ facem $i$ comparații. Complexitatea este $O(N^2)$.
- *Cazul cel mai favorabil (Best case)*: Vectorul este deja sortat crescător. Facem o singură comparație pentru fiecare cheie. Complexitatea este $O(N)$.
- *Cazul mediu (Average case)*: Complexitatea timpului este tot de ordinul $O(N^2)$.

==== c) Problemă completă (Sortare prin inserție)
- *Enunț*: Să se ordoneze crescător elementele unui vector folosind sortarea prin inserție.
- *Cod C++*:
  ```cpp
  #include <iostream>
  using namespace std;
  void insertionSort(int A[], int n) {
      for (int i = 1; i < n; ++i) {
          int cheie = A[i];
          int j = i - 1;
          while (j >= 0 && A[j] > cheie) {
              A[j + 1] = A[j];
              j--;
          }
          A[j + 1] = cheie;
      }
  }
  int main() {
      int A[] = {35, 12, 45, 8, 20, 15, 30};
      insertionSort(A, 7);
      for (int x : A) cout << x << " ";
      return 0;
  }
  ```
- *Cod Pascal*:
  ```pascal
  program SortareInsertie;
  var
    A: array[1..7] of integer = (35, 12, 45, 8, 20, 15, 30);
    i, j, cheie: integer;
  begin
    for i := 2 to 7 do
    begin
      cheie := A[i];
      j := i - 1;
      while (j >= 1) and (A[j] > cheie) do
      begin
        A[j + 1] := A[j];
        j := j - 1;
      end;
      A[j + 1] := cheie;
    end;
    for i := 1 to 7 do write(A[i], ' ');
  end.
  ```

---

=== 2. Rețele: Aplicații colaborative
- *Aplicații colaborative*: Programe ce permit utilizatorilor aflați în locații diferite să lucreze în timp real la același document sau proiect (ex. Microsoft Teams, Google Docs).
- *Dispozitive periferice utilizate*: Cameră web, microfon, căști/boxe.
- *Beneficii*: Reducerea costurilor de deplasare, flexibilitatea programului de lucru.
- *Dezavantaje*: Dependența critică de conexiunea la internet, riscuri crescute privind securitatea datelor.

---

=== 3. Programare: Permutare circulară cifre

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

void circular(long long &n) {
    long long temp = n;
    long long p = 1;
    while (temp >= 10) {
        p *= 10;
        temp /= 10;
    }
    int last = n % 10;
    n = last * p + (n / 10);
}

int main() {
    ifstream fin("def2022.in");
    long long x;
    long long min_odd = -1;
    int count_min = 0;
    while (fin >> x) {
        circular(x);
        if (x % 2 != 0) {
            if (min_odd == -1 || x < min_odd) {
                min_odd = x;
                count_min = 1;
            } else if (x == min_odd) {
                count_min++;
            }
        }
    }
    fin.close();
    
    if (min_odd == -1) cout << "nu exista\n";
    else cout << min_odd << " " << count_min << "\n";
    
    return 0;
}
```

*Soluție Pascal:*
```pascal
program PermutareCifre;
var
  fin: text;
  x, min_odd: int64;
  count_min: integer;

procedure circular(var n: int64);
var
  temp, p: int64;
  last: integer;
begin
  temp := n;
  p := 1;
  while temp >= 10 do
  begin
    p := p * 10;
    temp := temp div 10;
  end;
  last := n mod 10;
  n := last * p + (n div 10);
end;

begin
  assign(fin, 'def2022.in');
  reset(fin);
  min_odd := -1;
  count_min := 0;
  while not eof(fin) do
  begin
    read(fin, x);
    circular(x);
    if x mod 2 <> 0 then
    begin
      if (min_odd = -1) or (x < min_odd) then
      begin
        min_odd := x;
        count_min := 1;
      end
      else if x = min_odd then
        count_min := count_min + 1;
    end;
  end;
  close(fin);
  
  if min_odd = -1 then writeln('nu exista')
  else writeln(min_odd, ' ', count_min);
end.
```

---

=== 4. Baze de date: Curse de cai
- *Entități*:
  - `CAL`: `id_cal` (PK), `nume`, `varsta`, `proprietar_contact`.
  - `CURSA`: `id_cursa` (PK), `tip_cursa`, `data_ora`.
  - `INSCRIERE`: `id_cal` (FK), `id_cursa` (FK), `loc_clasare` (NULL), PK este `(id_cal, id_cursa)`.
- *SQL*:
  ```sql
  DELETE FROM CAL
  WHERE id_cal NOT IN (
      SELECT DISTINCT i.id_cal
      FROM INSCRIERE i
      JOIN CURSA c ON i.id_cursa = c.id_cursa
      WHERE c.data_ora >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
  );
  ```

---

= II. Rezolvare Definitivat Varianta 3 (19 iulie 2023)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2023/Def_050_Informatica_P_2023_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2023/Def_050_Informatica_P_2023_bar_03_LRO.pdf)

*(Notă: Acest subiect este identic cu cel din Definitivat 2024 Model).*

== SUBIECTUL I
=== 1. Algoritmul Dijkstra
Vezi Definitivat 2024 (Secțiunea I.1).

=== 2. Formatarea paginii
Vezi Definitivat 2024 (Secțiunea I.2).

=== 3. Programare: Cifră de control
Codul C++ și Pascal este identic cu cel din modelul 2024 (Secțiunea I.3).

=== 4. Baze de date: Organizație de ciclism
Vezi Definitivat 2024 (Secțiunea I.4).

== SUBIECTUL al II-lea
=== 1. Didactică: Operații pe date
Demersul didactic dedicat predării unității centrale (soft/hard) sau operațiilor logice.

=== 2. Evaluare: Întrebări structurate
Vezi Definitivat 2024 (Secțiunea II.2).
