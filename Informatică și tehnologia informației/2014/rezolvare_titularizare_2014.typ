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

== SUBIECTUL al II-lea (45 de puncte)

=== 1. Algoritm eficient: Cel mai mare număr de două cifre lipsă din fișier (O(N) timp, O(1) memorie)
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
