#!/bin/bash -l
export JOBID=NO_BATCH
module use /Users/mathomp4/modulefiles/Core
module load appleclang-flang/22 openmpi/5.0.10

set -x
export ESMF_TRACE_LIB_BUILD=OFF
export ESMPY_DATA_DIR="/Users/mathomp4/ESMF_Testing/esmf-test-data/grids"
export FC="/Users/mathomp4/.homebrew/brew/bin/flang-22"
export OpenMP_ROOT="/Users/mathomp4/.homebrew/brew/opt/libomp"
export PATH=/home/mathomp4/.homebrew/brew/bin:$PATH
export ESMF_DIR=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_develop/esmf
export ESMF_COMPILER=llvm
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_develop/module-build.log
export WORK_ROOT=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_develop
export TEMP_ROOT=/Users/mathomp4/ESMF_Testing/llvm_22.1_openmpi_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 6 2>&1| tee $WORK_ROOT/build.log
