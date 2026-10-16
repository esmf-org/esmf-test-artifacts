#!/bin/bash -l
module load cmake
module load None openmpi/fjdj7gt
module load netcdf-c/d5o6huw netcdf-fortran/7erikgt

set -x
export ESMPY_DATA_DIR="/usr/local/esmf/esmf-testing/esmf-test-data/grids"
export ESMF_DIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_openmpi_g_develop/esmf
export ESMF_COMPILER=nagclang
export ESMF_COMM=openmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
cd /usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_openmpi_g_develop/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
/usr/local/esmf/esmf-testing/esmf-test-scripts/py_env_creation/py_env_create --path /usr/local/esmf/esmf-testing/conda_environments --file environment-python3.11-numpy1.26.yml
cd /usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_openmpi_g_develop
conda activate /usr/local/esmf/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.11-numpy1.26
rm -rf esmpy_venv
python3 -m venv --system-site-packages esmpy_venv
. esmpy_venv/bin/activate
cd /usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_openmpi_g_develop/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_openmpi_g_develop/esmpy-install.log
make download 2>&1| tee /usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_openmpi_g_develop/esmpy-download.log
deactivate
conda deactivate
