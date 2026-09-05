#!/bin/bash -l
#SBATCH --account=nems
#SBATCH -o /scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/intel_2023.2.0_intelmpi_g_feature_esmx-cmake/build.bat_%j.o
#SBATCH -e /scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/intel_2023.2.0_intelmpi_g_feature_esmx-cmake/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load gnu/13.2.0
module load cmake/3.28.1
module load intel/2023.2.0 impi/2023.2.0
module load netcdf/4.7.0

set -x
export CXX=icpx
export CC=icx
export FC=ifort
export ESMF_MPIRUN=mpirun.srun
export I_MPI_CXX=icpx
export I_MPI_CC=icx
export I_MPI_F90=ifort
export ESMF_DIR=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/intel_2023.2.0_intelmpi_g_feature_esmx-cmake/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/intel_2023.2.0_intelmpi_g_feature_esmx-cmake/module-build.log
export WORK_ROOT=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/intel_2023.2.0_intelmpi_g_feature_esmx-cmake
export TEMP_ROOT=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/intel_2023.2.0_intelmpi_g_feature_esmx-cmake
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 40 2>&1| tee $WORK_ROOT/build.log
