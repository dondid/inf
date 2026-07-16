#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Titularizare / Definitivat*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Probă Practică 2026 - Varianta 1],
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
  #text(size: 12pt)[Anul 2026 - Informatică și Tehnologia Informației - Varianta 1]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= SUBIECTUL I (3 puncte) - Programare (C++ & Pascal)

== Teorie și Analiză Algoritmică

Problema cere citirea unui număr natural $n$ și a unui șir de $n$ numere întregi din fișierul `minim.in`, urmând să se afișeze valoarea minimă a acestora (sau a unei părți din șir) în fișierul `minim.out`.

=== Logica Rezolvării
- *Subpunctul a*: Programul citește valoarea $n$, iar apoi determină minimul global al celor $n$ elemente citite secvențial. Acest algoritm folosește o singură variabilă pentru stocarea valorilor intermediare, fiind optim din punct de vedere al memoriei.
- *Subpunctul b*: Se cere scrierea unui program care implementează subprogramul `afla_minim(n, v)` care determină minimul dintr-un tablou unidimensional $v$ cu $n$ elemente. În programul principal, se citesc cele $n$ numere într-un tablou, iar apoi se determină valoarea minimă din *prima jumătate* a acestora prin apelul subprogramului.

=== Analiza Conceptului de „Prima Jumătate”
Dacă numărul de elemente $n$ este impar, conceptul de „prima jumătate” poate avea două interpretări matematice/informatice:
1. *Împărțire întreagă*: $n / 2$ (sau `n div 2` în Pascal). De exemplu, pentru $n=5$, prima jumătate are $2$ elemente (pozițiile 1 și 2 sau index 0 și 1). Aceasta este abordarea standard în majoritatea algoritmilor de programare.
2. *Împărțire prin rotunjire superioară*: $(n+1)/2$ (sau `(n+1) div 2`). De exemplu, pentru $n=5$, prima jumătate are $3$ elemente (pozițiile 1, 2 și 3).
În implementările de mai jos am utilizat abordarea standard cu $n / 2$ (sau `n div 2`), incluzând o tratare specială pentru cazul în care $n=1$, unde prima jumătate va conține exact singurul element disponibil ($1$ element).

=== Complexitate
- *Timp*:
  - *Subpunctul a*: $O(n)$ - parcurgem șirul o singură dată.
  - *Subpunctul b*: $O(n)$ - citirea tabloului durează $O(n)$, iar căutarea minimului pe prima jumătate durează $O(n/2) = O(n)$ pași.
- *Spațiu*:
  - *Subpunctul a*: $O(1)$ - memorie suplimentară constantă.
  - *Subpunctul b*: $O(n)$ - pentru stocarea tabloului unidimensional în memorie.

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
    #include <algorithm>

    using namespace std;

    int main() {
        ifstream fin("minim.in");
        ofstream fout("minim.out");
        
        if (!fin) {
            cerr << "Eroare la deschiderea fisierului minim.in" << endl;
            return 1;
        }
        
        int n;
        if (!(fin >> n)) return 0;
        
        long long val_min;
        if (fin >> val_min) {
            for (int i = 1; i < n; ++i) {
                long long x;
                fin >> x;
                if (x < val_min) {
                    val_min = x;
                }
            }
            fout << val_min << "\n";
        }
        return 0;
    }
    ```
  ],
  [
    === Cod Pascal
    ```pascal
    program MinimA;

    var
      fin, fout: text;
      n, i: integer;
      x, val_min: int64;

    begin
      assign(fin, 'minim.in');
      reset(fin);
      assign(fout, 'minim.out');
      rewrite(fout);
      
      if eof(fin) then
      begin
        close(fin);
        close(fout);
        exit;
      end;
      
      read(fin, n);
      if not eof(fin) then
      begin
        read(fin, val_min);
        for i := 2 to n do
        begin
          read(fin, x);
          if x < val_min then
            val_min := x;
        end;
        writeln(fout, val_min);
      end;
      
      close(fin);
      close(fout);
    end.
    ```
  ]
)

---

== Subpunctul b: Program cu utilizarea subprogramelor cerute

#grid(
  columns: (1fr, 1fr),
  gutter: 10pt,
  [
    === Cod C++
    ```cpp
    #include <iostream>
    #include <fstream>
    #include <vector>

    using namespace std;

    // Subprogramul afla_minim
    long long afla_minim(int n, const long long v[]) {
        long long val_min = v[0];
        for (int i = 1; i < n; ++i) {
            if (v[i] < val_min) {
                val_min = v[i];
            }
        }
        return val_min;
    }

    int main() {
        ifstream fin("minim.in");
        ofstream fout("minim.out");
        
        if (!fin) {
            cerr << "Eroare la deschiderea fisierului minim.in" << endl;
            return 1;
        }
        
        int n;
        if (!(fin >> n)) return 0;
        
        long long v[100];
        for (int i = 0; i < n; ++i) {
            fin >> v[i];
        }
        
        int jumatate = n / 2;
        if (jumatate == 0) jumatate = 1;
        
        long long minim_jumatate = afla_minim(jumatate, v);
        fout << minim_jumatate << "\n";
        
        return 0;
    }
    ```
  ],
  [
    === Cod Pascal
    ```pascal
    program MinimB;

    type
      TTablou = array[1..100] of int64;

    var
      fin, fout: text;
      n, i, jumatate: integer;
      v: TTablou;

    // Subprogramul afla_minim
    function afla_minim(n: integer; var v: TTablou): int64;
    var
      i: integer;
      val_min: int64;
    begin
      val_min := v[1];
      for i := 2 to n do
      begin
        if v[i] < val_min then
          val_min := v[i];
      end;
      afla_minim := val_min;
    end;

    begin
      assign(fin, 'minim.in');
      reset(fin);
      assign(fout, 'minim.out');
      rewrite(fout);
      
      if eof(fin) then
      begin
        close(fin);
        close(fout);
        exit;
      end;
      
      read(fin, n);
      for i := 1 to n do
        read(fin, v[i]);
        
      jumatate := n div 2;
      if jumatate = 0 then
        jumatate := 1;
        
      writeln(fout, afla_minim(jumatate, v));
      
      close(fin);
      close(fout);
    end.
    ```
  ]
)

#pagebreak()

= SUBIECTUL II (2 puncte) - Baze de Date (SQL)

Pentru gestiunea stocului unui magazin alimentar, proiectăm tabela `Magazin` cu atributele cerute în enunț.

== Schema SQL de Creare a Tabelei

```sql
CREATE TABLE Magazin (
    idProdus INT PRIMARY KEY,
    Denumire VARCHAR(50) NOT NULL,
    Cantitate INT,
    Pret DECIMAL(5,2),
    Data_expir DATE
);
```
*Explicație*:
- `idProdus` reprezintă codul unic al produsului, cheie primară, tip `INT` (numeric 5 cifre).
- `Denumire` este numele produsului, tip text variabil de maxim 50 de caractere (`VARCHAR(50)`).
- `Cantitate` stochează stocul curent ca număr întreg (`INT`).
- `Pret` este definit ca `DECIMAL(5,2)` (reprezentare exactă cu maxim 5 cifre semnificative, dintre care 2 după zecimală, ex: `999.99`).
- `Data_expir` reține data de expirare a produsului, tip calendaristic `DATE`.

== Inserare Date (minim 4 înregistrări)

```sql
INSERT INTO Magazin (idProdus, Denumire, Cantitate, Pret, Data_expir) VALUES
(20001, 'Lapte Proaspat 1.5%', 20, 7.50, '2026-07-25'),
(20002, 'Ulei de Masline Extra Virgin', 15, 45.00, '2027-06-30'),
(20003, 'Ceaun de Fonta', 5, 120.00, '2030-01-01'),
(20004, 'Paine Integrala', 50, 4.20, '2026-07-18'),
(20005, 'Cafea Arabica Premium 500g', 12, 38.50, '2027-03-15');
```

== Interogare (Query) de Selecție

Cerința cere selectarea produselor cu prețul mai mare de 35, ordonate alfabetic după denumire.

```sql
SELECT idProdus, Denumire, Cantitate, Pret, Data_expir
FROM Magazin
WHERE Pret > 35.00
ORDER BY Denumire ASC;
```

=== Rezultatul Interogării pe Datele de Test:
| idProdus | Denumire | Cantitate | Pret | Data_expir |
| :--- | :--- | :---: | :---: | :---: |
| 20005 | Cafea Arabica Premium 500g | 12 | 38.50 | 2027-03-15 |
| 20003 | Ceaun de Fonta | 5 | 120.00 | 2030-01-01 |
| 20002 | Ulei de Masline Extra Virgin | 15 | 45.00 | 2027-06-30 |

---

= SUBIECTUL III (2 puncte) - Sistem de Operare (Căutare fișiere în File Explorer)

Pentru a efectua o căutare a fișierelor cu o anumită extensie în sistemul de operare Windows, se parcurg următorii pași:

1. Se deschide aplicația *File Explorer* (folosind comanda rapidă `Win + E`).
2. Se navighează în locația dorită pentru căutare (de exemplu, unitatea de disc local `C:` sau folderul de lucru al candidatului).
3. Se face clic pe caseta de căutare (*Search Box*) localizată în colțul din dreapta-sus al ferestrei.
4. Se introduce masca de căutare `*.docx`, unde caracterul steluță (`*`) reprezintă un wildcard ce înlocuiește orice șir de caractere din numele fișierului, iar `.docx` reprezintă extensia fișierelor Microsoft Word.
5. Se apasă tasta Enter sau se așteaptă indexarea rezultatelor. Rezultatele sunt afișate în panoul central al File Explorer.

Captura de ecran demonstrativă a căutării este salvată sub numele `ecran.jpg` în directorul indicat:

#align(center)[
  #image("rezolvare_2026/Subiectul_III/ecran.jpg", width: 85%)
  #text(size: 9pt, style: "italic")[Figura 1: Rezultatele căutării după masca \*.docx în File Explorer]
]

#pagebreak()

= SUBIECTUL IV (1 punct) - Tehnoredactare Text (Word)

Pentru crearea documentului `orar.docx` ce conține orarul clasei a IX-a, s-au parcurs următorii pași metodologici:

1. *Setarea paginii*: Din tab-ul *Layout* -> *Orientation* se selectează *Landscape*. Din *Margins* -> *Custom Margins* se setează toate marginile (sus, jos, stânga, dreapta) la `2 cm`. Formatul paginii este selectat ca *A4*.
2. *Inserarea tabelului*: Din meniul *Insert* -> *Table* se alege un caroiaj de `4 rânduri` și `7 coloane`.
3. *Structurarea datelor și Unirea Celulelor*:
   - Pe primul rând, prima celulă conține `"Ziua"`. Celulele de la a doua la a șaptea (coloanele 2-7) sunt selectate, se face clic dreapta și se alege *Merge Cells* (Unire celule). În această celulă unită se introduce textul `"Orarul clasei a IX a ...."`.
   - Pe rândul al doilea se trec textul `"ora"` în prima coloană și denumirile zilelor săptămânii în următoarele coloane: `"Luni"`, `"Marți"`, `"Miercuri"`, `"Joi"`, `"Vineri"`, `"Sâmbătă"`.
   - Pe rândurile 3 și 4 (corespunzătoare orelor 8-9 și 9-10) se completează disciplinele.
   - Pe ultima coloană (coloana 7, corespunzătoare zilei de Sâmbătă), celulele de pe rândurile 3 și 4 sunt unite pe verticală (*Merge Cells*), introducându-se textul `"excursii"`.
4. *Inserarea imaginilor în celule*:
   - În celula corespunzătoare zilei de *Joi*, intervalul *8-9* (rândul 3, coloana 5), se inserează imaginea `carte.jpg` (*Insert* -> *Pictures* -> *This Device...*), redimensionând-o la dimensiuni potrivite (de exemplu, înălțime/lățime de $~1.5$ cm).
   - În celula corespunzătoare zilei de *Vineri*, intervalul *9-10* (rândul 4, coloana 6), se inserează imaginea `natura.jpg` după aceeași metodă.
5. *Formatarea textului și tabelului*:
   - Întregul text din tabel este setat pe fontul *Arial*, dimensiune *11*.
   - Toate celulele sunt formatate să aibă textul centrat atât orizontal, cât și vertical (se selectează tabelul, clic dreapta -> *Table Properties* -> tab-ul *Cell* -> *Vertical alignment: Center*; de asemenea, din secțiunea *Paragraph* se alege centrare text).

Structura vizuală a tabelului tehnoredactat în Word este reprezentată mai jos:

#align(center)[
  #table(
    columns: (1.2fr, 1.5fr, 1.5fr, 1.5fr, 1.8fr, 1.8fr, 1.5fr),
    align: center + horizon,
    stroke: 0.5pt + luma(100),
    [Ziua], table.cell(colspan: 6)[*Orarul clasei a IX a ....*],
    [ora], [Luni], [Marți], [Miercuri], [Joi], [Vineri], [Sâmbătă],
    [8-9], [TIC], [Română], [Istorie], [#image("rezolvare_2026/Subiectul_IV/carte.jpg", width: 25pt)], [Matematică], table.cell(rowspan: 2)[excursii],
    [9-10], [Franceză], [Geografie], [Chimie], [Matematică], [#image("rezolvare_2026/Subiectul_IV/natura.jpg", width: 25pt)], []
  )
  #text(size: 9pt, style: "italic")[Figura 2: Structura tabelului orarului școlar cu celule îmbinate și elemente grafice]
]

---

= SUBIECTUL V (1 punct) - Utilizarea Serviciilor Internet (HTML & CSS)

Pentru realizarea paginii web `plumb.html` care prezintă opera lirică „Plumb” de George Bacovia, s-a scris următorul cod complet de structură și stilizare:

== Codul HTML al Paginii `plumb.html`

```html
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <title>Plumb - George Bacovia</title>
    <style>
        body {
            background-color: #f0f2f5; /* Fundal gri-albastru tematic */
            color: #2f3e46;            /* Text gri inchis pentru lizibilitate */
            font-family: Arial, sans-serif; /* Font Arial conform cerintei */
            text-align: center;        /* Centrare text */
            margin-top: 50px;
        }
        .container {
            display: inline-block;
            background: #ffffff;
            padding: 30px 50px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        h3 {
            text-decoration: underline; /* Titlu H3 subliniat */
            margin-bottom: 5px;
            font-size: 24px;
        }
        hr {
            width: 100px;
            border: 0;
            height: 1px;
            background-color: #52796f; /* Linie orizontala sub titlu */
            margin: 10px auto 25px auto;
        }
        p {
            line-height: 1.8;
            font-size: 16px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Plumb</h3>
        <hr>
        <p>
            Dormeau adânc sicriele de <strong>plumb</strong>,<br>
            Și <em>flori</em> de <strong>plumb</strong> și funerar vestmânt --<br>
            Stam singur în cavou... și era vânt...<br>
            Și scârțâiau coroanele de <strong>plumb</strong>.
        </p>
        <p>
            Dormea întors amorul meu de <strong>plumb</strong><br>
            Pe <em>flori</em> de <strong>plumb</strong>, și-am început să-l strig --<br>
            Stam singur lângă mort... și era frig...<br>
            Și-i atârnau aripile de <strong>plumb</strong>.
        </p>
    </div>
</body>
</html>
```

== Detalii privind Respectarea Cerințelor:
- *Titlul paginii*: S-a utilizat eticheta `<h3>` subliniată prin CSS (`text-decoration: underline`).
- *Element separator*: O linie orizontală (`<hr>`) a fost adăugată imediat sub titlu.
- *Formatare text*: Cuvântul *plumb* a fost boldat folosind eticheta `<strong>`, iar cuvântul *flori* a fost scris cursiv utilizând eticheta `<em>` (italic).
- *Aliniere și Font*: Întreaga pagină folosește proprietatea `text-align: center` și familia de fonturi `Arial`.
- *Fundal*: S-a ales o culoare de fundal discretă și profesională (`#f0f2f5`), în acord cu cromatica sumbră sugerată de tematica poeziei.
