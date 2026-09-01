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


ESMF_APPSDIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/apps/appsO/Darwin.nagclang.64.mpiuni.default
ESMF_LIBSDIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_ESMXDIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/addon/ESMX
ESMF_CMAKEDIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/cmake


ESMF_F90COMPILER=nagfor
ESMF_F90LINKER=nagfor

ESMF_F90COMPILEOPTS=-O0  -PIC -DESMF_NAG_UNIX_MODULE -dusty -thread_safe
ESMF_F90COMPILEPATHS=-I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/mod/modO/Darwin.nagclang.64.mpiuni.default -I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/include -I/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/include -I/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/include
ESMF_F90COMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='develop+g849fce6537' -DESMF_MPIUNI -I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DYAML=ESMF_YAML -DESMF_YAMLCPP=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=mpiuni -DESMF_DIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf
ESMF_F90COMPILEFREECPP=-free -fpp
ESMF_F90COMPILEFREENOCPP=-free
ESMF_F90COMPILEFIXCPP=-fixed -fpp
ESMF_F90COMPILEFIXNOCPP=-fixed

ESMF_F90LINKOPTS= -thread_safe
ESMF_F90LINKPATHS=-L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
ESMF_F90ESMFLINKPATHS=-L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_F90LINKRPATHS=-Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default  -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
ESMF_F90ESMFLINKRPATHS=-Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_F90LINKLIBS=-lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++
ESMF_F90ESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++

ESMF_CXXCOMPILER=clang++
ESMF_CXXLINKER=clang++

ESMF_CXXCOMPILEOPTS=-std=c++11 -O0 -DNDEBUG  -fPIC -x c++ -mmacosx-version-min=10.7 -stdlib=libc++ -pthread
ESMF_CXXCOMPILEPATHS=-I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/include  -I/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/include -I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/prologue/yaml-cpp/include
ESMF_CXXCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='develop+g849fce6537' -DESMF_MPIUNI -I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DYAML=ESMF_YAML -DESMF_YAMLCPP=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=mpiuni -DESMF_DIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf -D__SDIR__='' -DESMF_CXXSTD=11

ESMF_CXXLINKOPTS= -pthread
ESMF_CXXLINKPATHS=-L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
ESMF_CXXESMFLINKPATHS=-L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_CXXLINKRPATHS=-Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default  -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
ESMF_CXXESMFLINKRPATHS=-Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_CXXLINKLIBS=-lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm /usr/local/lib/NAG_Fortran/quickfit.o -Xlinker -flat_namespace -Xlinker -rpath -Xlinker /usr/local/lib/NAG_Fortran /usr/local/lib/NAG_Fortran/libf72rts.dylib /usr/local/lib/NAG_Fortran/libf72rts.a -lm
ESMF_CXXESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm /usr/local/lib/NAG_Fortran/quickfit.o -Xlinker -flat_namespace -Xlinker -rpath -Xlinker /usr/local/lib/NAG_Fortran /usr/local/lib/NAG_Fortran/libf72rts.dylib /usr/local/lib/NAG_Fortran/libf72rts.a -lm

ESMF_CCOMPILER=clang
ESMF_CLINKER=clang

ESMF_CCOMPILEOPTS=-std=c99 -O0 -DNDEBUG  -fPIC -pthread
ESMF_CCOMPILEPATHS=-I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/include   -I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/build_config/Darwin.nagclang.default
ESMF_CCOMPILECPPFLAGS=-DESMF_NO_INTEGER_1_BYTE -DESMF_NO_INTEGER_2_BYTE -DESMF_VERSION_STRING_GIT='develop+g849fce6537' -DESMF_MPIUNI -I/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni -DESMF_MOAB=1 -DESMF_LAPACK=1 -DESMF_LAPACK_INTERNAL=1 -DESMF_NO_ACC_SOFTWARE_STACK=1 -DESMF_PIO=1 -DESMF_NETCDF=1 -DYAML=ESMF_YAML -DESMF_YAMLCPP=1 -DESMF_NO_OPENMP -DESMF_NO_OPENACC -DESMF_TESTEXHAUSTIVE -DESMF_BOPT_O -DESMF_TESTPERFORMANCE -DESMF_TESTCOMPTUNNEL -DESMF_TESTWITHTHREADS -DS64=1 -DESMF_OS_Darwin=1 -DESMF_COMM=mpiuni -DESMF_DIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf -D__SDIR__='' -DESMF_CSTD=99

ESMF_CLINKOPTS= -pthread
ESMF_CLINKPATHS=-L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib -L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -L/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
ESMF_CESMFLINKPATHS=-L/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_CLINKRPATHS=-Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib -Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib -Wl,-rpath,/usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
ESMF_CESMFLINKRPATHS=-Wl,-rpath,/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default
ESMF_CLINKLIBS=-lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm /usr/local/lib/NAG_Fortran/quickfit.o -Xlinker -flat_namespace -Xlinker -rpath -Xlinker /usr/local/lib/NAG_Fortran /usr/local/lib/NAG_Fortran/libf72rts.dylib /usr/local/lib/NAG_Fortran/libf72rts.a -lm -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++
ESMF_CESMFLINKLIBS=-lesmf -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm /usr/local/lib/NAG_Fortran/quickfit.o -Xlinker -flat_namespace -Xlinker -rpath -Xlinker /usr/local/lib/NAG_Fortran /usr/local/lib/NAG_Fortran/libf72rts.dylib /usr/local/lib/NAG_Fortran/libf72rts.a -lm -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++

ESMF_SO_F90COMPILEOPTS=-PIC
ESMF_SO_F90LINKOPTS=-shared
ESMF_SO_F90LINKOPTSEXE=
ESMF_SO_CXXCOMPILEOPTS=-fPIC
ESMF_SO_CXXLINKOPTS=-shared
ESMF_SO_CXXLINKOPTSEXE=
ESMF_SO_CCOMPILEOPTS=-fPIC
ESMF_SO_CLINKOPTS=-shared
ESMF_SO_CLINKOPTSEXE=

ESMF_SL_SUFFIX=dylib

ESMF_OPENMP_F90COMPILEOPTS=
ESMF_OPENMP_F90LINKOPTS=
ESMF_OPENMP_CXXCOMPILEOPTS=
ESMF_OPENMP_CXXLINKOPTS=

ESMF_OPENACC_F90COMPILEOPTS=
ESMF_OPENACC_F90LINKOPTS=
ESMF_OPENACC_CXXCOMPILEOPTS=
ESMF_OPENACC_CXXLINKOPTS=

# ESMF Tracing compile/link options
ESMF_TRACE_LDPRELOAD=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/lib/libO/Darwin.nagclang.64.mpiuni.default/libesmftrace_preload.dylib
ESMF_TRACE_STATICLINKOPTS=-static -Wl,--wrap=c_esmftrace_notify_wrappers -Wl,--wrap=c_esmftrace_isinitialized -Wl,--wrap=write -Wl,--wrap=writev -Wl,--wrap=pwrite -Wl,--wrap=read -Wl,--wrap=open -Wl,--wrap=MPI_Allgather -Wl,--wrap=MPI_Allgatherv -Wl,--wrap=MPI_Allreduce -Wl,--wrap=MPI_Alltoall -Wl,--wrap=MPI_Alltoallv -Wl,--wrap=MPI_Alltoallw -Wl,--wrap=MPI_Barrier -Wl,--wrap=MPI_Bcast -Wl,--wrap=MPI_Bsend -Wl,--wrap=MPI_Gather -Wl,--wrap=MPI_Gatherv -Wl,--wrap=MPI_Iprobe -Wl,--wrap=MPI_Irecv -Wl,--wrap=MPI_Irsend -Wl,--wrap=MPI_Isend -Wl,--wrap=MPI_Issend -Wl,--wrap=MPI_Probe -Wl,--wrap=MPI_Recv -Wl,--wrap=MPI_Reduce -Wl,--wrap=MPI_Rsend -Wl,--wrap=MPI_Scan -Wl,--wrap=MPI_Scatter -Wl,--wrap=MPI_Scatterv -Wl,--wrap=MPI_Send -Wl,--wrap=MPI_Sendrecv -Wl,--wrap=MPI_Test -Wl,--wrap=MPI_Testall -Wl,--wrap=MPI_Testany -Wl,--wrap=MPI_Testsome -Wl,--wrap=MPI_Wait -Wl,--wrap=MPI_Waitall -Wl,--wrap=MPI_Waitany -Wl,--wrap=MPI_Waitsome -Wl,--wrap=mpi_allgather_ -Wl,--wrap=mpi_allgather__ -Wl,--wrap=mpi_allgatherv_ -Wl,--wrap=mpi_allgatherv__ -Wl,--wrap=mpi_allreduce_ -Wl,--wrap=mpi_allreduce__ -Wl,--wrap=mpi_alltoall_ -Wl,--wrap=mpi_alltoall__ -Wl,--wrap=mpi_alltoallv_ -Wl,--wrap=mpi_alltoallv__ -Wl,--wrap=mpi_alltoallw_ -Wl,--wrap=mpi_alltoallw__ -Wl,--wrap=mpi_barrier_ -Wl,--wrap=mpi_barrier__ -Wl,--wrap=mpi_bcast_ -Wl,--wrap=mpi_bcast__ -Wl,--wrap=mpi_bsend_ -Wl,--wrap=mpi_bsend__ -Wl,--wrap=mpi_exscan_ -Wl,--wrap=mpi_exscan__ -Wl,--wrap=mpi_gather_ -Wl,--wrap=mpi_gather__ -Wl,--wrap=mpi_gatherv_ -Wl,--wrap=mpi_gatherv__ -Wl,--wrap=mpi_iprobe_ -Wl,--wrap=mpi_iprobe__ -Wl,--wrap=mpi_irecv_ -Wl,--wrap=mpi_irecv__ -Wl,--wrap=mpi_irsend_ -Wl,--wrap=mpi_irsend__ -Wl,--wrap=mpi_isend_ -Wl,--wrap=mpi_isend__ -Wl,--wrap=mpi_issend_ -Wl,--wrap=mpi_issend__ -Wl,--wrap=mpi_probe_ -Wl,--wrap=mpi_probe__ -Wl,--wrap=mpi_recv_ -Wl,--wrap=mpi_recv__ -Wl,--wrap=mpi_reduce_ -Wl,--wrap=mpi_reduce__ -Wl,--wrap=mpi_reduce_scatter_ -Wl,--wrap=mpi_reduce_scatter__ -Wl,--wrap=mpi_rsend_ -Wl,--wrap=mpi_rsend__ -Wl,--wrap=mpi_scatter_ -Wl,--wrap=mpi_scatter__ -Wl,--wrap=mpi_scatterv_ -Wl,--wrap=mpi_scatterv__ -Wl,--wrap=mpi_scan_ -Wl,--wrap=mpi_scan__ -Wl,--wrap=mpi_send_ -Wl,--wrap=mpi_send__ -Wl,--wrap=mpi_sendrecv_ -Wl,--wrap=mpi_sendrecv__ -Wl,--wrap=mpi_test_ -Wl,--wrap=mpi_test__ -Wl,--wrap=mpi_testall_ -Wl,--wrap=mpi_testall__ -Wl,--wrap=mpi_testany_ -Wl,--wrap=mpi_testany__ -Wl,--wrap=mpi_testsome_ -Wl,--wrap=mpi_testsome__ -Wl,--wrap=mpi_wait_ -Wl,--wrap=mpi_wait__ -Wl,--wrap=mpi_waitall_ -Wl,--wrap=mpi_waitall__ -Wl,--wrap=mpi_waitany_ -Wl,--wrap=mpi_waitany__
ESMF_TRACE_STATICLINKLIBS=-lesmftrace_static
ESMF_TRACE_DYNAMICLINKLIBS=-lesmftrace_preload
ESMF_F90ESMFPRELOADLINKLIBS=-lesmf -lesmftrace_preload -lpioc -lnetcdf -lnetcdff -lnetcdf -lnetcdf -lm -lstdc++

# Internal ESMF variables, do NOT depend on these!

ESMF_INTERNAL_DIR=/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf
ESMF_INTERNAL_MPIRUN="/usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf/src/Infrastructure/stubs/mpiuni/mpirun"

#
# !!! The following options were used on this ESMF build !!!
#
# ESMF_DIR: /usr/local/esmf/esmf-testing/nagclang_7.2.44_17.0.0_mpiuni_O_develop/esmf
# ESMF_OS: Darwin
# ESMF_MACHINE: arm64
# ESMF_ABI: 64
# ESMF_COMPILER: nagclang
# ESMF_BOPT: O
# ESMF_OPTLEVEL: 0
# ESMF_COMM: mpiuni
# ESMF_SITE: default
# ESMF_PTHREADS: ON
# ESMF_OPENMP: OFF
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
# ESMF_NETCDF_INCLUDE:    /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/include
# ESMF_NETCDF_LIBS:       -lnetcdf
# ESMF_NETCDF_LIBPATH:    /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-c-4.9.3-hth7a6zrg22od5cqfg7xdlfv4owccsef/lib
# ESMF_NFCONFIG:          nf-config
# ESMF_NETCDFF_INCLUDE:   /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/include
# ESMF_NETCDFF_LIBS:      -lnetcdff -lnetcdf -lnetcdf -lm
# ESMF_NETCDFF_LIBPATH:   /usr/local/esmf/spack/opt/spack/darwin-m1/netcdf-fortran-4.6.2-oboy4y33rs5gaeni7sp6vivucyq4mq2j/lib
# ESMF_PIO:               internal
# ESMF_PIO_LIBS:          -lpioc
# ESMF_YAMLCPP:           internal
#
# * Compilers, Linkers, Flags, and Libraries *
# Location of the preprocessor:      /usr/bin/clang
# Location of the Fortran compiler:  /usr/local/bin/nagfor
# Location of the Fortran linker:    /usr/local/bin/nagfor
# Location of the C++ compiler:      /usr/bin/clang++
# Location of the C++ linker:        /usr/bin/clang++
# Location of the C compiler:        /usr/bin/clang
# Location of the C linker:          /usr/bin/clang
#
