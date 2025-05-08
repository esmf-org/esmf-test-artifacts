#!/bin/bash -l
#SBATCH --account=s1873
#SBATCH -o /discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.6.0_intelmpi_g_develop/test.bat_%j.o
#SBATCH -e /discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.6.0_intelmpi_g_develop/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=compute
#SBATCH -C mil
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=120
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module use /discover/swdev/gmao_SIteam/modulefiles-SLES15
module load cmake/3.30.3 comp/gcc/11.4.0
module load comp/intel/2021.6.0 mpi/impi/2021.13

set -x
export I_MPI_OFI_PROVIDER=psm3
export I_MPI_FABRICS=shm:ofi
export I_MPI_CXX=icpc
export I_MPI_CC=icc
export ESMF_DIR=/discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.6.0_intelmpi_g_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.6.0_intelmpi_g_develop/module-test.log
export WORK_ROOT=/discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.6.0_intelmpi_g_develop
export TEMP_ROOT=/discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.6.0_intelmpi_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
