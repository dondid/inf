#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2021*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Model & Var 2021],
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
  #text(size: 12pt)[Anul 2021 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Model 2021

== SUBIECTUL I (60 de puncte)

=== 1. Tablouri unidimensionale și vectori
- *Declarare*: Alocare statică `int V[100]` / `V: array[1..100] of integer` și alocare dinamică.
- *Elemente*: Relația dintre indici și deplasare în vector.
- *Problemă (Determinarea valorii minime)*:
  - *C++*:
    ```cpp
    #include <iostream>
    using namespace std;
    int main() {
        int n, V[100];
        cin >> n;
        for (int i = 0; i < n; ++i) cin >> V[i];
        int minim = V[0];
        for (int i = 1; i < n; ++i) if (V[i] < minim) minim = V[i];
        cout << minim << endl;
        return 0;
    }
    ```
  - *Pascal*:
    ```pascal
    program MinimVector;
    var
      n, i, minim: integer;
      V: array[1..100] of integer;
    begin
      read(n);
      for i := 1 to n do read(V[i]);
      minim := V[1];
      for i := 2 to n do if V[i] < minim then minim := V[i];
      writeln(minim);
    end.
    ```

---

=== 2. Structura de directoare și fișiere
- *Sistem de operare*: Gestionează fișierele prin intermediul tabelelor de alocare a fișierelor (ex. NTFS, ext4).
- *Directoare și căi*: Calea absolută (de la rădăcină) și calea relativă (față de directorul curent).
- *Operații*: Redenumire, ștergere, creare, copiere.

---

=== 3. Programare: Cifre pare și impare

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

int sumaCifre(long long n) {
    int s = 0;
    while (n > 0) {
        s += n % 10;
        n /= 10;
    }
    return s;
}

int main() {
    ifstream fin("def2021.in");
    long long x;
    int count_pare = 0, count_impare = 0;
    while (fin >> x) {
        int sc = sumaCifre(x);
        if (sc % 2 == 0) count_pare++;
        else count_impare++;
    }
    fin.close();
    
    ofstream fout("def2021.out");
    fout << count_pare << " " << count_impare << "\n";
    fout.close();
    
    return 0;
}
```

*Soluție Pascal:*
```pascal
program ParitateCifre;
var
  fin, fout: text;
  x: int64;
  count_pare, count_impare: integer;

function sumaCifre(n: int64): integer;
var s: integer;
begin
  s := 0;
  while n > 0 do
  begin
    s := s + (n mod 10);
    n := n div 10;
  end;
  sumaCifre := s;
end;

begin
  assign(fin, 'def2021.in');
  reset(fin);
  count_pare := 0;
  count_impare := 0;
  while not eof(fin) do
  begin
    read(fin, x);
    if sumaCifre(x) mod 2 = 0 then
      count_pare := count_pare + 1
    else
      count_impare := count_impare + 1;
  end;
  close(fin);
  
  assign(fout, 'def2021.out');
  rewrite(fout);
  writeln(fout, count_pare, ' ', count_impare);
  close(fout);
end.
```

---

=== 4. Baze de date: Zboruri companie
- *Entități*:
  - `CLIENT`: `id_client` (PK), `nume`, `prenume`, `adresa`.
  - `ZBOR`: `id_zbor` (PK), `aeroport_sursa`, `aeroport_destinatie`, `data_ora_plecare`.
  - `BILET`: `id_bilet` (PK), `id_client` (FK), `id_zbor` (FK), `mod_plata`.
- *SQL*:
  ```sql
  SELECT DISTINCT c.prenume, c.nume
  FROM CLIENT c
  JOIN BILET b ON c.id_client = b.id_client
  WHERE b.mod_plata = 'numerar';
  ```

---

= II. Rezolvare Definitivat Varianta 3 (14 iulie 2021)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2021/Def_050_Informatica_P_2021_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2021/Def_050_Informatica_P_2021_bar_03_LRO.pdf)

*(Notă: Acest subiect este identic cu cel din Definitivat 2022 Model).*

== SUBIECTUL I
=== 1. Bubble Sort
Vezi Definitivat 2022 (Secțiunea I.1).

=== 2. Organizarea logică a datelor
Vezi Definitivat 2022 (Secțiunea I.2).

=== 3. Programare: Cifre distincte
Codul C++ și Pascal de rezolvare a mulțimii cifrelor `{0,1,2}` (cu scriere în `def.out`).
*(Codul este identic cu cel din 2022, diferența fiind denumirea fișierului de ieșire: `def.out`).*

=== 4. Baze de date: Zboruri
Vezi Definitivat 2022 (Secțiunea I.4).
