#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load compiler/gnu/8.2.0 
module load tool/netcdf/4.6.1/gcc

set -x
export ESMF_DIR=/project/esmf/ESMF-Nightly-Testing-Bighorn/gfortran_8.2.0_mpiuni_g_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/ESMF-Nightly-Testing-Bighorn/gfortran_8.2.0_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/ESMF-Nightly-Testing-Bighorn/gfortran_8.2.0_mpiuni_g_develop/module-build.log
export WORK_ROOT=/project/esmf/ESMF-Nightly-Testing-Bighorn/gfortran_8.2.0_mpiuni_g_develop
export TEMP_ROOT=/project/esmf/ESMF-Nightly-Testing-Bighorn/gfortran_8.2.0_mpiuni_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 8 2>&1| tee $WORK_ROOT/build.log
