#!/bin/bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "usage: ./runPipes.sh <filename.cpp> <main_wrapper.cpp>"
    exit 1
fi

unset CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=/spare/sinanis/intel-llvm/build/lib:$LD_LIBRARY_PATH

INPUT_FILE=$1
MAIN_CPP=$2
BASENAME="${INPUT_FILE%.cpp}"

CLANG="/spare/sinanis/intel-llvm/build/bin/clang++"
OPT="/usr/bin/opt-18"
LLC="/usr/bin/llc-18"

TOOLCHAIN="/spare/sinanis/aarch64-toolchain"
SYSROOT="$TOOLCHAIN/aarch64-buildroot-linux-gnu/sysroot"
GCC="$TOOLCHAIN/bin/aarch64-buildroot-linux-gnu-gcc" 
GXX="$TOOLCHAIN/bin/aarch64-buildroot-linux-gnu-g++"

INTERMEDIATES_DIR="${BASENAME}_arm_files"
EXECUTABLES_DIR="${BASENAME}_arm_executables"
mkdir -p $INTERMEDIATES_DIR
mkdir -p $EXECUTABLES_DIR


clean_ir() {
 local f="$1"
 sed -i 's/nocreateundeforpoison//g' "$f"
 sed -i 's/spir_kernel//g' "$f"
 sed -i 's/spir_func//g' "$f"
 sed -i 's/icmp samesign/icmp/g' "$f"
}

echo "====================================="
echo "Baseline sycl -> asm (ARM64 Scalar)"
echo "====================================="

$CLANG -fsycl -fsycl-device-only -O3 -fno-vectorize -fno-slp-vectorize \
  --gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/13 \
  -I/home1/public/sinanis/sycl-bench/include \
  -I/home1/public/sinanis/sycl-bench/polybench/common \
  -S -emit-llvm $INPUT_FILE -o $INTERMEDIATES_DIR/${BASENAME}_baseline_device.ll

clean_ir "$INTERMEDIATES_DIR/${BASENAME}_baseline_device.ll"

$LLC -mtriple=aarch64 -mattr=+sve -O3 $INTERMEDIATES_DIR/${BASENAME}_baseline_device.ll -o $INTERMEDIATES_DIR/${BASENAME}_baseline.s
$GCC -c $INTERMEDIATES_DIR/${BASENAME}_baseline.s -o $INTERMEDIATES_DIR/${BASENAME}_baseline.o
$GXX -c $MAIN_CPP -o $INTERMEDIATES_DIR/main_baseline.o -O3 -fno-rtti
$GXX $INTERMEDIATES_DIR/main_baseline.o $INTERMEDIATES_DIR/${BASENAME}_baseline.o -o $EXECUTABLES_DIR/${BASENAME}_arm_baseline.out


echo "====================="
echo "Path(1) SVE No Polly"
echo "====================="
$CLANG -fsycl -fsycl-device-only -O3 -fno-vectorize -fno-slp-vectorize \
  --gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/13 \
  -I/home1/public/sinanis/sycl-bench/include \
  -I/home1/public/sinanis/sycl-bench/polybench/common \
  -S -emit-llvm $INPUT_FILE -o $INTERMEDIATES_DIR/${BASENAME}_sve_device.ll

clean_ir "$INTERMEDIATES_DIR/${BASENAME}_sve_device.ll"

$OPT -S -mtriple=aarch64 -mcpu=neoverse-v2 -mattr=+sve -passes='loop-vectorize' < $INTERMEDIATES_DIR/${BASENAME}_sve_device.ll > $INTERMEDIATES_DIR/${BASENAME}_sve_vect.ll

$LLC -mtriple=aarch64 -mcpu=neoverse-v2 -mattr=+sve -O3 $INTERMEDIATES_DIR/${BASENAME}_sve_vect.ll -o $INTERMEDIATES_DIR/${BASENAME}_sve_vect.s
$GCC -march=armv9-a+sve -c $INTERMEDIATES_DIR/${BASENAME}_sve_vect.s -o $INTERMEDIATES_DIR/${BASENAME}_sve_vect.o
$GXX -c $MAIN_CPP -o $INTERMEDIATES_DIR/main_sve.o -O3 -fno-rtti
$GXX $INTERMEDIATES_DIR/main_sve.o $INTERMEDIATES_DIR/${BASENAME}_sve_vect.o -o $EXECUTABLES_DIR/${BASENAME}_arm_pure_sve.out


echo "====================="
echo "Path(2) JUST POLLY"
echo "====================="
# $CLANG -fsycl -fsycl-device-only -O3 -fno-vectorize -fno-slp-vectorize -mllvm -polly -mllvm -polly-vectorizer=stripmine\
#   --gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/13 \
#   -I/home1/public/sinanis/sycl-bench/include \
#   -I/home1/public/sinanis/sycl-bench/polybench/common \
#   -S -emit-llvm $INPUT_FILE -o $INTERMEDIATES_DIR/${BASENAME}_polly_device.ll
$CLANG -fsycl -fsycl-device-only -O3 -fno-vectorize -fno-slp-vectorize -mllvm -polly \
  --gcc-install-dir=/usr/lib/gcc/x86_64-linux-gnu/13 \
  -I/home1/public/sinanis/sycl-bench/include \
  -I/home1/public/sinanis/sycl-bench/polybench/common \
  -S -emit-llvm $INPUT_FILE -o $INTERMEDIATES_DIR/${BASENAME}_polly_device.ll


clean_ir "$INTERMEDIATES_DIR/${BASENAME}_polly_device.ll"
$OPT -S -mtriple=aarch64 -mcpu=neoverse-v2 -mattr=+sve -passes='loop-vectorize' < $INTERMEDIATES_DIR/${BASENAME}_polly_device.ll > $INTERMEDIATES_DIR/${BASENAME}_polly_vect.ll

# $OPT -S -mtriple=aarch64 -mattr=+neon -passes='loop-vectorize' < $INTERMEDIATES_DIR/${BASENAME}_polly_device.ll > $INTERMEDIATES_DIR/${BASENAME}_polly_vect.ll

$LLC -mtriple=aarch64 -mcpu=neoverse-v2 -mattr=+sve -O3 $INTERMEDIATES_DIR/${BASENAME}_polly_vect.ll -o $INTERMEDIATES_DIR/${BASENAME}_polly_vectorized.s
# $LLC -mtriple=aarch64 -mattr=+neon -O3 $INTERMEDIATES_DIR/${BASENAME}_polly_vect.ll -o $INTERMEDIATES_DIR/${BASENAME}_polly_vectorized.s
$GCC  -march=armv9-a+sve -c $INTERMEDIATES_DIR/${BASENAME}_polly_vectorized.s -o $INTERMEDIATES_DIR/${BASENAME}_polly_vectorized.o
$GXX -c $MAIN_CPP -o $INTERMEDIATES_DIR/main_polly.o -O3 -fno-rtti
$GXX $INTERMEDIATES_DIR/main_polly.o $INTERMEDIATES_DIR/${BASENAME}_polly_vectorized.o -o $EXECUTABLES_DIR/${BASENAME}_arm_pure_polly.out



