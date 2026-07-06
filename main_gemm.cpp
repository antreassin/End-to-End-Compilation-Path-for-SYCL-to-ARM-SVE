#include <iostream>
#include <cstdlib>
#include <chrono>
#include <fstream> 
using namespace std;

extern "C" void _ZTS4Gemm(long NI, long NJ, long NK, float* A, float* B, float* C);

void run_benchmark(long N, char *name, ofstream& outfile) {
    float* A = new float[N*N];
    float* B = new float[N*N];
    float* C = new float[N*N];
    
    for(long i=0; i<N; i++){
        for(long j=0; j<N; j++){
            A[i*N+j] = (float)(i*j)/N;
            B[i*N+j] = (float)(i*j+1)/N;
            C[i*N+j] = (float)(i*j+2)/N;
        }
    }
    
    auto start_time = chrono::high_resolution_clock::now();
    _ZTS4Gemm(N, N, N, A, B, C);
    auto end_time = chrono::high_resolution_clock::now();
    
    chrono::duration<double, milli> execution_time = end_time - start_time;
    outfile << execution_time.count() << "," << N << "," << name <<"\n";

    delete[] A;
    delete[] B;
    delete[] C;
}

int main(int argc, char **argv) {
    ofstream outfile("results.csv", ios_base::app);
    if (!outfile.is_open()) {
        cerr << "failed to open file" << endl;
        return 1;
    }
    // run_benchmark(512, argv[0], outfile);
    run_benchmark(1024, argv[0], outfile);
    // run_benchmark(1024*2, argv[0], outfile);
    // run_benchmark(1024*4, argv[0], outfile);
    outfile.close();
    return 0;
}