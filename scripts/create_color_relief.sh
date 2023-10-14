#!/bin/sh

for pre in "$@"
do
  echo color relief $pre
  gdaldem color-relief -alpha -of GTiff -z 3.0 -s 2.0 ../map_data/DEM/${pre}_1arc_v2.tif color-relief.txt img/${pre}_coloredRelief.tif
done
