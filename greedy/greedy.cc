#include <iostream>
#include <list>
#include <map>
using namespace std;

#define ERROR -1

int findBestGuy(const list<unsigned int>& candidates, bool* selected, bool* valid, unsigned int N, float** m) {

    int bestGuy = ERROR;
    float compat = -1.0f;

    for (unsigned int i = 0; i < N; ++i) {

        if (not valid[i] or selected[i]) continue;

        float localCompat = 0.0f;
        for (unsigned int cand : candidates) localCompat += m[i][cand];

        if (localCompat > compat) {
            compat = localCompat;
            bestGuy = i;
        }
    }

    return bestGuy;
}

bool feasible(unsigned int candidate, unsigned int D, unsigned int* np, bool* valid, unsigned int N, unsigned int* d, float** m, const list<unsigned int>& candidates) {

    //Need someone from his department
    if (np[d[candidate] - 1] == 0) return false;

    //Trust enough in case that needed
    for (unsigned int x : candidates) {

        if (m[candidate][x] < 0.15f) {
            
            bool exist = false;
            auto it = candidates.begin();
            while (not exist and it != candidates.end()) {
                unsigned int aux = *it;
                exist = m[x][aux] > 0.85 and m[candidate][aux] > 0.85;
                ++it;
            }

            if (not exist) return false;
        }
    }

    //Remove ones that not feasible and return true
    for (unsigned int i = 0; i < N; ++i) if (m[candidate][i] == 0.0f) valid[i] = false;

    return true;
}

inline bool validSolution(unsigned int D, unsigned int* np) {

    for (unsigned int p = 0; p < D; ++p) if (np[p] != 0) return false;
    return true;
}

bool* greedy(unsigned int D, unsigned int* np, unsigned int N, unsigned int* d, float** m) {
    
    bool valid[N];
    bool selected[N];
    list<unsigned int> candidates;


    for (unsigned int i = 0; i < N; ++i) {
        valid[i] = true;
        selected[i] = false;
    }

    unsigned int commite = 0;
    for (unsigned int p = 0; p < D; ++p) commite += np[p];


    map<float, unsigned int> mp;

    for (unsigned int i = 0; i < N; ++i) {
        float f = 0.0f;
        for (unsigned int j = 0; j < N; ++j) f += m[i][j];
        mp.insert({f, i});
    }

    auto it = mp.begin();
    int bestCandidate = it -> second;
    ++it;

    while (it != mp.end() and not feasible(bestCandidate, D, np, valid, N, d, m, candidates)) {
        bestCandidate = it -> second;
        ++it;
    }

    if (it == mp.end()) bestCandidate = ERROR;

    while (commite > 0 and bestCandidate != ERROR) {

        if (feasible(bestCandidate, D, np, valid, N, d, m, candidates)) {
            candidates.push_back(bestCandidate);
            --commite;
            --np[d[bestCandidate] - 1];
            selected[bestCandidate] = true;
        }

        else valid[bestCandidate] = false;
        //for (unsigned int p = 0; p < D; ++p) cout <<np[p]<<" ";
        //cout << endl;
        bestCandidate = findBestGuy(candidates, selected, valid, N, m);
    }

    if (commite > 0) {
        cout << "There is no solution using a greedy algorithm" << endl;
        return nullptr;
    }

    else {
        
        cout << "OBJECTIVE: ";

        float f = 0.0f;

        for (unsigned int i = 0; i < N; ++i) {
            for (unsigned int j = i+1; j < N and selected[i]; ++j) {
                if (selected[j]) f += m[i][j];
            }
        }

        unsigned int finalNum = candidates.size();
        f *= 2.0f/(finalNum * (finalNum - 1));
        cout << f << endl;

        cout << "Commission: ";
        for (unsigned int i = 0; i < N; ++i) if (selected[i]) cout << i + 1 << " ";
        cout << endl;
        return selected;
    }
}
