#!/bin/bash -l
export JOBID=NO_BATCH
module load CMake/3.24.3
module load compiler/nag/7.0 
module load tool/netcdf/4.6.1/nag

set -x
export ESMF_DIR=/project/esmf/ESMF-Nightly-Testing-Bighorn/nag_7.0_mpiuni_g_develop/esmf
export ESMF_COMPILER=nag
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/ESMF-Nightly-Testing-Bighorn/nag_7.0_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/ESMF-Nightly-Testing-Bighorn/nag_7.0_mpiuni_g_develop/module-test.log
export WORK_ROOT=/project/esmf/ESMF-Nightly-Testing-Bighorn/nag_7.0_mpiuni_g_develop
export TEMP_ROOT=/project/esmf/ESMF-Nightly-Testing-Bighorn/nag_7.0_mpiuni_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
