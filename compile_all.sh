#!/bin/bash
echo "2d" 
./runPipes.sh 2dconvolution.cpp main_2d.cpp
echo "2mm"
./runPipes.sh 2mm.cpp main_2mm.cpp
echo "bicg"
./runPipes.sh bicg.cpp main_bicg.cpp
echo "gemm"
./runPipes.sh gemm.cpp main_gemm.cpp
echo "syrk"
./runPipes.sh syrk.cpp main_syrk.cpp

