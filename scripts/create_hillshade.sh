#!/bin/sh

for pre in "$@"
do
  echo hillshade $pre
  gdaldem hillshade -co compress=lzw -compute_edges -of GTiff -z 5 -s 30120 ../map_data/DEM/${pre}_1arc_v2.tif img/${pre}_hillshade.tif  -igor
done
