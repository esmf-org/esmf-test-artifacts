#!/bin/bash -l
module load ncarenv/23.09 cmake conda/latest julia/1.10.2
module load intel/2023.2.1 
module load netcdf/4.9.2

set -x
export ESMPY_DATA_DIR="/glade/derecho/scratch/sacks/esmf-testing/esmf-test-data/grids"
export ESMF_TEST_NUOPC_JULIA=ON
export ESMF_DIR=/glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
cd /glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop/esmf
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
/glade/work/sacks/esmf-testing/esmf-test-scripts/py_env_creation/py_env_create --path /glade/work/sacks/esmf-testing/conda_environments --file environment-python3.13-numpy2.1.yml
cd /glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop
conda activate /glade/work/sacks/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.13-numpy2.1
rm -rf esmpy_venv
python3 -m venv --system-site-packages esmpy_venv
. esmpy_venv/bin/activate
cd /glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop/esmf/src/addon/esmpy
python3 -m pip install . 2>&1| tee /glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop/esmpy-install.log
make download 2>&1| tee /glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpiuni_g_develop/esmpy-download.log
deactivate
conda deactivate
