#!/bin/bash -l
#SBATCH --account=nems
#SBATCH -o /scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state/test.bat_%j.o
#SBATCH -e /scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state/test.bat_%j.e
#SBATCH --time=2:00:00
#SBATCH --partition=hera
#SBATCH --qos=batch
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --exclusive
export JOBID=$SLURM_JOBID


module load cmake/3.28.1
module load gnu/13.2.0 

set -x
export ESMF_DIR=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state/esmf
export ESMF_COMPILER=gfortran
export ESMF_COMM=mpiuni
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state/module-test.log
export WORK_ROOT=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state
export TEMP_ROOT=/scratch3/NCEPDEV/stmp/Gerhard.Theurich/ESMF-Nightly-Testing-Hera/gfortran_13.2.0_mpiuni_g_fix_esmx-data-internal-state
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
make install 2>&1| tee $WORK_ROOT/install.log
make all_tests 2>&1| tee $WORK_ROOT/test.log
export ESMFMKFILE=`find $PWD/DEFAULTINSTALLDIR -iname esmf.mk`
export CMAKE_PREFIX_PATH=$(dirname $ESMFMKFILE)/cmake/ESMF:${CMAKE_PREFIX_PATH}
