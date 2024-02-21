#!/bin/sh

echo osm_extract.sh
pwd
echo Extract key OSM nodes and ways from an OSM.PBF file
echo Data Directory: "$1"
echo filenames list:  "$1"/"$2"
echo File list basenames without osm.pbf:
cat "$1"/"$2"
# Working dir:  opencarto main directory
# Arg1: data directory
# Arg2: file in data directory that contains base name of files to process

while read -r name; do
  echo OSMOSIS EXTRACT NODES from "$1"/"$name".osm.pbf
  osmosis  --read-pbf "$1"/"$name".osm.pbf  \
  --tf accept-nodes place=city,suburb,town,island natural=mountain_range,peak,volcano,bay,desert,valley,geyser man_made=lighthouse \
  amenity=university,marketplace  historic=castle,district   \
  --tf reject-ways --tf reject-relations \
  --write-xml "$1"/"$name".nodes.osm

  echo OSMOSIS EXTRACT WAYS from "$1"/"$name".osm.pbf
  osmosis   --read-pbf "$1"/"$name".osm.pbf  \
  --tf accept-ways natural=glacier,desert railway=rail,subway,light_rail highway=motorway \
  water=reservoir,river,lake waterway=river landuse=retail,commercial boundary=national_park --used-node  \
  --tf reject-ways usage=branch,science,industrial,military,test service=siding,crossover,yard,spur \
  --write-xml "$1"/"$name".ways.osm

done < "$1"/"$2"
