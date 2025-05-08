#!/bin/bash -l
#SBATCH --account=esrl_bmcs
#SBATCH -o /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2023.2.0-oneAPI_mpi_g_develop/build.bat_%j.o
#SBATCH -e /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2023.2.0-oneAPI_mpi_g_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c5
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load PrgEnv-intel git cmake cray-libsci
module load intel-oneapi/2023.2.0 cray-mpich/8.1.28
module load cray-hdf5/1.12.2.9 cray-netcdf/4.9.0.9

set -x
export ESMF_NETCDF_INCLUDE="$CRAY_NETCDF_PREFIX/include"
export ESMF_NETCDF_LIBPATH="$CRAY_NETCDF_PREFIX/lib"
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_MPILAUNCHOPTIONS=--exact
export ESMF_DIR=/gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2023.2.0-oneAPI_mpi_g_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2023.2.0-oneAPI_mpi_g_develop/module-build.log
export WORK_ROOT=/gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/intel_2023.2.0-oneAPI_mpi_g_develop
export TEMP_ROOT=/tmp/intel_2023.2.0-oneAPI_mpi_g_develop
rsync -a $WORK_ROOT/esmf $TEMP_ROOT
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 128 2>&1| tee $WORK_ROOT/build.log
cd
rsync -a $TEMP_ROOT/esmf $WORK_ROOT
rm -rf $TEMP_ROOT
