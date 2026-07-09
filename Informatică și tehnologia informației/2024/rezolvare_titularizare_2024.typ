#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Titularizare 2024*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Titularizare Model & Var 2024],
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
  #text(size: 14pt, style: "italic")[Concursul Național pentru Ocuparea Posturilor Didactice] \
  #text(size: 12pt)[Anul 2024 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Titularizare Model 2024

== SUBIECTUL I (30 de puncte)

=== 1. Date de tip real (Floating Point)
- *Tip real in C++*: `double` (8 octeți / 64 biți).
- *Tip real in Pascal*: `double` sau `real` (8 octeți în Pascal modern).
- *Patru exemple de declarare cu inițializări (C++ / Pascal)*:
  1. Zecimal standard: `double a = 3.14;` / `a: double = 3.14;`
  2. Partea fracționară omisă: `double b = 5.;` / `b: double = 5.0;`
  3. Partea întreagă omisă: `double c = .75;` / `c: double = 0.75;`
  4. Reprezentare exponențială (științifică): `double d = 1.2e-3;` / `d: double = 1.2e-3;`
- *Exemple de operatori*: adunarea (`+`), împărțirea reală (`/`).
- *Funcții predefinite*: radical (`sqrt`), valoare absolută (`abs`), rotunjire (`round`).
- *Problemă (Aria unui cerc)*:
  - *C++*:
    ```cpp
    #include <iostream>
    #include <cmath>
    using namespace std;
    int main() {
        double r;
        cin >> r;
        double aria = M_PI * r * r;
        cout << aria << endl;
        return 0;
    }
    ```
  - *Pascal*:
    ```pascal
    program AriaCerc;
    var r, aria: double;
    begin
      read(r);
      aria := pi * r * r;
      writeln(aria);
    end.
    ```

---

=== 2. Tehnologia Informației (TIC): Tabele în procesoare de text
- *Noțiuni*: Celulă, linie, coloană. Tabelul se poate insera în corpul documentului sau în antet/subsol.
- *Inserare*: Din meniul Insert (Tabel $M times N$) sau prin desenarea manuală a tabelului.
- *Personalizare*: Îmbinare celule (Merge), divizare (Split), culori de fundal (Shading), borduri (Borders), lățime coloană (Width), înălțime rând (Height), aliniere text în celulă.

---

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Programare: n-ouroboros

*Soluție C++:*
```cpp
#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <sstream>

using namespace std;

int ouroboros(string s) {
    int len = s.length();
    int max_n = 0;
    for (int n = 1; 2 * n <= len; ++n) {
        string prefix = s.substr(0, n);
        string sufix = s.substr(len - n, n);
        if (prefix == sufix) {
            max_n = n;
        }
    }
    return max_n;
}

string to_lower_str(string s) {
    string res = s;
    for (char &c : res) {
        c = tolower(c);
    }
    return res;
}

int main() {
    string text;
    if (!getline(cin, text)) return 0;
    
    stringstream ss(text);
    string word;
    vector<string> words;
    int max_overall_n = 0;
    vector<string> best_words;
    
    while (ss >> word) {
        words.push_back(word);
        string lower_w = to_lower_str(word);
        int n = ouroboros(lower_w);
        if (n > max_overall_n) {
            max_overall_n = n;
            best_words.clear();
            best_words.push_back(word);
        } else if (n == max_overall_n && n > 0) {
            best_words.push_back(word);
        }
    }
    
    if (max_overall_n > 0) {
        cout << max_overall_n << endl;
        for (int i = 0; i < best_words.size(); ++i) {
            cout << best_words[i] << (i == best_words.size() - 1 ? "" : " ");
        }
        cout << endl;
    } else {
        cout << "NU" << endl;
    }
    
    return 0;
}
```

*Soluție Pascal:*
```pascal
program OuroborosText;
uses sysutils;

var
  textInput: string;
  words, best_words: array[1..100] of string;
  wordCount, bestWordCount, i, max_overall_n, n: integer;
  currWord: string;

function ouroboros(s: string): integer;
var
  len, max_n, n_val: integer;
  prefix, sufix: string;
begin
  len := length(s);
  max_n := 0;
  for n_val := 1 to len div 2 do
  begin
    prefix := copy(s, 1, n_val);
    sufix := copy(s, len - n_val + 1, n_val);
    if prefix = sufix then
      max_n := n_val;
  end;
  ouroboros := max_n;
end;

begin
  readln(textInput);
  wordCount := 0;
  bestWordCount := 0;
  max_overall_n := 0;
  
  // Împărțire în cuvinte
  currWord := '';
  for i := 1 to length(textInput) do
  begin
    if textInput[i] <> ' ' then
      currWord := currWord + textInput[i]
    else if currWord <> '' then
    begin
      wordCount := wordCount + 1;
      words[wordCount] := currWord;
      currWord := '';
    end;
  end;
  if currWord <> '' then
  begin
    wordCount := wordCount + 1;
    words[wordCount] := currWord;
  end;
  
  for i := 1 to wordCount do
  begin
    n := ouroboros(lowercase(words[i]));
    if n > max_overall_n then
    begin
      max_overall_n := n;
      bestWordCount := 1;
      best_words[1] := words[i];
    end
    else if (n = max_overall_n) and (n > 0) then
    begin
      bestWordCount := bestWordCount + 1;
      best_words[bestWordCount] := words[i];
    end;
  end;
  
  if max_overall_n > 0 then
  begin
    writeln(max_overall_n);
    for i := 1 to bestWordCount do
    begin
      write(best_words[i]);
      if i < bestWordCount then write(' ');
    end;
    writeln;
  end
  else
    writeln('NU');
end.
```

=== 2. Algoritm eficient: Sumă subset 2023
- *Algoritmul*: Utilizăm un vector caracteristic boolean `possible` de lungime $2024$, inițializat cu `false` și `possible[0] = true`. Citim numerele din fișier și, pentru fiecare număr $x$ care satisface $1 \le x \le 2023$, actualizăm posibilitatea sumelor de la 2023 în jos: `possible[v] = possible[v] || possible[v - x]`. Această abordare rulează în $O(M times 2023)$ unde $M \le 2023$, adică extrem de rapid. Spatiul este constant ($O(1)$).

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
using namespace std;

bool possible[2024];

int main() {
    ifstream fin("titu2023.in");
    if (!fin) { cout << "NU\n"; return 0; }
    possible[0] = true;
    int x;
    while (fin >> x) {
        if (x >= 1 && x <= 2023) {
            for (int v = 2023; v >= x; --v) {
                if (possible[v - x]) possible[v] = true;
            }
        }
    }
    fin.close();
    if (possible[2023]) cout << "DA\n";
    else cout << "NU\n";
    return 0;
}
```

*Soluție Pascal:*
```pascal
program Suma2023;
var
  fin: text;
  possible: array[0..2023] of boolean;
  x, v: integer;
begin
  assign(fin, 'titu2023.in'); reset(fin);
  for v := 0 to 2023 do possible[v] := false;
  possible[0] := true;
  while not eof(fin) do
  begin
    read(fin, x);
    if (x >= 1) and (x <= 2023) then
    begin
      for v := 2023 downto x do
        if possible[v - x] then possible[v] := true;
    end;
  end;
  close(fin);
  if possible[2023] then writeln('DA')
  else writeln('NU');
end.
```

---

= II. Rezolvare Titularizare Varianta 3 (17 iulie 2024)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2024/Tit_050_Informatica_P_2024_var_03_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2024/Tit_050_Informatica_P_2024_bar_03_LRO.pdf)

*(Notă: Acest subiect este identic cu cel din Titularizare 2025 Model).*

== SUBIECTUL I
=== 1. Structura de date: Arbori
Vezi Titularizare 2025 (Secțiunea I.1).

=== 2. Ergonomia postului de lucru
Vezi Titularizare 2025 (Secțiunea I.2).

== SUBIECTUL al II-lea
=== 1. Programare: Lanț muntos (Creastă)
Codul C++ și Pascal este identic cu cel din Titularizare 2025 (Secțiunea II.1).

=== 2. Algoritm eficient: Tije discuri
Codul C++ și Pascal de rezolvare a discurilor pe tije prin căutare binară în $O(N log N)$ (folosind datele din `titu2024.txt`).
*(Codul este identic cu cel din 2025, diferența fiind denumirea fișierului de intrare: `titu2024.txt`).*

== SUBIECTUL al III-lea
=== 1. Didactică: Formatarea textului
Vezi Titularizare 2025 (Secțiunea III.1).

=== 2. Evaluare: Itemi obiectivi
Vezi Titularizare 2025 (Secțiunea III.2).
