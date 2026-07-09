#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2022*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Model & Var 2022],
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
  #text(size: 12pt)[Anul 2022 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Model 2022

== SUBIECTUL I (60 de puncte)

=== 1. Algoritmul de sortare prin metoda Bulelor (Bubble Sort)
==== a) Descriere în limbaj natural și exemplificare pe 7 numere
- *Descriere*: Algoritmul parcurge tabloul în mod repetat și compară elementele adiacente. Dacă două elemente consecutive nu sunt în ordinea corectă (crescătoare), acestea sunt interschimbate. Parcurgerile se repetă până când nu mai are loc nicio interschimbare într-o trecere completă.
- *Exemplificare pentru tabloul:* `[25, 14, 30, 8, 12, 5, 20]` (N = 7)
  - *Trecerea 1*:
    - `25 > 14` -> swap -> `[14, 25, 30, 8, 12, 5, 20]`
    - `25 < 30` -> no swap
    - `30 > 8` -> swap -> `[14, 25, 8, 30, 12, 5, 20]`
    - `30 > 12` -> swap -> `[14, 25, 8, 12, 30, 5, 20]`
    - `30 > 5` -> swap -> `[14, 25, 8, 12, 5, 30, 20]`
    - `30 > 20` -> swap -> `[14, 25, 8, 12, 5, 20, 30]` (30 a ajuns pe poziția corectă).
  - *Trecerea 2*: Parcurgem până la penultimul element:
    - Interschimbările succesive aduc elementul 25 pe penultima poziție: `[14, 8, 12, 5, 20, 25, 30]`.
  - *Trecerile 3, 4, 5, 6* continuă în același mod până când vectorul devine complet sortat: `[5, 8, 12, 14, 20, 25, 30]`.

==== b) Complexitatea algoritmului
- *Cazul cel mai nefavorabil (Worst case)*: Vectorul este sortat descrescător. Se efectuează $O(N^2)$ comparații și interschimbări.
- *Cazul cel mai favorabil (Best case)*: Vectorul este deja sortat. Cu o optimizare ce folosește un fanion (flag) de verificare a interschimbărilor, algoritmul se oprește după prima trecere: $O(N)$.
- *Cazul mediu (Average case)*: Complexitatea timpului este de ordinul $O(N^2)$.

==== c) Problemă completă (Bubble Sort)
- *Cod C++*:
  ```cpp
  #include <iostream>
  using namespace std;
  void bubbleSort(int A[], int n) {
      bool sortat;
      do {
          sortat = true;
          for (int i = 0; i < n - 1; ++i) {
              if (A[i] > A[i + 1]) {
                  swap(A[i], A[i + 1]);
                  sortat = false;
              }
          }
      } while (!sortat);
  }
  int main() {
      int A[] = {25, 14, 30, 8, 12, 5, 20};
      bubbleSort(A, 7);
      for (int x : A) cout << x << " ";
      return 0;
  }
  ```

---

=== 2. Organizarea logică a datelor în cadrul unui sistem de operare
- *Structura sistemului de fișiere*:
  1. *Partiție*: O diviziune logică a unui hard disk fizic tratată de SO ca un volum independent.
  2. *Director*: O structură logică de tip container ce conține referințe către fișiere și alte directoare.
  3. *Fișier*: O colecție organizată de informații stocată pe un mediu extern.
- *Operații*:
  - *Formatare*: Pregătirea unei partiții pentru a fi folosită de SO prin crearea structurii sistemului de fișiere (ex. NTFS, FAT32).
  - *Copiere, Mutare, Redenumire, Ștergere* de directoare/fișiere.

---

=== 3. Programare: Cifre din mulțimea {0, 1, 2}
- *Descriere*: Subprogramul `cifDistMax` numără cifrele distincte și determină cifra maximă a lui `n`. Programul principal generează recursiv toate numerele formate exclusiv din cifrele `{0, 1, 2}`, le ordonează și utilizează căutarea binară pentru a determina cel mai mic număr din intervalul $[x, y]$.

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;

void cifDistMax(long long n, int &nrd, int &cma) {
    bool ap[10] = {false};
    nrd = 0; cma = 0;
    long long temp = n;
    if (temp == 0) { nrd = 1; cma = 0; return; }
    while (temp > 0) {
        int cif = temp % 10;
        if (!ap[cif]) { ap[cif] = true; nrd++; }
        if (cif > cma) cma = cif;
        temp /= 10;
    }
}

vector<long long> vals;
void genereaza() {
    vals.push_back(0);
    queue<long long> Q;
    Q.push(1); Q.push(2);
    while (!Q.empty()) {
        long long u = Q.front(); Q.pop();
        if (u > 1000000000LL) continue;
        vals.push_back(u);
        Q.push(u * 10 + 0);
        Q.push(u * 10 + 1);
        Q.push(u * 10 + 2);
    }
    sort(vals.begin(), vals.end());
}

int main() {
    genereaza();
    long long x, y;
    ifstream fin("def2022.in"); // în cazul în care datele vin din fișier
    // dar enunțul model spune: se citesc de la tastatură x și y, se scrie în def2022.out
    if (!(cin >> x >> y)) return 0;
    
    ofstream fout("def2022.out");
    auto it = lower_bound(vals.begin(), vals.end(), x);
    if (it != vals.end() && *it <= y) {
        fout << *it << "\n";
    } else {
        fout << "nu exista\n";
    }
    fout.close();
    return 0;
}
```

*Soluție Pascal:*
```pascal
program NumereTernare;
var
  x, y: int64;
  vals: array[1..60000] of int64;
  count, i, st, dr, mid, pos: integer;
  fout: text;

procedure gen(val: int64);
begin
  if val > 1000000000 then exit;
  count := count + 1;
  vals[count] := val;
  gen(val * 10 + 0);
  gen(val * 10 + 1);
  gen(val * 10 + 2);
end;

procedure QuickSort(l, r: integer);
var
  i, j: integer;
  pivot, tmp: int64;
begin
  i := l; j := r;
  pivot := vals[(l + r) div 2];
  repeat
    while vals[i] < pivot do i := i + 1;
    while vals[j] > pivot do j := j - 1;
    if i <= j then
    begin
      tmp := vals[i]; vals[i] := vals[j]; vals[j] := tmp;
      i := i + 1; j := j - 1;
    end;
  until i > j;
  if l < j then QuickSort(l, j);
  if i < r then QuickSort(i, r);
end;

begin
  readln(x, y);
  count := 1;
  vals[1] := 0;
  gen(1);
  gen(2);
  QuickSort(1, count);
  
  st := 1; dr := count; pos := -1;
  while st <= dr do
  begin
    mid := (st + dr) div 2;
    if vals[mid] >= x then
    begin
      pos := mid;
      dr := mid - 1;
    end
    else st := mid + 1;
  end;
  
  assign(fout, 'def2022.out');
  rewrite(fout);
  if (pos <> -1) and (vals[pos] <= y) then
    writeln(fout, vals[pos])
  else
    writeln(fout, 'nu exista');
  close(fout);
end.
```

---

=== 4. Baze de date: Companie Aviatică
- *Entități*:
  - `CLIENT`: `id_client` (PK), `nume`, `prenume`, `adresa`.
  - `ZBOR`: `id_zbor` (PK), `aeroport_sursa`, `aeroport_destinatie`, `data_ora_plecare`, `data_ora_sosire`.
  - `BILET`: `id_bilet` (PK), `id_client` (FK), `id_zbor` (FK), `mod_plata`, `data_achizitie`.
- *SQL*:
  ```sql
  SELECT DISTINCT c.prenume, c.nume
  FROM CLIENT c
  JOIN BILET b ON c.id_client = b.id_client
  WHERE b.mod_plata = 'numerar';
  ```

---

= II. Rezolvare Definitivat Varianta 3 (20 iulie 2022)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2022/Def_050_Informatica_P_2022_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2022/Def_050_Informatica_P_2022_bar_03_LRO.pdf)

*(Notă: Acest subiect este identic cu cel din Definitivat 2023 Model).*

== SUBIECTUL I
=== 1. Sortarea prin inserție
Vezi Definitivat 2023 (Secțiunea I.1).

=== 2. Aplicații colaborative
Vezi Definitivat 2023 (Secțiunea I.2).

=== 3. Programare: Permutare circulară cifre
Codul C++ și Pascal este identic cu cel din modelul 2023 (Secțiunea I.3).

=== 4. Baze de date: Curse de cai
Vezi Definitivat 2023 (Secțiunea I.4).
