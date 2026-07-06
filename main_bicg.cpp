#include <iostream>
#include <cstdlib>
#include <chrono>
#include <fstream> 

using namespace std;

extern "C" void _ZTS5Bicg1(long size, float* A, float* r, float* s);
extern "C" void _ZTS5Bicg2(long size, float* A, float* p, float* q);

void run_benchmark(long N, char *name, ofstream& outfile) {
    float* A = new float[N * N];
    float* r = new float[N];
    float* s = new float[N];
    float* p = new float[N];
    float* q = new float[N];

    for(long i = 0; i < N; i++) {
        r[i] = (float)rand() / (float)RAND_MAX;
        p[i] = (float)rand() / (float)RAND_MAX;
        s[i] = 0.0f;
        q[i] = 0.0f; 
        
        for(long j = 0; j < N; j++) {
            A[i * N + j] = (float)rand() / (float)RAND_MAX;
        }
    }
    
    auto start_time = chrono::high_resolution_clock::now();
    
    _ZTS5Bicg1(N, A, r, s);
    _ZTS5Bicg2(N, A, p, q);
    auto end_time = chrono::high_resolution_clock::now();
    chrono::duration<double, milli> execution_time = end_time - start_time;
    
    outfile << execution_time.count() << "," << N << "," << name << "\n";
    // for(int i = 0; i < N ;i++){
    //     for(int j = 0; j < N; j++){
    //         outfileres << A[i,j] << endl;
    //     }
    // }
    delete[] A;
    delete[] r;
    delete[] s;
    delete[] p;
    delete[] q;
}

int main(int argc, char **argv) {
    ofstream outfile("results_bicg.csv", ios_base::app);
    // ofstream outfileres("output.csv");
    if (!outfile.is_open()) {
        cerr << "failed to open file" << endl;
        return 1;
    }
    // if (!outfileres.is_open()) {
    //     cerr << "failed to open file" << endl;
    //     return 1;
    // }
    run_benchmark(16384, argv[0], outfile);
    // run_benchmark(1024*4, argv[0], outfile);
    // run_benchmark(1024*8, argv[0], outfile);
    // run_benchmark(1024*16, argv[0], outfile);
    
    outfile.close();
    return 0;
}