#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2014*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Var 2014],
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
  #text(size: 12pt)[Anul 2014 - Informatică]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Varianta 1 (14 iulie 2014)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2014/Def_MET_056_Informatica_P_2014_var_01_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2014/Def_MET_056_Informatica_P_2014_bar_01_LRO.pdf)

== SUBIECTUL I (30 de puncte)

=== 1. Grafuri Hamiltoniene
- *Definiții*:
  - *Ciclu hamiltonian*: Un ciclu elementar care conține toate nodurile grafului exact o singură dată.
  - *Graf hamiltonian*: Un graf care conține cel puțin un ciclu hamiltonian.
- *Teoremă de caracterizare*: Teorema lui Dirac: Dacă $G$ este un graf neorientat cu $n \ge 3$ noduri, în care gradul fiecărui nod $v$ satisface condiția $d(v) \ge n/2$, atunci $G$ este hamiltonian.
- *Problemă (Determinare ciclu hamiltonian)*:
  - *C++ (Backtracking)*:
    ```cpp
    #include <iostream>
    #include <vector>
    using namespace std;
    int n, m, x[20];
    bool viz[20], ad[20][20];
    void afisare() {
        for (int i = 1; i <= n; ++i) cout << x[i] << " ";
        cout << x[1] << "\n";
    }
    void backtrack(int k) {
        for (int val = 1; val <= n; ++val) {
            if (!viz[val] && ad[x[k-1]][val]) {
                x[k] = val;
                viz[val] = true;
                if (k == n) {
                    if (ad[val][x[1]]) afisare();
                } else backtrack(k + 1);
                viz[val] = false;
            }
        }
    }
    ```

---

=== 2. Structura sistemelor de calcul: Sistemul de operare
- *Definiție*: Un ansamblu de programe care controlează resursele hardware ale sistemului de calcul și oferă o interfață între utilizator și aplicații.
- *Funcții*:
  1. Gestiunea proceselor (alocarea procesorului).
  2. Gestiunea memoriei interne (RAM).
  3. Gestiunea sistemului de fișiere (stocarea pe medii externe).

---

=== 3. Programare: Secvență de elemente cu cifre egale (distinct = 1)

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;

int distinct(long long n) {
    bool ap[10] = {false};
    int count = 0;
    long long temp = n;
    if (temp == 0) return 1;
    while (temp > 0) {
        int cif = temp % 10;
        if (!ap[cif]) {
            ap[cif] = true;
            count++;
        }
        temp /= 10;
    }
    return count;
}

int main() {
    ifstream fin("DATE.TXT");
    long long x;
    int max_len = 0;
    int current_len = 0;
    while (fin >> x) {
        if (distinct(x) == 1) {
            current_len++;
        } else {
            if (current_len >= 2) {
                max_len = max(max_len, current_len);
            }
            current_len = 0;
        }
    }
    if (current_len >= 2) {
        max_len = max(max_len, current_len);
    }
    fin.close();
    
    if (max_len < 2) cout << "Nu exista\n";
    else cout << max_len << "\n";
    
    return 0;
}
```

*Soluție Pascal:*
```pascal
program SecventeEgale;
var
  fin: text;
  x: int64;
  max_len, curr_len: integer;
  
function distinct(n: int64): integer;
var
  ap: array[0..9] of boolean;
  count, i, cif: integer;
  temp: int64;
begin
  for i := 0 to 9 do ap[i] := false;
  count := 0;
  temp := n;
  if temp = 0 then
  begin
    distinct := 1;
    exit;
  end;
  while temp > 0 do
  begin
    cif := temp mod 10;
    if not ap[cif] then
    begin
      ap[cif] := true;
      count := count + 1;
    end;
    temp := temp div 10;
  end;
  distinct := count;
end;

begin
  assign(fin, 'DATE.TXT');
  reset(fin);
  max_len := 0;
  curr_len := 0;
  while not eof(fin) do
  begin
    read(fin, x);
    if distinct(x) = 1 then
      curr_len := curr_len + 1
    else
    begin
      if curr_len >= 2 then
      begin
        if curr_len > max_len then max_len := curr_len;
      end;
      curr_len := 0;
    end;
  end;
  if curr_len >= 2 then
  begin
    if curr_len > max_len then max_len := curr_len;
  end;
  close(fin);
  
  if max_len < 2 then writeln('Nu exista')
  else writeln(max_len);
end.
```
