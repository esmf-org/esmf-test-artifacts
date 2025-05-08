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
ESMF_VERSION_STRING=8.9.0 beta snapshot
ESMF_VERSION_STRING_GIT=v8.9.0b08-5-g079ca68fdc
#----------------------------------------------

ESMF_VERSION_MAJOR=8
ESMF_VERSION_MINOR=9
ESMF_VERSION_REVISION=0
ESMF_VERSION_PATCHLEVEL=0
ESMF_VERSION_PUBLIC='F'
ESMF_VERSION_BETASNAPSHOT='T'


ESMF_APPSDIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/apps/appsg/Linux.gfortran.64.mpich.default
ESMF_LIBSDIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_ESMXDIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/src/addon/ESMX
ESMF_CMAKEDIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/cmake


ESMF_F90COMPILER=mpif90
ESMF_F90LINKER=mpif90

ESMF_F90COMPILEOPTS=-g -Wall -Wextra -Wconversion -Wno-unused -Wno-unused-dummy-argument -fbacktrace -fimplicit-none -fcheck=all,no-pointer -fPIC  -m64 -mcmodel=small -pthread -ffree-line-length-none  -fopenmp
ESMF_F90COMPILEPATHS=-I/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/mod/modg/Linux.gfortran.64.mpich.default -I/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/src/include -I/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/include -I/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/include
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.9.0b08-5-g079ca68fdc' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpich -DESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf
ESMF_F90COMPILEFREECPP=
ESMF_F90COMPILEFREENOCPP=-ffree-form
ESMF_F90COMPILEFIXCPP=-cpp -ffixed-form
ESMF_F90COMPILEFIXNOCPP=

ESMF_F90LINKOPTS=   -m64 -mcmodel=small -pthread -Wl,--no-as-needed  -fopenmp
ESMF_F90LINKPATHS=-L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/
ESMF_F90ESMFLINKPATHS=-L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default  -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_F90LINKLIBS=-lpioc -lnetcdf -lnetcdff -lrt -lstdc++ -ldl
ESMF_F90ESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lrt -lstdc++ -ldl

ESMF_CXXCOMPILER=mpicxx
ESMF_CXXLINKER=mpicxx

ESMF_CXXCOMPILEOPTS=-std=c++11 -g -Wall -Wextra -Wno-unused  -fPIC -m64 -mcmodel=small -pthread  -fopenmp
ESMF_CXXCOMPILEPATHS= -I/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/src/include  -I/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/include -I/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.9.0b08-5-g079ca68fdc' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpich -DESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf -D__SDIR__='' -DESMF_CXXSTD=11

ESMF_CXXLINKOPTS=  -m64 -mcmodel=small -pthread -Wl,--no-as-needed  -fopenmp
ESMF_CXXLINKPATHS=-L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/
ESMF_CXXESMFLINKPATHS=-L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default  -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_CXXLINKLIBS=-lpioc -lnetcdf -lnetcdff -lrt -lgfortran -ldl
ESMF_CXXESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lrt -lgfortran -ldl

ESMF_CCOMPILER=mpicc
ESMF_CLINKER=mpicc

ESMF_CCOMPILEOPTS=-std=c99 -g -fPIC  -fopenmp
ESMF_CCOMPILEPATHS=-I/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/src/include   -I/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/build_config/Linux.gfortran.default
ESMF_CCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='v8.9.0b08-5-g079ca68fdc' -DESMF_LOWERCASE_SINGLEUNDERSCORE -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DESMF_YAMLCPP=1 -DESMF_YAML=1 -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_g -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DSx86_64_small=1 -DESMF_OS_Linux=1 -DESMF_COMM=mpich -DESMF_DIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf -D__SDIR__='' -DESMF_CSTD=99

ESMF_CLINKOPTS=   -fopenmp
ESMF_CLINKPATHS=-L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/ -L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -L/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/
ESMF_CESMFLINKPATHS=-L/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_CLINKRPATHS=-Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/ -Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64 -Wl,-rpath,/opt/GCC/7.4.0/lib64/gcc/x86_64-pc-linux-gnu/7.4.0/../../../../lib64/
ESMF_CESMFLINKRPATHS=-Wl,-rpath,/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default
ESMF_CLINKLIBS=-lpioc -lnetcdf -lnetcdff -lrt -lgfortran -ldl -lpioc -lnetcdf -lnetcdff -lrt -lstdc++ -ldl
ESMF_CESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lrt -lgfortran -ldl -lpioc -lnetcdf -lnetcdff -lrt -lstdc++ -ldl

ESMF_SO_F90COMPILEOPTS=-fPIC
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CXXCOMPILEOPTS=-fPIC
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=-Wl,-export-dynamic
ESMF_SO_CCOMPILEOPTS=-fPIC
ESMF_SO_CLINKOPTS=-shared
ESMF_SO_CLINKOPTSEXE=-Wl,-export-dynamic

ESMF_OPENMP_F90COMPILEOPTS= -fopenmp
ESMF_OPENMP_F90LINKOPTS= -fopenmp
ESMF_OPENMP_CXXCOMPILEOPTS= -fopenmp
ESMF_OPENMP_CXXLINKOPTS= -fopenmp

ESMF_OPENACC_F90COMPILEOPTS= -fopenacc
ESMF_OPENACC_F90LINKOPTS= -fopenacc
ESMF_OPENACC_CXXCOMPILEOPTS= -fopenacc
ESMF_OPENACC_CXXLINKOPTS= -fopenacc

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf/lib/libg/Linux.gfortran.64.mpich.default/libesmftrace_preload.so
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static
ESMF_TRACE_DYNAMICLINKLIBS=-lesmftrace_preload
ESMF_F90ESMFPRELOADLINKLIBS=-lesmf -lesmftrace_preload -lpioc -lnetcdf -lnetcdff -lrt -lstdc++ -ldl

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf
ESMF_INTERNAL_MPIRUN="mpirun "

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /home/gerhard/ESMF-Nightly-Testing/gfortran_7.4.0_mpich_g_develop/esmf
# ESMF_OS: Linux
# ESMF_MACHINE: x86_64
# ESMF_ABI: 64
# ESMF_COMPILER: gfortran
# ESMF_BOPT: g
# ESMF_COMM: mpich
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
# ESMF_NETCDF_INCLUDE:    /opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/include
# ESMF_NETCDF_LIBS:       -lnetcdf
# ESMF_NETCDF_LIBPATH:    /opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64
# ESMF_NFCONFIG:          nf-config
# ESMF_NETCDFF_INCLUDE:   /opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/include
# ESMF_NETCDFF_LIBS:      -lnetcdff
# ESMF_NETCDFF_LIBPATH:   /opt/GCC/7.4.0/mpich/3.3.1/netcdf/4.7.4/lib64
# ESMF_PIO:               internal
# ESMF_PIO_LIBS:          -lpioc
# ESMF_YAMLCPP:           internal
#
# * Compilers, Linkers, Flags, and Libraries *
# Location of the preprocessor:      /opt/GCC/7.4.0/bin/gcc
# Location of the Fortran compiler:  /opt/GCC/7.4.0/mpich/3.3.1/bin/mpif90
# Location of the Fortran linker:    /opt/GCC/7.4.0/mpich/3.3.1/bin/mpif90
# Location of the C++ compiler:      /opt/GCC/7.4.0/mpich/3.3.1/bin/mpicxx
# Location of the C++ linker:        /opt/GCC/7.4.0/mpich/3.3.1/bin/mpicxx
# Location of the C compiler:        /opt/GCC/7.4.0/mpich/3.3.1/bin/mpicc
# Location of the C linker:          /opt/GCC/7.4.0/mpich/3.3.1/bin/mpicc
#
