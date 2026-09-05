#!/bin/bash -l
#SBATCH --account=c6_test_eval
#SBATCH -o /gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpi_O_develop/test.bat_%j.o
#SBATCH -e /gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpi_O_develop/test.bat_%j.e
#SBATCH --time=2:00:00
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
module load intel/2025.2 cray-mpich/8.1.32
module load cray-hdf5/1.14.3.7 cray-netcdf/4.9.2.1

set -x
export ESMF_NETCDF_INCLUDE="$CRAY_NETCDF_PREFIX/include"
export ESMF_NETCDF_LIBPATH="$CRAY_NETCDF_PREFIX/lib"
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_MPILAUNCHOPTIONS=--exact
export ESMF_DIR=/gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpi_O_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpi_O_develop/module-test.log
export WORK_ROOT=/gpfs/f6/c6_test_eval/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C6/intel_2025.2.1_mpi_O_develop
export TEMP_ROOT=/tmp/intel_2025.2.1_mpi_O_develop
rsync -a $WORK_ROOT/esmf $TEMP_ROOT
rsync -a $WORK_ROOT/nuopc-app-prototypes $TEMP_ROOT
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
cd
rsync -a $TEMP_ROOT/esmf $WORK_ROOT
rsync -a $TEMP_ROOT/nuopc-app-prototypes $WORK_ROOT
rm -rf $TEMP_ROOT
