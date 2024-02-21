#!/bin/sh

for name in "$@"
do
  # Create opacity band: hillshade is A, opacity is its invert: 255-A
  echo opacity layer $name
  gdal_calc.py -A ./${name}  --outfile=./opacity.tif --calc="255*(A>220) + 1*(A<=220)"  --overwrite

  # assigns to relevant bands -b 1 and -b 2
  echo merge bands
  gdalbuildvrt -separate -overwrite final.vrt ./${name} ./opacity.tif

  # Create alpha based tif
  echo create alpha ${name}.new
  gdal_translate -co COMPRESS=LZW -co ALPHA=YES ./final.vrt ${name}.new
done
