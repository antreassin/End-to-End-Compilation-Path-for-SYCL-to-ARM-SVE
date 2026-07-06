// #include <sycl/sycl.hpp>

// using namespace sycl;

// class Polybench_2mm_1;
// class Polybench_2mm_2;

// void dummy_sycl_launcher(long N, float* A, float* B, float* C, float* D, float* E) {
//     queue q;
    
//     q.submit([&](handler& h) {
//         h.single_task<class Polybench_2mm_1>([N, A, B, C]() {
//           for(size_t i = 0; i < N; i++) {
//             for(size_t j = 0; j < N; j++) {
//               for(size_t k = 0; k < N; ++k) {
//                 C[i * N + j] += A[i * N + k] * B[k * N + j];
//               }
//             }
//           }
//         });
//     });
//     q.submit([&](handler& h) {
//         h.single_task<class Polybench_2mm_2>([N, C, D, E]() {
//           for(size_t i = 0; i < N; i++) {
//             for(size_t j = 0; j < N; j++) {
//               E[i * N + j] = 0;
//               for(size_t k = 0; k < N; ++k) {
//                 E[i * N + j] += C[i * N + k] * D[k * N + j];
//               }
//             }
//           }
//         });
//     });
// } //kako


#include <string>
#include <vector>

#include <cstdlib>

#include <sycl/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class Polybench_2mm_2;
class Polybench_2mm_1;

void init_array(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, DATA_TYPE* D, size_t size) {
  const auto NI = size;
  const auto NJ = size;
  const auto NK = size;
  const auto NL = size;

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NK; j++) {
      A[i * NI + j] = ((DATA_TYPE)i * j) / NI;
    }
  }

  for(size_t i = 0; i < NK; i++) {
    for(size_t j = 0; j < NJ; j++) {
      B[i * NK + j] = ((DATA_TYPE)i * (j + 1)) / NJ;
    }
  }

  for(size_t i = 0; i < NL; i++) {
    for(size_t j = 0; j < NJ; j++) {
      C[i * NL + j] = ((DATA_TYPE)i * (j + 3)) / NL;
    }
  }

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NL; j++) {
      D[i * NL + j] = ((DATA_TYPE)i * (j + 2)) / NK;
    }
  }
}

class Polybench_2mm {
public:
  Polybench_2mm(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

  void setup() {
    A.resize(size * size);
    B.resize(size * size);
    C.resize(size * size);
    D.resize(size * size);
    E.resize(size * size);

    init_array(A.data(), B.data(), C.data(), D.data(), size);
    
    }

    void run(std::vector<sycl::event>& events) {
      using namespace sycl;
      
      DATA_TYPE* raw_A = A.data();
      DATA_TYPE* raw_B = B.data();
      DATA_TYPE* raw_C = C.data();
      DATA_TYPE* raw_D = D.data();
      DATA_TYPE* raw_E = E.data();
      events.push_back(args.device_queue.submit([&](handler& cgh) {
        cgh.single_task<Polybench_2mm_1>([=, size_ = size]() {
          DATA_TYPE* ptrA = raw_A;
          DATA_TYPE* ptrB = raw_B;
          DATA_TYPE* ptrC = raw_C;
  
          for(size_t i = 0; i < size_; i++) {
            for(size_t k = 0; k < size_; k++) {
              // float alpha = ptrA[i * size_ + k];
              #pragma clang loop vectorize_width(4, scalable)
              #pragma clang loop interleave_count(1)
              for(size_t j = 0; j < size_; j++) {
                ptrC[i * size_ + j] += ptrA[i * size_ + k] * ptrB[k * size_ + j];
              }
            }
          }
        });
      }));
      events.push_back(args.device_queue.submit([&](handler& cgh) {
        cgh.single_task<Polybench_2mm_2>([=, size_ = size]() {
          DATA_TYPE* ptrC = raw_C;
          DATA_TYPE* ptrD = raw_D;
          DATA_TYPE* ptrE = raw_E;
  
          for(size_t i = 0; i < size_; i++) {
            for(size_t j = 0; j < size_; j++) {
                ptrE[i * size_ + j] = 0.0f;
            }
            for(size_t k = 0; k < size_; k++) {
              // float alpha = ptrC[i * size_ + k];
              #pragma clang loop vectorize_width(4, scalable)
              #pragma clang loop interleave_count(1)
              for(size_t j = 0; j < size_; j++) {
                ptrE[i * size_ + j] += ptrC[i * size_ + k] * ptrD[k * size_ + j];
              }
            }
          }
        });
      }));
    }


private:
  BenchmarkArgs args;

  const size_t size;
  std::vector<DATA_TYPE> A;
  std::vector<DATA_TYPE> B;
  std::vector<DATA_TYPE> C;
  std::vector<DATA_TYPE> D;
  std::vector<DATA_TYPE> E;

};

int main(int argc, char** argv) {
  return 0;
}
