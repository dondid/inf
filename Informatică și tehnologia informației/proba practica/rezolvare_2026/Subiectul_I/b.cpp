#include <iostream>
#include <fstream>
#include <vector>

using namespace std;

// Subprogramul afla_minim primeste prin n numarul de elemente ale unui vector,
// iar prin v elementele vectorului. Returneaza valoarea minima din vector.
long long afla_minim(int n, const long long v[]) {
    long long val_min = v[0];
    for (int i = 1; i < n; ++i) {
        if (v[i] < val_min) {
            val_min = v[i];
        }
    }
    return val_min;
}

int main() {
    ifstream fin("minim.in");
    ofstream fout("minim.out");
    
    if (!fin) {
        cerr << "Eroare la deschiderea fisierului minim.in" << endl;
        return 1;
    }
    
    int n;
    if (!(fin >> n)) return 0;
    
    long long v[100];
    for (int i = 0; i < n; ++i) {
        fin >> v[i];
    }
    
    // Se cere determinarea minimului din prima jumatate a celor n numere.
    // Daca n este impar (ex: 5), prima jumatate poate fi considerata n/2 (2 elemente)
    // sau (n+1)/2 (3 elemente). De regula, in algoritmi se utilizeaza n/2 (impartirea intreaga).
    // Daca n = 1, prima jumatate va avea cel putin 1 element.
    int jumatate = n / 2;
    if (jumatate == 0) jumatate = 1;
    
    long long minim_jumatate = afla_minim(jumatate, v);
    fout << minim_jumatate << "\n";
    
    return 0;
}
