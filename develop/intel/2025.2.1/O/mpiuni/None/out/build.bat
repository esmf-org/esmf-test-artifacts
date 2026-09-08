#!/bin/bash -l
#SBATCH --account=c6_test_eval
#SBATCH -o /gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpiuni_O_develop/build.bat_%j.o
#SBATCH -e /gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpiuni_O_develop/build.bat_%j.e
#SBATCH --time=1:00:00
#SBATCH --cluster=c6
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load PrgEnv-intel
module load git
module load cmake
module load cray-libsci
module load intel/2025.2 
module load cray-hdf5/1.14.3.7 cray-netcdf/4.9.2.1

set -x
export ESMF_NETCDF_INCLUDE="$CRAY_NETCDF_PREFIX/include"
export ESMF_NETCDF_LIBPATH="$CRAY_NETCDF_PREFIX/lib"
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_DIR=/gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpiuni_O_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpiuni_O_develop/module-build.log
export WORK_ROOT=/gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpiuni_O_develop
export TEMP_ROOT=/tmp/intel_2025.2.1_mpiuni_O_develop
rsync -a $WORK_ROOT/esmf $TEMP_ROOT
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 128 2>&1| tee $WORK_ROOT/build.log
cd
rsync -a $TEMP_ROOT/esmf $WORK_ROOT
rm -rf $TEMP_ROOT
