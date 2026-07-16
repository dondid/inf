#include <iostream>
#include <fstream>
#include <algorithm>

using namespace std;

int main() {
    ifstream fin("minim.in");
    ofstream fout("minim.out");
    
    if (!fin) {
        cerr << "Eroare la deschiderea fisierului minim.in" << endl;
        return 1;
    }
    
    int n;
    if (!(fin >> n)) return 0;
    
    long long val_min;
    if (fin >> val_min) {
        for (int i = 1; i < n; ++i) {
            long long x;
            fin >> x;
            if (x < val_min) {
                val_min = x;
            }
        }
        fout << val_min << "\n";
    }
    
    return 0;
}
