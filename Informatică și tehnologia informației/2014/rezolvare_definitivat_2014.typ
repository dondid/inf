#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Definitivare 2014*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Definitivat Var 2014],
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
  #text(size: 12pt)[Anul 2014 - Informatică]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Definitivat Varianta 1 (14 iulie 2014)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2014/Def_MET_056_Informatica_P_2014_var_01_LRO.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2014/Def_MET_056_Informatica_P_2014_bar_01_LRO.pdf)

== SUBIECTUL I (30 de puncte)

=== 1. Grafuri Hamiltoniene
- *Definiții*:
  - *Ciclu hamiltonian*: Un ciclu elementar care conține toate nodurile grafului exact o singură dată.
  - *Graf hamiltonian*: Un graf care conține cel puțin un ciclu hamiltonian.
- *Teoremă de caracterizare*: Teorema lui Dirac: Dacă $G$ este un graf neorientat cu $n \ge 3$ noduri, în care gradul fiecărui nod $v$ satisface condiția $d(v) \ge n/2$, atunci $G$ este hamiltonian.
- *Problemă (Determinare ciclu hamiltonian)*:
  - *C++ (Backtracking)*:
    ```cpp
    #include <iostream>
    #include <vector>
    using namespace std;
    int n, m, x[20];
    bool viz[20], ad[20][20];
    void afisare() {
        for (int i = 1; i <= n; ++i) cout << x[i] << " ";
        cout << x[1] << "\n";
    }
    void backtrack(int k) {
        for (int val = 1; val <= n; ++val) {
            if (!viz[val] && ad[x[k-1]][val]) {
                x[k] = val;
                viz[val] = true;
                if (k == n) {
                    if (ad[val][x[1]]) afisare();
                } else backtrack(k + 1);
                viz[val] = false;
            }
        }
    }
    ```

---

=== 2. Structura sistemelor de calcul: Sistemul de operare
- *Definiție*: Un ansamblu de programe care controlează resursele hardware ale sistemului de calcul și oferă o interfață între utilizator și aplicații.
- *Funcții*:
  1. Gestiunea proceselor (alocarea procesorului).
  2. Gestiunea memoriei interne (RAM).
  3. Gestiunea sistemului de fișiere (stocarea pe medii externe).

---

=== 3. Programare: Secvență de elemente cu cifre egale (distinct = 1)

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <algorithm>
using namespace std;

int distinct(long long n) {
    bool ap[10] = {false};
    int count = 0;
    long long temp = n;
    if (temp == 0) return 1;
    while (temp > 0) {
        int cif = temp % 10;
        if (!ap[cif]) {
            ap[cif] = true;
            count++;
        }
        temp /= 10;
    }
    return count;
}

int main() {
    ifstream fin("DATE.TXT");
    long long x;
    int max_len = 0;
    int current_len = 0;
    while (fin >> x) {
        if (distinct(x) == 1) {
            current_len++;
        } else {
            if (current_len >= 2) {
                max_len = max(max_len, current_len);
            }
            current_len = 0;
        }
    }
    if (current_len >= 2) {
        max_len = max(max_len, current_len);
    }
    fin.close();

    if (max_len < 2) cout << "Nu exista\n";
    else cout << max_len << "\n";

    return 0;
}
```

*Soluție Pascal:*
```pascal
program SecventeEgale;
var
  fin: text;
  x: int64;
  max_len, curr_len: integer;

function distinct(n: int64): integer;
var
  ap: array[0..9] of boolean;
  count, i, cif: integer;
  temp: int64;
begin
  for i := 0 to 9 do ap[i] := false;
  count := 0;
  temp := n;
  if temp = 0 then
  begin
    distinct := 1;
    exit;
  end;
  while temp > 0 do
  begin
    cif := temp mod 10;
    if not ap[cif] then
    begin
      ap[cif] := true;
      count := count + 1;
    end;
    temp := temp div 10;
  end;
  distinct := count;
end;

begin
  assign(fin, 'DATE.TXT');
  reset(fin);
  max_len := 0;
  curr_len := 0;
  while not eof(fin) do
  begin
    read(fin, x);
    if distinct(x) = 1 then
      curr_len := curr_len + 1
    else
    begin
      if curr_len >= 2 then
      begin
        if curr_len > max_len then max_len := curr_len;
      end;
      curr_len := 0;
    end;
  end;
  if curr_len >= 2 then
  begin
    if curr_len > max_len then max_len := curr_len;
  end;
  close(fin);

  if max_len < 2 then writeln('Nu exista')
  else writeln(max_len);
end.
```

---

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Aspecte ale proiectării didactice pentru conținutul A: Structuri repetitive

==== a) Tipuri de lecție și momente ale lecției
*Tipuri de lecție*:
1. Lecție de comunicare/însușire de noi cunoștințe.
2. Lecție de formare de priceperi și deprinderi.
3. Lecție de recapitulare și sistematizare.

*Momente esențiale ale lecției*:
1. Organizarea clasei și captarea atenției.
2. Anunțarea temei și a obiectivelor.
3. Dirijarea învățării prin explicații, exemple și exerciții.
4. Fixarea, evaluarea și formularea temei pentru acasă.

==== b) Activități de învățare
Pentru capitolul *Structuri repetitive*, pot fi folosite următoarele activități:
1. Identificarea situațiilor în care este necesară repetarea unui bloc de instrucțiuni.
2. Compararea structurilor `while`, `do...while` și `for`.
3. Implementarea unui algoritm de calcul al sumei cifrelor unui număr.
4. Testarea programului pentru cazuri limită: număr cu o singură cifră, număr terminat în zero, număr mare.

*Scenariu pentru activitatea 3*:
- Profesorul propune problema: „Se citește un număr natural. Să se determine suma cifrelor sale.”
- Profesorul întreabă ce operații permit extragerea ultimei cifre și eliminarea acesteia. Elevii identifică `n mod 10` și `n div 10`.
- Profesorul construiește împreună cu elevii structura repetitivă: cât timp `n > 0`, se adaugă ultima cifră la sumă și se elimină cifra.
- Elevii implementează algoritmul, rulează exemple și verifică manual rezultatele.

*Soluție C++*:
```cpp
#include <iostream>
using namespace std;

int main() {
    int n, s = 0;
    cin >> n;
    while (n > 0) {
        s += n % 10;
        n /= 10;
    }
    cout << s;
    return 0;
}
```

=== 2. Test oral pentru conținutul A: Structuri repetitive

#table(
  columns: (1.2fr, 2.6fr, 2.2fr),
  inset: 5pt,
  [*Item*], [*Enunț*], [*Răspuns așteptat*],
  [1], [Ce este o structură repetitivă?], [O instrucțiune care execută repetat un bloc cât timp o condiție este îndeplinită sau pentru un număr determinat de pași.],
  [2], [Când este recomandată folosirea instrucțiunii `for`?], [Când numărul de repetări este cunoscut sau determinabil înaintea buclei.],
  [3], [Ce diferență există între `while` și `do...while`?], [`while` testează condiția înainte de execuție, `do...while` după execuție, deci execută blocul cel puțin o dată.],
  [4], [Ce se întâmplă dacă într-o buclă `while` condiția nu devine niciodată falsă?], [Apare o buclă infinită.],
  [5], [Dați un exemplu de problemă rezolvată cu repetare.], [Suma cifrelor unui număr, numărarea divizorilor, parcurgerea unui vector etc.]
)

---

== SUBIECTUL al III-lea (30 de puncte)

=== Învățarea: concept, condiții interne și condiții externe

*Concept*: Învățarea este procesul psihopedagogic prin care individul dobândește cunoștințe, deprinderi, capacități, atitudini și comportamente noi, pe baza experienței și exercițiului. În școală, învățarea este organizată, dirijată și evaluată, având ca scop dezvoltarea competențelor elevilor.

*Condiții interne ale învățării*:
- motivația elevului și interesul pentru sarcină;
- nivelul de dezvoltare intelectuală și cunoștințele anterioare;
- atenția, memoria, capacitatea de concentrare;
- stilul de învățare și încrederea în propriile posibilități;
- starea afectivă și disponibilitatea pentru efort.

La informatică, un elev care stăpânește operațiile aritmetice de bază și are motivație pentru rezolvarea problemelor va înțelege mai ușor structurile repetitive.

*Condiții externe ale învățării*:
- calitatea explicației profesorului;
- metodele didactice folosite;
- organizarea clasei și climatul educațional;
- mijloacele de învățământ: calculator, proiector, fișe de lucru, platforme online;
- timpul alocat exersării și feedbackul primit.

Învățarea eficientă apare prin corelarea condițiilor interne cu cele externe. Profesorul adaptează sarcinile la nivelul elevilor, oferă exemple gradate, creează situații de exersare și verifică permanent înțelegerea.
