#!/bin/sh

echo Import the OSM nodes extract file and the OSM ways extract file into GIS database
echo Directory: "$1"
echo File list: "$2"
# Working dir:  opencarto main directory
# Arg1: data directory
# Arg2: file in data directory that contains base name of files to process
cat "$1"/"$2"

while read name; do
    echo Import NODES: osm2pgsql "$1"/"$name".nodes.osm
    osm2pgsql -d gis --append --slim  -G --hstore --tag-transform-script openstreetmap-carto.lua  -S openstreetmap-carto.style "$1"/"$name".nodes.osm
    echo Import WAYS: osm2pgsql "$1"/"$name".ways.osm
    osm2pgsql -d gis --append --slim  -G --hstore --tag-transform-script openstreetmap-carto.lua  -S openstreetmap-carto.style "$1"/"$name".ways.osm

done < "$1"/"$2"
