# Use this makefile for a cross-platform overo build

ifeq ($(strip $(OETMP)),)
	OETMP = ${OVEROTOP}/tmp
endif


TOOLDIR = $(OETMP)/sysroots/`uname -m`-linux/usr/armv7a/bin
STAGEDIR = $(OETMP)/sysroots/armv7a-angstrom-linux-gnueabi/usr

# CC = $(TOOLDIR)/arm-angstrom-linux-gnueabi-gcc
CXX = $(TOOLDIR)/arm-angstrom-linux-gnueabi-g++
CXXFLAGS = -Wall

LIBDIR = $(STAGEDIR)/lib -lopencv_calib3d -lopencv_imgproc -lopencv_contrib -lopencv_legacy -lopencv_core -lopencv_ml -lopencv_features2d -lopencv_objdetect -lopencv_flann -lopencv_video -lopencv_highgui
INCDIR = $(STAGEDIR)/include -I $(STAGEDIR)/include/opencv

# SRC = gumsnap.c
SRC = src/main.cpp
# SRC = src/sampleio.cpp

#TARGET = gumsnap
TARGET = bin/smiledetector
#TARGET = bin/sampleio

$(TARGET): $(SRC)
	$(CXX) $(CXXFLAGS) -I $(INCDIR) -L $(LIBDIR) $(SRC) -o $(TARGET)
	$(CXX) $(CXXFLAGS) -I $(INCDIR) -L $(LIBDIR) $(SRC) -D_DEBUG -o $(TARGET)_debug

clean:
	rm -f $(TARGET)
