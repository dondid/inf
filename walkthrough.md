# Walkthrough - Ghid de studiu complet și explicit pentru Titularizare (80 de pagini)

Acest document atestă finalizarea cu succes a extinderii ghidului de studiu într-un manual/textbook de sine stătător și auto-conținut pentru examenul de Titularizare la Informatică și TIC, acoperind integral programa oficială.

## Rezumatul Extinderilor pe Secțiuni

Toate capitolele din [ghid_programa_titularizare_informatica_tic.typ](file:///Debian/home/daniel/projects/inf/Informatică și tehnologia informației/ghid_programa_titularizare_informatica_tic.typ) au fost detaliate rând cu rând, fără a sări nicio temă:

1. **Secțiunea 3.1 (Algoritmi)**:
   - Extinsă complet cu prelucrarea cifrelor, divizibilitate (primalitate, divizori), CMMDC/CMMMC recursiv/iterativ, șiruri recurente (Fibonacci), secvențe, interschimbări.
   - Cod complet scris în paralel (C++ și Pascal) pentru toți acești algoritmi.
   - Cod complet și urme de execuție pas cu pas pentru sortări (Bubble Sort, Insertion Sort, Selection Sort, Counting Sort), căutare secvențială/binară, interclasare și analiza complexității (Big-O și Teorema Master).

2. **Secțiunea 3.2 (Limbaje de programare: C++ și Pascal)**:
   - Adăugată tabelă comparativă detaliată pentru tipuri simple de date (dimensiuni în octeți și intervale de valori).
   - Detaliat operatorii aritmetici, relaționali, logici, diferențele dintre împărțirea întreagă și reală (`/`, `%` vs. `/`, `div`, `mod`) și evaluarea leneșă (short-circuit logic).
   - Cod complet pentru inserare/ștergere în vectori (deplasări), prelucrări pe matrice (diagonala principală/secundară, sume sub/deasupra diagonalei).
   - Lucrul cu șiruri de caractere (verificare palindrom, separare cuvinte manual și prin `strtok` în ambele limbaje).
   - Fișiere text: citire până la EOF (`while (fin >> x)` vs `while not eof(f) do`) în ambele limbaje.
   - Mecanismul transmiterii parametrilor (valoare vs referință/var), variabile locale vs globale și stiva de apeluri (diagramă detaliată/stack trace recursiv pentru `suma_cifre_rec(123)`).
   - Programare Orientată pe Obiecte (POO): cele 4 principii explicate teoretic și exemplificate printr-un program complet în C++ care implementează o clasă de bază `Persoana` și o clasă derivată `Elev`, demonstrând încapsularea, moștenirea și polimorfismul prin metode `virtual` și `override`.

3. **Secțiunea 3.3 (Metode de programare)**:
   - **Greedy**: noțiunea teoretică (substructură optimă și proprietatea alegerii greedy). Cod complet în C++ și Pascal pentru problema rucsacului continuu și problema spectacolelor (ordonare după final).
   - **Backtracking**: schelet recursiv general în C++ și Pascal. Explicații matematice și cod complet pentru generări combinatoriale (permutări, aranjamente, combinări, submulțimi, partiții de numere și partiții de mulțimi). Detaliat constrângerile pentru problema reginelor, labirint și comis-voiajor.
   - **Divide et Impera**: concept. Cod complet în C++ și Pascal pentru Turnurile din Hanoi, Merge Sort și Quick Sort.
   - **Programare Dinamică**: concept de subprobleme suprapuse. Definiții de stare, relații de recurență și cod complet pentru LIS ($O(N^2)$), rucsac discret (0-1 Knapsack) și LCS (cel mai lung subșir comun).

4. **Secțiunea 3.4 & 3.5 (Structuri dinamice și Grafuri)**:
   - Liste liniare: cod complet în C++ și Pascal pentru declarare, creare, parcurgere, inserare și ștergere în Liste Simplu Înlănțuite (LSI), plus declarări pentru Liste Dublu Înlănțuite (LDI) și Liste Circulare.
   - Stive și cozi implementate dinamic: cod complet în ambele limbaje pentru `push`, `pop`, `enqueue`, `dequeue`.
   - Arbori: parcurgeri recursive (RSD, SRD, SDR) și arbori binari de căutare (căutare, inserare recursivă în ambele limbaje).
   - Heap: definiție detaliată. Cod complet în C++ și Pascal pentru `heapify` (cernere) și descrierea `Build-Heap`, `Insert`, `Extract-Max` și `Heap-Sort`.
   - Grafuri: cod complet C++ și Pascal pentru parcurgerile BFS (cu coadă) și DFS (recursivă).
   - Algoritmi avansați pe grafuri cu cod complet în ambele limbaje: Kosaraju-Sharir pentru componente tare conexe, Roy-Warshall pentru închidere tranzitivă, Dijkstra pentru drumuri minime, Roy-Floyd și Kruskal (cu structură DSU/compresie de cale) pentru APM.

5. **Secțiunea 3.6 - 3.10 (Baze de date, Arhitectură, OS, Birotică, Rețele, HTML)**:
   - Baze de date: modelele ierarhic și rețea. Exemplu complet, pas cu pas, de normalizare de la tabel nenormalizat la 1FN, 2FN și 3FN cu explicarea dependențelor funcționale. SQL complet pentru DDL (`CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`) și DML complex (`JOIN`, `GROUP BY`, `HAVING`, subinterogări).
   - Arhitectură: CPU (UCC, UAL, Registre, Cache L1-L3), memorii interne (SRAM vs DRAM, ROM, PROM, EEPROM), memorii externe (HDD, SSD), periferice de intrare, ieșire și I/O, ergonomie și siguranță.
   - Sisteme de operare: definiție, funcții, fișiere și directoare, căi absolute vs relative, permisiuni, malware, antivirus, firewall, licențe (Comercial, Shareware, Freeware, Open Source, Creative Commons).
   - Birotică: MS Word (cuprins automat, stiluri, antet/subsol, tabele), MS Excel (funcții detaliate `SUM`, `AVERAGE`, `COUNT`, `IF`, `COUNTIF`, `SUMIF`, `VLOOKUP` și tipuri de referințe `A1`, `$A$1`, `$A1`, `A$1`), PowerPoint (regula 6x6, contrast, animații).
   - Rețele și HTML: tipuri de rețele (PAN, LAN, MAN, WAN), modelul TCP/IP (Aplicație: HTTP/HTTPS, FTP, SMTP, POP3, IMAP, DNS; Transport: TCP vs UDP; Rețea: IP; Fizic: MAC), cod HTML complet ilustrând structura, titluri, paragrafe, liste, linkuri, imagini și tabele.

6. **Secțiunea 4 & 5 (Metodică și Proba Practică)**:
   - Proiect de lecție complet (Bubble Sort) structurat pe 7 etape (organizatoric, captare, anunțare temă, predare, fixare practică, evaluare/feedback, temă pentru acasă), precizând metode, mijloace și forme de organizare.
   - Calitățile instrumentelor de evaluare (validitate, fidelitate, obiectivitate, aplicabilitate, sensibilitate).
   - Tipuri de itemi (obiectivi, semiobiectivi, subiectivi) cu reguli de proiectare și exemple specifice de informatică (Grilă complexitate, Întrebare structurată matrice, Algoritm sortare cu fișiere), plus un barem complet de corectare model titularizare.
   - Simulare completă pentru proba practică:
     - Subiectul I (Programare): determinare frecvență maximă în fișier în C++ (`std::map`) și Pascal (Quick Sort + parcurgere liniară).
     - Subiectul II (SQL): creare tabele relaționale cu constrângeri și query complex cu `JOIN`, `GROUP BY` și `HAVING`.
     - Subiectul III (Excel & HTML): formulă `COUNTIF` explicată detaliat și o pagină HTML cu tabel și link extern.

## Rezultate Compilare

Generarea PDF-ului a fost realizată cu succes:
- **Număr de pagini**: 80 de pagini (manual complet, detaliat).
- **Text extractibil**: 177.586 de caractere (necriptat, căutabil).
- **Curățenie markere**: nu există markere de lucru neterminat; aparițiile de `...` sunt folosite exclusiv pentru eliziune sintactică validă în structuri de cod sau diagrame.
