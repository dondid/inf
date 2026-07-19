# Walkthrough verificare ghid programa titularizare

Data verificarii: 2026-07-19

## Rezumat

Repository-ul include acum un ghid central de studiu pentru Titularizare la Informatică și Tehnologia Informației, construit după programa oficială locală `19_Programa_titu_P_Informatica_si_tehnologia_informatiei.pdf`.

Fișiere finale:
- `Informatică și tehnologia informației/ghid_programa_titularizare_informatica_tic.typ`
- `Informatică și tehnologia informației/ghid_programa_titularizare_informatica_tic.pdf`

Ghidul este conceput ca material complet de parcurgere: explică programa, marchează zonele de probă practică, oferă checklisturi, exemple, reguli de răspuns și un plan de studiu etapizat.

## Acoperire conținut

Au fost acoperite toate componentele majore ale programei:
- competențele cadrului didactic de specialitate;
- tematica științifică: algoritmi, limbaje de programare, metode de programare, alocare dinamică, grafuri, baze de date, arhitectură, sisteme de operare, birotică și rețele;
- proba practică din capitolele marcate cu `(*)`: programare, baze de date, sisteme de operare, birotică, Internet și HTML;
- metodica predării disciplinelor informatice;
- evaluarea randamentului școlar, itemi, bareme și erori de notare;
- bibliografia științifică și metodică, tratată ca direcție de parcurgere selectivă;
- plan de studiu și matrice de verificare finală.

## Extinderi realizate

- Programare și medii vizuale: au fost detaliate blocurile vizuale interactive pentru Scratch, Blockly și App Inventor, inclusiv evenimente, structuri de control, variabile, liste și blocuri proprii.
- Limbaje de programare: au fost adăugate funcții standard predefinite uzuale pentru C++ și Pascal, inclusiv funcții pentru șiruri de caractere și operații matematice.
- Structuri arborescente: au fost definite arborii binari compleți, arborii binari de căutare și structura Heap, cu reprezentare prin vector, formule de indexare, operații Heapify, Build-Heap, Insert, Extract și Heap-Sort.
- Teoria grafurilor: au fost clarificate lanțuri, drumuri, cicluri, circuite, variante simple/elementare, graful transpus, matricea drumurilor, Roy-Warshall, Kosaraju-Sharir și Tarjan.
- Baze de date: au fost explicate modelele ierarhic și rețea, modelul relațional, normalizarea, DDL (`CREATE TABLE`, `ALTER TABLE`, `DROP TABLE`) și DML (`SELECT`, `INSERT`, `UPDATE`, `DELETE`).
- Metodică și evaluare: au fost completate modularitatea, multidisciplinaritatea, calitățile instrumentelor de evaluare și regulile/avantajele/dezavantajele itemilor obiectivi, semiobiectivi și subiectivi.
- Integrare: README-ul listează ghidul nou în structura proiectului și include comanda de compilare.

## Rezultate tehnice

Verificări efectuate:
- compilare Typst a ghidului în PDF final;
- verificare metadate PDF cu `pdfinfo`;
- verificare extractibilitate text cu `pdftotext`;
- scanare pentru markere neterminate sau formulări temporare;
- verificare stare Git pentru fișierele modificate.

Rezultat compilare:
- PDF generat cu succes;
- format A4;
- document necriptat;
- text extractibil;
- avertisment local `unknown font family: arial`, neblocant, cu fallback automat Typst.

Notă: avertismentul despre Arial este același tip de avertisment menționat anterior pentru materialele Typst din repository și nu împiedică generarea PDF-ului.

## Stare finală recomandată

Materialul poate fi folosit ca ghid central de studiu după programa oficială. Pentru lucrul zilnic:
1. se parcurge capitolul din ghid;
2. se rezolvă subiecte oficiale asemănătoare din dosarele anuale;
3. se verifică răspunsul cu rezolvările din repository;
4. se revine la checklisturile și matricea de acoperire pentru lacune.

Înainte de publicare sau commit, este suficientă verificarea finală:
```bash
typst compile "Informatică și tehnologia informației/ghid_programa_titularizare_informatica_tic.typ" "Informatică și tehnologia informației/ghid_programa_titularizare_informatica_tic.pdf"
pdftotext "Informatică și tehnologia informației/ghid_programa_titularizare_informatica_tic.pdf" - | wc -m
```
