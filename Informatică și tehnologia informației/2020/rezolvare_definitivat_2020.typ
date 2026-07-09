#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2020*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Var 2020],
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
  #text(size: 12pt)[Anul 2020 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Varianta 3 (22 iulie 2020)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2020/Def_050_Informatica_P_2020_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2020/Def_050_Informatica_P_2020_bar_03_LRO.pdf)

*(Notă: Acest subiect este identic cu cel din Definitivat 2026 Model).*

== SUBIECTUL I (60 de puncte)

=== 1. Programare Orientată pe Obiecte (POO): Încapsulare
- *Încapsulare*: Principiul POO ce ascunde starea internă a unui obiect și restricționează accesul direct la membrii săi prin definirea de metode publice (getter/setter) de acces.
- *Clase și Obiecte*: Clasa reprezintă șablonul/tipul de date, iar obiectul este instanța fizică a clasei alocată în memorie.
- *Niveluri de acces*:
  1. `public`: Accesibil de oriunde din program.
  2. `private`: Accesibil doar din interiorul aceleiași clase.
  3. `protected`: Accesibil din clasă și din clasele derivate (moștenite).
- *Constructori/Destructori*: Metode speciale apelate la crearea, respectiv distrugerea automată a unui obiect.

- *Problemă (Gestiune cont bancar)*:
  - *C++*:
    ```cpp
    #include <iostream>
    #include <string>
    using namespace std;
    class ContBancar {
    private:
        string titular;
        double sold;
    public:
        ContBancar(string t, double s) : titular(t), sold(s) {}
        void depune(double suma) { if(suma > 0) sold += suma; }
        double getSold() { return sold; }
    };
    int main() {
        ContBancar cont("Daniel", 1000);
        cont.depune(500);
        cout << "Sold curent: " << cont.getSold() << endl;
        return 0;
    }
    ```

---

=== 2. Structura sistemelor de calcul: Dispozitive periferice
- *Integrare*: Perifericele permit introducerea de date (intrare) și redarea rezultatelor (ieșire), comunicând cu procesorul prin controlere speciale de I/O și întreruperi software/hardware.
- *Clasificare*:
  1. *Periferice de intrare*: Mouse, Tastatură (parametru: DPI pentru mouse, polling rate).
  2. *Periferice de ieșire*: Monitor, Imprimantă (parametru: rezoluție PPI/DPI, timp de răspuns).
  3. *Periferice de intrare/ieșire (I/O)*: Ecran tactil, placă de rețea.

---

=== 3. Programare: Încadrare cifre în baze de numerație
- *Descriere*: Cifra maximă a fiecărui număr determină baza minimă în care acesta poate fi scris (baza minimă = `cMax(n) + 1`). Programul citește șirul, determină cifra maximă pentru fiecare termen și actualizează contoarele pentru toate bazele superioare acelei cifre maxime.

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
using namespace std;

int cMax(long long n) {
    int mx = 0;
    long long temp = n;
    while (temp > 0) {
        int cif = temp % 10;
        if (cif > mx) mx = cif;
        temp /= 10;
    }
    return mx;
}

int main() {
    ifstream fin("def2020.in");
    long long x;
    int baze[11] = {0}; // contoare pentru baze de la 2 la 10
    
    while (fin >> x) {
        int mx = cMax(x);
        // Numărul poate fi scris în orice bază b > mx
        for (int b = mx + 1; b <= 10; ++b) {
            if (b >= 2) baze[b]++;
        }
    }
    fin.close();
    
    for (int b = 2; b <= 10; ++b) {
        cout << baze[b] << (b == 10 ? "" : " ");
    }
    cout << endl;
    
    return 0;
}
```

*Soluție Pascal:*
```pascal
program BazeNumerație;
var
  fin: text;
  x: int64;
  baze: array[2..10] of integer;
  b, mx, i: integer;

function cMax(n: int64): integer;
var mx, cif: integer;
begin
  mx := 0;
  while n > 0 do
  begin
    cif := n mod 10;
    if cif > mx then mx := cif;
    n := n div 10;
  end;
  cMax := mx;
end;

begin
  for b := 2 to 10 do baze[b] := 0;
  assign(fin, 'def2020.in');
  reset(fin);
  
  while not eof(fin) do
  begin
    read(fin, x);
    mx := cMax(x);
    for b := mx + 1 to 10 do
    begin
      if b >= 2 then
        baze[b] := baze[b] + 1;
    end;
  end;
  close(fin);
  
  for b := 2 to 10 do
  begin
    write(baze[b]);
    if b < 10 then write(' ');
  end;
  writeln;
end.
```

---

=== 4. Baze de date: Școală de dans
- *Entități*:
  - `CURSANT`: `id_cursant` (PK), `nume`, `prenume`, `data_nasterii`.
  - `STIL_DANS`: `id_stil` (PK), `nume_stil`, `categoria`, `descriere`.
  - `INSCRIERE`: `id_cursant` (FK), `id_stil` (FK), `an_inscriere`, PK este `(id_cursant, id_stil, an_inscriere)`.
- *SQL (Adăugare date)*:
  ```sql
  INSERT INTO STIL_DANS (nume_stil, categoria, descriere)
  VALUES ('tango argentinian', 'clasic', 'Dans inclus pe lista patrimoniului UNESCO');
  ```
