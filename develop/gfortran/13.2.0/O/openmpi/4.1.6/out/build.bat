#!/bin/bash -l
#SBATCH --account=esmf
#SBATCH -o /mnt/lfs5/BMC/esmf/ESMF-Nightly-Testing/gfortran_13.2.0_openmpi_O_develop/build.bat_%j.o
#SBATCH -e /mnt/lfs5/BMC/esmf/ESMF-Nightly-Testing/gfortran_13.2.0_openmpi_O_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=xjet
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake/3.28.1
module load gnu/13.2.0 openmpi/4.1.6

set -x
export ESMF_MPIRUN=mpirun.srun
export ESMF_DIR=/mnt/lfs5/BMC/esmf/ESMF-Nightly-Testing/gfortran_13.2.0_openmpi_O_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=openmpi
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /mnt/lfs5/BMC/esmf/ESMF-Nightly-Testing/gfortran_13.2.0_openmpi_O_develop/module-build.log
export WORK_ROOT=/mnt/lfs5/BMC/esmf/ESMF-Nightly-Testing/gfortran_13.2.0_openmpi_O_develop
export TEMP_ROOT=/mnt/lfs5/BMC/esmf/ESMF-Nightly-Testing/gfortran_13.2.0_openmpi_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 24 2>&1| tee $WORK_ROOT/build.log
