#!/bin/bash -l
#SBATCH --account=esrl_bmcs
#SBATCH -o /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.3.0_mpi_g_develop/test.bat_%j.o
#SBATCH -e /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.3.0_mpi_g_develop/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --cluster=c5
#SBATCH --qos=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=128
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module unload PrgEnv-intel cray-mpich
module load PrgEnv-gnu git cmake
module load gcc-native/12.3 cray-mpich/8.1.28
module load cray-hdf5/1.12.2.9 cray-netcdf/4.9.0.9

set -x
export ESMF_NETCDF_LIBS="-lnetcdff -lnetcdf"
export ESMF_MPILAUNCHOPTIONS=--exact
export ESMF_DIR=/gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.3.0_mpi_g_develop/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.3.0_mpi_g_develop/module-test.log
export WORK_ROOT=/gpfs/f5/nggps_emc/world-shared/Gerhard.Theurich/ESMF-Nightly-Testing-C5/gfortran_12.3.0_mpi_g_develop
export TEMP_ROOT=/tmp/gfortran_12.3.0_mpi_g_develop
rsync -a $WORK_ROOT/esmf $TEMP_ROOT
rsync -a $WORK_ROOT/nuopc-app-prototypes $TEMP_ROOT
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
cd
rsync -a $TEMP_ROOT/esmf $WORK_ROOT
rsync -a $TEMP_ROOT/nuopc-app-prototypes $WORK_ROOT
rm -rf $TEMP_ROOT
