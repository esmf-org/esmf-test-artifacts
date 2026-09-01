# ESMF application makefile fragment
#
# Use the following ESMF_ variables to compile and link
# your ESMF application against this ESMF build.
#
# !!! VERY IMPORTANT: If the location of this ESMF build is   !!!
# !!! changed, e.g. libesmf.a is copied to another directory, !!!
# !!! this file - esmf.mk - must be edited to adjust to the   !!!
# !!! correct new path                                        !!!
#
# Please see end of file for options used on this ESMF build
#

#----------------------------------------------
ESMF_VERSION_STRING=9.0.0 beta snapshot
ESMF_VERSION_STRING_GIT=develop+g849fce6537
#----------------------------------------------

ESMF_VERSION_MAJOR=9
ESMF_VERSION_MINOR=0
ESMF_VERSION_REVISION=0
ESMF_VERSION_PATCHLEVEL=0
ESMF_VERSION_PUBLIC='F'
ESMF_VERSION_BETASNAPSHOT='T'


ESMF_APPSDIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/apps/appsg/Darwin.gfortran.64.openmpi.default
ESMF_LIBSDIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_ESMXDIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/src/addon/ESMX
ESMF_CMAKEDIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/cmake


ESMF_F90COMPILER=mpifort
ESMF_F90LINKER=mpifort

ESMF_F90COMPILEOPTS=-g -Wall -Wextra -Wconversion -Wno-unused -Wno-unused-dummy-argument -fbacktrace -fimplicit-none -fcheck=all,no-pointer  -fPIC -pthread -ffree-line-length-none -fopenmp
ESMF_F90COMPILEPATHS=-I/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/mod/modg/Darwin.gfortran.64.openmpi.default -I/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/src/include -I/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/include -I/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/include
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='develop+g849fce6537' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DYAML=ESMF_YAML -DESMF_YAMLCPP=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=openmpi -DESMF_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=-ffree-form
ESMF_F90COMPILEFIXCPP=-cpp -ffixed-form
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS= -pthread -fopenmp
ESMF_F90LINKPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/gcc-14.2.0-qqymykmrplffv57mi6bq7jls5ndk3ymq/lib/gcc/aarch64-apple-darwin24.5.0/14.2.0/../../../
ESMF_F90ESMFLINKPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_F90LINKRPATHS=
ESMF_F90ESMFLINKRPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_F90LINKLIBS=-lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++
ESMF_F90ESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++

ESMF_CXXCOMPILER=mpicxx
ESMF_CXXLINKER=mpicxx

ESMF_CXXCOMPILEOPTS=-std=c++11 -g -Wall -Wextra -Wno-unused  -fPIC -pthread -fopenmp
ESMF_CXXCOMPILEPATHS=-I/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/src/include  -I/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/include -I/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='develop+g849fce6537' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DYAML=ESMF_YAML -DESMF_YAMLCPP=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=openmpi -DESMF_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf -D__SDIR__='' -DESMF_CXXSTD=11 -DESMF_NO_SIGUSR2

ESMF_CXXLINKOPTS= -pthread -fopenmp
ESMF_CXXLINKPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/gcc-14.2.0-qqymykmrplffv57mi6bq7jls5ndk3ymq/lib/gcc/aarch64-apple-darwin24.5.0/14.2.0/../../../
ESMF_CXXESMFLINKPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_CXXLINKRPATHS=
ESMF_CXXESMFLINKRPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_CXXLINKLIBS=-lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lgfortran
ESMF_CXXESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lgfortran

ESMF_CCOMPILER=mpicc
ESMF_CLINKER=mpicc

ESMF_CCOMPILEOPTS=-std=c99 -g  -fPIC -fopenmp
ESMF_CCOMPILEPATHS=-I/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/src/include   -I/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/build_config/Darwin.gfortran.default
ESMF_CCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='develop+g849fce6537' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DYAML=ESMF_YAML -DESMF_YAMLCPP=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=openmpi -DESMF_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf -D__SDIR__='' -DESMF_CSTD=99

ESMF_CLINKOPTS= -fopenmp
ESMF_CLINKPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/gcc-14.2.0-qqymykmrplffv57mi6bq7jls5ndk3ymq/lib/gcc/aarch64-apple-darwin24.5.0/14.2.0/../../../ -L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/gcc-14.2.0-qqymykmrplffv57mi6bq7jls5ndk3ymq/lib/gcc/aarch64-apple-darwin24.5.0/14.2.0/../../../
ESMF_CESMFLINKPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_CLINKRPATHS=
ESMF_CESMFLINKRPATHS=-L/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default
ESMF_CLINKLIBS=-lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lgfortran -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++
ESMF_CESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lgfortran -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++

ESMF_SO_F90COMPILEOPTS=-fPIC
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=
ESMF_SO_CXXCOMPILEOPTS=-fPIC
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=
ESMF_SO_CCOMPILEOPTS=-fPIC
ESMF_SO_CLINKOPTS=-shared
ESMF_SO_CLINKOPTSEXE=

ESMF_SL_SUFFIX=dylib

ESMF_OPENMP_F90COMPILEOPTS=-fopenmp
ESMF_OPENMP_F90LINKOPTS=-fopenmp
ESMF_OPENMP_CXXCOMPILEOPTS=-fopenmp
ESMF_OPENMP_CXXLINKOPTS=-fopenmp

ESMF_OPENACC_F90COMPILEOPTS=-fopenacc
ESMF_OPENACC_F90LINKOPTS=-fopenacc
ESMF_OPENACC_CXXCOMPILEOPTS=-fopenacc
ESMF_OPENACC_CXXLINKOPTS=-fopenacc

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf/lib/libg/Darwin.gfortran.64.openmpi.default/libesmftrace_preload.dylib
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static
ESMF_TRACE_DYNAMICLINKLIBS=-lesmftrace_preload
ESMF_F90ESMFPRELOADLINKLIBS=-lesmf -lesmftrace_preload -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf
ESMF_INTERNAL_MPIRUN="mpirun "

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /usr/local/esmf/esmf-testing/gfortran_14.2.0_openmpi_g_develop/esmf
# ESMF_OS: Darwin
# ESMF_MACHINE: arm64
# ESMF_ABI: 64
# ESMF_COMPILER: gfortran
# ESMF_BOPT: g
# ESMF_COMM: openmpi
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: ON
# ESMF_OPENACC: OFF
# ESMF_ARRAY_LITE: FALSE
# ESMF_NO_INTEGER_1_BYTE: TRUE
# ESMF_NO_INTEGER_2_BYTE: TRUE
# ESMF_FORTRANSYMBOLS: default
# ESMF_MAPPER_BUILD: OFF
# ESMF_AUTO_LIB_BUILD: ON
# ESMF_DEFER_LIB_BUILD: ON
# ESMF_SHARED_LIB_BUILD: ON
# 
# ESMF environment variables pointing to 3rd party software:
# ESMF_MOAB:              internal
# ESMF_LAPACK:            internal
# ESMF_ACC_SOFTWARE_STACK:            none
# ESMF_NETCDF:            nc-config
# ESMF_NETCDF_INCLUDE:    /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/include
# ESMF_NETCDF_LIBS:       -lnetcdf
# ESMF_NETCDF_LIBPATH:    /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.2-fwi4w4n456fqjmwvrkqbsyp4uvbe3b7w/lib
# ESMF_NFCONFIG:          nf-config
# ESMF_NETCDFF_INCLUDE:   /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/include
# ESMF_NETCDFF_LIBS:      -lnetcdff -lnetcdf -lnetcdf -lm
# ESMF_NETCDFF_LIBPATH:   /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-etm2w4uwf2et4w2qrvv5taity4jdauzi/lib
# ESMF_PIO:               internal
# ESMF_PIO_LIBS:          -lpioc
# ESMF_YAMLCPP:           internal
#
# * Compilers, Linkers, Flags, and Libraries *
# Location of the preprocessor:      /usr/local/esmf/spack/opt/spack/darwin-m1/gcc-14.2.0-qqymykmrplffv57mi6bq7jls5ndk3ymq/bin/gcc
# Location of the Fortran compiler:  /usr/local/esmf/spack/opt/spack/darwin-m1/openmpi-5.0.8-baycfopqjxmd5f5w67ff46qprpg7wm33/bin/mpifort
# Location of the Fortran linker:    /usr/local/esmf/spack/opt/spack/darwin-m1/openmpi-5.0.8-baycfopqjxmd5f5w67ff46qprpg7wm33/bin/mpifort
# Location of the C++ compiler:      /usr/local/esmf/spack/opt/spack/darwin-m1/openmpi-5.0.8-baycfopqjxmd5f5w67ff46qprpg7wm33/bin/mpicxx
# Location of the C++ linker:        /usr/local/esmf/spack/opt/spack/darwin-m1/openmpi-5.0.8-baycfopqjxmd5f5w67ff46qprpg7wm33/bin/mpicxx
# Location of the C compiler:        /usr/local/esmf/spack/opt/spack/darwin-m1/openmpi-5.0.8-baycfopqjxmd5f5w67ff46qprpg7wm33/bin/mpicc
# Location of the C linker:          /usr/local/esmf/spack/opt/spack/darwin-m1/openmpi-5.0.8-baycfopqjxmd5f5w67ff46qprpg7wm33/bin/mpicc
#
