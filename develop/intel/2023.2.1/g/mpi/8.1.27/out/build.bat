#!/bin/bash -l
#PBS -N build.bat
#PBS -l walltime=2:00:00
#PBS -q main
#PBS -A p93300606
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load ncarenv/23.09 cmake conda/latest julia/1.10.2
module load intel/2023.2.1 cray-mpich/8.1.27
module load netcdf/4.9.2

set -x
export ESMPY_DATA_DIR="/glade/derecho/scratch/sacks/esmf-testing/esmf-test-data/grids"
export ESMF_TEST_NUOPC_JULIA=ON
export ESMF_MPIRUN=mpiexec
export ESMF_DIR=/glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpi_g_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpi_g_develop/module-build.log
export WORK_ROOT=/glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpi_g_develop
export TEMP_ROOT=/glade/derecho/scratch/sacks/esmf-testing/intel_2023.2.1_mpi_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 128 2>&1| tee $WORK_ROOT/build.log
