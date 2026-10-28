#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake/tw2cvya
module load gcc/kykcamd 
module load netcdf-c/wmtjeqb netcdf-fortran/vnbwfbw

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/usr/local/esmf/esmf-testing/gfortranclang_14.2.0_17.0.0_mpiuni_O_develop/esmf
export ESMF_COMPILER=gfortranclang
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/usr/local/esmf/esmf-testing/gfortranclang_14.2.0_17.0.0_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /usr/local/esmf/esmf-testing/gfortranclang_14.2.0_17.0.0_mpiuni_O_develop/module-build.log
export WORK_ROOT=/usr/local/esmf/esmf-testing/gfortranclang_14.2.0_17.0.0_mpiuni_O_develop
export TEMP_ROOT=/usr/local/esmf/esmf-testing/gfortranclang_14.2.0_17.0.0_mpiuni_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 8 2>&1| tee $WORK_ROOT/build.log
