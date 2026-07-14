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

---

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Metodă didactică aplicată la conținutul A: Șiruri de caractere

*Metoda aleasă*: învățarea prin descoperire dirijată.

==== a) Caracteristici și aplicabilitate
- Profesorul nu transmite direct toate regulile, ci creează situații-problemă prin care elevii observă proprietăți ale șirurilor: lungime, poziție, acces la caractere, concatenare, extragere de subșiruri.
- Elevii formulează concluzii pe baza unor exemple și verifică ipotezele prin rularea unor programe scurte.

Metoda este potrivită pentru capitolul *Șiruri de caractere* deoarece operațiile asupra textului sunt ușor de observat practic: modificarea unui caracter, parcurgerea unui șir, numărarea vocalelor sau testarea unui palindrom produc rezultate imediate. Astfel, elevii leagă noțiunea abstractă de tablou de caractere de situații concrete de procesare a textului.

==== b) Exemplu de secvență de instruire
- *Activitate de învățare*: determinarea numărului de vocale dintr-un șir citit de la tastatură.
- *Mijloc de învățământ*: calculator cu mediu de programare și fișă de lucru.
- *Formă de organizare*: activitate frontală pentru formularea problemei, apoi lucru pe perechi.

*Scenariu didactic*:
- Profesorul prezintă șirul `informatica`, cere elevilor să indice manual vocalele și notează observația că fiecare caracter trebuie analizat separat.
- Profesorul ghidează elevii spre ideea de parcurgere cu un indice de la prima la ultima poziție și formulează condiția `s[i] in {'a','e','i','o','u'}`.
- Elevii implementează algoritmul, rulează programul pe exemple diferite și compară rezultatele.
- Profesorul discută erorile frecvente: ignorarea literelor mari, folosirea greșită a indicilor, confundarea lungimii șirului cu ultima poziție.

*Soluție de referință C++*:
```cpp
#include <iostream>
#include <cstring>
using namespace std;

bool vocala(char c) {
    c = tolower(c);
    return strchr("aeiou", c) != nullptr;
}

int main() {
    char s[101];
    cin.getline(s, 101);
    int nr = 0;
    for (int i = 0; s[i] != '\0'; ++i)
        if (vocala(s[i])) nr++;
    cout << nr;
    return 0;
}
```

=== 2. Test de evaluare pentru conținutul A: Șiruri de caractere

Testul are 90 de puncte, la care se adaugă 10 puncte din oficiu.

#table(
  columns: (1.4fr, 2.4fr, 2.2fr),
  inset: 5pt,
  [*Item*], [*Enunț*], [*Răspuns așteptat / barem*],
  [1. Alegere multiplă (20p)], [Care expresie returnează lungimea șirului `s` în C/C++? A. `sizeof(s)` B. `strlen(s)` C. `length(s[0])` D. `count(s)`], [`B`; 20p pentru alegerea corectă.],
  [2. Răspuns scurt (30p)], [Precizați rolul caracterului `'\0'` într-un șir de caractere memorat ca tablou de `char`.], [Marchează sfârșitul șirului; permite funcțiilor de bibliotecă să știe unde se termină textul. 20p explicație corectă, 10p exemplu.],
  [3. Problemă practică (40p)], [Se citește un cuvânt. Să se afișeze `DA` dacă este palindrom și `NU` în caz contrar.], [Parcurgere cu doi indici, comparație simetrică, afișare corectă. 10p citire, 20p test corect, 10p afișare.]
)

---

== SUBIECTUL al III-lea (30 de puncte)

=== Formele educației: formală, nonformală, informală

*Educația formală* este educația organizată instituțional, desfășurată în școală, pe baza unor planuri-cadru, programe școlare, obiective, conținuturi și forme de evaluare oficiale. Ea este sistematică, graduală și certificată prin acte de studii.

*Educația nonformală* se desfășoară tot organizat, dar în afara sistemului școlar strict: cercuri, cluburi, tabere, concursuri, ateliere, activități extracurriculare. Este mai flexibilă, centrată pe interesele participanților și dezvoltă competențe complementare celor formale.

*Educația informală* reprezintă ansamblul influențelor educative spontane sau neorganizate din familie, grupul de prieteni, mass-media, internet, comunitate și experiențe cotidiene. Nu are curriculum oficial, dar influențează puternic atitudinile, valorile și comportamentele.

*Analiză comparativă*:
- Educația formală oferă structură, progresie și certificare, dar poate fi mai rigidă.
- Educația nonformală crește motivația și aplicabilitatea practică, dar depinde mult de calitatea organizării.
- Educația informală este permanentă și naturală, dar poate transmite și modele greșite dacă nu este filtrată critic.

*Interdependență*: Cele trei forme nu se exclud, ci se completează. De exemplu, la informatică, școala oferă conceptele de bază despre algoritmi, un club de robotică le transformă în proiecte practice, iar experiența personală de utilizare a calculatorului consolidează deprinderile. Profesorul eficient valorifică toate cele trei surse: organizează învățarea formală, recomandă activități nonformale și discută critic experiențele informale ale elevilor.

#pagebreak()

= II. Rezolvare Definitivat Informatică de gestiune Varianta 3 (17 iulie 2012)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2012/Def_MET_048_Informatica_gestiune_P_2012_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2012/Def_MET_048_Informatica_gestiune_P_2012_bar_03_LRO.pdf)

== SUBIECTUL I (30 de puncte)

=== 1. Produs informatic pentru gestiunea bazelor de date

Un exemplu potrivit este Microsoft Access sau LibreOffice Base. Informația este organizată în tabele, fiecare tabel având câmpuri, înregistrări și chei primare. Relațiile dintre tabele permit evitarea redundanței și interogarea coerentă a datelor.

*Elemente de interfață*:
- panoul de obiecte, din care se aleg tabele, interogări, formulare și rapoarte;
- grila de proiectare, folosită pentru definirea câmpurilor, criteriilor sau controalelor.

*Facilități principale*:
- *crearea tabelelor*: definirea câmpurilor, tipurilor de date, cheilor primare și relațiilor;
- *interogarea datelor*: selectarea, filtrarea, sortarea și agregarea informațiilor;
- *raportarea*: generarea de situații tipărite sau exportabile pe baza datelor stocate.

=== 2. Dispozitive periferice

Dispozitivele periferice sunt echipamente hardware conectate la sistemul de calcul, folosite pentru introducerea datelor, afișarea rezultatelor sau stocarea/transferul informațiilor. Exemple: tastatura, mouse-ul, monitorul, imprimanta, scannerul.

=== 3. Subprogramul `suma` și programul cerut

Antet C++:
```cpp
int suma(int n);
```

Soluție C++:
```cpp
#include <iostream>
#include <fstream>
using namespace std;

int suma(int n) {
    int s = 0;
    do {
        s += n % 10;
        n /= 10;
    } while (n > 0);
    return s;
}

void solutie() {
    ifstream fin("DATE.TXT");
    int n;
    fin >> n;
    fin.close();

    if (suma(n) % 2 == 1)
        cout << n;
    else
        cout << "Nu este impara";
}
```

=== 4. Bază de date pentru companie de excursii

Model conceptual cu 3 tabele:
- `CLIENT(id_client, nume, prenume, adresa)`;
- `EXCURSIE(id_excursie, pret, descriere_obiective)`;
- `CONTRACT(id_contract, id_client, id_excursie, data_semnare)`.

Relații:
- `CLIENT` 1:M `CONTRACT`;
- `EXCURSIE` 1:M `CONTRACT`;
- relația M:N dintre clienți și excursii este rezolvată prin `CONTRACT`.

Restricții:
- chei primare pentru fiecare tabel;
- `CONTRACT.id_client` și `CONTRACT.id_excursie` sunt chei străine valide;
- `pret > 0`;
- `data_semnare` obligatorie;
- se poate impune unicitate pe `(id_client, id_excursie, data_semnare)` dacă se dorește evitarea înregistrării aceluiași contract de două ori.

Interogări utile:
```sql
-- clienții unei excursii date
SELECT c.nume, c.prenume, c.adresa, ct.data_semnare
FROM CLIENT c
JOIN CONTRACT ct ON ct.id_client = c.id_client
WHERE ct.id_excursie = :id_excursie;

-- clienții cu cel puțin două contracte
SELECT c.id_client, c.nume, c.prenume
FROM CLIENT c
JOIN CONTRACT ct ON ct.id_client = c.id_client
GROUP BY c.id_client, c.nume, c.prenume
HAVING COUNT(*) >= 2;

-- excursii fără contracte
SELECT e.*
FROM EXCURSIE e
LEFT JOIN CONTRACT ct ON ct.id_excursie = e.id_excursie
WHERE ct.id_contract IS NULL;
```

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Studiul de caz

*Caracteristici*:
- pornește de la o situație concretă, apropiată de realitate;
- solicită analiza, formularea de ipoteze, argumentarea și alegerea unei soluții.

*Etape*: alegerea cazului, prezentarea situației, documentarea, analiza individuală sau pe grupe, dezbaterea soluțiilor și formularea concluziilor.

*Exemplu*: la modulul Baze de date, conținutul „Proiectarea unei baze de date pentru o agenție de turism”.

- *Activitate de învățare*: identificarea entităților și relațiilor dintr-un caz practic.
- *Mijloc de învățământ*: fișă de caz și calculator cu SGBD.
- *Scenariu*: profesorul prezintă cazul unei agenții care gestionează clienți, excursii și contracte. Elevii extrag cerințele, propun entități, stabilesc chei primare și relații. Profesorul dirijează discuția spre eliminarea redundanței și validarea modelului. Elevii compară soluțiile și justifică de ce tabela `CONTRACT` este necesară pentru relația M:N.

=== 2. Test de evaluare pentru capitolul Baze de date

#table(
  columns: (1.4fr, 2.4fr, 2.2fr),
  inset: 5pt,
  [*Item*], [*Enunț*], [*Răspuns așteptat / barem*],
  [Pereche (30p)], [Asociați noțiunile: cheie primară, cheie străină, interogare cu descrierile corespunzătoare.], [3 asocieri corecte x 10p.],
  [Completare (20p)], [Într-o relație 1:M, cheia primară din tabela de la partea 1 apare ca ____ în tabela de la partea M.], [cheie străină; 20p.],
  [Problemă/eseu (40p)], [Proiectați tabelele pentru evidența elevilor înscriși la cursuri opționale. Precizați chei și relații.], [Tabele corecte 15p, chei 10p, relații 10p, restricții 5p.]
)

Se acordă 10 puncte din oficiu.

== SUBIECTUL al III-lea (30 de puncte)

Rezolvarea pentru formele educației este aceeași ca în secțiunea anterioară: educația formală este instituționalizată și certificată, educația nonformală este organizată în afara curriculumului strict, iar educația informală apare spontan în familie, grupuri, media și experiențe cotidiene. Răspunsul complet trebuie să includă definiții, analiză comparativă și interdependența celor trei forme, cu exemple din activitatea de informatică: lecția formală oferă concepte, clubul sau concursul dezvoltă aplicații, iar experiențele personale cu tehnologia consolidează sau influențează comportamentele.
