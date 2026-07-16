#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Titularizare / Definitivat*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Probă Practică 2025 - Varianta 2],
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
  #text(size: 14pt, style: "italic")[Probă Practică - Concursul de Ocupare a Posturilor Didactice] \
  #text(size: 12pt)[Anul 2025 - Informatică și Tehnologia Informației - Varianta 2]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= SUBIECTUL I (3 puncte) - Programare (C++ & Pascal)

== Teorie și Analiză Algoritmică

Problema cere citirea unui număr natural $n$ și a unui șir de $n$ numere naturale, iar apoi afișarea în fișierul `divizori.out` a acelor numere care au un *număr impar de divizori*, ordonate *descrescător*.

=== Proprietatea Matematică Cheie
Un număr natural $x$ are un număr impar de divizori dacă și numai dacă este *pătrat perfect* ($x = k^2$, unde $k in bb(N)$).

*Demonstrație*:
Divizorii unui număr natural $x$ pot fi grupați în perechi de forma $(d, x/d)$, unde $d$ este un divizor al lui $x$. Deoarece $d$ și $x/d$ sunt distincte în majoritatea cazurilor, numărul total de divizori este de obicei par.
Singura situație în care o pereche conține elemente egale este atunci când:
$d = x/d <=> d^2 = x <=> d = sqrt(x)$
Dacă $x$ este pătrat perfect, radicalul său $sqrt(x)$ este un număr întreg și reprezintă un divizor care nu se poate asocia cu un alt divizor distinct (se asociază cu el însuși). Acest element "nepereche" determină ca numărul total de divizori să fie impar.

=== Complexitate
- *Timp*:
  - Pentru subpunctul *a*: Verificarea dacă un număr este pătrat perfect se face în $O(1)$ prin calculul radicalului și ridicarea la pătrat: `round(sqrt(x)) * round(sqrt(x)) == x`. Astfel, filtrarea numerelor durează $O(n)$. Sortarea celor $m$ numere filtrate ($m <= n$) durează $O(m log m)$ utilizând un algoritm eficient sau $O(m^2)$ utilizând Bubble Sort. Complexitatea totală de timp este extrem de mică și optimă pentru $n <= 100$.
  - Pentru subpunctul *b*: Funcția `nrdiv(x)` parcurge numerele până la $sqrt(x)$, având o complexitate de $O(sqrt(x))$ per număr. Cu $n$ numere de cel mult 4 cifre ($x <= 9999$, deci $sqrt(x) <= 100$), numărul maxim de operații în buclă este $100 * 100 = 10.000$, rulând instantaneu.
- *Spațiu*: $O(n)$ pentru stocarea elementelor filtrate în vederea sortării lor.

---

== Subpunctul a: Program complet fără subprograme specifice

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    === Cod C++
    ```cpp
    #include <iostream>
    #include <fstream>
    #include <vector>
    #include <cmath>
    #include <algorithm>

    using namespace std;

    bool este_patrat_perfect(int x) {
        if (x < 0) return false;
        int r = round(sqrt(x));
        return r * r == x;
    }

    int main() {
        ifstream fin("divizori.in");
        ofstream fout("divizori.out");
        
        int n;
        if (!(fin >> n)) return 0;
        
        vector<int> rez;
        for (int i = 0; i < n; ++i) {
            int x;
            fin >> x;
            if (este_patrat_perfect(x)) {
                rez.push_back(x);
            }
        }
        
        if (rez.empty()) {
            fout << "nu exista\n";
        } else {
            sort(rez.begin(), rez.end(), greater<int>());
            for (size_t i = 0; i < rez.size(); ++i) {
                fout << rez[i] << (i == rez.size() - 1 ? "" : " ");
            }
            fout << "\n";
        }
        return 0;
    }
    ```
  ],
  [
    === Cod Pascal
    ```pascal
    program DivizoriA;
    uses math;

    var
      fin, fout: text;
      n, i, x, count: integer;
      rez: array[1..100] of integer;
      temp, j: integer;

    function EstePatratPerfect(x: integer): boolean;
    var
      r: integer;
    begin
      if x < 0 then
        EstePatratPerfect := false
      else
      begin
        r := round(sqrt(x));
        EstePatratPerfect := (r * r = x);
      end;
    end;

    begin
      assign(fin, 'divizori.in'); reset(fin);
      assign(fout, 'divizori.out'); rewrite(fout);
      if eof(fin) then begin
        close(fin); close(fout); exit;
      end;
      read(fin, n);
      count := 0;
      for i := 1 to n do begin
        read(fin, x);
        if EstePatratPerfect(x) then begin
          count := count + 1;
          rez[count] := x;
        end;
      end;
      if count = 0 then
        write(fout, 'nu exista')
      else begin
        for i := 1 to count - 1 do
          for j := i + 1 to count do
            if rez[i] < rez[j] then begin
              temp := rez[i];
              rez[i] := rez[j];
              rez[j] := temp;
            end;
        for i := 1 to count do begin
          write(fout, rez[i]);
          if i < count then write(fout, ' ');
        end;
        writeln(fout);
      end;
      close(fin); close(fout);
    end.
    ```
  ]
)

---

== Subpunctul b: Program cu utilizarea subprogramelor cerute

Enunțul cere definirea a două subprograme:
1. `nrdiv(n)` - returnează numărul de divizori ai lui `n`.
2. `ordonare(n, v)` - ordonează descrescător elementele unui tablou `v` de lungime `n`.

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    === Cod C++
    ```cpp
    #include <iostream>
    #include <fstream>

    using namespace std;

    int nrdiv(int n) {
        int cnt = 0;
        for (int i = 1; i * i <= n; ++i) {
            if (n % i == 0) {
                cnt++;
                if (i * i != n) {
                    cnt++;
                }
            }
        }
        return cnt;
    }

    void ordonare(int n, int v[]) {
        for (int i = 0; i < n - 1; ++i) {
            for (int j = i + 1; j < n; ++j) {
                if (v[i] < v[j]) {
                    int aux = v[i];
                    v[i] = v[j];
                    v[j] = aux;
                }
            }
        }
    }

    int main() {
        ifstream fin("divizori.in");
        ofstream fout("divizori.out");
        
        int n;
        if (!(fin >> n)) return 0;
        
        int v[100];
        int count = 0;
        for (int i = 0; i < n; ++i) {
            int x;
            fin >> x;
            if (nrdiv(x) % 2 != 0) {
                v[count++] = x;
            }
        }
        
        if (count == 0) {
            fout << "nu exista\n";
        } else {
            ordonare(count, v);
            for (int i = 0; i < count; ++i) {
                fout << v[i] << (i == count - 1 ? "" : " ");
            }
            fout << "\n";
        }
        return 0;
    }
    ```
  ],
  [
    === Cod Pascal
    ```pascal
    program DivizoriB;

    type
      TTablou = array[1..100] of integer;

    var
      fin, fout: text;
      n, i, x, count: integer;
      v: TTablou;

    function nrdiv(n: integer): integer;
    var
      i, cnt: integer;
    begin
      cnt := 0;
      i := 1;
      while i * i <= n do begin
        if n mod i = 0 then begin
          cnt := cnt + 1;
          if i * i <> n then
            cnt := cnt + 1;
        end;
        i := i + 1;
      end;
      nrdiv := cnt;
    end;

    procedure ordonare(n: integer; var v: TTablou);
    var
      i, j, temp: integer;
    begin
      for i := 1 to n - 1 do
        for j := i + 1 to n do
          if v[i] < v[j] then begin
            temp := v[i];
            v[i] := v[j];
            v[j] := temp;
          end;
    end;

    begin
      assign(fin, 'divizori.in'); reset(fin);
      assign(fout, 'divizori.out'); rewrite(fout);
      if eof(fin) then begin
        close(fin); close(fout); exit;
      end;
      read(fin, n);
      count := 0;
      for i := 1 to n do begin
        read(fin, x);
        if nrdiv(x) mod 2 <> 0 then begin
          count := count + 1;
          v[count] := x;
        end;
      end;
      if count = 0 then
        write(fout, 'nu exista')
      else begin
        ordonare(count, v);
        for i := 1 to count do begin
          write(fout, v[i]);
          if i < count then write(fout, ' ');
        end;
        writeln(fout);
      end;
      close(fin); close(fout);
    end.
    ```
  ]
)

#pagebreak()

= SUBIECTUL II (2 puncte) - Baze de Date (SQL)

Pentru evidența candidaților la un concurs cu două probe (practică și teoretică), proiectăm tabela `Candidati` cu atributele cerute.

== Schema SQL de Creare a Tabelei

```sql
CREATE TABLE Candidati (
    CodCandidat INT PRIMARY KEY,
    NumePrenume VARCHAR(50) NOT NULL,
    CNP VARCHAR(13) NOT NULL UNIQUE,
    NotaPractica DECIMAL(4,2),
    NotaTeorie DECIMAL(4,2)
);
```
*Explicație*:
- `CodCandidat` este cheie primară de tip `INT` (numeric).
- `NumePrenume` este de tip text variabil de maxim 50 de caractere (`VARCHAR(50)`).
- `CNP` este text fix sau variabil de 13 caractere (`VARCHAR(13)`), unic și obligatoriu (`NOT NULL`).
- `NotaPractica` și `NotaTeorie` sunt definite ca `DECIMAL(4,2)` pentru a stoca note cu 2 zecimale (ex: `8.50`, `10.00`).

== Inserare Date (minim 5 înregistrări)

```sql
INSERT INTO Candidati (CodCandidat, NumePrenume, CNP, NotaPractica, NotaTeorie) VALUES
(10001, 'Popescu Ionel', '1950812123456', 8.50, 9.20),
(10002, 'Ionescu Maria', '2970514123456', 6.80, 8.00),
(10003, 'Vasilescu Radu', '1920320123456', 9.00, 7.50),
(10004, 'Georgescu Elena', '2941125123456', 7.10, 6.50),
(10005, 'Dumitru Vasile', '1890203123456', 9.50, 9.80);
```

== Interogare (Query) de Selecție

Cerința cere selectarea numelui și notelor obținute la cele două probe pentru candidații care au peste nota 7 la ambele probe, ordonați alfabetic după nume.

```sql
SELECT NumePrenume, NotaPractica, NotaTeorie
FROM Candidati
WHERE NotaPractica > 7.00 AND NotaTeorie > 7.00
ORDER BY NumePrenume ASC;
```

=== Rezultatul Interogării pe Datele de Test:
| NumePrenume | NotaPractica | NotaTeorie |
| :--- | :---: | :---: |
| Dumitru Vasile | 9.50 | 9.80 |
| Popescu Ionel | 8.50 | 9.20 |
| Vasilescu Radu | 9.00 | 7.50 |

---

= SUBIECTUL III (1 punct) - Sistem de Operare (Windows Defender Firewall)

Pentru a activa sau dezactiva Paravanul de Protecție (Windows Defender Firewall), se parcurg următorii pași în sistemul de operare Windows 10/11:

1. Se deschide meniul *Start* și se caută *Control Panel* (Panou de control), apoi se apasă Enter.
2. În fereastra Control Panel, se selectează categoria *System and Security* (Sistem și securitate).
3. Se face clic pe *Windows Defender Firewall*.
4. În meniul din partea stângă, se alege opțiunea *Turn Windows Defender Firewall on or off* (Activare sau dezactivare paravan de protecție Windows Defender).
5. În fereastra deschisă, pentru fiecare tip de rețea (Privată și Publică), se selectează butonul radio corespunzător:
   - *Turn on Windows Defender Firewall* (Activare)
   - *Turn off Windows Defender Firewall (not recommended)* (Dezactivare)
6. Se face clic pe butonul *OK* pentru a salva modificările.

Fereastra corespunzătoare configurării este ilustrată în captura de ecran de mai jos, salvată în fișierul `informații.jpg`:

#align(center)[
  #image("rezolvare_2025/Subiectul_III/informații.jpg", width: 85%)
  #text(size: 9pt, style: "italic")[Figura 1: Ecranul de activare/dezactivare Windows Defender Firewall]
]

#pagebreak()

= SUBIECTUL IV (2 puncte) - Calcul Tabelar (Excel)

Pentru realizarea cerințelor în aplicația Microsoft Excel, se parcurg pașii detaliați de mai jos. Fișierul rezultat este salvat sub numele `papetarie.xlsx` în folderul destinat rezolvării.

== Etapele de Rezolvare Pas cu Pas

1. *Crearea tabelului inițial (cerința a)*:
   - Pe rândul 1, în celulele `A1`, `B1`, `C1` se scriu capetele de tabel: `Produs`, `CodProdus`, `Pret`.
   - În rândurile 2-5 se completează datele produselor:
     - `A2:caietmat`, `B2:24`, `C2:2.5`
     - `A3:caietrom`, `B3:25`, `C3:2.2`
     - `A4:colia4`, `B4:125`, `C4:13`
     - `A5:dosarsina`, `B5:15`, `C5:0.5`
2. *Inserarea unui nou rând (cerința b)*:
   - Se face clic dreapta pe antetul rândului 1 și se alege *Insert* (Inserare). Datele se deplasează în jos cu un rând (antetul devine rândul 2, datele ocupă rândurile 3-6).
3. *Unirea celulelor și adăugarea titlului (cerința c)*:
   - Se selectează domeniul de celule `A1:D1`.
   - Din tab-ul *Home*, secțiunea *Alignment*, se apasă butonul *Merge & Center* (Combinare și centrare).
   - Se scrie textul `"Papetărie"`.
   - Se stabilește fontul la *Algerian*, dimensiunea *14*, stilul *Bold*.
4. *Inserarea coloanei Cantitate (cerința d)*:
   - Se selectează coloana `C` (Pret), se face clic dreapta și se alege *Insert*. Coloana `Pret` se deplasează la dreapta devinind coloana `D`. Noua coloană `C` goală se află acum imediat după `CodProdus`.
   - În celula `C2` (antetul noii coloane) se scrie textul `"Cantitate"`.
5. *Completarea coloanei Cantitate (cerința e)*:
   - Se introduc valori numerice la alegere în celulele `C3`, `C4`, `C5`, `C6` (de exemplu: `10`, `15`, `25`, `30`).
6. *Formatarea datelor (cerința f)*:
   - *Antet (f.a)*: Se selectează celulele `A2:E2`. Se setează fontul la *Arial*, stilul *Bold*, dimensiunea *13* și culoarea textului *Roșu*.
   - *Restul datelor (f.b)*: Se selectează celulele `A3:E6`. Se setează fontul la *Arial*, stilul *Regular*, dimensiunea *12* și culoarea textului *Albastru*.
7. *Ascunderea rândului 4 (cerința g)*:
   - Se face clic dreapta pe antetul rândului 4 (care conține acum produsul `caietrom`) și se selectează opțiunea *Hide* (Ascundere).
8. *Stabilirea înălțimii ultimului rând (cerința h)*:
   - Se face clic dreapta pe antetul rândului 6 (care conține produsul `dosarsina`), se alege *Row Height...* (Înălțime rând) și se introduce valoarea `25`.
9. *Stabilirea lățimii coloanei E (cerința i)*:
   - Se face clic dreapta pe antetul coloanei `E`, se selectează *Column Width...* (Lățime coloană) și se introduce valoarea `15`.
10. *Redenumirea foii de calcul (cerința j)*:
    - Se face dublu-clic pe eticheta foii de calcul din partea de jos stângă (`Sheet1`), se șterge numele vechi și se scrie `"Papetărie"`, apoi se apasă Enter.

---

= SUBIECTUL V (1 punct) - Utilizarea Serviciilor Internet (Istoric Descărcări)

Pentru a vizualiza istoricul descărcărilor (Downloads) într-un browser web (de exemplu Google Chrome, Microsoft Edge sau Mozilla Firefox), se folosește una dintre următoarele metode:

1. *Metoda rapidă (Scurtătură tastatură)*: Se apasă combinația de taste `Ctrl + J` (în Windows/Linux) sau `Cmd + Option + L` (în macOS). Aceasta va deschide direct o pagină dedicată istoricului fișierelor descărcate.
2. *Metoda din meniul browserului*: 
   - Se face clic pe butonul de meniu din colțul dreapta-sus al ecranului (reprezentat prin trei puncte verticale în Chrome/Edge sau trei linii orizontale în Firefox).
   - Din lista derulantă, se selectează opțiunea *Downloads* (Descărcări).

Captura de ecran care ilustrează pagina cu istoricul descărcărilor este salvată sub numele `internet.jpg`:

#align(center)[
  #image("rezolvare_2025/Subiectul_V/internet.jpg", width: 85%)
  #text(size: 9pt, style: "italic")[Figura 2: Ecranul cu istoricul descărcărilor în browser]
]
