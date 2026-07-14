#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2018*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Var 2018],
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
  #text(size: 12pt)[Anul 2018 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Varianta 2 (18 iulie 2018)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2018/Def_050_Informatica_P_2018_var_02_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2018/Def_050_Informatica_P_2018_bar_02_LRO.pdf)

== SUBIECTUL I (60 de puncte)

=== 1. Structura de date: Arbori Binari de Căutare (ABC)
- *Definire*: Un arbore binar este arbore de căutare dacă cheia fiecărui nod este strict mai mare decât cheile tuturor nodurilor din subarborele stâng și strict mai mică sau egală cu cheile tuturor nodurilor din subarborele drept.
- *Exemplu cu 7 noduri*: Inserăm în ordine cheile `50, 30, 70, 20, 40, 60, 80`. Rădăcina este `50`; în stânga se află subarborele cu `30, 20, 40`, iar în dreapta subarborele cu `70, 60, 80`.
- *Operații specifice pe exemplu*:
  - *Inserare*: cheia `35` se compară cu `50` (merge stânga), cu `30` (merge dreapta), cu `40` (merge stânga) și se inserează ca fiu stâng al lui `40`.
  - *Căutare*: pentru cheia `60`, traseul este `50 -> 70 -> 60`, deci cheia există.
  - *Ștergere*: dacă se șterge nodul `70`, care are doi fii, poate fi înlocuit cu succesorul în inordine `80` sau cu predecesorul `60`, apoi se repară legătura subarborelui din care a fost preluată cheia.
  - *Parcurgere*: inordine produce cheile sortate crescător: `20 30 40 50 60 70 80`; preordine vizitează rădăcina înaintea subarborilor; postordine vizitează rădăcina după subarbori.
- *Problemă (Gestiune dicționar)*:
  *Enunț*: Se citesc `n` chei distincte. Să se construiască un arbore binar de căutare prin alocare dinamică și să se afișeze cheile în ordine crescătoare.

  *Descriere*: Fiecare cheie citită este inserată în ABC prin comparații succesive cu nodul curent. Afișarea inordine a unui ABC dă valorile în ordine crescătoare, deoarece se vizitează mai întâi subarborele stâng, apoi nodul, apoi subarborele drept.

  - *C++*:
    ```cpp
    #include <iostream>
    using namespace std;
    struct Nod {
        int cheie;
        Nod *st, *dr;
    };
    void inserare(Nod* &rad, int x) {
        if (rad == nullptr) rad = new Nod{x, nullptr, nullptr};
        else if (x < rad->cheie) inserare(rad->st, x);
        else inserare(rad->dr, x);
    }
    void inordine(Nod* rad) {
        if (rad != nullptr) {
            inordine(rad->st);
            cout << rad->cheie << " ";
            inordine(rad->dr);
        }
    }
int main() {
    Nod* rad = nullptr;
    int n, x;
    cin >> n;
    for (int i = 1; i <= n; ++i) {
        cin >> x;
        inserare(rad, x);
    }
    inordine(rad);
    return 0;
}
    ```

---

=== 2. Procesoare de text: Formatare text
- *Elemente inserare*: Celulă tabel, casetă de text (Text Box), antet/subsol (Header/Footer).
- *Formatare paragraf*: Aliniere, indentare, spațiere rânduri, spațiere paragrafe, chenare.
- *Formatare caracter*: Font, dimensiune, culoare, stil (bold/italic/underline), spațiere caractere.
- *Metode aplicare*: Formatare directă, stiluri (Styles).

---

=== 3. Programare: Reprezentare sumă termeni recurență

*Descrierea algoritmului*: Subprogramul `termen(n)` determină cel mai mare termen al șirului care nu depășește valoarea curentă `n`. Programul principal aplică o strategie greedy: cât timp suma rămasă este pozitivă, alege `termen(sum)`, îl scrie în lista rezultatului și îl scade din sumă. Termenii sunt obținuți direct prin apeluri utile ale subprogramului cerut, iar valorile apar în ordine descrescătoare. Pentru șirul dat, această alegere nu folosește niciun termen de mai mult de două ori.

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <vector>
using namespace std;

long long termen(long long n) {
    long long prev2 = 1, prev1 = 2;
    if (n < 1) return 0;
    if (n == 1) return 1;
    if (n == 2) return 2;
    while (true) {
        long long curr = 1 + 3 * prev1 - 2 * prev2;
        if (curr > n) return prev1;
        prev2 = prev1;
        prev1 = curr;
    }
}

int main() {
    long long n;
    if (!(cin >> n)) return 0;

    vector<long long> rez;
    long long sum = n;
    while (sum > 0) {
        long long t = termen(sum);
        rez.push_back(t);
        sum -= t;
    }

    ofstream fout("def.out");
    for (int i = 0; i < rez.size(); ++i) {
        fout << rez[i] << (i == rez.size() - 1 ? "" : " ");
    }
    fout.close();

    return 0;
}
```

*Soluție Pascal:*
```pascal
program SumaTermeni;
var
  n, sum_val: int64;
  rez: array[1..80] of int64;
  rez_count, i: integer;
  fout: text;

function termen(n_val: int64): int64;
var
  prev2, prev1, curr: int64;
begin
  if n_val < 1 then termen := 0
  else if n_val = 1 then termen := 1
  else if n_val = 2 then termen := 2
  else
  begin
    prev2 := 1; prev1 := 2;
    while true do
    begin
      curr := 1 + 3 * prev1 - 2 * prev2;
      if curr > n_val then
      begin
        termen := prev1;
        exit;
      end;
      prev2 := prev1; prev1 := curr;
    end;
  end;
end;

begin
  readln(n);
  sum_val := n;
  rez_count := 0;
  while sum_val > 0 do
  begin
    rez_count := rez_count + 1;
    rez[rez_count] := termen(sum_val);
    sum_val := sum_val - rez[rez_count];
  end;

  assign(fout, 'def.out');
  rewrite(fout);
  for i := 1 to rez_count do
  begin
    write(fout, rez[i]);
    if i < rez_count then write(fout, ' ');
  end;
  close(fout);
end.
```

---

=== 4. Baze de date: Florărie
*Model conceptual*:
  - `CLIENT`: `id_client` (PK), `nume`, `prenume`, `adresa`, `telefon`.
  - `TIP_FLOARE`: `id_floare` (PK), `denumire_stiintifica`, `pret_unitar`, `anotimp_specific`.
  - `COMANDA`: `id_client` (FK), `id_floare` (FK), `data_comanda`, `cantitate`, PK este `(id_client, id_floare, data_comanda)`.

*Relații și normalizare*: `CLIENT` și `TIP_FLOARE` sunt legate prin `COMANDA`, care reține data și cantitatea. Cheia compusă `(id_client, id_floare, data_comanda)` identifică o comandă pentru un anumit client, tip de floare și dată. Modelul respectă 1NF prin câmpuri atomice, 2NF prin separarea atributelor clientului/florii de comandă, și 3NF prin evitarea repetării prețului sau sezonului în comenzile clienților. Restricții utile: `cantitate > 0`, `pret_unitar >= 0`, chei străine valide.

*Model fizic*:
```sql
CREATE TABLE CLIENT (
  id_client INT PRIMARY KEY,
  nume VARCHAR(50) NOT NULL,
  prenume VARCHAR(50) NOT NULL,
  adresa VARCHAR(150),
  telefon VARCHAR(20)
);

CREATE TABLE TIP_FLOARE (
  id_floare INT PRIMARY KEY,
  denumire_stiintifica VARCHAR(100) NOT NULL,
  pret_unitar DECIMAL(8,2) NOT NULL CHECK (pret_unitar >= 0),
  anotimp_specific VARCHAR(30) NOT NULL
);

CREATE TABLE COMANDA (
  id_client INT NOT NULL,
  id_floare INT NOT NULL,
  data_comanda DATE NOT NULL,
  cantitate INT NOT NULL CHECK (cantitate > 0),
  PRIMARY KEY (id_client, id_floare, data_comanda),
  FOREIGN KEY (id_client) REFERENCES CLIENT(id_client),
  FOREIGN KEY (id_floare) REFERENCES TIP_FLOARE(id_floare)
);
```

*SQL pentru tipurile de flori specifice verii*:
  ```sql
  SELECT denumire_stiintifica, pret_unitar
  FROM TIP_FLOARE
  WHERE anotimp_specific = 'vara';
  ```

---

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Strategie didactică pentru secvența A: tablouri bidimensionale
*Mijloc de învățământ*: calculatorul cu mediu de programare și proiector pentru urmărirea parcurgerii unei matrice.

*Argumente*: Tablourile bidimensionale se înțeleg mai ușor prin reprezentare vizuală pe linii și coloane; rularea programului permite elevilor să observe legătura dintre indicii `i`, `j` și elementele matricei.

*Elemente de proiectare*: metodă - demonstrația combinată cu exercițiul; formă de organizare - frontal și individual; activitate - parcurgerea matricei pe linii și calculul sumei fiecărei linii.

*Scenariu*: Profesorul afișează o matrice `3 x 4`, marchează indicii de linie și coloană și construiește două bucle imbricate. Elevii implementează citirea matricei și calculul sumelor pe linii. Profesorul verifică rezultatele și discută diferența dintre parcurgerea pe linii și pe coloane.

=== 2. Itemi cu răspuns scurt
*Caracteristici*: solicită un răspuns concis; verifică o achiziție punctuală; se corectează rapid și obiectiv.

*Reguli*: enunț clar, răspuns unic sau bine delimitat, evitarea formulărilor negative inutile.

- *Item A*: Cum se accesează elementul de pe linia `i` și coloana `j` într-o matrice `a`? *Răspuns*: `a[i][j]` în C/C++ sau `a[i,j]` în Pascal.
- *Item B*: Ce reprezintă serviciul FTP? *Răspuns*: un serviciu/protocol pentru transferul fișierelor între calculatoare prin rețea.
