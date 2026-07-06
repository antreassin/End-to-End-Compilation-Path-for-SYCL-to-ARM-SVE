//added a main in end of file
#include <string>
#include <vector>
#include <cstdlib>
#include <sycl/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

#define ALPHA 32412
#define BETA 2123

using DATA_TYPE = float;

class Gemm;

void init(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t size) {
  const auto NI = size;
  const auto NJ = size;
  const auto NK = size;

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NK; j++) {
      A[i * NK + j] = ((DATA_TYPE)i * j) / NI;
    }
  }

  for(size_t i = 0; i < NK; i++) {
    for(size_t j = 0; j < NJ; j++) {
      B[i * NJ + j] = ((DATA_TYPE)i * j + 1) / NJ;
    }
  }

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NJ; j++) {
      C[i * NJ + j] = ((DATA_TYPE)i * j + 2) / NJ;
    }
  }
}

class Polybench_Gemm {
public:
  Polybench_Gemm(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

  void setup() {
    A.resize(size * size);
    B.resize(size * size);
    C.resize(size * size);
    init(A.data(), B.data(), C.data(), size);
  }

  // void run(std::vector<sycl::event>& events) {
  //   using namespace sycl;

  //   float* __restrict__ raw_A = A.data();
  //   float* __restrict__ raw_B = B.data();
  //   float* __restrict__ raw_C = C.data();

  //   events.push_back(args.device_queue.submit([&](handler& cgh) {
  //     cgh.single_task<Gemm>([=, NI_ = size, NJ_ = size, NK_ = size]() {
  //       for(size_t i = 0; i < NI_; i++) {
  //         for(size_t j = 0; j < NJ_; j++) {
  //           raw_C[i * NJ_ + j] *= BETA;
  //           for(size_t k = 0; k < NK_; k++) {
  //             raw_C[i * NJ_ + j] += ALPHA * raw_A[i * NK_ + k] * raw_B[k * NJ_ + j];
  //           }
  //         }
  //       }
  //     });
  //   }));
  // }
  //bad execution
  // void run(std::vector<sycl::event>& events) {
  //   using namespace sycl;
  //   float* raw_A = A.data();
  //   float* raw_B = B.data();
  //   float* raw_C = C.data();

  //   events.push_back(args.device_queue.submit([&](handler& cgh) {
  //     cgh.single_task<Gemm>([=, NI_ = size, NJ_ = size, NK_ = size]() {
  //       float* __restrict__ ptrA = raw_A;
  //       float* __restrict__ ptrB = raw_B;
  //       float* __restrict__ ptrC = raw_C;

        // for(size_t i = 0; i < NI_; i++) {
        //   for(size_t j = 0; j < NJ_; j++) {
        //     ptrC[i * NJ_ + j] *= BETA;
        //     #pragma clang loop vectorize_width(4, scalable)
        //     #pragma clang loop interleave_count(1)
        //     for(size_t k = 0; k < NK_; k++) {
        //       ptrC[i * NJ_ + j] += ALPHA * ptrA[i * NK_ + k] * ptrB[k * NJ_ + j];
        //     }
            
        //   }
  //       }
  //     });
  //   }));
  // }
  void run(std::vector<sycl::event>& events) {
    using namespace sycl;
    
    float* raw_A = A.data();
    float* raw_B = B.data();
    float* raw_C = C.data();

    events.push_back(args.device_queue.submit([&](handler& cgh) {
      cgh.single_task<Gemm>([=, NI_ = size, NJ_ = size, NK_ = size]() {
        float* ptrA = raw_A;
        float* ptrB = raw_B;
        float* ptrC = raw_C;
        for(size_t i = 0; i < NI_; i++) {
          for(size_t j = 0; j < NJ_; j++) {
            ptrC[i * NJ_ + j] *= BETA;
          } 
          for(size_t k = 0; k < NK_; k++) {
            float alpha_a_ik = ALPHA * ptrA[i * NK_ + k];
            #pragma clang loop vectorize_width(4, scalable)
            #pragma clang loop interleave_count(1)
            for(size_t j = 0; j < NJ_; j++) {
              // ptrC[i * NJ_ + j] *= BETA;
              ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
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
};

int main(int argc, char** argv) {
  return 0;
}


// for(size_t i = 0; i < NI_; i++) {
//   for(size_t j = 0; j < NJ_; j++) {
//     ptrC[i * NJ_ + j] *= BETA;
//   } 
//   for(size_t k = 0; k < NK_; k++) {
//     float alpha_a_ik = ALPHA * ptrA[i * NK_ + k];
//     #pragma clang loop vectorize_width(4, scalable)
//     #pragma clang loop interleave_count(1)
//     for(size_t j = 0; j < NJ_/2; j++) {
//       // ptrC[i * NJ_ + j] *= BETA;
//       ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
//     }
//     for(size_t j = (NJ_/2)+1; j < NJ_; j++) {
//       // ptrC[i * NJ_ + j] *= BETA;
//       ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
//     }
//   }
// }

// for(size_t i = 0; i < NI_; i++) {
//   for(size_t j = 0; j < NJ_; j++) {
//     ptrC[i * NJ_ + j] *= BETA;
//   } 
//   for(size_t k = 0; k < NK_; k++) {
//     float alpha_a_ik = ALPHA * ptrA[i * NK_ + k];
//     #pragma clang loop vectorize_width(4, scalable)
//     #pragma clang loop interleave_count(1)
//     for(size_t j = 0; j < NJ_/4; j++) {
//       // ptrC[i * NJ_ + j] *= BETA;
//       ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
//     }
//     for(size_t j = (NJ_/4)+1 ; j < 2*(NJ_/4); j++) {
//       // ptrC[i * NJ_ + j] *= BETA;
//       ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
//     }
//     for(size_t j = 2*(NJ_/4)+1; j < 3*(NJ_/4); j++) {
//       // ptrC[i * NJ_ + j] *= BETA;
//       ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
//     }
//     for(size_t j = 3*(NJ_/4)+1; j < 4*(NJ_/4); j++) {
//       // ptrC[i * NJ_ + j] *= BETA;
//       ptrC[i * NJ_ + j] += alpha_a_ik * ptrB[k * NJ_ + j];
//     }
//   }
// }

//note: to thema me thn polly einai oti prospathei na xwresei to innermost loop sthn l1 cache kai gia auto exei megalo bottle neck, sthn 
//prospathia mu na to kanw na "xwresei" prospathisa na kopsw to loop (lathos tho me to +1) kai to polly tote eixe kanoniko opt, 
// bevaia otan to allaksa sto kanoniko version tu swstou xwrsmu gia loop (xwris to +1) to polly den eixe effect to opt kai eixe to idio
// bottle neck, ara ektos apo oti prepei na einai mikra ta loops diestanomai oti exei na kanei kai me to addressing ths polly giati opws eidame
// sto prohgoumeno part tu thesis skipparei mixanismous gia na dei an to address einai exei alias.