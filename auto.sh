#!/bin/bash

# mytest
pgfortran -Mcuda -c mytests.cuf
pgfortran -Mcuda eds.f03 mytests.o -o eds

# ramp
pgfortran -Mcuda -c ramp.cuf
pgfortran -Mcuda testramp.f03 ramp.o -o ramp -lcublas

# fill
pgfortran -Mcuda=rdc -c ffill.cuf
pgfortran -Mcuda=rdc tfill.cuf ffill.o -o tfill

# devptr
pgfortran -Mcuda=rdc -c devptr.cuf
pgfortran -Mcuda=rdc devptr.o devptrtest.f03 -o devtest

rm *.o *.mod
