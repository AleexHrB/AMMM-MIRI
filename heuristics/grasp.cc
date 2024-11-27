#include <iostream>
#include <list>
#include <vector>
#include <cfloat>
using namespace std;

#define ERROR -1

float alphaHold;


bool feasibleSol(unsigned int candidate, unsigned int D, unsigned int* np, bool* valid, unsigned int N, unsigned int* d, float** m, const list<unsigned int>& candidates) {

    //Need someone from his department
    if (np[d[candidate] - 1] == 0) return false;

    //Trust enough in case that needed
    for (unsigned int x : candidates) {

        if (m[candidate][x] < 0.15f) {
            
            bool exist = false;
            auto it = candidates.begin();
            while (not exist and it != candidates.end()) {
                unsigned int aux = *it;
                exist = m[x][aux] > 0.85f and m[candidate][aux] > 0.85f;
                ++it;
            }

            if (not exist) return false;
        }
    }
    return true;
}

pair<float, float> setRCL(const list<unsigned int>& candidates, bool* selected, bool* valid, unsigned int N, float** m, vector<pair<float, unsigned int>>& rcl, unsigned int D, unsigned int* np, unsigned* d) {

    //Best / Worst
    pair<float, float> p = {-1.0f, FLT_MAX};

    for (unsigned int i = 0; i < N; ++i) {

        if (not valid[i] or selected[i] or not feasibleSol(i, D, np, valid, N, d, m, candidates)) {
            rcl[i] = {-1.0f, i};
            continue;
        }

        float localCompat = 0.0f;
        for (unsigned int cand : candidates) localCompat += m[i][cand];
        rcl[i] = {localCompat, i};

        if (localCompat > p.first) p.first = localCompat;
        if (localCompat < p.second) p.second = localCompat;
    }

    return p;
}


bool graspInit(unsigned int D, unsigned int* np, unsigned int N, unsigned int* d, float** m, bool* selected, float alpha) {

    bool valid[N];
    srand(time(NULL));

    unsigned int npCopy[D];

    for (unsigned int i = 0; i < N; ++i) {
        selected[i] = false;
        valid[i] = true;
    }

    unsigned int commite = 0;
    for (unsigned int p = 0; p < D; ++p) {
        commite += np[p];
        npCopy[p] = np[p];
    }

    list<unsigned int> candidates;

    while (commite > 0) {
        vector<pair<float, unsigned int>> rcl(N);
        pair<float, float> maxMin = setRCL(candidates, selected, valid, N, m, rcl, D, npCopy, d);

        if (maxMin.first < 0.0f) break;

        alphaHold = maxMin.first - alpha * (maxMin.first - maxMin.second);
        rcl.erase(remove_if(rcl.begin(), rcl.end(), [] (const pair<float, unsigned int>& p) {
                return p.first < alphaHold;
                }), rcl.end());

        if (rcl.empty()) break;
        unsigned int choosen = rand() % rcl.size();
        unsigned int selectedGuy = rcl[choosen].second;
        candidates.push_back(selectedGuy);
        selected[selectedGuy] = true;
        for (unsigned int i = 0; i < N; ++i) if (m[selectedGuy][i] == 0.0f) valid[i] = false;
        --npCopy[d[selectedGuy] - 1];
        --commite;
    }

    return commite == 0;
}
