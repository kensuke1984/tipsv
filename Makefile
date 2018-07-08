# makefile .fr tipsv
PROGS = mpi-tipsv
FC	= mpif90
FC2= ifort
FFLAGS	= -O
SRC = calmat.f90 trialf.f90 others.f90 rk3.f90 glu2.f90 dcsymbdl0.f90 dcsymbdl.f90 \
	mpi-tipsv.f90 formpi.f90
OBJS	= $(SRC:.f90=.o)
.SUFFIXES: .f90 .o

all:$(PROGS) 

mpi-tipsv: $(OBJS)
	$(FC) $(FFLAGS) -o $@ $(OBJS)

mpi-tipsv.o: mpi-tipsv.f90
	$(FC) $(FFLAGS) -c mpi-tipsv.f90 -o $@

.f90.o:
	$(FC2) $(FFLAGS) -c $< 

clean:
	rm -f $(OBJS) $(PROGS) work
