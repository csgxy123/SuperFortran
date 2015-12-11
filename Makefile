ALL: eds ramp tfill devtest textest pttest multi cublasdev cublasdev mmul mapmem async

eds: eds.f03 mytests.o
	pgfortran -Mcuda $+ -o $@

ramp: testramp.f03 ramp.o
	pgfortran -Mcuda -lcublas $+ -o $@

tfill: tfill.cuf ffill.o
	pgfortran -Mcuda=rdc -Minfo $+ -o $@

devtest: devptrtest.f03 devptr.o
	pgfortran -Mcuda=rdc $+ -o $@

textest: textest.f03 memtests.o
	pgfortran -Mcuda=rdc $+ -o $@

pttest: pttest.cuf
	pgfortran -Mcuda=charstring  $+ -o $@

multi: multidimred.cuf
	pgfortran -Mcuda $+ -o $@

cublasdev: mblasd.cuf
	pgfortran -Mcuda=cc35 $+ -lcublas_device -o $@

mmul: mmul.cuf
	pgfortran -Mcuda $+ -c

# failed the test
mapmem: mapmem.cuf
	pgfortran -Mcuda $+ -o $@

async: testAsync.cuf
	pgfortran -Mcuda $+ -o $@

mytests.o: mytests.cuf
	pgfortran -Mcuda -c $+

ramp.o: ramp.cuf
	pgfortran -Mcuda=rdc -c $+

ffill.o: ffill.cuf
	pgfortran -Mcuda=rdc -c $+

devptr.o: devptr.cuf
	pgfortran -Mcuda=rdc -c $+

memtests.o: memtests.cuf
	pgfortran -Mcuda=rdc -c $+

.PHONY: clean
clean:
	rm -f *.o *.mod devtest ramp tfill eds textest pttest multi cublasdev mmul mapmem async
