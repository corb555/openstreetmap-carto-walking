# NOTE: OSM filenames must not have a space in them!

# This Makefile processes all .osm and .osm.pbf files in the specified data directory using osm2pgsql.
# If the .osm or .osm.pbf file is newer than its corresponding .done file, osm2pgsql is run on the file,
# and a .done file is created in the "done" directory to indicate completion. The `clean` target removes
# all generated .done files.

# Define the shell to use
SHELL := /bin/bash

# Define the data directory and the done directory
DATA_DIR := "/Users/mike/Documents2/map_data/OSM"
DONE_DIR := imported

# Create the done directory if it doesn't exist
$(shell mkdir -p $(DONE_DIR))

# Find all .osm and .osm.pbf files in the data directory
OSM_FILES := $(wildcard $(DATA_DIR)*.osm $(DATA_DIR)*.osm.pbf)

# Define the target for each .osm and .osm.pbf file, placing the .done files in the done directory
TARGETS := $(patsubst $(DATA_DIR)%, $(DONE_DIR)/%.done, $(OSM_FILES))

# Default target to run all jobs
all: $(TARGETS)

# Rule to run osm2pgsql if .osm or .osm.pbf file is newer than its .done file
$(DONE_DIR)/%.done: $(DATA_DIR)% | $(DONE_DIR)
	@echo "Processing $*"
	@echo "Running osm2pgsql on '$<'"  # Quoting the input file
	@osm2pgsql -d gis --append --slim -G --hstore --tag-transform-script openstreetmap-carto.lua -S openstreetmap-carto.style "$<" && \
	echo "Creating $@ to indicate completion" && \
	touch "$@"

# Debug target to print the current configuration
debug: 	
	@echo "       "
	@echo "   Data = $(DATA_DIR)"
	@echo "   OSM Files = $(OSM_FILES)"
	@echo "       "
	@echo "   Targets = $(TARGETS)"

# Ensure done directory exists
$(DONE_DIR):
	@mkdir -p $(DONE_DIR)

# Clean up
clean:
	@echo "Cleaning up generated .done files"
	rm -f $(TARGETS)
