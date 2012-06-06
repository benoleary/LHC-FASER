#
# LHC-FASER Makefile to compile the libLHC-FASER.a library file.
#

SHELL = /bin/sh

CC=g++
CCFLAGS= -Wall
CCOBJFLAGS= -c
CCEXEFLAGS=
LDFLAGS= -L./ -lLHC-FASER
AR=ar
ARFLAGS=rcs
SOURCES=LHC-FASER.cpp \
 LHC-FASER_base_electroweak_cascade_stuff.cpp \
 LHC-FASER_base_kinematics_stuff.cpp \
 LHC-FASER_base_lepton_distribution_stuff.cpp \
 LHC-FASER_charged_electroweak_cascade_stuff.cpp \
 LHC-FASER_cross-section_stuff.cpp \
 LHC-FASER_derived_lepton_distributions.cpp \
 LHC-FASER_electroweak_cascade_collection_stuff.cpp \
 LHC-FASER_full_cascade_stuff.cpp \
 LHC-FASER_global_stuff.cpp \
 LHC-FASER_input_handling_stuff.cpp \
 LHC-FASER_jet_kinematics_stuff.cpp \
 LHC-FASER_lepton_kinematics_stuff.cpp \
 LHC-FASER_neutral_electroweak_cascade_stuff.cpp \
 LHC-FASER_signal_calculator_stuff.cpp \
 LHC-FASER_signal_data_collection_stuff.cpp \
 LHC-FASER_sparticle_decay_stuff.cpp \
 CppSLHA/CppSLHA_BLOCK.cpp \
 CppSLHA/CppSLHA_EW_scale_spectrum.cpp \
 CppSLHA/CppSLHA_file_reading_stuff.cpp \
 CppSLHA/CppSLHA_global_stuff.cpp \
 CppSLHA/CppSLHA_particle_data.cpp \
 CppSLHA/CppSLHA_PDG_codes_and_data.cpp \
 CppSLHA/CppSLHA_waiting_on_subprocess_executor.cpp \
 CppSLHA/CppSLHA.cpp
OBJECTS=$(SOURCES:.cpp=.o)
LIBRARYFILE=libLHC-FASER.a

.PHONY: all
all: $(SOURCES) $(LIBRARYFILE)
	
$(SOURCES):
	$(CC) $(CCOBJFLAGS) $(CCFLAGS) $< -o $@

$(LIBRARYFILE): $(OBJECTS)
	$(AR) $(ARFLAGS) $@ $(OBJECTS)

.PHONY: deleteobjects
deleteobjects:
	\rm -f $(OBJECTS)

.PHONY: clean
clean:
	\rm -f $(OBJECTS) $(LIBRARYFILE)
