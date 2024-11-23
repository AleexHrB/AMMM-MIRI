 bool valid(unsigned int a, unsigned int b, unsigned int* d, unsigned int N, float** m, bool* selected) {
    if (d[a] != d[b]) return false;
    unsigned int outside = selected[a] ? b:a;
    unsigned int inside = selected[a] ? a:b;

    selected[inside] = false;
    selected[outside] = true;
    bool validSwap = true;

    for (unsigned int i = 0; i < N and validSwap; ++i) if (selected[i] and m[outside][i] == 0.0f) validSwap = false;

    for (unsigned int i = 0; i < N and validSwap; ++i) {
        for (unsigned int j = i + 1; j < N and validSwap; ++j) {
            if (selected[i] and selected[j] and m[i][j] < 0.15f) {
                bool found = false;
                for (unsigned int k = 0; k < N and not found; ++k)
                    if (selected[k]) found = m[i][k] > 0.85f and m[j][k] > 0.85f;
                validSwap = found;
            }
        }
    }

    //for (unsigned int i = 0; i < N; ++i){
    //    if (selected[i] && i != inside && m[outside][i] == 0.0f) return false;
    //    else if (selected[i] && i != inside && m[outside][i] < 0.15f) {
    //        bool valid = false;
    //        for (unsigned int j = 0; j < N && !valid; ++j)  {
    //            valid = selected[j] && j != inside && m[outside][j] > 0.85f && m[i][j] > 0.85f;
    //        }
    //        if (!valid) return false;
    //    } 
    //}

    selected[inside] = true;
    selected[outside] = false;
    return validSwap;    
}

bool operatorSwapFirst(unsigned int D, unsigned int* np, unsigned int N, unsigned int* d, float** m, bool* selected) {
    for (unsigned int i = 0; i < N; ++i) {
        for (unsigned int j = i + 1; j < N; ++j) {
            if (selected[i] != selected[j] && valid(i,j, d, N, m, selected)) {
                unsigned int outside = selected[i] ? j:i;
                unsigned int inside = selected[i] ? i:j;

                float out, in;
                out = in = 0.0f;
                for (unsigned int k = 0; k < N; ++k) {
                    if (selected[k] && k != inside) {
                        out += m[outside][k];
                        in += m[inside][k];
                    }
                }
                if (out > in) {
                    selected[outside] = true;
                    selected[inside] = false;
                    return true;
                }
            }
        }
    }
    return false;
 }


bool operatorSwapBest(unsigned int D, unsigned int* np, unsigned int N, unsigned int* d, float** m, bool* selected) {   
    unsigned int bestIn = -1;
    unsigned int bestOut = -1;
    float bestVal = 0.0f;
    for (unsigned int i = 0; i < N; ++i) {
        for (unsigned int j = i + 1; j < N; ++j) {
            if (selected[i] != selected[j] && valid(i,j, np, N, m, selected)) {
                unsigned int outside = selected[i] ? j:i;
                unsigned int inside = selected[i] ? i:j;

                float out, in;
                out = in = 0.0f;
                for (unsigned int k = 0; k < N; ++k) {
                    if (selected[k] && k != inside) {
                        out += m[outside][k];
                        in += m[inside][k];
                    }
                }

                if (out - in > bestVal) {
                    bestOut = outside;
                    bestIn = inside;
                    bestVal = out - in;
                }
            }
        }
    }
    if (bestIn != -1) {
        selected[bestIn] = false;
        selected[bestOut] = true;
        return true;
    }
    return false;
}

 


void hillClimbing(unsigned int D, unsigned int* np, unsigned int N, unsigned int* d, float** m, bool* selected) { 
 bool improvement = true;
  while (improvement) {
    improvement = operatorSwapFirst(D, np, N, d, m, selected);
  }  
}


