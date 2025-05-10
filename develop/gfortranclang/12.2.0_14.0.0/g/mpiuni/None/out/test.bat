#!/bin/bash -l
export JOBID=NO_BATCH
module load gfortran-12.2.0_clang-14.0.0 
module load netcdf-4.9.0

set -x
export ESMF_TESTPERFORMANCE=OFF
export ESMPY_DATA_DIR="/Users/sacks/projects/scratch/esmf-testing/esmf-test-data/grids"
export ESMF_TEST_NUOPC_JULIA=ON
export ESMF_DIR=/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop/esmf
export ESMF_COMPILER=gfortranclang
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop/module-test.log
export WORK_ROOT=/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop
export TEMP_ROOT=/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
/Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop/esmpy_install.bat
cd /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop
conda activate /Users/sacks/projects/scratch/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
. esmpy_venv/bin/activate
cd /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop/esmf/src/addon/esmpy
make test 2>&1| tee /Users/sacks/projects/scratch/esmf-testing/gfortranclang_12.2.0_14.0.0_mpiuni_g_develop/esmpy-test.log
deactivate
conda deactivate
