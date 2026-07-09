# 🎓 Pregătire Examen Titularizare & Definitivat
## Disciplina: Informatică și Tehnologia Informației (TIC)

Acest repository conține un set complet de resurse, subiecte oficiale și **rezolvări de nota 10** pentru examenele naționale de **Titularizare** și **Definitivare în Învățământ** din România, acoperind disciplinele **Informatică** și **Tehnologia Informației și a Comunicațiilor (TIC)**.

Toate rezolvările sunt concepute pentru a fi **perfecte** (asigurând punctaj maxim conform baremelor oficiale), extrem de detaliate și sunt disponibile în formate moderne de tehnoredactare (**Markdown** și **Typst/PDF**).

---

## 📂 Structura Proiectului

Proiectul este organizat cronologic și tematic:

```text
inf/
├── README.md
├── .gitignore
└── Informatică și tehnologia informației/
    ├── 2011 - 2026/                       # Dosare organizate pe ani
    │   ├── [An]_var_[...].pdf             # Subiectele oficiale (variante/modele)
    │   ├── [An]_bar_[...].pdf             # Baremele oficiale de corectare
    │   ├── rezolvare_definitivat_[An].typ # Sursa Typst pentru Definitivat
    │   ├── rezolvare_definitivat_[An].pdf # PDF Definitivat
    │   ├── rezolvare_titularizare_[An].typ # Sursa Typst pentru Titularizare
    │   └── rezolvare_titularizare_[An].pdf # PDF Titularizare
    ├── proba practica/                    # Subiecte și resurse pentru proba practică
    └── carti/                             # Suport de curs (metodică, pedagogie, programare)*
```
*\*Notă: Folderul `carti/` conține manuale și cursuri voluminoase salvate local, dar este exclus din Git prin `.gitignore` pentru a menține repository-ul ușor.*

---

## ⚡ Caracteristicile Rezolvărilor

Fiecare an rezolvat conține elementele cheie cerute la examen:
* **Programare & Algoritmică**: Rezolvări complete scrise în **două limbaje de programare**: **C++** și **Pascal**, însoțite de explicații în limbaj natural și analiză de complexitate.
* **Baze de Date**: Proiectarea modelelor conceptuale (cu relații și reguli 3NF), modele fizice (tabele) și interogări SQL complete.
* **Pedagogie și Didactică**: Planificări de lecții detaliate bazate pe metode didactice interactive (Mozaic, Problematizare, Învățare prin descoperire) și scenarii complete de lecție.
* **Evaluare**: Proiecte de teste scrise/practice cu bareme analitice de corectare pentru toți itemii (obiectivi, semiobiectivi și subiectivi).

---

## 📊 Stadiul Rezolvărilor

| Anul | Definitivat (Subiect) | Titularizare (Subiect) | Rezolvare Definitivat | Rezolvare Titularizare | Stadiu |
| :---: | :---: | :---: | :---: | :---: | :---: |
| **2026** | Model | Model | [TYP](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/rezolvare_definitivat_2026.typ) / [PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/rezolvare_definitivat_2026.pdf) | [TYP](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/rezolvare_titularizare_2026.typ) / [PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2026/rezolvare_titularizare_2026.pdf) | **Finalizat** |
| **2025** | Model + Var 2 | Model + Var 3 | [TYP](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2025/rezolvare_definitivat_2025.typ) / [PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2025/rezolvare_definitivat_2025.pdf) | [TYP](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2025/rezolvare_titularizare_2025.typ) / [PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2025/rezolvare_titularizare_2025.pdf) | **Finalizat** |
| **2024** | Subiecte | Subiecte | ⏳ | ⏳ | Planificat |
| **2023** | Subiecte | Subiecte | ⏳ | ⏳ | Planificat |
| **2022** | Subiecte | Subiecte | ⏳ | ⏳ | Planificat |
| **2021** | Subiecte | Subiecte | ⏳ | ⏳ | Planificat |
| **2020** | Subiecte | Subiecte | ⏳ | ⏳ | Planificat |
| **2019 - 2011** | Subiecte | Subiecte | ⏳ | ⏳ | Planificat |

---

## 🛠️ Cum se compilează fișierele Typst (.typ) în PDF

[Typst](https://typst.app) este un sistem modern de tehnoredactare. Dacă dorești să modifici rezolvările și să generezi din nou fișierele PDF:

### Opțiunea 1: Online (Fără instalare)
1. Copiază codul dintr-un fișier `.typ` dorit (de exemplu, `rezolvare_definitivat_2026.typ`).
2. Lipsește-l în editorul online gratuit de pe [typst.app](https://typst.app).
3. Descarcă PDF-ul generat instantaneu.

### Opțiunea 2: Local (Din terminal)
Dacă ai Typst instalat pe sistem, deschide terminalul în directorul proiectului și rulează:
```bash
typst compile "Informatică și tehnologia informației/2026/rezolvare_definitivat_2026.typ" "Informatică și tehnologia informației/2026/rezolvare_definitivat_2026.pdf"
```
Pentru a monitoriza modificările în timp real (Live Preview local):
```bash
typst watch "Informatică și tehnologia informației/2026/rezolvare_definitivat_2026.typ"
```
