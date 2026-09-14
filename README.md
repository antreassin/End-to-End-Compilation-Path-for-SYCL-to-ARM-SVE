# SYCL to ARM SVE Compilation Pipeline

## Motivation

Standard SYCL `parallel_for` constructs hide explicit loop boundaries and memory access patterns within the SYCL runtime. This abstraction prevents standard LLVM middle-end optimizers, such as the Loop Vectorizer and the Polly polyhedral framework, from analyzing and restructuring the code. This project resolves this by replacing `parallel_for` with `single_task` kernels containing explicit nested C++ `for` loops to expose the full structure to the LLVM middle-end.

## Prerequisites

*   **Compiler Toolchain:** Custom LLVM-18.
*   **Frontend:** Intel LLVM SYCL compiler to extract Intermediate Representation (IR) code.
*   **Target Architecture:** ARM Neoverse-V2 (evaluated on Cortex-X925 cores).

## Compilation Paths

The compilation pipeline must be manually driven through three distinct optimization paths to isolate their effects :

| Path | Description | Flags | 
| :--- | :--- | :--- |
| **Path 0 (Baseline)** | Standard LLVM IR with vectorization strictly disabled to establish a scalar execution floor.  | `-O3`, `-fno-vectorize`, `-fno-slp-vectorize`  |
| **Path 1 (Vectorized SVE)** | Enables the LLVM Loop Vectorizer to generate Scalable Vector Extension (SVE) instructions.  | `-O3`, `-passes='loop-vectorize'`, `-mcpu=neoverse-v2`, `-mattr=+sve`  |
| **Path 2 (Polyhedral + SVE)** | Applies the Polly framework to restructure memory access patterns before feeding the output into the LLVM Loop Vectorizer.  | `-O3`, `-mllvm -polly`, `-passes='loop-vectorize'`, `-mcpu=neoverse-v2`, `-mattr=+sve`  |

## Required Code Transformations

To ensure compatibility with the LLVM middle-end optimizers, the original SYCL benchmark code requires systematic manual transformations before compilation :

*   **Raw C++ Pointers:** SYCL buffer-accessors are stripped away and replaced with flat 1D raw C++ pointers (e.g., `DATA_TYPE* raw_A = A.data();`) to expose unmodified memory addresses directly to the frontend .
*   **`single_task` Execution:** The execution construct is switched from `parallel_for` to `single_task` to prevent the SYCL runtime from interfering with loop distribution .
*   **Explicit Nested Loops:** Implicit indices (e.g., `item[0]`) and internal out-of-bounds `if` statements are replaced with explicit, serial nested `for` loops to provide a clear Iteration Domain .
*   **Explicit Vectorization Directives:** Clang pragmas (`#pragma clang loop vectorize_width(4, scalable)` and `#pragma clang loop interleave_count(1)`) are injected directly before the innermost loops to explicitly guide SVE generation .
*   **Loop Canonicalization:** Manual loop interchange (e.g., swapping `j` and `k` loops in GEMM) and loop fusion (e.g., in SYRK) are applied to establish the contiguous memory streams necessary for optimal hardware utilization .

## Evaluated Benchmarks

The pipeline is tested against five Polybench suite kernels representing varying algorithmic complexities :

*   **O(N²) Complexity:** 2D-Convolution (N=4096), BiCG (N=16384) .
*   **O(N³) Complexity:** 2MM (N=1024), GEMM (N=1024), SYRK (N=1024) .
