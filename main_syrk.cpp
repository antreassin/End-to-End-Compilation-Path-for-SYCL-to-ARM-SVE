#include <iostream>
#include <cstdlib>
#include <chrono>
#include <fstream> 

using namespace std;

extern "C" void _ZTS6Syr2k2(long size, float* A, float* C);

void run_benchmark(long N, char *name, ofstream& outfile) {
    float* A = new float[N * N];
    float* C = new float[N * N];
    for(long i = 0; i < N; i++) {
        for(long j = 0; j < N; j++) {
            A[i * N + j] = (float)rand() / (float)RAND_MAX;
            C[i * N + j] = (float)rand() / (float)RAND_MAX; 
        }
    }

    auto start_time = chrono::high_resolution_clock::now();
    _ZTS6Syr2k2(N, A, C);
    auto end_time = chrono::high_resolution_clock::now();
    chrono::duration<double, milli> execution_time = end_time - start_time;
    outfile << execution_time.count() << "," << N << "," << name << "\n";
    delete[] A;
    delete[] C;
}

int main(int argc, char **argv) {
    ofstream outfile("results_syrk.csv", ios_base::app);
    if (!outfile.is_open()) {
        cerr << "failed to open file" << endl;
        return 1;
    }
    run_benchmark(1024, argv[0], outfile);
    
    outfile.close();
    return 0;
}