#include <iostream>
#include <cstdlib>
#include <chrono>
#include <fstream> 
using namespace std;

extern "C" void _ZTS6conv2D(long size,float* A, float* B);

void run_benchmark(long N, char *name, ofstream& outfile) {
    float* A = new float[N*N];
    float* B = new float[N*N];
    for(long i=0; i<N; i++){
        for(long j=0; j<N; j++){
            A[i*N+j] = (float)rand() / (float)RAND_MAX;
            B[i*N+j] = 0.0f; 
        }
    }
    
    auto start_time = chrono::high_resolution_clock::now();
    _ZTS6conv2D(N,A,B);
    auto end_time = chrono::high_resolution_clock::now();
    chrono::duration<double, milli> execution_time = end_time - start_time;
    outfile << execution_time.count() << "," << N << "," << name <<"\n";
    delete[] A;
    delete[] B;
}

int main(int argc, char **argv) {
    ofstream outfile("results_conv2d.csv", ios_base::app);
    if (!outfile.is_open()) {
        cerr << "failed to open file" << endl;
        return 1;
    }
    run_benchmark(4096, argv[0], outfile);
    outfile.close();
    return 0;
}
