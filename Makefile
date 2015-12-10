ALL: eds ramp tfill devtest textest

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
	rm -f *.o *.mod devtest ramp tfill eds textest 

