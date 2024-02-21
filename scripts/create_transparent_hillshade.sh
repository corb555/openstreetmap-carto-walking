#!/bin/sh


echo DO NOT USE.  use create_hillshade

echo hillshade "$1".vrt "$1"_hillshade.tif
# Create hillshade
gdaldem hillshade "$1".vrt  hillshade.tmp.tif -s 111120 -z 5  -compute_edges -igor

# Create opacity band: hillshade is A, opacity is its invert: 255-A
echo opacity layer "$1"
gdal_calc.py -A hillshade.tmp.tif  --outfile=opacity.tif --calc="255*(A>220) + 1*(A<=220)"  --overwrite

# assigns to relevant bands -b 1 and -b 2
echo merge
gdalbuildvrt -separate -overwrite final.vrt ./hillshade.tmp.tif ./opacity.tif

# Create alpha based tif
echo create alpha "$1"
gdal_translate -co COMPRESS=LZW -co ALPHA=YES ./final.vrt "$1"_hillshade.tif

