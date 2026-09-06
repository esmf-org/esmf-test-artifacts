#!/bin/bash -l
#SBATCH --account=s1873
#SBATCH -o /discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.13.0_intelmpi_O_feature_esmx-cmake/test.bat_%j.o
#SBATCH -e /discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.13.0_intelmpi_O_feature_esmx-cmake/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=compute
#SBATCH -C mil
#SBATCH --qos=allnccs
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=120
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module use /discover/swdev/gmao_SIteam/modulefiles-SLES15
module load cmake/3.30.3
module load comp/gcc/12.3.0
module load comp/intel/2024.2.0 mpi/impi/2021.13
module load other/esmf-netcdf/ifort_2021.13.0-intelmpi_2021.13.0

set -x
export I_MPI_OFI_PROVIDER=psm3
export I_MPI_FABRICS=shm:ofi
export CXX=icpx
export CC=icx
export FC=ifort
export I_MPI_CXX=icpx
export I_MPI_CC=icx
export I_MPI_F90=ifort
export ESMF_DIR=/discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.13.0_intelmpi_O_feature_esmx-cmake/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=intelmpi
export ESMF_NETCDF=nc-config
export ESMF_BOPT='O'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
module list >& /discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.13.0_intelmpi_O_feature_esmx-cmake/module-test.log
export WORK_ROOT=/discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.13.0_intelmpi_O_feature_esmx-cmake
export TEMP_ROOT=/discover/nobackup/projects/gmao/SIteam/ESMF_Testing/intel_2021.13.0_intelmpi_O_feature_esmx-cmake
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
cd ../nuopc-app-prototypes
./testProtos.sh 2>&1| tee $WORK_ROOT/nuopc.log
