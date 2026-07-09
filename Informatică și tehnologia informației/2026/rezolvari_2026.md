# Rezolvări Complete și Detaliate - Subiecte Model 2026
## Disciplinele: Informatică și Tehnologia Informației (Definitivat & Titularizare)

Acest document reprezintă ghidul complet și perfect de rezolvare a modelelor de subiecte pentru examenele naționale de **Definitivare în Învățământ** și **Titularizare** din anul **2026**. Programele și algoritmii de programare sunt scriși integral atât în **C++**, cât și în **Pascal**, respectând cu strictețe baremele oficiale de corectare.

---

## Partea I: Examenul Național pentru Definitivare în Învățământ – Model 2026

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/Def_050_Informatica_P_2026_var_model.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/Def_050_Informatica_P_2026_bar_model.pdf)

### SUBIECTUL I (60 de puncte)

#### 1. Structura de date: Listă simplu înlănțuită (15 puncte)

##### a) Noțiuni preliminare: Parcurgerea nodurilor
O listă simplu înlănțuită este o structură de date dinamică formată din noduri împrăștiate în memoria Heap. Fiecare nod este o structură/înregistrare formată din:
- **Informația utilă** (datele stocate).
- **Legătura/Pointerul** către nodul următor (`urm` / `next`).

Structura de definire a unui nod:
* **C++**:
  ```cpp
  struct Nod {
      int info;
      Nod* urm;
  };
  ```
* **Pascal**:
  ```pascal
  type
    PNod = ^TNod;
    TNod = record
      info: integer;
      urm: PNod;
    end;
  ```

**Parcurgerea nodurilor**: Pornind de la pointerul de start al listei (`prim`), se vizitează nodul curent și se înaintează la următorul prin reatribuirea pointerului de parcurgere cu legătura sa: `p = p->urm` (C++) sau `p := p^.urm` (Pascal), până când pointerul devine `NULL`/`nil`.

##### b) Descrierea și exemplificarea etapelor de realizare a celor 4 operații de inserare
Presupunem o listă cu 5 noduri: `prim -> [10] -> [20] -> [30] -> [40] -> [50] -> NULL`.
Noul nod de inserat este indicat de pointerul `nou`, având valoarea `99`.

###### 1. Inserarea înainte de primul nod (la începutul listei)
* **Descriere**: Legătura noului nod este setată să indice către primul nod actual al listei. Pointerul de start al listei (`prim`) este apoi actualizat pentru a indica spre noul nod.
* **Cod C++**:
  ```cpp
  nou->urm = prim;
  prim = nou;
  ```
* **Cod Pascal**:
  ```pascal
  nou^.urm := prim;
  prim := nou;
  ```
* **Trace vizual**:
  ```text
  Inițial: prim -> [10] -> [20] -> ...
  Pas 1:   nou [99] -> [10] (nou->urm = prim)
  Pas 2:   prim -> nou [99] -> [10] -> [20] -> ...
  ```

###### 2. Inserarea după ultimul nod (la sfârșitul listei)
* **Descriere**: Se parcurge lista până când se ajunge la ultimul nod (cel care are `urm == NULL`). Legătura acestui ultim nod se setează să indice către `nou`, iar legătura lui `nou` devine `NULL`.
* **Cod C++**:
  ```cpp
  Nod* p = prim;
  while (p->urm != nullptr) p = p->urm;
  p->urm = nou;
  nou->urm = nullptr;
  ```
* **Cod Pascal**:
  ```pascal
  p := prim;
  while p^.urm <> nil do p := p^.urm;
  p^.urm := nou;
  nou^.urm := nil;
  ```
* **Trace vizual**:
  ```text
  Inițial: [40] -> ultim [50] -> NULL
  Pas 1:   ultim [50] -> nou [99] (p->urm = nou)
  Pas 2:   nou [99] -> NULL (nou->urm = NULL)
  ```

###### 3. Inserarea înainte de un nod intermediar dat (ex. înaintea nodului cu valoarea `30`)
* **Descriere**: Este necesară parcurgerea listei pentru a identifica nodul anterior celui căutat (nodul cu valoarea `20`). Legătura lui `nou` este setată să indice către nodul căutat (`nou->urm = anterior->urm`). Legătura nodului anterior se actualizează să indice către `nou`.
* **Cod C++**:
  ```cpp
  Nod* ant = prim;
  while (ant->urm != nullptr && ant->urm->info != 30) ant = ant->urm;
  nou->urm = ant->urm;
  ant->urm = nou;
  ```
* **Cod Pascal**:
  ```pascal
  ant := prim;
  while (ant^.urm <> nil) and (ant^.urm^.info <> 30) do ant := ant^.urm;
  nou^.urm := ant^.urm;
  ant^.urm := nou;
  ```
* **Trace vizual**:
  ```text
  Inițial: ant [20] -> [30]
  Pas 1:   nou [99] -> [30] (nou->urm = ant->urm)
  Pas 2:   ant [20] -> nou [99]
  Rezultat: [20] -> [99] -> [30]
  ```

###### 4. Inserarea după un nod intermediar dat (ex. după nodul cu valoarea `30`)
* **Descriere**: Se identifică nodul dat `p` (cel cu valoarea `30`). Legătura lui `nou` preia adresa succesorului lui `p` (`nou->urm = p->urm`). Legătura lui `p` este setată să indice către `nou`.
* **Cod C++**:
  ```cpp
  Nod* p = prim;
  while (p != nullptr && p->info != 30) p = p->urm;
  nou->urm = p->urm;
  p->urm = nou;
  ```
* **Cod Pascal**:
  ```pascal
  p := prim;
  while (p <> nil) and (p^.info <> 30) do p := p^.urm;
  nou^.urm := p^.urm;
  p^.urm := nou;
  ```
* **Trace vizual**:
  ```text
  Inițial: p [30] -> [40]
  Pas 1:   nou [99] -> [40] (nou->urm = p->urm)
  Pas 2:   p [30] -> nou [99]
  Rezultat: [30] -> [99] -> [40]
  ```

##### c) Exemplu de utilizare într-o problemă completă (Inserare Ordonată)
* **Enunț**: Se citesc numere întregi până la introducerea valorii `0`. Să se creeze o listă simplu înlănțuită prin inserare ordonată crescător, apoi să se afișeze elementele listei.

* **Descriere în limbaj natural**:
  Citim numere. Pentru fiecare număr nenul, alocăm dinamic un nod. Dacă lista este goală sau valoarea noului nod este mai mică decât a primului, inserăm la început. Altfel, parcurgem lista cu un pointer de urmărire până când găsim primul nod cu o valoare mai mare, inserând noul nod imediat înaintea acestuia.

* **Implementare C++**:
  ```cpp
  #include <iostream>
  using namespace std;

  struct Nod {
      int info;
      Nod* urm;
  };

  void inserareOrdonata(Nod* &prim, int val) {
      Nod* nou = new Nod{val, nullptr};
      if (prim == nullptr || prim->info >= val) {
          nou->urm = prim;
          prim = nou;
      } else {
          Nod* curent = prim;
          while (curent->urm != nullptr && curent->urm->info < val) {
              curent = curent->urm;
          }
          nou->urm = curent->urm;
          curent->urm = nou;
      }
  }

  void afisare(Nod* prim) {
      for (Nod* p = prim; p != nullptr; p = p->urm) {
          cout << p->info << " ";
      }
      cout << endl;
  }

  int main() {
      Nod* prim = nullptr;
      int x;
      while (cin >> x && x != 0) {
          inserareOrdonata(prim, x);
      }
      afisare(prim);
      return 0;
  }
  ```

* **Implementare Pascal**:
  ```pascal
  program ListaOrdonata;
  type
    PNod = ^TNod;
    TNod = record
      info: integer;
      urm: PNod;
    end;
  var
    prim: PNod;
    x: integer;

  procedure inserareOrdonata(var prim: PNod; val: integer);
  var
    nou, curent: PNod;
  begin
    new(nou);
    nou^.info := val;
    nou^.urm := nil;
    if (prim = nil) or (prim^.info >= val) then
    begin
      nou^.urm := prim;
      prim := nou;
    end
    else
    begin
      curent := prim;
      while (curent^.urm <> nil) and (curent^.urm^.info < val) do
        curent := curent^.urm;
      nou^.urm := curent^.urm;
      curent^.urm := nou;
    end;
  end;

  procedure afisare(p: PNod);
  begin
    while p <> nil do
    begin
      write(p^.info, ' ');
      p := p^.urm;
    end;
    writeln;
  end;

  begin
    prim := nil;
    read(x);
    while x <> 0 do
    begin
      inserareOrdonata(prim, x);
      read(x);
    end;
    afisare(prim);
  end.
  ```

---

#### 2. Sisteme de operare, rețele și securitate (15 puncte)

##### a) Noțiuni preliminare:
1. **Sistem de calcul**: Componenta fizică (hard) și cea logică (soft) ce lucrează împreună pentru a permite introducerea, stocarea, procesarea și livrarea datelor sub formă de informații.
2. **Sistem de operare**: Programul principal care rulează pe un calculator. Acesta administrează memoria, procesele, componentele hardware și software, oferind o platformă stabilă pe care pot fi executate aplicațiile de utilizator.
3. **Rețea de calculatoare**: Un ansamblu de echipamente (calculatoare, routere, switch-uri) interconectate prin cabluri sau semnale wireless, având scopul de a partaja resurse de date și hardware (imprimante, servere).

##### b) Trei tipuri de amenințări informatice și caracteristicile lor:
1. **Troian (Trojan)**:
   - *Caracteristica 1*: Se ascunde în programe aparent legitime sau descărcate ca utilitare.
   - *Caracteristica 2*: Nu se reproduce singur, ci deschide porturi și căi de acces (Backdoors) prin care atacatorii pot controla computerul de la distanță.
2. **Ransomware**:
   - *Caracteristica 1*: Folosește algoritmi puternici de criptare pentru a bloca accesul utilizatorului la propriile fișiere personale.
   - *Caracteristica 2*: Șantajează victima, cerând o sumă de bani (de obicei în Bitcoin) în schimbul cheii de decriptare.
3. **Vierme (Worm)**:
   - *Caracteristica 1*: Se propagă singur prin intermediul rețelelor locale sau al internetului, exploatând breșe de securitate ale sistemelor de operare.
   - *Caracteristica 2*: Nu necesită atașarea de un fișier executabil existent pentru a rula sau a se răspândi.

##### c) Două acțiuni ale unui program antivirus la detectarea unui virus:
1. **Carantinarea**: Blocarea fișierului infectat într-un director securizat, criptat, izolat de sistemul de operare pentru a nu se propaga sau executa.
2. **Ștergerea / Curățarea**: Eliminarea semnăturilor de cod viral din fișier (dezinfectare) sau ștergerea integrală a fișierului dacă repararea nu este posibilă.

##### d) Exemplu de program antivirus cunoscut:
- **Bitdefender Antivirus**.

---

#### 3. Programare: Generare etichete sală spectacol (15 puncte)

##### Descriere în limbaj natural a algoritmului:
Pentru a implementa subprogramul `eticheta(s, d, n)`, trebuie să lipim la dreapta lui `s` cifrele lui `d`.
Pentru aceasta, calculăm întâi câte cifre are `d`. Variabila multiplicator `p` este inițializată cu `1`. Într-o buclă repetitivă, cât timp o copie a lui `d` este strict mai mare decât zero, o împărțim succesiv la 10 și înmulțim `p` cu 10. Valoarea finală a lui `n` va fi calculată direct ca: `n = s * p + d`.
În programul principal, după citirea lui `m` și `n` de la tastatură, construim o matrice. Pentru fiecare element `A[i][j]` (scaunul $j$ de pe rândul $i$), apelăm `eticheta(j, i, val1)` (rândul lipit la dreapta scaunului) și `eticheta(i, j, val2)` (rândul lipit la stânga scaunului). În matrice vom salva valoarea minimă dintre cele două opțiuni folosind funcția `min`. În final, scriem matricea obținută în fișierul text `def2025.txt`, cu elementele de pe o linie separate de un singur spațiu.

##### Soluție C++:
```cpp
#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

void eticheta(int s, int d, int &n) {
    int temp = d;
    int p = 1;
    while (temp > 0) {
        p *= 10;
        temp /= 10;
    }
    n = s * p + d;
}

int main() {
    int m, n;
    if (!(cin >> m >> n)) return 0;
    
    int A[101][101];
    for (int i = 1; i <= m; ++i) {
        for (int j = 1; j <= n; ++j) {
            int val1, val2;
            eticheta(j, i, val1);
            eticheta(i, j, val2);
            A[i][j] = min(val1, val2);
        }
    }
    
    ofstream fout("def2025.txt");
    for (int i = 1; i <= m; ++i) {
        for (int j = 1; j <= n; ++j) {
            fout << A[i][j] << (j == n ? "" : " ");
        }
        fout << "\n";
    }
    fout.close();
    
    return 0;
}
```

##### Soluție Pascal:
```pascal
program GenerareEtichete;
uses math;

var
  m, n, i, j, val1, val2: integer;
  A: array[1..100, 1..100] of integer;
  fout: text;

procedure eticheta(s, d: integer; var n: integer);
var
  temp, p: integer;
begin
  temp := d;
  p := 1;
  while temp > 0 do
  begin
    p := p * 10;
    temp := temp div 10;
  end;
  n := s * p + d;
end;

begin
  readln(m, n);
  
  for i := 1 to m do
  begin
    for j := 1 to n do
    begin
      eticheta(j, i, val1);
      eticheta(i, j, val2);
      A[i, j] := min(val1, val2);
    end;
  end;
  
  assign(fout, 'def2025.txt');
  rewrite(fout);
  for i := 1 to m do
  begin
    for j := 1 to n do
    begin
      write(fout, A[i, j]);
      if j < n then
        write(fout, ' ');
    end;
    writeln(fout);
  end;
  close(fout);
end.
```

---

#### 4. Baze de date: Asociație Festivaluri (15 puncte)

##### a) Modelul conceptual (Entități, Atribute, Relații, Forme Normale, Restricții)

**Entități și Identificatori Unici:**
1. **FESTIVAL** (memorează datele despre festivaluri)
   - `id_festival` (Cheie Primară - PK)
   - `denumire` (U)
   - `tematica`
   - `site_oficial` (poate fi NULL)
2. **TIP_EVENIMENT** (norme specifice organizării fiecărui tip de eveniment)
   - `id_tip` (Cheie Primară - PK)
   - `denumire_tip` (ex: concert, expozitie, workshop) (U)
   - `spatiu_necesar`
   - `nr_max_participanti`
   - `varsta_minima`
   - `alte_aspecte`
3. **EVENIMENT** (date specifice evenimentelor desfășurate în cadrul festivalurilor)
   - `id_eveniment` (Cheie Primară - PK)
   - `id_festival` (Cheie Străină - FK)
   - `id_tip` (Cheie Străină - FK)
   - `denumire`
   - `descriere`
   - `data_ora_inceput`
   - `durata` (în minute)
   - `locatie`
   - `categorie_public_tinta`

**Relații între Entități:**
- Relația **FESTIVAL – EVENIMENT**: O relație de tip 1:M (Un festival are mai multe evenimente, un eveniment aparține unui singur festival).
- Relația **TIP_EVENIMENT – EVENIMENT**: O relație de tip 1:M (Un tip de eveniment definește mai multe evenimente specifice; un eveniment are un singur tip).

**Forme Normale:**
- **1NF**: Toate atributele au doar valori simple, atomice.
- **2NF**: Toate atributele depind complet de întreaga cheie primară (deoarece cheile primare sunt formate dintr-o singură coloană auto-increment, nu există dependențe parțiale).
- **3NF**: Nu există dependențe tranzitive. Atributele non-cheie din tabela `EVENIMENT` nu depind de caracteristicile fizice generale ale tipului de eveniment direct, ci prin intermediul cheii străine `id_tip` legată de tabela separată `TIP_EVENIMENT`.

**Restricții / Reguli:**
- `denumire` în `FESTIVAL` și `denumire_tip` în `TIP_EVENIMENT` sunt setate ca unice (`UNIQUE`) și obligatorii (`NOT NULL`).
- Constrângerile de integritate referențială: `FOREIGN KEY (id_festival) REFERENCES FESTIVAL(id_festival) ON DELETE RESTRICT`.

##### b) Modelul Fizic (Structura tabelelor)

**Tabela: FESTIVAL**
- `id_festival` INT PRIMARY KEY AUTO_INCREMENT
- `denumire` VARCHAR(100) NOT NULL UNIQUE
- `tematica` VARCHAR(255) NOT NULL
- `site_oficial` VARCHAR(255) NULL

**Tabela: TIP_EVENIMENT**
- `id_tip` INT PRIMARY KEY AUTO_INCREMENT
- `denumire_tip` VARCHAR(50) NOT NULL UNIQUE
- `spatiu_necesar` VARCHAR(100) NOT NULL
- `nr_max_participanti` INT NOT NULL
- `varsta_minima` INT NOT NULL DEFAULT 0
- `alte_aspecte` TEXT NULL

**Tabela: EVENIMENT**
- `id_eveniment` INT PRIMARY KEY AUTO_INCREMENT
- `id_festival` INT NOT NULL
- `id_tip` INT NOT NULL
- `denumire` VARCHAR(100) NOT NULL
- `descriere` TEXT NULL
- `data_ora_inceput` DATETIME NOT NULL
- `durata` INT NOT NULL CHECK (durata > 0)
- `locatie` VARCHAR(100) NOT NULL
- `categorie_public_tinta` VARCHAR(50) NOT NULL
- FOREIGN KEY (`id_festival`) REFERENCES `FESTIVAL`(`id_festival`)
- FOREIGN KEY (`id_tip`) REFERENCES `TIP_EVENIMENT`(`id_tip`)

##### Interogări SQL adiționale (pentru obținerea rapoartelor cerute):
1. **Numărul de festivaluri cu cel puțin două evenimente de tip workshop**:
   ```sql
   SELECT COUNT(*) AS total_festivaluri
   FROM (
       SELECT e.id_festival
       FROM EVENIMENT e
       JOIN TIP_EVENIMENT t ON e.id_tip = t.id_tip
       WHERE t.denumire_tip = 'workshop'
       GROUP BY e.id_festival
       HAVING COUNT(e.id_eveniment) >= 2
   ) AS SubSel;
   ```
2. **Tipurile de evenimente care nu s-au desfășurat în niciun festival în ultimii doi ani**:
   ```sql
   SELECT t.denumire_tip
   FROM TIP_EVENIMENT t
   WHERE t.id_tip NOT IN (
       SELECT DISTINCT e.id_tip
       FROM EVENIMENT e
       WHERE e.data_ora_inceput >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
   );
   ```

##### c) Adăugarea datelor de bază
* **Opțiunea 1: Utilizând SQL (Recomandat)**:
  ```sql
  INSERT INTO FESTIVAL (denumire, tematica, site_oficial) 
  VALUES ('EduCode 2025', 'Inovatie in predarea informaticii', NULL);
  ```
* **Opțiunea 2: Ghid GUI (Interfață Grafică - phpMyAdmin)**:
  1. Deschideți instrumentul de gestiune a bazei de date (phpMyAdmin).
  2. Selectați baza de date dorită din panoul din stânga.
  3. Faceți clic pe tabela `FESTIVAL`.
  4. Selectați tab-ul **Insert** din meniul superior.
  5. Completați câmpul `denumire` cu valoarea `'EduCode 2025'` și `tematica` cu `'Inovatie in predarea informaticii'`. Lăsați `site_oficial` vid (sau introduceți NULL).
  6. Faceți clic pe butonul **Go** pentru a executa adăugarea datelor.

---

### SUBIECTUL al II-lea (30 de puncte)

#### 1. Proiectarea unei activități didactice (Alegere Secvență) (15 puncte)

Aici sunt prezentate detaliat activitățile didactice pentru **ambele** secvențe, la alegerea candidatului.

##### OPTIUNEA A: Secvența A (Metoda Divide et Impera)
* **Metoda didactică**: **Problematizarea**.
* **Caracteristici**:
  1. *Caracter educational*: Transformă elevul din receptor pasiv în cercetător activ prin crearea unei stări conflictuale de natură intelectuală (situație-problemă).
  2. *Stimularea gândirii*: Pune accent pe analiză, abstractizare și aplicare a algoritmilor într-un mod creativ și structurat.
* **Mijloace de învățământ**: Tablă interactivă, calculatoare, platformă online (ex: PBInfo).
* **Forma de organizare**: Activitate frontală îmbinată cu activitate individuală pe calculator.
* **Activitate de învățare**: Elevii primesc o problemă clasică (ex: determinarea maximului dintr-un șir de 1000 de elemente) și li se cere să o rezolve fără parcurgerea liniară clasică a vectorului, fiind ghidați să împartă vectorul în două jumătăți egale și să combine rezultatele.

**Scenariul Didactic**:
1. *Captarea atenției (Situația-problemă)*: Profesorul adresează întrebarea: „Dacă avem un dicționar fizic gros de 1000 de pagini și căutăm un cuvânt, cum procedăm pentru a-l găsi cel mai repede? Îl citim pagină cu pagină de la început?” Elevii răspund că deschid la jumătate, apoi decid în ce parte continuă.
2. *Predare prin problematizare*: Profesorul introduce metoda *Divide et Impera*:
   - Împărțirea problemei inițiale în subprobleme similare (Divide).
   - Rezolvarea subproblemelor (dacă sunt suficient de simple) sau continuarea împărțirii (Impera).
   - Combinarea rezultatelor subproblemelor pentru a obține soluția problemei inițiale (Combină).
3. *Activitatea profesorului*: Prezintă structura unei funcții recursive care determină maximul dintr-un vector. Coordonează elevii să scrie corect apelurile recursive.
4. *Activitatea elevilor*: Implementează algoritmul pe calculator, rulează teste de execuție și compară numărul de operații efectuate.

---

##### OPTIUNEA B: Secvența B (Dispozitive de stocare a datelor)
* **Metoda didactică**: **Mozaicul (Jigsaw)**.
* **Caracteristici**:
  1. *Interdependență pozitivă*: Elevii devin piese esențiale în echipă, învățând că succesul grupului depinde de seriozitatea fiecărui membru.
  2. *Dezvoltare socială*: Stimulează cooperarea, ascultarea activă și claritatea în exprimare.
* **Mijloace de învățământ**: Fișe de expert individuale, ecrane de proiecție, mostre reale (un HDD defect deschis, un SSD, un USB Flash).
* **Forma de organizare**: Lucru pe grupe de 4 elevi.
* **Activitate de învățare**: Elevii vor învăța reciproc caracteristicile mediilor de stocare, realizând o diagramă comparativă.

**Scenariul Didactic**:
1. *Împărțirea clasei*: Profesorul formează grupuri de bază de 4 elevi, oferind fiecăruia un număr de la 1 la 4.
2. *Gruparea experților*:
   - Numărul 1: Experții în Hard Disk-uri (HDD) și medii magnetice.
   - Numărul 2: Experții în Solid State Drive-uri (SSD) și memorii Flash.
   - Numărul 3: Experții în stocarea Cloud (avantaje/dezavantaje).
   - Numărul 4: Experții în unități de măsură (B, KB, MB, GB, TB, PB) și relațiile de conversie.
3. *Activitatea experților*: Profesorul distribuie fișele tehnice. Elevii citesc, analizează și își structurează o metodă de a le explica colegilor.
4. *Predarea în grupul de bază*: Elevii revin la grupurile de bază. Fiecare pe rând predă subtema sa. Profesorul monitorizează și oferă clarificări științifice.
5. *Evaluarea*: Profesorul aplică o scurtă evaluare (quiz online pe Kahoot) pentru verificarea însușirii tuturor noțiunilor.

---

#### 2. Evaluarea rezultatelor școlare: Proba Scrisă (15 puncte)

##### a) Avantaje și limite ale utilizării probei scrise:
* **Avantajul 1**: Grad sporit de obiectivitate. Baremele clare reduc influența factorilor subiectivi ai evaluatorului în aprecierea răspunsurilor.
* **Avantajul 2**: Permite testarea simultană a întregului colectiv de elevi, optimizând timpul destinat evaluării.
* **Avantajul 3**: Elevul își poate gestiona timpul de rezolvare independent, diminuându-se stările de inhibiție induse de examinarea orală directă.
* **Limită**: Lipsa flexibilității feedback-ului în timp real. Profesorul nu poate pune întrebări ajutătoare sau ghida elevul dacă acesta a înțeles greșit enunțul unui item.

##### b) Elaborarea itemilor de evaluare:

###### Item pentru Secvența A (Divide et Impera)
* **Tipul itemului**: Item obiectiv de tip alegere multiplă.
* **Enunț**:
  * **C++**:
    Se consideră funcția de mai jos realizată prin metoda *Divide et Impera*:
    ```cpp
    int calcul(int st, int dr, int V[]) {
        if (st == dr) return V[st];
        int m = (st + dr) / 2;
        int r1 = calcul(st, m, V);
        int r2 = calcul(m + 1, dr, V);
        return (r1 > r2) ? r1 : r2;
    }
    ```
    Ce returnează această funcție pentru un vector `V` cu elementele `[12, 45, 8, 90, 3]` apelată cu parametrii `calcul(0, 4, V)`?
    A. Suma tuturor elementelor vectorului (158).
    B. Valoarea maximă din vector (90).
    C. Valoarea minimă din vector (3).
    D. Poziția primului element din vector (0).
  * **Pascal**:
    Se consideră funcția de mai jos realizată prin metoda *Divide et Impera*:
    ```pascal
    function calcul(st, dr: integer; var V: array of integer): integer;
    var
      m, r1, r2: integer;
    begin
      if st = dr then calcul := V[st]
      else
      begin
        m := (st + dr) div 2;
        r1 := calcul(st, m, V);
        r2 := calcul(m + 1, dr, V);
        if r1 > r2 then calcul := r1
        else calcul := r2;
      end;
    end;
    ```
    Ce returnează această funcție pentru un vector `V` cu elementele `[12, 45, 8, 90, 3]` apelată cu parametrii `calcul(0, 4, V)`?
    A. Suma elementelor vectorului.
    B. Valoarea maximă din vector (90).
    C. Valoarea minimă din vector (3).
    D. Primul index.
* **Răspuns corect**: B.

###### Item pentru Secvența B (Dispozitive de stocare)
* **Tipul itemului**: Item semi-obiectiv cu răspuns scurt.
* **Enunț**:
  Ordonați crescător în funcție de capacitatea maximă de stocare următoarele medii fizice de stocare a datelor: **Stick de memorie USB (Flash Drive)**, **Unitate SSD (Solid State Drive)** și **Card MicroSD**. Precizați de asemenea care este relația matematică de conversie între unitățile de măsură **Gigabyte (GB)** și **Megabyte (MB)**.
* **Răspuns corect**:
  - Ordinea crescătoare uzuală a capacităților de stocare: Card MicroSD < Stick USB < Unitate SSD. (Se acceptă și variante argumentate bazate pe modele comerciale standard actuale).
  - Relația de conversie: $1\text{ GB} = 1024\text{ MB}$ (sau $2^{10}\text{ MB}$).

---
---

## Partea II: Concursul Național de Ocupare a Posturilor Didactice – Model 2026

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/Tit_050_Informatica_P_2026_var_model.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/Tit_050_Informatica_P_2026_bar_model.pdf)

### SUBIECTUL I (30 de puncte)

#### 1. Structura de date: Coadă (15 puncte)

##### a) Accesul la elemente
O coadă este o structură de date de tip **FIFO (First-In, First-Out)**. Accesul direct este permis doar la extremitățile cozii:
- **Față (Front)**: de unde se citesc și se elimină elementele.
- **Spate (Rear)**: unde se adaugă elementele noi.

##### b) Descriere și Exemplificare pentru o coadă cu 4 elemente
Fie coada în care inserăm succesiv valorile `A`, `B`, `C`, `D`, apoi realizăm o ștergere.

###### 1. Reprezentarea Secvențială (Vector fix `Q` și pointerii/indicii `front` și `rear`)
* **Structuri & Inițializare**:
  - **C++**:
    ```cpp
    char Q[100];
    int front = 0, rear = 0;
    ```
  - **Pascal**:
    ```pascal
    var
      Q: array[0..99] of char;
      front: integer = 0;
      rear: integer = 0;
    ```
* **Operații (Inserare/Ștergere)**:
  - Inserarea lui `val`: `Q[rear++] = val;` (C++) sau `Q[rear] := val; rear := rear + 1;` (Pascal).
  - Ștergerea: `val = Q[front++];` (C++) sau `val := Q[front]; front := front + 1;` (Pascal).
* **Trace vizual**:
  ```text
  Inițial: front = 0, rear = 0 | Coada: []
  Adaug 'A': Q[0]='A', rear=1 | Coada: [A]
  Adaug 'B': Q[1]='B', rear=2 | Coada: [A, B]
  Adaug 'C': Q[2]='C', rear=3 | Coada: [A, B, C]
  Adaug 'D': Q[3]='D', rear=4 | Coada: [A, B, C, D]
  Ștergere: front=1 (elimină 'A') | Coada activă: [B, C, D]
  ```

###### 2. Reprezentarea Înlănțuită (Noduri dinamice și pointeri `prim` și `ultim`)
* **Structuri & Inițializare**:
  - **C++**:
    ```cpp
    struct Nod {
        char info;
        Nod* urm;
    };
    Nod *prim = nullptr, *ultim = nullptr;
    ```
  - **Pascal**:
    ```pascal
    type
      PNod = ^TNod;
      TNod = record
        info: char;
        urm: PNod;
      end;
    var
      prim: PNod = nil;
      ultim: PNod = nil;
    ```
* **Operații (Inserare/Ștergere)**:
  - *Inserare*: Se alocă un nod. Dacă lista e vidă, `prim = ultim = nou`. Altfel, `ultim->urm = nou; ultim = nou;`.
  - *Ștergere*: Se reține `prim`. `prim = prim->urm`. Se eliberează memoria nodului inițial.
* **Trace vizual**:
  ```text
  Inițial: prim = nil, ultim = nil
  Adaug 'A': prim -> [A] <- ultim
  Adaug 'B': prim -> [A] -> [B] <- ultim
  Adaug 'C': prim -> [A] -> [B] -> [C] <- ultim
  Adaug 'D': prim -> [A] -> [B] -> [C] -> [D] <- ultim
  Ștergere: prim se mută la [B]. Se eliberează [A].
  Rezultat: prim -> [B] -> [C] -> [D] <- ultim
  ```

##### c) Utilizare într-o problemă: Algoritmul Lee
* **Enunț**: Determinarea numărului minim de pași de la o poziție de start la o destinație într-un labirint binar.
* **Descriere**: Utilizăm o coadă în care stocăm coordonatele celulelor vizitate. Pornim de la coordonatele de start și le adăugăm în coadă. Extragem succesiv elemente din coadă și adăugăm toți vecinii nevizitați în coadă, marcându-le distanța.

* **Implementare C++**:
  ```cpp
  #include <iostream>
  using namespace std;

  struct Coordonate {
      int x, y;
  };

  Coordonate Q[10000];
  int frontIdx = 0, rearIdx = 0;

  int labirint[100][100], dist[100][100];
  int n = 5, m = 5;
  int dx[] = {-1, 0, 1, 0}, dy[] = {0, 1, 0, -1};

  int lee(int xs, int ys, int xf, int yf) {
      dist[xs][ys] = 1;
      Q[rearIdx++] = {xs, ys};
      
      while (frontIdx < rearIdx) {
          Coordonate c = Q[frontIdx++];
          if (c.x == xf && c.y == yf) return dist[xf][yf] - 1;
          
          for (int i = 0; i < 4; ++i) {
              int nx = c.x + dx[i];
              int ny = c.y + dy[i];
              if (nx >= 1 && nx <= n && ny >= 1 && ny <= m) {
                  if (labirint[nx][ny] == 0 && dist[nx][ny] == 0) {
                      dist[nx][ny] = dist[c.x][c.y] + 1;
                      Q[rearIdx++] = {nx, ny};
                  }
              }
          }
      }
      return -1;
  }

  int main() {
      // Labirint simplificat
      int rez = lee(1, 1, 3, 3);
      cout << "Pasi: " << rez << endl;
      return 0;
  }
  ```

* **Implementare Pascal**:
  ```pascal
  program LeeCoadă;
  type
    Coordonate = record
      x, y: integer;
    end;
  var
    Q: array[0..9999] of Coordonate;
    frontIdx: integer = 0;
    rearIdx: integer = 0;
    labirint: array[1..100, 1..100] of integer;
    dist: array[1..100, 1..100] of integer;
    n: integer = 5;
    m: integer = 5;
    dx: array[0..3] of integer = (-1, 0, 1, 0);
    dy: array[0..3] of integer = (0, 1, 0, -1);

  function lee(xs, ys, xf, yf: integer): integer;
  var
    c: Coordonate;
    i, nx, ny: integer;
  begin
    dist[xs, ys] := 1;
    Q[rearIdx].x := xs; Q[rearIdx].y := ys;
    rearIdx := rearIdx + 1;
    
    while frontIdx < rearIdx do
    begin
      c := Q[frontIdx];
      frontIdx := frontIdx + 1;
      if (c.x = xf) and (c.y = yf) then
      begin
        lee := dist[xf, yf] - 1;
        exit;
      end;
      for i := 0 to 3 do
      begin
        nx := c.x + dx[i];
        ny := c.y + dy[i];
        if (nx >= 1) and (nx <= n) and (ny >= 1) and (ny <= m) then
        begin
          if (labirint[nx, ny] = 0) and (dist[nx, ny] = 0) then
          begin
            dist[nx, ny] := dist[c.x, c.y] + 1;
            Q[rearIdx].x := nx; Q[rearIdx].y := ny;
            rearIdx := rearIdx + 1;
          end;
        end;
      end;
    end;
    lee := -1;
  end;

  begin
    writeln('Pasi: ', lee(1, 1, 3, 3));
  end.
  ```

---

#### 2. Arhitectura sistemelor de calcul: Unitatea Centrală de Prelucrare (UCP) (15 puncte)

##### a) Integrarea în ansamblul arhitectural al unui sistem de calcul
UCP este componenta principală care controlează fluxul de date în calculator. Acesta comunică prin trei seturi principale de magistrale:
- **Magistrala de date**: transportă datele între CPU și RAM.
- **Magistrala de adrese**: utilizată de CPU pentru a specifica adresa din memorie unde citește/scrie datele.
- **Magistrala de control**: transmite semnale de sincronizare și control (Read/Write, semnale de ceas).

##### b) Două componente din structura UCP și rolul lor:
1. **ALU (Arithmetic Logic Unit)**: Execută operațiile elementare de adunare, scădere, logică booleană (AND, OR) și deplasare de biți.
2. **Registrele interne**: Zone de memorie extrem de rapide și de dimensiuni reduse (ex. Program Counter, Acumulator) care stochează datele folosite în execuția curentă.

##### c) Parametri ai microprocesorului:
1. **Frecvența de tact (Clock Rate)**: Viteza cu care pulsează tactul ceasului intern. Influențează direct numărul de instrucțiuni executate pe secundă. Valoare curentă: `5.2 GHz`.
2. **Lățimea magistralei de date (sau arhitectura)**: Reprezintă volumul de date ce poate fi transferat simultan la o singură operație. Valoare curentă: `64 biți`.
3. **Numărul de nuclee (Cores)**: Procesoare independente fizic integrate pe aceeași pastilă de siliciu. Permite rularea programelor în paralel. Valoare curentă: `16 nuclee`.

---

### SUBIECTUL al II-lea (30 de puncte)

#### 1. Programare Backtracking: Combinări bancnote (15 puncte)

##### Soluție C++:
```cpp
#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int n;
int c[10];
int b[10];

void tipar() {
    for (int i = 0; i < n; ++i) {
        if (b[i] > 0) {
            if (c[i] == 1) {
                cout << b[i] << "x" << c[i] << "leu ";
            } else {
                cout << b[i] << "x" << c[i] << "lei ";
            }
        }
    }
    cout << "\n";
}

void back(int idx, int current_sum) {
    if (current_sum == 0) {
        tipar();
        return;
    }
    if (idx < 0) {
        return;
    }
    
    int max_bills = current_sum / c[idx];
    for (int bills = max_bills; bills >= 0; --bills) {
        b[idx] = bills;
        back(idx - 1, current_sum - bills * c[idx]);
    }
    b[idx] = 0;
}

int main() {
    int s;
    if (!(cin >> s >> n)) return 0;
    
    for (int i = 0; i < n; ++i) {
        cin >> c[i];
        b[i] = 0;
    }
    
    for (int i = 0; i < n - 1; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if (c[i] > c[j]) {
                swap(c[i], c[j]);
            }
        }
    }
    
    back(n - 1, s);
    return 0;
}
```

##### Soluție Pascal:
```pascal
program CombinariBancnote;

var
  s, i, j, temp: integer;
  n: integer;
  c: array[0..9] of integer;
  b: array[0..9] of integer;

procedure tipar;
var
  k: integer;
begin
  for k := 0 to n - 1 do
  begin
    if b[k] > 0 then
    begin
      if c[k] = 1 then
        write(b[k], 'x', c[k], 'leu ')
      else
        write(b[k], 'x', c[k], 'lei ');
    end;
  end;
  writeln;
end;

procedure back(idx: integer; current_sum: integer);
var
  bills, max_bills: integer;
begin
  if current_sum = 0 then
  begin
    tipar;
    exit;
  end;
  if idx < 0 then
    exit;
    
  max_bills := current_sum div c[idx];
  for bills := max_bills downto 0 do
  begin
    b[idx] := bills;
    back(idx - 1, current_sum - bills * c[idx]);
  end;
  b[idx] := 0;
end;

begin
  read(s);
  read(n);
  for i := 0 to n - 1 do
  begin
    read(c[i]);
    b[i] := 0;
  end;
  
  for i := 0 to n - 2 do
  begin
    for j := i + 1 to n - 1 do
    begin
      if c[i] > c[j] then
      begin
        temp := c[i];
        c[i] := c[j];
        c[j] := temp;
      end;
    end;
  end;
  
  back(n - 1, s);
end.
```

---

#### 2. Algoritmi eficienți: Suprapunere Programări Cabinet Medic (15 puncte)

##### Justificarea eficienței:
Algoritmul citește valorile din fișier una câte una și verifică dacă valoarea citită este identică cu ultima valoare procesată. 
* **Timp**: $O(N)$ - se efectuează o singură trecere peste datele ordonate.
* **Memorie**: $O(1)$ - se folosesc exclusiv câteva variabile simple de tip întreg pentru comparație, respectând limitele stricte de eficiență.

##### Soluție C++:
```cpp
#include <iostream>
#include <fstream>

using namespace std;

int main() {
    ifstream fin("titu2025.txt");
    if (!fin) return 1;
    
    int current;
    if (!(fin >> current)) {
        cout << 0 << endl;
        fin.close();
        return 0;
    }
    
    int val;
    int rescheduled = 0;
    while (fin >> val) {
        if (val == current) {
            rescheduled++;
        } else {
            current = val;
        }
    }
    fin.close();
    
    cout << rescheduled << endl;
    return 0;
}
```

##### Soluție Pascal:
```pascal
program EvaluareSuprapuneri;

var
  fin: text;
  current, val, rescheduled: longint;

begin
  assign(fin, 'titu2025.txt');
  reset(fin);
  
  if eof(fin) then
  begin
    writeln(0);
    close(fin);
    halt;
  end;
  
  read(fin, current);
  rescheduled := 0;
  
  while not eof(fin) do
  begin
    read(fin, val);
    if val = current then
      rescheduled := rescheduled + 1
    else
      current := val;
  end;
  
  close(fin);
  writeln(rescheduled);
end.
```

---

### SUBIECTUL al III-lea (30 de puncte)

#### 1. Proiectare Test de Evaluare și Barem pentru Secvența A (Subprograme) (15 puncte)

---

### TEST DE EVALUARE - SUBPROGRAME
*Timpul efectiv de lucru: 50 de minute. Se acordă 10 puncte din oficiu.*

#### ITEMUL 1 (Alegere Multiplă) - 15 puncte
Ce se va afișa în urma execuției următorului cod?
* **C++**:
  ```cpp
  void f(int x, int &y) {
      x++; y++;
  }
  int main() {
      int a = 5, b = 5;
      f(a, b);
      cout << a << " " << b;
  }
  ```
  A. `5 5` | B. `5 6` | C. `6 6` | D. `6 5`
* **Pascal**:
  ```pascal
  procedure f(x: integer; var y: integer);
  begin
    x := x + 1; y := y + 1;
  end;
  // apelat cu a=5, b=5:
  f(a, b); write(a, ' ', b);
  ```
  A. `5 5` | B. `5 6` | C. `6 6` | D. `6 5`

#### ITEMUL 2 (Completare) - 15 puncte
Completați codul astfel încât subprogramul să returneze corect `true`/`true` dacă `n` este număr par.
* **C++**: `bool estePar(int n) { return n % 2 == ..........; }`
* **Pascal**: `function estePar(n: integer): ..........; begin estePar := (n mod 2 = 0); end;`

#### ITEMUL 3 (Răspuns Scurt) - 15 puncte
Precizați două avantaje ale modularizării codului prin subprograme definite de utilizator.

#### ITEMUL 4 (Întrebare Structurată) - 15 puncte
Se consideră subprogramul:
* **C++**: `int g(int n) { if(n <= 0) return 0; return n + g(n-3); }`
* **Pascal**: `function g(n: integer): integer; begin if n <= 0 then g := 0 else g := n + g(n-3); end;`
a) Determinați valoarea pentru `g(7)`. (7 puncte)
b) Explicați rolul condiției `n <= 0`. (8 puncte)

#### ITEMUL 5 (Rezolvare de Probleme) - 20 puncte
Scrieți definiția completă a unui subprogram `sumaCifre` care determină suma cifrelor impare ale unui număr natural `n` transmis ca parametru.

---

### BAREM DE NOTARE (TEST)
- **Item 1**: B (15p)
- **Item 2**: `0` în C++ (7.5p) și `boolean` în Pascal (7.5p)
- **Item 3**: Reutilizarea codului, depanare facilă, lizibilitate. (15p)
- **Item 4**: a) `12` (7p), b) Oprește recursivitatea (8p)
- **Item 5**: 20 puncte:
  - **C++**:
    ```cpp
    int sumaCifre(long long n) {
        int sum = 0;
        while (n > 0) {
            int cif = n % 10;
            if (cif % 2 != 0) sum += cif;
            n /= 10;
        }
        return sum;
    }
    ```
  - **Pascal**:
    ```pascal
    function sumaCifre(n: int64): integer;
    var sum, cif: integer;
    begin
      sum := 0;
      while n > 0 do
      begin
        cif := n mod 10;
        if cif mod 2 <> 0 then sum := sum + cif;
        n := n div 10;
      end;
      sumaCifre := sum;
    end;
    ```

---

#### 2. Proiectarea unei strategii didactice pentru Secvența B (Animații și Modele 3D) (15 puncte)

##### a) Două funcții ale unui mijloc de învățământ:
1. **Funcția ilustrativ-demonstrativă**: Permite vizualizarea elementelor spațiale 3D (axe de rotație, plane de proiecție) facilitând formarea reprezentărilor mintale spațiale.
2. **Funcția formativă**: Antrenează elevii în procesul de modelare activă, dezvoltând gândirea algoritmică și atenția la detalii tehnice.

##### b) Proiectare didactică:
* **Mijloc ales**: **Tinkercad**.
* **Metoda**: **Învățarea prin descoperire dirijată**.
* **Forma**: Individual.
* **Activitate**: Elevul realizează o animație simplă de translație pe axa Z și rotație a unui con.

###### Scenariu didactic:
1. Profesorul demonstrează cum se modifică proprietățile unui obiect în Tinkercad.
2. Elevul introduce un con și îl redimensionează.
3. Profesorul explică translația. Elevul modifică coordonatele pe rând pentru a simula mișcarea.
4. Profesorul arată rolul temporizării. Elevii testează diferite intervale de timp.
