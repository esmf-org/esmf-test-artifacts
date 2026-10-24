#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake/tw2cvya
module load gcc/kykcamd mpich/a552zrn
module load netcdf-c/kjkr6dd netcdf-fortran/kcbfb7v

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpich
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop/module-test.log
export WORK_ROOT=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop
export TEMP_ROOT=/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
/usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop/esmpy_install.bat
cd /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop
conda activate /usr/local/esmf/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
. esmpy_venv/bin/activate
cd /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop/esmf/src/addon/esmpy
make test 2>&1| tee /usr/local/esmf/esmf-testing/gfortran_14.2.0_mpich_O_develop/esmpy-test.log
deactivate
conda deactivate
