#include <string>
#include <vector>
#include <cstdlib>
#include <sycl/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class conv2D;

void init(DATA_TYPE* A, size_t size) {
  const auto NI = size;
  const auto NJ = size;

  for(size_t i = 0; i < NI; ++i) {
    for(size_t j = 0; j < NJ; ++j) {
      A[i * NJ + j] = (float)rand() / (float)RAND_MAX;
    }
  }
}

class Polybench_2DConvolution {
public:
  Polybench_2DConvolution(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

  void setup() {
    A.resize(size * size);
    B.resize(size * size);
    init(A.data(), size);
  }

  void run(std::vector<sycl::event>& events) {
    using namespace sycl;
    float* raw_A = A.data();
    float* raw_B = B.data();

    events.push_back(args.device_queue.submit([&](handler& cgh) {
      
      cgh.single_task<class conv2D>([=, size_ = size]() {
        
        float* ptrA = raw_A;
        float* ptrB = raw_B;
        const float c11 = +0.2f, c21 = +0.5f, c31 = -0.8f;
        const float c12 = -0.3f, c22 = +0.6f, c32 = -0.9f;
        const float c13 = +0.4f, c23 = +0.7f, c33 = +0.10f;

        for(size_t i = 1; i < size_ - 1; ++i) {
          
          #pragma clang loop vectorize_width(4, scalable)
          #pragma clang loop interleave_count(1)
          for(size_t j = 1; j < size_ - 1; ++j) {
            
            ptrB[i * size_ + j] =
                c11 * ptrA[(i - 1) * size_ + (j - 1)] + c12 * ptrA[(i + 0) * size_ + (j - 1)] + c13 * ptrA[(i + 1) * size_ + (j - 1)] +
                c21 * ptrA[(i - 1) * size_ + (j + 0)] + c22 * ptrA[(i + 0) * size_ + (j + 0)] + c23 * ptrA[(i + 1) * size_ + (j + 0)] +
                c31 * ptrA[(i - 1) * size_ + (j + 1)] + c32 * ptrA[(i + 0) * size_ + (j + 1)] + c33 * ptrA[(i + 1) * size_ + (j + 1)];
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
};

int main(int argc, char** argv) {
  return 0;
}