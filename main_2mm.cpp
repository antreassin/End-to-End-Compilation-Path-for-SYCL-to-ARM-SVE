#include <iostream>
#include <cstdlib>
#include <chrono>
#include <fstream>

using namespace std;
extern "C" void _ZTS15Polybench_2mm_1(long N, float* A, float* B, float* C);
extern "C" void _ZTS15Polybench_2mm_2(long N, float* C, float* D, float* E);

void run_benchmark(long N, char *name, ofstream& outfile) {
    float* A = new float[N*N];
    float* B = new float[N*N];
    float* C = new float[N*N];
    float* D = new float[N*N];
    float* E = new float[N*N];
    for(long i=0; i<N; i++) {
        for(long j=0; j<N; j++) {
            A[i*N+j] = (float)(i*j)/N;
            B[i*N+j] = (float)(i*(j+1))/N;
            C[i*N+j] = (float)(i*(j+3))/N;
            D[i*N+j] = (float)(i*(j+2))/N;
            E[i*N+j] = 0.0f;
        }
    }
    
    auto start_time = chrono::high_resolution_clock::now();
    _ZTS15Polybench_2mm_1(N, A, B, C);
    _ZTS15Polybench_2mm_2(N, C, D, E);
    
    auto end_time = chrono::high_resolution_clock::now();
    chrono::duration<double, milli> execution_time = end_time - start_time;
    outfile << execution_time.count() << "," << N << "," << name <<"\n";

    delete[] A; delete[] B; delete[] C; delete[] D; delete[] E;
}

int main(int argc, char **argv) {
    ofstream outfile("results_2mm.csv", ios_base::app); 
    if (!outfile.is_open()) {
        cerr << "failed to open file" << endl;
        return 1;
    }
    run_benchmark(1024, argv[0], outfile);
    outfile.close();
    return 0;
}
