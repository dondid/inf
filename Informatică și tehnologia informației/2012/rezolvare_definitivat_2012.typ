#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2012*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Var 2012],
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
  #text(size: 14pt, style: "italic")[Examenul Național de Definitivare în Învățământ] \
  #text(size: 12pt)[Anul 2012 - Informatică]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Varianta 3 (17 iulie 2012)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2012/Def_MET_047_Informatica_P_2012_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2012/Def_MET_047_Informatica_P_2012_bar_03_LRO.pdf)

== SUBIECTUL I (30 de puncte)

=== 1. Metoda Backtracking
- *Descriere*: O tehnică generală de programare folosită pentru determinarea tuturor soluțiilor unei probleme care îndeplinesc anumite condiții specifice. Soluția se generează sub forma unui vector $X = (x_1, x_2, ..., x_n)$. La fiecare pas se adaugă un nou element în vector și se validează condițiile de consistență internă. Dacă pasul nu este valid, se face `backtrack` la nivelul anterior.
- *Problemă (Generare permutări)*:
  ```cpp
  #include <iostream>
  using namespace std;
  int n, x[20];
  bool viz[20];
  void afisare() {
      for (int i = 1; i <= n; ++i) cout << x[i] << " ";
      cout << "\n";
  }
  void backtrack(int k) {
      if (k > n) { afisare(); return; }
      for (int val = 1; val <= n; ++val) {
          if (!viz[val]) {
              x[k] = val;
              viz[val] = true;
              backtrack(k + 1);
              viz[val] = false;
          }
      }
  }
  ```

---

=== 2. Structura sistemelor de calcul: Dispozitive periferice
- *Definiție*: Echipamente hardware externe conectate la unitatea centrală de procesare pentru introducerea datelor în memorie sau extragerea rezultatelor prelucrării.
- *Exemple*: Tastatura (dispozitiv de intrare), Monitorul (dispozitiv de ieșire).

---

=== 3. Programare: Cifre de control lipsă din fișier

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

int control(long long n) {
    if (n == 0) return 0;
    long long s = n;
    while (s >= 10) {
        long long temp = s;
        long long sum = 0;
        while (temp > 0) {
            sum += temp % 10;
            temp /= 10;
        }
        s = sum;
    }
    return s;
}

int main() {
    ifstream fin("DATE.TXT");
    long long x;
    bool ap[10] = {false};
    while (fin >> x) {
        ap[control(x)] = true;
    }
    fin.close();
    
    bool found = false;
    for (int i = 0; i <= 9; ++i) {
        if (!ap[i]) {
            cout << i << " ";
            found = true;
        }
    }
    if (!found) cout << "Nu exista";
    cout << "\n";
    return 0;
}
```

*Soluție Pascal:*
```pascal
program CifreControlLipsa;
var
  fin: text;
  x: int64;
  ap: array[0..9] of boolean;
  i: integer;
  found: boolean;

function control(n: int64): integer;
var
  s, temp, sum: int64;
begin
  if n = 0 then
  begin
    control := 0;
    exit;
  end;
  s := n;
  while s >= 10 do
  begin
    temp := s;
    sum := 0;
    while temp > 0 do
    begin
      sum := sum + (temp mod 10);
      temp := temp div 10;
    end;
    s := sum;
  end;
  control := s;
end;

begin
  for i := 0 to 9 do ap[i] := false;
  assign(fin, 'DATE.TXT');
  reset(fin);
  while not eof(fin) do
  begin
    read(fin, x);
    ap[control(x)] := true;
  end;
  close(fin);
  
  found := false;
  for i := 0 to 9 do
  begin
    if not ap[i] then
    begin
      write(i, ' ');
      found := true;
    end;
  end;
  if not found then
    write('Nu exista');
  writeln;
end.
```
