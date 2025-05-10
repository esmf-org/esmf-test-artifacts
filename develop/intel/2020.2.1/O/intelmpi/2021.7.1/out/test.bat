#!/bin/bash -l
#SBATCH --account=da-cpu
#SBATCH -o /work/noaa/da/mpotts/sandbox/intel_2020.2.1_intelmpi_O_develop/test.bat_%j.o
#SBATCH -e /work/noaa/da/mpotts/sandbox/intel_2020.2.1_intelmpi_O_develop/test.bat_%j.e
#SBATCH --time=4:00:00
#SBATCH --partition=orion
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake netcdf-fortran/4.6.0 python/3.10.8 intel-oneapi-mkl/2022.2.1
module load intel-oneapi-compilers/2022.2.1 intel-oneapi-mpi/2021.7.1
module load netcdf-c/4.9.2

set -x
export ESMF_MPIRUN=mpirun.srun
export ESMF_DIR=/work/noaa/da/mpotts/sandbox/intel_2020.2.1_intelmpi_O_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /work/noaa/da/mpotts/sandbox/intel_2020.2.1_intelmpi_O_develop/module-test.log
export WORK_ROOT=/work/noaa/da/mpotts/sandbox/intel_2020.2.1_intelmpi_O_develop
export TEMP_ROOT=/work/noaa/da/mpotts/sandbox/intel_2020.2.1_intelmpi_O_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
