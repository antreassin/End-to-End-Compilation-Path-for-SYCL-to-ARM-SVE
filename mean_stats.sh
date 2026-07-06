#!/bin/bash

# echo "2mm polly stats:"

# for i in $(seq 1 10);
# do
#     taskset -c 15 perf stat ./2mm_arm_executables/2mm_arm_pure_polly.out >> 2mm_polly_stats.txt 2>&1
# done

# echo "gemm polly stats:"

# for i in $(seq 1 10);
# do
#     taskset -c 15 perf stat ./gemm_arm_executables/gemm_arm_pure_polly.out >> gemm_polly_stats.txt 2>&1
# done

# echo "bicg polly stats:"

# for i in $(seq 1 10);
# do
#     taskset -c 15 perf stat ./bicg_arm_executables/bicg_arm_pure_polly.out >> bicg_polly_stats.txt 2>&1
# done


taskset -c 15 perf stat -e instructions,cycles,armv8_pmuv3_1/event=0x40/,armv8_pmuv3_1/event=0x41/ ./gemm_arm_executables/gemm_arm_pure_polly.out >> ldst.txt 2>&1
taskset -c 15 perf stat -e instructions,cycles,armv8_pmuv3_1/event=0x40/,armv8_pmuv3_1/event=0x41/ ./bicg_arm_executables/bicg_arm_pure_polly.out >> ldst.txt 2>&1
taskset -c 15 perf stat -e instructions,cycles,armv8_pmuv3_1/event=0x40/,armv8_pmuv3_1/event=0x41/ ./2mm_arm_executables/2mm_arm_pure_polly.out >> ldst.txt 2>&1