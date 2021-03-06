#
# Example Makefile.
#

SHELL = /bin/sh

CC=g++
CCFLAGS= -Wall -O3
CCOBJFLAGS= -c
CCEXEFLAGS=
LDFLAGS=
AR=ar
AFLAGS=rcs
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
LIGHTEXECUTABLE=LHC-FASER_Light.exe

all: $(OBJECTS) $(LIBRARYFILE) $(LIGHTEXECUTABLE)

$(OBJECTS): %.o: %.cpp
	$(CC) $(CCFLAGS) $(CCOBJFLAGS) $< -o $@
	
$(LIBRARYFILE): $(OBJECTS)
	$(AR) $(AFLAGS) $@ $(OBJECTS)
	
$(LIGHTEXECUTABLE): LHC-FASER_Light.cpp $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) LHC-FASER_Light.cpp -o $@

clean:
	rm -rf *o $(EXECUTABLE)
	