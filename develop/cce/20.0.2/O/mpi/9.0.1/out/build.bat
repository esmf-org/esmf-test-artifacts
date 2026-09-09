#!/bin/bash -l
#SBATCH --account=esrl_bmcs
#SBATCH -o /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/cce_20.0.2_mpi_O_develop/build.bat_%j.o
#SBATCH -e /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/cce_20.0.2_mpi_O_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c5
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module unload PrgEnv-intel cray-mpich
module load PrgEnv-cray
module load git
module load cmake
module load cce/20.0.2 cray-mpich/9.0.1
module load cray-hdf5/1.14.3.7 cray-netcdf/4.9.2.1

set -x
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_MPILAUNCHOPTIONS=--exact
export ESMF_DIR=/gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/cce_20.0.2_mpi_O_develop/esmf
export ESMF_COMPILER=cce
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/cce_20.0.2_mpi_O_develop/module-build.log
export WORK_ROOT=/gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/cce_20.0.2_mpi_O_develop
export TEMP_ROOT=/tmp/cce_20.0.2_mpi_O_develop
rsync -a $WORK_ROOT/esmf $TEMP_ROOT
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 128 2>&1| tee $WORK_ROOT/build.log
cd
rsync -a $TEMP_ROOT/esmf $WORK_ROOT
rm -rf $TEMP_ROOT
