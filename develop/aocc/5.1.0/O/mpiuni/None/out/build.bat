#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load AOCC/5.1.0 

set -x
export ESMF_F90LINKOPTS="-Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/opt/GLIBC2.42/usr/lib64/ld-linux-x86-64.so.2 -Wl,-rpath=/opt/GLIBC2.42/usr/lib64:/opt/aocc/aocc-compiler-5.1.0/lib -lm"
export ESMF_CXXLINKOPTS="-Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/opt/GLIBC2.42/usr/lib64/ld-linux-x86-64.so.2 -Wl,-rpath=/opt/GLIBC2.42/usr/lib64:/opt/aocc/aocc-compiler-5.1.0/lib -lm"
export ESMF_CLINKOPTS="-Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/opt/GLIBC2.42/usr/lib64/ld-linux-x86-64.so.2 -Wl,-rpath=/opt/GLIBC2.42/usr/lib64:/opt/aocc/aocc-compiler-5.1.0/lib -lm"
export ESMF_TRACE_LIB_BUILD=OFF
export ESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/aocc_5.1.0_mpiuni_O_develop/esmf
export ESMF_COMPILER=aocc
export ESMF_COMM=mpiuni
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/home/gerhard/ESMF-Nightly-Testing/aocc_5.1.0_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /home/gerhard/ESMF-Nightly-Testing/aocc_5.1.0_mpiuni_O_develop/module-build.log
export WORK_ROOT=/home/gerhard/ESMF-Nightly-Testing/aocc_5.1.0_mpiuni_O_develop
export TEMP_ROOT=/home/gerhard/ESMF-Nightly-Testing/aocc_5.1.0_mpiuni_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 4 2>&1| tee $WORK_ROOT/build.log
