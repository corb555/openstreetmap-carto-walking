
- [Seattle](#seattle)
- [Twitter](#twitter)
- [Hillshade](#hillshade)
   * [Color Relief](#color-relief)
      + [ColorRelief.txt](#colorrelieftxt)
   * [Hill Slope](#hill-slope)
- [INSTALL KOSMTIK & MAPNIK on MACOS:](#install-kosmtik-mapnik-on-macos)
- [Carto CSS Documentation](#carto-css-documentation)
   * [fix permissions:  ](#fix-permissions)
   * [install mapnik using Brew:](#install-mapnik-using-brew)
   * [install postgres and pgAdmin from website](#install-postgres-and-pgadmin-from-website)
   * [Install Noto font](#install-noto-font)
   * [Download OSM data](#download-osm-data)
   * [load osm data:](#load-osm-data)

Somewhat random notes for project

kosmtik serve project.mml

<!-- TOC --><a id="seattle"></a>
# Seattle
http://127.0.0.1:6789/openstreetmap-carto-walking/#9/47.5932/-123.0482

highlight: light rail, tram/streetcar, express bus, ferry, stadium, tourist POI, 

Seattle: stadium, ferris wheel, aquarium, space needle, Chihuly, Disco Park, Myrtle Edwards, Westlake center, Boeing museum

<!-- TOC --><a id="twitter"></a>
# Twitter
@the_transit_guy  @WalkerSeattle  @pushtheneedle  @UrbanistOrg  @JeffSpeckFAICP  @SeattleSubway  @mateosfo  @SounderBruce  @MikeLindblom  @typewriteralley  @Spottnik @quaggy @LukeDistelhorst  @nilocobau  
@DE_Gifford  @GordonOfSeattle @LukeDistelhorst  @KromanDavid     @kglohse    @SNGreenways  @Danielhep @JackConness @19Woodstock

<!-- TOC --><a id="hillshade"></a>
# Hillshade
https://joeyklee.github.io/broc-cli-geo/guide/XX_digital_elevation_models.html
https://blog.mastermaps.com/2012/07/land-cover-mapping-with-mapnik.html
https://www.kreidefossilien.de/en/miscellaneous/custom-hillshading-for-osmand
https://tilemill-project.github.io/tilemill/docs/guides/terrain-data/
https://github.com/cyclosm/cyclosm-cartocss-style/blob/c4e8611aca2f5c00d4cb6b73c3e7bc4676e0627c/project.mml
https://blog.mastermaps.com/search?q=color+relief

gdaldem hillshade ANA_LUREF_NGL_DTM_epsg2169.vrt ANA_LUREF_NGL_DTM_epsg2169_hillshade.tif -co BIGTIFF=YES -co TILED=YES -co COMPRESS=DEFLATE -of GTiff -z 1.0 -s 0.5 -multidirectional

<Layer name="hillshade11"
	srs="+proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +a=6378137 +b=6378137 +units=m +no_defs +over">
	<StyleName>hillshade11</StyleName>
	<Datasource>
	<Parameter name="file">../data/Hillshade/hillshade_d2.tif</Parameter>
	<Parameter name="type">gdal</Parameter>
	</Datasource>
</Layer>

<Layer name="hillshade10"
	srs="+proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +a=6378137 +b=6378137 +units=m +no_defs +over">
	<StyleName>hillshade10</StyleName>
	<Datasource>
	<Parameter name="file">../data/Hillshade/hillshade_d2.tif</Parameter>
	<Parameter name="type">gdal</Parameter>
	</Datasource>
</Layer>

https://medium.com/@david.moraisferreira/shaded-relief-maps-using-gdal-a-beginners-guide-6a3fe56c6d

https://joeyklee.github.io/broc-cli-geo/guide/XX_digital_elevation_models.html

gdaldem hillshade -of GTiff -z 5 -s 111120 n47_w123_1arc_v2.tif king3-hillshade.tif

<!-- TOC --><a id="color-relief"></a>
## Color Relief

<!-- TOC --><a id="colorrelieftxt"></a>
### ColorRelief.txt

2200 255 255 255
1900 182 181 179
1500 198 192 131
1000 144 193 113
300 88 183 94
30 82 174 93
1 73 168 84
0 200 230 255
-200 200 230 255

gdaldem color-relief -of GTiff -z 3.0 -s 2.0 n47_w122_1arc_v2.tif color-relief.txt king2-coloredRelief.tif


#color-relief,
#hill-shade {
    raster-scaling: bilinear;
    raster-comp-op: multiply;
}

#hill-shade { raster-opacity: 0.6; }

<!-- TOC --><a id="hill-slope"></a>
## Hill Slope

color_slope.txt
nv 255 255 255 0
0 255 255 255 0
5 255 255 255 0
90 1 1 1 255

<!-- TOC --><a id="install-kosmtik-mapnik-on-macos"></a>
# INSTALL KOSMTIK & MAPNIK on MACOS:
https://www.blef.fr/how-to-deploy-tile-server/

<!-- TOC --><a id="carto-css-documentation"></a>
# Carto CSS Documentation
https://cartocss.readthedocs.io/_/downloads/en/v0.18.1/pdf/
https://osm2pgsql.org/doc/manual.html
https://switch2osm.org/serving-tiles/manually-building-a-tile-server-16-04-2-lts/
https://ircama.github.io/osm-carto-tutorials/osm-rendering-process/
https://www.linuxbabe.com/ubuntu/openstreetmap-tile-server-ubuntu-20-04-osm
https://github.com/gravitystorm/openstreetmap-carto/blob/master/INSTALL.md

<!-- TOC --><a id="fix-permissions"></a>
## fix permissions:  
sudo chown -R $(whoami):admin /usr/local/* 
sudo chmod -R g+rwx /usr/local/*

install brew

<!-- TOC --><a id="install-mapnik-using-brew"></a>
## install mapnik using Brew:

https://github.com/mapnik/mapnik/wiki/MacInstallation_Homebrew

<!-- TOC --><a id="install-postgres-and-pgadmin-from-website"></a>
## install postgres and pgAdmin from website

create DB gis, add extensions: hstore and postgis

install node js from website
install kosmtik from:  https://github.com/kosmtik/kosmtik#install-or-update
install osm2pgsql:   brew install osm2pgsql

<!-- TOC --><a id="install-noto-font"></a>
## Install Noto font
Download noto font
Use FontBook app to install font 

<!-- TOC --><a id="download-osm-data"></a>
## Download OSM data

get additional data:  
`cd ~/src/openstreetmap-carto/`  
`scripts/get-external-data.py`  


<!-- TOC --><a id="load-osm-data"></a>
## load osm data:
https://osm2pgsql.org/doc/manual.html
osm2pgsql -d gis --create --slim  -G --hstore --tag-transform-script openstreetmap-carto.lua  -S openstreetmap-carto.style ../map_data/OSM/london_XL.osm.pbf

## 
CREATE DATABASE gis WITH TEMPLATE gis_template OWNER postgres;

