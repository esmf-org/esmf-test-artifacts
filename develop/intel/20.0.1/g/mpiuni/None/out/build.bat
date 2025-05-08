#!/bin/bash -l
#PBS -N build.bat
#PBS -l walltime=1:00:00
#PBS -q medium
#PBS -A UNUSED
#PBS -l nodes=1:ppn=48
JOBID="`echo $PBS_JOBID | cut -d. -f1`"

module load compiler/intel/20.0.1 
module load tool/netcdf/4.7.4/intel/20.0.1

set -x
export ESMF_DIR=/project/esmf/ESMF-Nightly-Testing-Izumi/intel_20.0.1_mpiuni_g_develop/esmf
export ESMF_COMPILER=intel
export ESMF_COMM=mpiuni
export ESMF_NETCDF=nc-config
export ESMF_BOPT='g'
export ESMF_TESTEXHAUSTIVE='ON'
export ESMF_TESTWITHTHREADS='ON'
export ESMF_MPIRUN=/project/esmf/ESMF-Nightly-Testing-Izumi/intel_20.0.1_mpiuni_g_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun
module list >& /project/esmf/ESMF-Nightly-Testing-Izumi/intel_20.0.1_mpiuni_g_develop/module-build.log
export WORK_ROOT=/project/esmf/ESMF-Nightly-Testing-Izumi/intel_20.0.1_mpiuni_g_develop
export TEMP_ROOT=/project/esmf/ESMF-Nightly-Testing-Izumi/intel_20.0.1_mpiuni_g_develop
cd $TEMP_ROOT/esmf
export ESMF_DIR=`pwd`
set -o pipefail
make info 2>&1| tee $WORK_ROOT/info.log
make -j 48 2>&1| tee $WORK_ROOT/build.log
