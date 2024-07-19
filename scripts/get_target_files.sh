# Define the shell to use
SHELL := /bin/bash

# Define the data directory and the done directory
DATA_DIR := "./"
DONE_DIR := imported

# Create the done directory if it doesn't exist
$(shell mkdir -p $(DONE_DIR))

# Generate OSM targets
OSM_TARGETS := $(shell find "$(DATA_DIR)" -maxdepth 1 -type f -name "*.osm" -exec basename {} \; | sed "s|$$|.done|" | sed "s|^|$(DONE_DIR)/|")

# Generate PBF targets
PBF_TARGETS := $(shell find "$(DATA_DIR)" -maxdepth 1 -type f -name "*.osm.pbf" -exec basename {} \; | sed "s|$$|.done|" | sed "s|^|$(DONE_DIR)/|")

# Combine OSM and PBF targets
TARGETS := $(OSM_TARGETS) $(PBF_TARGETS)

# Default target to run all jobs
all: $(TARGETS)

# Rule to run osm2pgsql if .osm file is newer than its .done file
$(DONE_DIR)/%.osm.done: $(DATA_DIR)/%.osm | $(DONE_DIR)
	@echo "Processing $*"
	@echo "Running osm2pgsql on '$<'"  # Quoting the input file
	@osm2pgsql -d gis --append --slim -G --hstore --tag-transform-script openstreetmap-carto.lua -S openstreetmap-carto.style "$<" && \
	echo "Creating $@ to indicate completion" && \
	touch "$@"

# Rule to run osm2pgsql if .osm.pbf file is newer than its .done file
$(DONE_DIR)/%.osm.pbf.done: $(DATA_DIR)/%.osm.pbf | $(DONE_DIR)
	@echo "Processing $*"
	@echo "Running osm2pgsql on '$<'"  # Quoting the input file
	@osm2pgsql -d gis --append --slim -G --hstore --tag-transform-script openstreetmap-carto.lua -S openstreetmap-carto.style "$<" && \
	echo "Creating $@ to indicate completion" && \
	touch "$@"

# Debug target to print the current configuration
debug:
	@echo "       "
	@echo "   Data = $(DATA_DIR)"
	@echo "   Targets = $(TARGETS)"
	@echo "       "

# Ensure done directory exists
$(DONE_DIR):
	@mkdir -p $(DONE_DIR)

# Clean up
clean:
	@echo "Cleaning up generated .done files"
	rm -f $(TARGETS)
