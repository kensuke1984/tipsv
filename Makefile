# makefile .fr tipsv
PROGS = mpi-tipsv
FC	= mpif90
FC2= ifort
FFLAGS	= -O
SRC = calmat.f trialf.f others.f rk3.f glu2.f dcsymbdl0.f dcsymbdl.f mpi-tipsv.f formpi.f
SRC2 = calmat.f trialf.f others.f rk3.f glu2.f dcsymbdl0.f dcsymbdl.f tipsv.f
SRC_SINGLE = calmat.f trialf.f others.f rk3.f glu2.f dcsymbdl0.f dcsymbdl.f mpi-tipsv_single.f formpi.f
OBJS	= $(SRC:.f=.o)
OBJS2 =$(SRC2:.f=.o)
OBJS_SINGLE =$(SRC_SINGLE:.f=.o)
.SUFFIXES: .f .o

all:$(PROGS) tipsv mpi-tipsv_single

mpi-tipsv: $(OBJS)
	$(FC) $(FFLAGS) -o $@ $(OBJS)

tipsv: $(OBJS2)
	$(FC2) $(FFLAGS)  -o $@ $(OBJS2)


mpi-tipsv_single: $(OBJS_SINGLE)
	$(FC) $(FFLAGS) -o $@ $(OBJS_SINGLE)


mpi-tipsv.o: mpi-tipsv.f
	$(FC) $(FFLAGS) -c mpi-tipsv.f -o $@
mpi-tipsv_single.o: mpi-tipsv_single.f
	$(FC) $(FFLAGS) -c mpi-tipsv_single.f -o $@

.f.o:
	$(FC2) $(FFLAGS)  -c $< 

clean:
	rm -f $(OBJS) $(OBJS2) $(OBJS_SINGLE) $(PROGS) mpi-tipsv_single tipsv work
