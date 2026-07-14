# Walkthrough verificare solutii

Data verificarii: 2026-07-14

## Rezumat

Repository-ul contine 29 de fisiere `.typ` pentru materialele de Informatica si tehnologia informatiei:

- 28 de rezolvari pe ani, pentru Titularizare si Definitivat;
- 1 fisier central de statistici: `Informatică și tehnologia informației/statistici_subiecte.typ`.

Toate cele 29 de surse au fost verificate prin compilare Typst. Compilarea finala trebuie sa ramana criteriul tehnic principal pentru validarea materialelor generate in PDF.

## Acoperire variante oficiale

Rezolvarile sunt organizate pe ani. Pentru anii in care in repository exista atat model, cat si varianta oficiala, ambele sunt incluse in acelasi fisier anual. Pentru Definitivat 2012-2014 au fost incluse explicit si subiectele de `Informatica de gestiune`, deoarece exista PDF-uri separate de subiect si barem.

| An | Examen | Variante locale acoperite |
| --- | --- | --- |
| 2011 | Titularizare | Varianta 2 |
| 2012 | Definitivat | Informatica Varianta 3; Informatica de gestiune Varianta 3 |
| 2013 | Titularizare | Varianta 2 |
| 2013 | Definitivat | Informatica Varianta 3; Informatica de gestiune Varianta 3 |
| 2014 | Titularizare | Varianta 3 |
| 2014 | Definitivat | Informatica Varianta 1; Informatica de gestiune Varianta 1 |
| 2015 | Titularizare | Varianta 3 |
| 2016 | Titularizare | Varianta 1 |
| 2017 | Titularizare | Varianta 3 |
| 2017 | Definitivat | Model; Varianta 3 |
| 2018 | Titularizare | Varianta 3 |
| 2018 | Definitivat | Varianta 2 |
| 2019 | Titularizare | Model; Varianta 3 |
| 2019 | Definitivat | Model; Varianta 3 |
| 2020 | Titularizare | Model; Varianta 3 |
| 2020 | Definitivat | Varianta 3 |
| 2021 | Titularizare | Model; Varianta 2 |
| 2021 | Definitivat | Model; Varianta 3 |
| 2022 | Titularizare | Varianta 3 |
| 2022 | Definitivat | Model; Varianta 3 |
| 2023 | Titularizare | Model; Varianta 3 |
| 2023 | Definitivat | Model; Varianta 3 |
| 2024 | Titularizare | Model; Varianta 3 |
| 2024 | Definitivat | Model; Varianta 2 |
| 2025 | Titularizare | Model; Varianta 3 |
| 2025 | Definitivat | Model; Varianta 2 |
| 2026 | Titularizare | Model |
| 2026 | Definitivat | Model |

## Zone verificate si actualizate

- Baze de date si normalizare: au fost extinse explicatiile pentru relatii, chei, restrictii, modele logice/fizice si forme normale, acolo unde rezolvarile aveau nevoie de mai multa claritate pentru invatare.
- Algoritmi C++ si Pascal: au fost reverificate solutiile sensibile, inclusiv backtracking recursiv/iterativ, parcurgeri BFS/DFS, algoritmi pe siruri, intervale, divizori si programare dinamica.
- Probleme didactice: au fost completate sectiunile despre strategii didactice, itemi, evaluare, ergonomie si organizarea activitatilor, acolo unde explicatiile erau prea scurte.
- Variante multiple: au fost urmarite explicit modelul, varianta oficiala si variantele de Informatica de gestiune acolo unde fisierele oficiale exista local.
- PDF-uri: fisierele generate au fost regenerate dupa modificarile surselor `.typ`.

## Verificari finale recomandate

- Compilare Typst pentru toate cele 29 de fisiere `.typ`.
- Scanare pentru markere de lucru neterminat si formulare temporare.
- Inspectie vizuala pentru cateva PDF-uri reprezentative: 2019 Titularizare, 2021 Titularizare, 2024-2026 Titularizare si Definitivat, plus `statistici_subiecte.pdf`.

## Observatii

- Avertismentul local despre familia de font `Arial`, daca apare la compilare, nu blocheaza generarea PDF-urilor; Typst foloseste fallback-ul disponibil local.
- Materialele trebuie considerate gata de invatat dupa ce compilarea 29/29 trece fara erori si nu mai apar markere de continut neterminat.
