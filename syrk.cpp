#include <string>
#include <vector>

#include <cstdlib>

#include <sycl/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class Syr2k2;

constexpr DATA_TYPE alpha = 123;
constexpr DATA_TYPE beta = 14512;

void init_arrays(DATA_TYPE* A, DATA_TYPE* C, size_t size) {
  const auto N = size;
  const auto M = size;

  for(size_t i = 0; i < N; i++) {
    for(size_t j = 0; j < M; j++) {
      A[i * M + j] = ((DATA_TYPE)i * j) / N;
    }

    for(size_t j = 0; j < N; j++) {
      C[i * M + j] = ((DATA_TYPE)i * j + 2) / N;
    }
  }
}

class Polybench_Syrk {
public:
  Polybench_Syrk(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

  void setup() {
    A.resize(size * size);
    C.resize(size * size);

    init_arrays(A.data(), C.data(), size);
    }

    void run(std::vector<sycl::event>& events) {
      using namespace sycl;
      DATA_TYPE* raw_A = A.data();
      DATA_TYPE* raw_C = C.data();
      
      events.push_back(args.device_queue.submit([&](handler& cgh) {
        cgh.single_task<Syr2k2>([=, size_ = size]() {
          DATA_TYPE* ptrA = raw_A;
          DATA_TYPE* ptrC = raw_C;
  
          for(size_t i = 0; i < size_; i++) {
            for(size_t j = 0; j < size_; j++) {
              // float sum = ptrC[i * size_ + j] * beta;
              ptrC[i * size_ + j] *= beta;
              {
              #pragma clang fp reassociate(on)
              #pragma clang loop vectorize_width(4, scalable)
              #pragma clang loop interleave_count(1)
              for(size_t k = 0; k < size_; k++) {
                // sum += alpha * ptrA[i * size_ + k] * ptrA[j * size_ + k];
                ptrC[i * size_ + j] += alpha * ptrA[i * size_ + k] * ptrA[j * size_ + k];
              }
              // ptrC[i * size_ + j] = sum; 
              }
            }
          }
        });
      }));
    }
  // sum += alpha * ptrA[i * size_ + k] * ptrA[j * size_ + k]; me auto to polly exei mikrotero execution time, alliws exei to sve 
  // void run(std::vector<sycl::event>& events) {
  //   using namespace sycl;
  //   DATA_TYPE* raw_A = A.data();
  //   DATA_TYPE* raw_C = C.data();

  //   events.push_back(args.device_queue.submit([&](handler& cgh) {
  //     cgh.single_task<Syr2k2>([=, size_ = size]() {
  //       DATA_TYPE* ptrA = raw_A;
  //       DATA_TYPE* ptrC = raw_C;
        // for(size_t i = 0; i < size_; i++) {
        //     #pragma clang loop vectorize_width(4, scalable)
        //     #pragma clang loop interleave_count(1)
        //     for(size_t j = 0; j < size_; j++) {
        //       ptrC[i * size_ + j] *= beta;
        //     }
        // }
        // for(size_t i = 0; i < size_; i++) {
        //     for(size_t j = 0; j < size_; j++) {
        //         #pragma clang loop vectorize_width(4, scalable)
        //         #pragma clang loop interleave_count(1)
        //         for(size_t k = 0; k < size_; k++) {
        //           ptrC[i * size_ + j] += alpha * ptrA[i * size_ + k] * ptrA[j * size_ + k];
        //         }
        //     }
        // }
  //     });
  //   }));
  // }


private:
  BenchmarkArgs args;

  const size_t size;
  std::vector<DATA_TYPE> A;
  std::vector<DATA_TYPE> C;
};

int main(int argc, char** argv) {
  return 0;
}
