#include<iostream>
#include<vector>
#include<time.h>
using namespace std;


int main(int argc, char** argv) {
	cout.setf(ios::fixed);
	cout.precision(2); 
	srand(time(NULL));

	int D,N;

  N = atoi(argv[1]);
    int  maxD = (N + 1)/2;
    //The sum of random variables approximates to a normal distribution
	D = rand()%(maxD/4) + rand()%(maxD/4) + rand()%(maxD/4) + rand()%(maxD/4) + 1;

	vector<int> n(D);
	vector<int> d(N);
	vector<vector<float>> m(N, vector<float>(N));
	for (int i = 0; i < D; ++i) {
		n[i] = rand() % ((N + D - 1)/D + 1);
	}

	int k = 0;
	for (int i = 0; i < D; ++i) {
		int aux = n[i];
		for (int j = k; j < k + aux; ++j) {
            d[j] = i + 1;
		}
        k = k + aux;
	}
    

    for (int i = k; i < N; ++i) {
		d[i] = (rand() % D) + 1;
    }
	

	for (int i = 0; i < N; ++i) {
        m[i][i] = 1;
        for (int j = i + 1; j < N; ++j) {
            int chance = rand()%100;
            if (chance < 2) {
                m[i][j] = 0.0f; 
                m[j][i] = 0.0f;
            }

            else if (chance < 10) {
                m[i][j] = float (rand())/ float(RAND_MAX); 
                m[i][j] = m[i][j] * 0.15; 
                m[j][i] = m[i][j];
            }
            else if (chance < 30) {
                m[i][j] = float (rand())/ float(RAND_MAX); 
                m[i][j] = m[i][j] * 0.15 + 0.85;
                m[j][i] = m[i][j];
            }
            else {
                m[i][j] = float (rand())/ float(RAND_MAX); 
                m[i][j] = m[i][j] * 0.7 + 0.15; 
                m[j][i] = m[i][j];

            }


        }
    }

	cout << "D = " << D << ";" << endl;
	cout << "n = [ ";
	for (int i = 0; i < D; ++i) cout << n[i] << " ";
	cout << "];" << endl;

	cout << endl;
	cout << "N = " << N << ";" << endl;
	cout << "d = [ ";
	for (int i = 0; i < N; ++i) cout << d[i] << " ";
	cout << "];" << endl;

	cout << "m = [" << endl;
	for (int i = 0; i < N; ++i) {
		cout << "[ ";
		for (int j = 0; j < N; ++j) cout << m[i][j] << " ";
		cout << "]" << endl;
	}
	cout << "];" << endl;
}
