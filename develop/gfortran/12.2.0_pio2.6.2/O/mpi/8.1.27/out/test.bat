#!/bin/bash -l
#PBS -N test.bat
#PBS -l walltime=2:00:00
#PBS -q main
#PBS -A p93300606
#PBS -l select=1:ncpus=128:mpiprocs=128
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load ncarenv/23.09 cmake parallelio/2.6.2 conda/latest
module load gcc/12.2.0 cray-mpich/8.1.27
module load netcdf/4.9.2

set -x
export ESMPY_DATA_DIR="/glade/derecho/scratch/sacks/esmf-testing/esmf-test-data/grids"
export ESMF_MPIRUN=mpiexec
export ESMF_PIO=external
export ESMF_PIO_INCLUDE="$PIO/include"
export ESMF_PIO_LIBPATH="$PIO/lib"
export ESMF_DIR=/glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop/module-test.log
export WORK_ROOT=/glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop
export TEMP_ROOT=/glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
ssh derecho6 /glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop/esmpy_install.bat
cd /glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop
conda activate /glade/work/sacks/esmf-testing/conda_environments/esmf-test-scripts-environment-python3.8-numpy1.19
. esmpy_venv/bin/activate
cd /glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop/esmf/src/addon/esmpy
make test 2>&1| tee /glade/derecho/scratch/sacks/esmf-testing/gfortran_12.2.0_pio2.6.2_mpi_O_develop/esmpy-test.log
deactivate
conda deactivate
