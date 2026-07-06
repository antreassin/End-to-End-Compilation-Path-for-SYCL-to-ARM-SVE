#include <string>
#include <vector>

#include <cstdlib>

#include <sycl/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

#ifndef M_PI
#define M_PI 3.14159
#endif

using DATA_TYPE = float;

class Bicg1;
class Bicg2;

void init_array(DATA_TYPE* A, DATA_TYPE* p, DATA_TYPE* r, size_t size) {
  const auto NX = size;
  const auto NY = size;

  for(size_t i = 0; i < NX; i++) {
    r[i] = i * M_PI;

    for(size_t j = 0; j < NY; j++) {
      A[i * NY + j] = ((DATA_TYPE)i * j) / NX;
    }
  }

  for(size_t i = 0; i < NY; i++) {
    p[i] = i * M_PI;
  }
}


class Polybench_Bicg {
public:
  Polybench_Bicg(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

  void setup() {
    A.resize(size * size);
    r.resize(size);
    s.resize(size);
    p.resize(size);
    q.resize(size);

    init_array(A.data(), p.data(), r.data(), size);
  }

  void run(std::vector<sycl::event>& events) {
    using namespace sycl;

    DATA_TYPE* raw_A = A.data();
    DATA_TYPE* raw_r = r.data();
    DATA_TYPE* raw_s = s.data();
    DATA_TYPE* raw_p = p.data();
    DATA_TYPE* raw_q = q.data();
    events.push_back(args.device_queue.submit([&](handler& cgh) {
      cgh.single_task<Bicg1>([=, size_ = size]() {
        DATA_TYPE* ptrA = raw_A;
        DATA_TYPE* ptrr = raw_r;
        DATA_TYPE* ptrs = raw_s;

        for(size_t i = 0; i < size_; i++) {
          #pragma clang loop vectorize_width(4, scalable)
          #pragma clang loop interleave_count(1)
          for(size_t j = 0; j < size_; j++) {
            ptrs[j] += ptrA[i * size_ + j] * ptrr[i];
          }
        }
      });
    }));
    // events.push_back(args.device_queue.submit([&](handler& cgh) {
    //   cgh.single_task<Bicg1>([=, size_ = size]() {
    //     DATA_TYPE* ptrA = raw_A;
    //     DATA_TYPE* ptrr = raw_r;
    //     DATA_TYPE* ptrs = raw_s;
    //     DATA_TYPE* ptrp = raw_p;
    //     DATA_TYPE* ptrq = raw_q;

    //     for(size_t i = 0; i < size_; i++) {
    //       #pragma clang loop vectorize_width(4, scalable)
    //       #pragma clang loop interleave_count(1)
    //       for(size_t j = 0; j < size_; j++) {
    //         ptrs[j] += ptrA[i * size_ + j] * ptrr[i];
    //         ptrq[i] += ptrA[i * size_ + j] * ptrp[j];
    //       }
    //     }
    //   });
    // }));
    events.push_back(args.device_queue.submit([&](handler& cgh) {
      cgh.single_task<Bicg2>([=, size_ = size]() {
        DATA_TYPE* ptrA = raw_A;
        DATA_TYPE* ptrp = raw_p;
        DATA_TYPE* ptrq = raw_q;

        for(size_t i = 0; i < size_; i++) {
            #pragma clang loop vectorize_width(4, scalable)
            #pragma clang loop interleave_count(1)
            for(size_t j = 0; j < size_; j++) {
              ptrq[i] += ptrA[i * size_ + j] * ptrp[j];
            }
        }
      });
    }));
    
  }


private:
  BenchmarkArgs args;

  const size_t size;
  std::vector<DATA_TYPE> A;
  std::vector<DATA_TYPE> r;
  std::vector<DATA_TYPE> s;
  std::vector<DATA_TYPE> p;
  std::vector<DATA_TYPE> q;

};

int main(int argc, char** argv) {
  return 0;
}
