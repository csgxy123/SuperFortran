#!/bin/bash

# mytest
pgfortran -Mcuda -c mytests.cuf
pgfortran -Mcuda eds.f03 mytests.o -o eds

# ramp
pgfortran -c ramp.cuf
# pgfortran testramp.f03 ramp.o -o ramp

rm *.o *.mod
