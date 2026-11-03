#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake/tw2cvya
module load gcc/kykcamd mpich/a552zrn
module load netcdf-c/kjkr6dd netcdf-fortran/kcbfb7v

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_g_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_g_develop/module-build.log
export WORK_ROOT=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_g_develop
export TEMP_ROOT=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 8 2>&1| tee $WORK_ROOT/build.log
