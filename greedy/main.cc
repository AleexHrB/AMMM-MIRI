#include <iostream>
#include <regex>
#include <fstream>
#include <stdlib.h>
#include "greedy.cc"
using namespace std;

bool readInteger(const string& s, unsigned int& n) {

    regex intRegex("[0-9]+");
    smatch match;

    if (regex_search(s, match, intRegex)) {
        n = stoi(match.str(0));
        return true;
    } 

    else return false;
}

bool readArray(string& s, unsigned int* v, unsigned int size) {

    regex intRegex("[0-9]+");

    smatch sm;
    unsigned int i = 0;

    while (regex_search(s, sm, intRegex)) {
        v[i] = stoi(sm.str(0));
        s = sm.suffix().str();
        ++i;
    }

    return i == size;

}

bool readArrayFloat(string& s, float* v, unsigned int size) {

    regex floatRegex("[0-1].[0-9][0-9]");

    smatch sm;
    unsigned int i = 0;

    while (regex_search(s, sm, floatRegex)) {
        v[i] = stof(sm.str(0));
        s = sm.suffix().str();
        ++i;
    }

    return i == size;

}


int main(int argc, char **argv) {

    if (argc < 3) {
        cout << "Please provide file path and input" << endl;
        return -1;
    }

    bool greedySolution = argv[2][2] == 'e';

    const char* nameFile = argv[1];
    ifstream file(nameFile);

    unsigned int D;
    unsigned int N;



    if (!file.is_open()) {  
        cout << "Error opening file!" << endl;
        return -1;
    }

    string s;
    getline(file, s);

    if (not readInteger(s, D)) {
        cout << "Error reading D" << endl;
        return -1;
    }


    getline(file, s);
    unsigned int np[D];

    if (not readArray(s, np, D)) {
        cout << "Error reading np" << endl;
        return -1;
    }


    getline(file, s);
    getline(file, s);

    if (not readInteger(s, N)) {
        cout << "Error reading N" << endl;
        return -1;
    }


    getline(file, s);
    unsigned int d[N];

    if (not readArray(s, d, N)) {
        cout << "Error reading d" << endl;
        return -1;
    }

    float **m = (float**)malloc(N*sizeof(float*));

    for (unsigned int i = 0; i < N; ++i) {
        m[i] = (float*) malloc(N*sizeof(float));
        while (not readArrayFloat(s,m[i], N)) getline(file, s);
    }

    file.close();

    if (greedySolution) greedy(D,np,N,d,m);
    else cout << "Juan Maricon" << endl;

    for (unsigned int i = 0; i < N; ++i) free(m[i]);
    free(m);
}
