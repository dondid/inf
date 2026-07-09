#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2013*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Var 2013],
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
  #text(size: 12pt)[Anul 2013 - Informatică]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Varianta 3 (18 iulie 2013)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2013/Def_MET_056_Informatica_P_2013_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2013/Def_MET_056_Informatica_P_2013_bar_03_LRO.pdf)

== SUBIECTUL I (30 de puncte)

=== 1. Metoda Greedy
- *Principiu*: Metoda Greedy rezolvă probleme de optimizare în care soluția se construiește pas cu pas. La fiecare pas, se alege elementul cel mai optim local (care pare cel mai bun în acel moment), sperând că această succesiune de alegeri locale va conduce la un optim global. Nu se revine niciodată la alegerile deja făcute.
- *Oportunitate*: O problemă are proprietatea de alegere Greedy dacă un optim global poate fi obținut prin alegeri locale optime.
- *Problemă (Problema Rucsacului - varianta fracționară)*:
  - *C++*:
    ```cpp
    #include <iostream>
    #include <vector>
    #include <algorithm>
    using namespace std;
    struct Obiect {
        double greutate, valoare, raport;
    };
    bool cmp(Obiect a, Obiect b) { return a.raport > b.raport; }
    double greedyKnapsack(vector<Obiect> &obiecte, double capacitate) {
        sort(obiecte.begin(), obiecte.end(), cmp);
        double valoare_totala = 0.0;
        for (auto &obj : obiecte) {
            if (capacitate >= obj.greutate) {
                capacitate -= obj.greutate;
                valoare_totala += obj.valoare;
            } else {
                valoare_totala += capacitate * obj.raport;
                break;
            }
        }
        return valoare_totala;
    }
    ```

---

=== 2. Structura sistemelor de calcul: Unitatea Centrală de Procesare (UCP)
- *Componente*: Unitatea Aritmetico-Logică (UAL), Unitatea de Control (UC), Regiștrii de memorie interni.
- *Funcții*:
  1. *Faza de decodificare*: Identificarea instrucțiunii ce urmează a fi executată.
  2. *Faza de execuție*: Efectuarea operațiilor aritmetice sau logice corespunzătoare.
  3. Gestiunea fluxului de date între memoria principală (RAM) și dispozitivele periferice.

---

=== 3. Programare: Perechi de numere prietene (amicabile)

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

void sumap(long long n, long long &s) {
    s = 1;
    for (long long d = 2; d * d <= n; ++d) {
        if (n % d == 0) {
            s += d;
            if (d * d != n) {
                s += n / d;
            }
        }
    }
}

int main() {
    int n;
    if (!(cin >> n)) return 0;
    
    ofstream fout("DATE.TXT");
    int count = 0;
    long long x = 2;
    while (count < n) {
        long long y;
        sumap(x, y);
        if (y > x) {
            long long x2;
            sumap(y, x2);
            if (x2 == x) {
                fout << x << " " << y << "\n";
                count++;
            }
        }
        x++;
    }
    fout.close();
    return 0;
}
```

*Soluție Pascal:*
```pascal
program NumerePrietene;
var
  n, count: integer;
  x, y, x2: int64;
  fout: text;

procedure sumap(n_val: int64; var s: int64);
var
  d: int64;
begin
  s := 1;
  d := 2;
  while d * d <= n_val do
  begin
    if n_val mod d = 0 then
    begin
      s := s + d;
      if d * d <> n_val then
        s := s + (n_val div d);
    end;
    d := d + 1;
  end;
end;

begin
  readln(n);
  assign(fout, 'DATE.TXT');
  rewrite(fout);
  count := 0;
  x := 2;
  while count < n do
  begin
    sumap(x, y);
    if y > x then
    begin
      sumap(y, x2);
      if x2 = x then
      begin
        writeln(fout, x, ' ', y);
        count := count + 1;
      end;
    end;
    x := x + 1;
  end;
  close(fout);
end.
```
