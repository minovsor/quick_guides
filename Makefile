## Compiler flags for development
# -c compile but dont link
# -o make object
#
# gfortran
# -ffree-form -Wall -Wextra -fmax-errors=1 -g -fcheck=all -fbacktrace
# ifort
# -warn all -check all

## Conversion flag
# -freal-4-real-8

## Description
# -ffree-form   : Enables free form layout in source files
# -Wall         : Enables commonly used warning options pertaining to usage that
#                we recommend avoiding and that we believe are easy to avoid
# -fcheck       : Enable the generation of run-time checks
# -Wextra       : Enables some warning options for usages of language features
#               which may be problematic.
#-fmax-errors   : Limits the maximum number of error messages to n, at which
#               point GNU Fortran bails out rather than attempting to continue
#               processing the source code.
#-fsyntax-only  : Check the code for syntax errors, but do not actually compile
#               it. This will generate module files for each module present in
#               the code, but no other output file.
# -freal-4-real-8
# -fopenmp
# -Wimplicit-interface  #check explicit interfaces
# -O3
# -mcmodel=medium 


#general paths
VPATH=src
OBJDIR=objs
MODDIR=mods
EXECDIR=exec

#compiler and linker
FC=gfortran
FFLAGS=-o3 -Wall -Wextra -ffree-form

#source codes
SRC=\
htm_calendar.f90 \
htm_vars_objects.f90 \
htm_vars_main.f90 \
htm_0_test.f90 \
htm_1a_machine.f90 \
htm_1b_timer.f90

#tricky variable to convert substring .f90 to .o
OBJ=${SRC:.f90=.o}

# rule to compile file from
%.o : %.f90
	$(FC) $(FFLAGS) -o $@ -c $<


#execution - make all objects from .f90
#uses OBJ variable trick!
model: $(OBJ)
	$(FC) $(FFLAGS) -o $@ $(OBJ)

	{ mv *.o $(OBJDIR) } || {echo " .o files not found"}
	{ mv *.mod $(MODDIR) } || {echo " .mod files not found"}
	{ mv *.exe $(EXECDIR)} || {echo " .exe files not found"}

clean:
	@rm -f *.mod *.o model