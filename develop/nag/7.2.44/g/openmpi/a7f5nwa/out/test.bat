#!/bin/bash -l
export JOBID=NO_BATCH
module load cmake
module load gcc/kykcamd openmpi/a7f5nwa
module load netcdf-c/pywk6et netcdf-fortran/busq63s

set -x
export FC=nagfor
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop/esmf
export ESMF_COMPILER=nag
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop/module-test.log
export WORK_ROOT=/usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop
export TEMP_ROOT=/usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
/usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop/esmpy_install.bat
cd /usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop
conda activate /usr/local/esmf/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
. esmpy_venv/bin/activate
cd /usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop/esmf/src/addon/esmpy
make test 2>&1| tee /usr/local/esmf/esmf-testing/nag_7.2.44_openmpi_g_develop/esmpy-test.log
deactivate
conda deactivate
