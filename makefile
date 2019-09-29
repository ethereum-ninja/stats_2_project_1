###############
# Makefile for Stats 2 Project 1
# Author: Kevin Thompson
# Last Updated September 24, 2019
###############

DATADIR = ./analysis/data
SOURCEDIR = ./src
SOURCES := $(shell find $(SOURCEDIR) -name "*.R" -type f)
SOURCEOUT = $(SOURCES:.R=.Rout) 

output: $(DATADIR)/pipeline.Rout
	mv .RData $(DATADIR)

$(DATADIR)/pipeline.Rout: $(DATADIR)/pipeline.R $(SOURCEOUT)
	R CMD BATCH $< $@

%.Rout: %.R
	R CMD BATCH $< $@

clean:
	find . -name "*.Rout" -type f -delete