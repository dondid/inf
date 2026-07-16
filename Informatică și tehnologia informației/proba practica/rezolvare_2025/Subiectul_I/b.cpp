#include <iostream>
#include <fstream>

using namespace std;

// Subprogramul nrdiv primeste ca parametru un numar natural n si returneaza numarul de divizori ai sai.
int nrdiv(int n) {
    int cnt = 0;
    int i = 1;
    for (; i * i <= n; ++i) {
        if (n % i == 0) {
            cnt++;
            if (i * i != n) {
                cnt++;
            }
        }
    }
    return cnt;
}

// Subprogramul ordonare primeste numarul de elemente n si tabloul v si il ordoneaza descrescator.
void ordonare(int n, int v[]) {
    for (int i = 0; i < n - 1; ++i) {
        for (int j = i + 1; j < n; ++j) {
            if (v[i] < v[j]) {
                int aux = v[i];
                v[i] = v[j];
                v[j] = aux;
            }
        }
    }
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
    
    int v[100];
    int count = 0;
    
    for (int i = 0; i < n; ++i) {
        int x;
        fin >> x;
        // Daca numarul de divizori este impar, il retinem in tablou
        if (nrdiv(x) % 2 != 0) {
            v[count++] = x;
        }
    }
    
    if (count == 0) {
        fout << "nu exista\n";
    } else {
        ordonare(count, v);
        for (int i = 0; i < count; ++i) {
            fout << v[i] << (i == count - 1 ? "" : " ");
        }
        fout << "\n";
    }
    
    return 0;
}
