#include <iostream>
#include <fstream>
#include <vector>
#include <cmath>
#include <algorithm>

using namespace std;

// Un numar natural are un numar impar de divizori daca si numai daca este patrat perfect.
// Demonstratie: Divizorii unui numar se asociaza in perechi (d, x/d). 
// Singurul caz in care o pereche contine elemente egale este cand d = x/d, adica d^2 = x.
// Prin urmare, doar patratele perfecte au un divizor "nepereche", deci un numar total impar de divizori.
bool este_patrat_perfect(int x) {
    if (x < 0) return false;
    int r = round(sqrt(x));
    return r * r == x;
}

int main() {
    ifstream fin("divizori.in");
    ofstream fout("divizori.out");
    
    if (!fin) {
        cerr << "Eroare la deschiderea fisierului divizori.in" << endl;
        return 1;
    }
    
    int n;
    if (!(fin >> n)) return 0;
    
    vector<int> rez;
    for (int i = 0; i < n; ++i) {
        int x;
        fin >> x;
        if (este_patrat_perfect(x)) {
            rez.push_back(x);
        }
    }
    
    if (rez.empty()) {
        fout << "nu exista\n";
    } else {
        // Sortare descrescatoare
        sort(rez.begin(), rez.end(), greater<int>());
        for (size_t i = 0; i < rez.size(); ++i) {
            fout << rez[i] << (i == rez.size() - 1 ? "" : " ");
        }
        fout << "\n";
    }
    
    return 0;
}
