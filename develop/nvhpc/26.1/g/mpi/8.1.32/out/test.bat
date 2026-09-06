#!/bin/bash -l
#PBS -N test.bat
#PBS -l walltime=2:00:00
#PBS -q main
#PBS -A p93300606
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load ncarenv/25.10
module load ncarcompilers
module load cmake
module load nvhpc/26.1 cray-mpich/8.1.32
module load netcdf/4.9.3

set -x
export ESMF_MPIRUN=mpiexec
export ESMF_DIR=/glade/derecho/scratch/sacks/esmf-testing/nvhpc_26.1_mpi_g_develop/esmf
export ESMF_COMPILER=nvhpc
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/derecho/scratch/sacks/esmf-testing/nvhpc_26.1_mpi_g_develop/module-test.log
export WORK_ROOT=/glade/derecho/scratch/sacks/esmf-testing/nvhpc_26.1_mpi_g_develop
export TEMP_ROOT=/glade/derecho/scratch/sacks/esmf-testing/nvhpc_26.1_mpi_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
