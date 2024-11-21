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
	D = rand()%N + 1;

	vector<int> n(D);
	vector<int> d(N);
	vector<vector<float>> m(N, vector<float>(N));

	for (int i = 0; i < D; ++i) {
		n[i] = rand() % ((N + D - 1)/D + 1);
	}
	for (int i = 0; i < N; ++i) {
		d[i] = (rand() % D) + 1;
	}

	for (int i = 0; i < N; ++i) {
		m[i][i] = 1;
		for (int j = i + 1; j < N; ++j) {
			m[i][j] =  float((rand())) / float((RAND_MAX));
			m[j][i] = m[i][j];

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
