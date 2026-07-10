#set page(
  paper: "a4",
  margin: (x: 2.5cm, y: 2.5cm),
  header: align(right)[*Pregătire Examen Titularizare 2011*],
  footer: [
    #line(length: 100%, stroke: 0.5pt + luma(150))
    #grid(
      columns: (1fr, 1fr),
      align(left)[Rezolvare Examen Titularizare Var 2011],
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
  #text(size: 12pt)[Anul 2011 - Informatică și Tehnologia Informației]
]

#v(1cm)
#outline(indent: 1.5em)
#pagebreak()

= I. Rezolvare Titularizare Varianta 2 (13 iulie 2011)

[Subiect PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2011/T_051_Informatica_si_tehnologia_informatiei_P_Subiect_2_final.pdf) | [Barem PDF](file:///wsl.localhost/Debian/home/daniel/projects/inf/Informatică și tehnologia informației/2011/T_051_Informatica_si_Tehnologia_informatiei_P_Barem_2_final.pdf)

== SUBIECTUL I (30 de puncte)

=== 1. Conexitatea grafurilor neorientate
- *Definiții*:
  - *Graf neorientat*: O pereche $G = (V, E)$ de noduri și muchii.
  - *Adiacență*: Relația dintre două noduri conectate printr-o muchie.
  - *Lanț*: O succesiune de noduri adiacente.
  - *Conexitate*: Un graf este conex dacă între oricare două noduri există cel puțin un lanț.
  - *Componentă conexă*: Un subgraf conex maximal.
- *Aplicații practice*:
  - *Rețele sociale*: Determinarea grupurilor de prieteni interconectați.
  - *Infrastructură*: Verificarea dacă toate orașele sunt legate rutier/feroviar.
- *Algoritm de determinare*: BFS sau DFS pentru identificarea componentelor conexe prin parcurgeri succesive.

---

=== 2. Programare: Numere prime (tprim)
- *Descriere*: Programul determină al $N$-lea număr prim. Pentru optimizare la determinarea apartenenței lui $P$, se generează al $N$-lea prim (limita superioară). Dacă $P \le "tprim"(N)$ și $P$ este prim, atunci $P$ se află în primele $N$ numere prime, altfel nu.

*Soluție C++:*
```cpp
#include <iostream>
using namespace std;

bool isPrime(long long val) {
    if (val < 2) return false;
    for (long long d = 2; d * d <= val; ++d) {
        if (val % d == 0) return false;
    }
    return true;
}

int tprim(int n) {
    int count = 0;
    int val = 2;
    while (true) {
        if (isPrime(val)) {
            count++;
            if (count == n) return val;
        }
        val++;
    }
}

int main() {
    long long p;
    int n;
    if (!(cin >> p >> n)) return 0;

    long long limit = tprim(n);
    if (p <= limit && isPrime(p)) {
        cout << "DA\n";
    } else {
        cout << "NU\n";
    }
    return 0;
}
```

*Soluție Pascal:*
```pascal
program NumerePrime;
var
  p: int64;
  n: integer;
  limit: int64;

function isPrime(val: int64): boolean;
var d: int64;
begin
  if val < 2 then
  begin
    isPrime := false;
    exit;
  end;
  d := 2;
  while d * d <= val do
  begin
    if val mod d = 0 then
    begin
      isPrime := false;
      exit;
    end;
    d := d + 1;
  end;
  isPrime := true;
end;

function tprim(n_val: integer): integer;
var
  count, val: integer;
begin
  count := 0;
  val := 2;
  while true do
  begin
    if isPrime(val) then
    begin
      count := count + 1;
      if count = n_val then
      begin
        tprim := val;
        exit;
      end;
    end;
    val := val + 1;
  end;
end;

begin
  readln(p, n);
  limit := tprim(n);
  if (p <= limit) and isPrime(p) then
    writeln('DA')
  else
    writeln('NU');
end.
```

---

== SUBIECTUL al II-lea (30 de puncte)

=== 1. Structura sistemelor de calcul: Dispozitive periferice
- *Rol*: Interfață I/O pentru comunicarea datelor cu UCP.
- *Clasificare*:
  - *Intrare*: Tastatură, Mouse.
  - *Ieșire*: Monitor, Imprimantă.
  - *Stocare/Mixte*: Placă de rețea.
- *Parametri*: Rezoluție DPI monitor, polling rate mouse, viteza de printare (PPM).

---

=== 2. Structuri de date: Înregistrare (produs)
- *C++*:
  ```cpp
  struct produs {
      char denumire[100];
      double pret;
  };
  produs x[2000];
  // Afișare preț pe poziția 10
  cout << x[9].pret; // 0-indexed sau x[10].pret dacă e 1-indexed
  ```
- *Pascal*:
  ```pascal
  type
    produs = record
      denumire: string;
      pret: real;
    end;
  var
    x: array[1..2000] of produs;
  // Afișare preț pe poziția 10
  writeln(x[10].pret);
  ```

---

=== 3. Algoritm eficient: Drum de sumă maximă în matrice pătratică (DP)

*Soluție C++:*
```cpp
#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
    ifstream fin("NR.TXT");
    int n;
    if (!(fin >> n)) return 0;
    vector<vector<long long>> A(n, vector<long long>(n));
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            fin >> A[i][j];
        }
    }
    fin.close();

    vector<vector<long long>> dp(n, vector<long long>(n, 0));
    for (int j = 0; j < n; ++j) {
        dp[0][j] = A[0][j];
    }

    for (int i = 1; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            long long prev_max = dp[i-1][j];
            if (j > 0) prev_max = max(prev_max, dp[i-1][j-1]);
            if (j < n - 1) prev_max = max(prev_max, dp[i-1][j+1]);
            dp[i][j] = A[i][j] + prev_max;
        }
    }

    long long ans = dp[n-1][0];
    for (int j = 1; j < n; ++j) {
        ans = max(ans, dp[n-1][j]);
    }

    cout << ans << endl;
    return 0;
}
```

*Soluție Pascal:*
```pascal
program MaxPathSum;
var
  fin: text;
  n, i, j: integer;
  A: array[1..100, 1..100] of integer;
  dp: array[1..100, 1..100] of int64;
  prev_max, ans: int64;
begin
  assign(fin, 'NR.TXT'); reset(fin);
  read(fin, n);
  for i := 1 to n do
    for j := 1 to n do
      read(fin, A[i, j]);
  close(fin);

  for j := 1 to n do dp[1, j] := A[1, j];

  for i := 2 to n do
  begin
    for j := 1 to n do
    begin
      prev_max := dp[i - 1, j];
      if j > 1 then
      begin
        if dp[i - 1, j - 1] > prev_max then prev_max := dp[i - 1, j - 1];
      end;
      if j < n then
      begin
        if dp[i - 1, j + 1] > prev_max then prev_max := dp[i - 1, j + 1];
      end;
      dp[i, j] := A[i, j] + prev_max;
    end;
  end;

  ans := dp[n, 1];
  for j := 2 to n do
  begin
    if dp[n, j] > ans then ans := dp[n, j];
  end;
  writeln(ans);
end.
```

---

== SUBIECTUL al III-lea (30 de puncte)

=== Test scris sumativ - Informatică, clasa a IX-a
*Capitole*: algoritmi elementari, structuri de control, tablouri unidimensionale. *Timp de lucru*: 50 de minute. Se acordă 90 de puncte și 10 puncte din oficiu.

#table(
  columns: (1.3fr, 2.6fr, 2.1fr),
  inset: 5pt,
  [*Item*], [*Enunț*], [*Răspuns / barem*],
  [Pereche 1 (10p)], [Asociați operația cu rolul ei: `n mod 10`, `n div 10`, `i++`.], [`n mod 10` - ultima cifră; `n div 10` - elimină ultima cifră; `i++` - incrementare.],
  [Pereche 2 (10p)], [Asociați structura cu situația: `if`, `while`, `for`.], [`if` - decizie; `while` - repetare cu număr necunoscut de pași; `for` - număr cunoscut de pași.],
  [Răspuns scurt 1 (10p)], [Ce afișează algoritmul care însumează cifrele lui `123`?], [`6`.],
  [Completare 2 (10p)], [Într-un vector `v`, elementul de pe poziția `i` se notează [spațiu liber].], [`v[i]` sau `v[i]` în C/C++, `v[i]`/`v[i]` după convenția predată.],
  [Întrebare structurată (20p)], [Pentru vectorul `4 7 2 9`: precizați maximul, poziția sa și descrieți algoritmul.], [Maxim `9`, poziția 4; parcurgere liniară cu variabilă `max`.],
  [Problemă (30p)], [Scrieți un algoritm care citește `n` și `n` valori și afișează câte sunt pare.], [Citire corectă 5p, parcurgere 10p, test paritate 10p, afișare 5p.]
)
