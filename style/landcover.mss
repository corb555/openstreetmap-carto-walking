// Fill Color
@low-opacity:  .25;
@med-opacity:  .4;
@high-opacity: .9;

@stream-color: lighten(@water-color, 5);
@river-color: @water-color; //#556279;
@water-color: #323F60;

@park: #A5B8A1; //#A2B89D;//#8EAA85; //#A5B7A0; //#7CA175;
@forest: #90A68A;

// Building Fill
@landmark: #A6ABB6; //#B6B9BD;
@hospital-fill: #D7D4DC;
@societal_amenities: #E6E4D2;
@tourism: #A9AAC7;

@building-fill-light: #DBDDE1; //#CFD3DA; //#D5D5D5;
@building-fill: #CCCFD5; //#C3C7D2; //#D6D6D6; //#D3D3D6; //#CFCFD3;

@building-line: darken(#D8DADF, 5);
@building-low-zoom: darken(#D8DADF, 10);

@building-transit: #B2B1C4;

// Residential, retail, commercial, industrial
@built-up-lowzoom: #DAD9D7;
@built-up-z12: #DAD9D7;

@residential: #DAD9D7;
@residential-light: lighten(@residential, 15);
@residential-line: darken(@residential, 20);

@retail: #DFDBD2; //#F2EFDA;           // Lch(89,16,30)
@retail-line: darken(@retail, 20);      // Lch(70,25,30)

@commercial: @retail;       // Lch(89,8.5,25)
@commercial-line: darken(@commercial, 20);  // Lch(75,12,25)

@industrial: #C1BFBA; //#D3CEC1;       // Lch(89,9,330) (Also used for railway, wastewater_plant)
@industrial-line: darken(@industrial, 15);  // Lch(75,11,330) (Also used for railway-line, wastewater_plant-line)
@industrial-lowzoom: #DDD7C4;
@brownfield: #DDDAD4;
@construction: #D2CFC9;

@background: #E0E0DA;
@land-color: #FCFAEC;
@pool-color: #8CADBE;
@swamp: #DEE3C4;
@wetland: #B3BEAF;
@meadow: #E8E6D6;
@grassland: #98BA8A;

@grass: lighten(@park, 2);
@forest: #3B7A30;
@light-forest: lighten(@forest, 20);
@hedge: @forest;
@garden: darken(@park, 3);
@leisure: lighten(@park, 5%);

@scrub: #DCDFCF;
@allotments: @residential;
@orchard: #8DB584; // also vineyard, plant_nursery
@scree: #919191;
@sand: #DFDBD1;
@beach: #E9E6D1;

// --- Sports ---
@pitch: darken(@park, 10);
@track: @pitch;
@stadium: #DBDACB; // also sports_centre
@golf_course: #C5D1AF;

// --- "Base" landuses ---

@religious: purple; //#C7B57C;
@religious-building: @landmark;   // Used in buildings.mss
@place_of_worship: blue; //#d0d0d0; // also landuse_religious
@place_of_worship_outline: darken(@place_of_worship, 20 );

@glacier: #E9EDED;     // NOTE glacier fill is in water.mss
@glacier-line: #9cf;
@int-water: #A6C7D8;

@pier-color: #D6D0BC;
@dam: #939393;

// Religious,landmark
@landmark-building-layer:  @landmark; //   // Instead of building fill
@landmark-outline: darken(@landmark, 10);

@farmland: #9EC392;         // Lch(94,14,112)
@farmland-line: #c7c9ae;    // Lch(80,14,112)
@farmyard: #9EC392;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)


// --- Transport ----
@transportation-area: #A645BA;
@aerodrome-area:#C4C3CD;
@apron: @aerodrome-area;
@parking: #B3AF9F; //#CDCDD3;
@parking-outline: @parking;
@garages: @parking;
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services

// --- Other ----

@bare_ground: #B0AB9D;
@campsite: #A8BFA2; // also caravan_site, picnic_site
@cemetery: #B3BBB3; // also grave_yard

@heath: #DCE4C2;
@mud: #e6dcd1; //rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@power: darken(@industrial, 5%);
@power-line: darken(@industrial-line, 5%);

@quarry: #c5c3c3;
@military: #9B9CB6;
@wastewater_plant: @industrial;
@wastewater_plant-line: @industrial-line;
@water_works: @industrial;
@water_works-line: @industrial-line;

#landcover-low-zoom[zoom < 10],
#landcover[zoom >= 10] {
  ::low-zoom[zoom < 12] {
    // Increase the lightness of the map by scaling color lightness to be in the 20%-100% range
    // image-filters: scale-hsla(0,1, 0,1, 0.2,1, 0,1);
  }

  ::low-zoom[zoom < 12],
  ::high-zoom[zoom >= 12] {
  [feature = 'leisure_swimming_pool'][zoom >= 14] {
    polygon-fill: @pool-color;
    polygon-opacity: 1;
    [zoom >= 17] {
      //line-width: 0.5;
      //line-color: saturate(darken(@pool-color, 20), 20);
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_recreation_ground'][zoom >= 14],
  [feature = 'leisure_playground'][zoom >= 15],
  [feature = 'leisure_fitness_station'][zoom >= 15] {
    polygon-fill: @leisure;
     polygon-opacity: @low-opacity;
    [zoom >= 15] {
      //line-color: darken(@leisure, 60%);
      //line-width: 0.3;
    }
    //[way_pixels >= 4]  { polygon-gamma: 0.75; }
    //[way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'tourism_camp_site'],
  [feature = 'tourism_caravan_site'],
  [feature = 'tourism_picnic_site'] {
    [zoom >= 14] {
      polygon-fill: @campsite;
      polygon-opacity: @high-opacity;

      [zoom >= 13] {
        line-color: saturate(darken(@campsite, 60%), 30%);
        line-width: 0.3;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_quarry'][zoom >= 14] {
    polygon-fill: @quarry;
    polygon-pattern-file: url('symbols/quarry.svg');
    polygon-opacity: @med-opacity;
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
  }

  [feature = 'landuse_vineyard'] {
    [zoom >= 21] {
      polygon-fill: @orchard;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 13] {
      polygon-pattern-file: url('patterns/vineyard.svg');
      polygon-pattern-alignment: global;
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
    }
  }

  [feature = 'leisure_garden'] {
    [zoom >= 14] {
      polygon-fill: @garden;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 13] {
      polygon-pattern-file: url('patterns/plant_nursery.svg');
      //polygon-pattern-opacity: 0.8;
      polygon-pattern-alignment: global;
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
    }
  }


  [feature = 'landuse_cemetery'],
  [feature = 'amenity_grave_yard'] {
    [zoom >= 14] {
      polygon-fill: @cemetery;
      polygon-opacity: @med-opacity;

      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'amenity_place_of_worship'][zoom >= 21],
  [feature = 'landuse_religious'][zoom >= 21] {
    polygon-fill:  @religious-building;
    polygon-clip: false;
    [zoom >= 15] {
      line-color: @place_of_worship_outline;
      line-opacity: .6;
      line-width: 0.3;
      line-clip: false;
    }
  }

  [feature = 'amenity_prison'][zoom >= 14][way_pixels > 75] {
    polygon-fill: #8e8e8e;
    polygon-opacity: @med-opacity;
    polygon-pattern-file: url('patterns/grey_vertical_hatch.svg');
    polygon-pattern-alignment: global;
    line-color: #888;
    line-width: 3;
    line-opacity: 0.3;
  }

/*
  [feature = 'landuse_residential'][zoom >= 21][zoom < 22] {
    polygon-fill: @residential;
    polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  } */

  [feature = 'landuse_garages'][zoom >= 14] {
    polygon-fill: @garages;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'leisure_park'] [zoom >= 12] [way_pixels >= 400]{
    [zoom >= 10] {
      polygon-fill: @park;
      polygon-opacity:  @med-opacity;
    }
    [zoom >= 13] {
      polygon-fill: @park;
      polygon-opacity: @high-opacity;
    }
    [zoom >= 15] {
    //comp-op: overlay;
    //raster-comp-op: overlay;
      //polygon-opacity: 1; //@high-opacity;
      polygon-fill: @park;
    }
    //[way_pixels >= 4]  { polygon-opacity:  @med-opacity; }
    //[way_pixels >= 64] { polygon-opacity:  @low-opacity;  }
  }

  [feature = 'leisure_ice_rink'][is_building = 'no'] {
    [zoom >= 15] {
      polygon-fill: @glacier;
      line-width: 0.5;
      line-color: saturate(darken(@glacier, 5), 5);
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'leisure_dog_park'] {
    [zoom >= 15] {
      polygon-fill: @leisure;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 16] {
      polygon-pattern-file: url('patterns/dog_park.svg');
      polygon-pattern-alignment: global;
      [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
    }
  }

  [feature = 'leisure_golf_course'][zoom >= 14],
  [feature = 'leisure_miniature_golf'][zoom >= 15] {
    polygon-fill: @golf_course;
         polygon-opacity: @med-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_allotments'] {
    [zoom >= 10] {
      polygon-fill: @allotments;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 13] {
      //polygon-pattern-file: url('patterns/allotments.svg');
      //polygon-pattern-alignment: global;
      //[way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
      //[way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
    }
    [zoom >= 16] {
      line-width: 0.5;
      line-color: desaturate(darken(@allotments, 10%), 10%);
      [name != null] {
        line-width: 0.7;
      }
    }
  }


  [feature = 'landuse_forest'][way_pixels >= 400] [zoom >= 8],
  [feature = 'natural_wood'] [zoom >= 12] [way_pixels >= 400]{
      [zoom >= 12] {
      //comp-op: multiply;
      polygon-opacity: @med-opacity;
      polygon-fill: @forest;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 17] {
      polygon-fill: @forest;
      //polygon-opacity: @high-opacity;

      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_nature_park'][zoom >= 21] [way_pixels >= 400] [way_pixels < 2000],
  [feature = 'leisure_nature_reserve'][zoom >= 21] [way_pixels >= 400] [way_pixels < 2000] {
      [zoom >= 12] {
      //xyzzy
      polygon-opacity: .2;
      polygon-fill: @park;

    }
    [zoom >= 14] {
      polygon-fill: @park;
      polygon-opacity: .2;

    }
  }

  [feature = 'landuse_farmyard'][zoom >= 14] {
    polygon-fill: @farmyard;
         polygon-opacity: @med-opacity;

      [zoom >= 16] {
        line-width: 0.5;
        line-color: @farmyard-line;
        [name != ''] {
          line-width: 0.7;
        }
      }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_farmland'][way_pixels >= 400],
  [feature = 'landuse_greenhouse_horticulture'] {
    [zoom >= 13] {
      polygon-fill: @farmland;
      polygon-opacity: @med-opacity;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_grass'][zoom >= 16],
  [feature = 'landuse_village_green'][zoom >= 15] {
    polygon-fill: @grass;
    //polygon-opacity: @med-opacity;
  }

  [feature = 'natural_grassland'][zoom >= 8][way_pixels >= 400],
  [feature = 'landuse_meadow'][zoom >= 14] [way_pixels >= 400]{
    polygon-fill: @grassland;
    polygon-opacity: .4;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_retail'],
  [feature = 'shop_mall'],
  [feature = 'amenity_marketplace']
  {
    [zoom >= 21] [zoom < 17] [way_pixels >= 400] {
      polygon-fill: @built-up-lowzoom;
      polygon-opacity: @med-opacity;
      [zoom >= 12] { polygon-fill: @built-up-z12; }
      [zoom >= 13] { polygon-fill: @retail; }
    }
  }

  [feature = 'landuse_industrial'][zoom >= 8][way_pixels >= 400] {
    polygon-fill: @built-up-lowzoom;
           polygon-opacity: @med-opacity;
    [zoom >= 10] {
     polygon-fill: @industrial-lowzoom;
     }
    [zoom >= 12] {
       polygon-fill: @industrial;
       polygon-opacity: .5;
       }

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'man_made_works'][zoom >= 16] {
    line-width: .5;
    line-color: @industrial-line;
    [name != ''] {
      line-width: 0.7;
    }
  }

  [feature = 'man_made_storage_tank'] ,
  [feature = 'man_made_wastewater_plant'] {
    polygon-fill: darken(@industrial,25);
    [zoom >= 15] {
      polygon-fill: @wastewater_plant;
    }
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @wastewater_plant-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
  }

  [feature = 'man_made_water_works'] {
    polygon-fill: @industrial;
    [zoom >= 15] {
      polygon-fill: @water_works;
    }
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @water_works-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
  }

  [feature = 'landuse_railway'][zoom >= 12] {
    polygon-fill: @railway;
    [zoom >= 22][name != ''] {
      line-width: 0.7;
      line-color: @railway-line;
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'power_plant'][zoom >= 10],
  [feature = 'power_generator'][zoom >= 10],
  [feature = 'power_substation'][zoom >= 13] {
    polygon-fill: lighten(@industrial, 7);
    [zoom >= 15] {
      polygon-fill: lighten(@power, 7);
    }
    [zoom >= 16] {
      //line-width: 0.5;
      //line-color: @power-line;
      [name != ''] {
        //line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_commercial'][zoom >= 8] [zoom < 13] {
    polygon-fill: @built-up-lowzoom;
    polygon-opacity: @low-opacity;
    [zoom >= 12] { polygon-fill: @built-up-z12; }
    [zoom >= 13] {
        polygon-opacity: @med-opacity;
        polygon-fill: @commercial;
         }
    [zoom >= 16] {
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  /*
  [feature = 'tourism_museum'] [zoom >= 15] {
      opacity: @med-opacity;

    [zoom >= 21] {
      polygon-fill: @landmark;
      //[way_pixels >= 4]  { polygon-gamma: 0.75; }
      //[way_pixels >= 64] { polygon-gamma: 0.3;  }
      line-width: .6;
      line-opacity: .6;

      line-color: @landmark-outline;
      //line-pattern-file:url(img/line_solid_6.png);
    }
  } */

/* HANDLED IN BUILDINGS.MSS
  [feature = 'tourism_museum'],
  [feature = 'tourism_attraction'],
  [feature = 'amenity_arts_centre'],
  [feature = 'tourism_gallery'],
  [feature = 'amenity_theatre'] {
    [zoom >= 16] {
      polygon-fill: @landmark;
      opacity: @med-opacity;
      //[way_pixels >= 4]  { polygon-gamma: 0.75; }
      //[way_pixels >= 64] { polygon-gamma: 0.3;  }
      line-width: .6;
      line-opacity: .6;
      line-color: @landmark-outline;
      //line-pattern-file:url(img/line_solid_6.png);
    }
  } */

  [feature = 'landuse_construction'] {
    [zoom >= 21] {
      polygon-fill: @construction;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

    [feature = 'landuse_brownfield']{
    [zoom >= 10] [way_pixels >= @med-building] {
      polygon-fill: @brownfield;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_landfill'] {
    [zoom >= 10] {
      polygon-fill: #D5D4BC;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_salt_pond'][zoom >= 10] {
    polygon-fill: @water-color;
         polygon-opacity: @med-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_bare_rock'][zoom >= 15] { //[way_pixels < 1000]{
    polygon-fill: @bare_ground;
    polygon-opacity: .2;
    //comp-op: multiply;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_scree'],
  [feature = 'natural_shingle'] {
    [zoom >= 12] {
    polygon-opacity: .2;
      polygon-fill: @scree;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

/*
  [landuse = 'volcanic_lava_flow'],
  [landuse = 'volcanic_lava_field'],
  [landuse = 'volcanic_caldera_rim'] {
    [zoom >= 9] {
    polygon-opacity: .2;
      polygon-fill: @scree;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  } */

  [feature = 'natural_sand'][zoom >= 8] {
    polygon-fill: #59523C; // xyzzy @sand;
    polygon-opacity: .9; //comp-op: multiply;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_heath'][zoom >= 8] {
    polygon-fill: @heath;
    polygon-opacity: @low-opacity;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_scrub'][zoom >= 8] {
    //comp-op: multiply;
    polygon-opacity: @med-opacity;
    polygon-fill: @scrub;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

    [feature = 'wetland_mud'][zoom >= 8] {
    polygon-fill: @swamp;
    polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_swamp'][zoom >= 8] {
    polygon-fill: @swamp;
    polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_mangrove'][zoom >= 8] {
    polygon-fill: @scrub;
         polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_reedbed'][zoom >= 8] {
    polygon-fill: @grass;
         polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_bog'] [zoom >= 8],
  [feature = 'wetland_string_bog'][zoom >= 8] {

      polygon-fill: @heath;
      polygon-opacity: @low-opacity;

      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }

  }

  [feature = 'wetland_wet_meadow'][zoom >= 8],
  [feature = 'wetland_fen'][zoom >= 8],
  [feature = 'wetland_saltmarsh'][zoom >= 8],
  [feature = 'wetland_marsh'][zoom >= 8] {

      polygon-fill: @swamp;
      polygon-opacity: @low-opacity;

      [feature = 'wetland_saltmarsh'][zoom >= 13] {
        //polygon-pattern-file: url('symbols/salt-dots-2.png');
        //polygon-pattern-alignment: global;
        //[way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
        //[way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }

  }

  [feature = 'amenity_hospital'],
  [feature = 'amenity_clinic'],
  [feature = 'amenity_university'],
  [feature = 'amenity_college'],
  [feature = 'amenity_school'],
  [feature = 'amenity_kindergarten'],
  [feature = 'amenity_community_centre'],
  [feature = 'amenity_social_facility'] {
    [zoom >= 21]  [way_pixels >= 200]{
        polygon-opacity: @med-opacity;
        polygon-fill:  @societal_amenities;
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'amenity_fire_station'][zoom >= 10][way_pixels > 900],
  [feature = 'amenity_police'][zoom >= 10][way_pixels > 900],
  [feature = 'amenity_fire_station'][zoom >= 13],
  [feature = 'amenity_police'][zoom >= 13] {
    polygon-fill: #F3E3DD;
    line-color: @military;
    line-opacity: 0.24;
    line-width: 1.0;
    line-offset: -0.5;
    [zoom >= 15] {
      line-width: 2;
      line-offset: -1.0;
    }
  }

  [feature = 'amenity_parking']{
    [zoom >= 16] [way_pixels >= 64]{
              polygon-fill: @parking;
                    polygon-opacity: 1;
      [zoom >= 17] {
      polygon-opacity: 1;
        polygon-fill: @parking;
        [zoom >= 15] {
          //line-width: 0.3;
          //line-color: @parking-outline;
        }
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }
      }
    }
  }

  //[feature = 'amenity_parking_space'][zoom >= 18] {
  //  line-width: 0.3;
  //  line-color: mix(@parking-outline, @parking, 50%);
  //}

  [feature = 'aeroway_apron'][zoom >= 11] {
    polygon-fill: @apron;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'aeroway_runway'][zoom >= 11] {
    polygon-fill: orange;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'aeroway_aerodrome'][zoom >= 21] {
    polygon-fill: @aerodrome-area;
    //line-width: 0.2;
    //line-color: saturate(darken(@transportation-area, 40%), 20%);
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= 15],
  [feature = 'amenity_bus_station'][zoom >= 15] {
    polygon-fill: @transit-gray; //@transportation-area;
    line-width: 0.2;
    line-color: saturate(darken(@transportation-area, 40%), 20%);
    // [way_pixels >= 4]  { polygon-gamma: 0.75; }
    // [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_shoal'][zoom >= 10] {
    polygon-fill: @beach;
    polygon-opacity: .8; //@high-opacity;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

    [feature = 'natural_beach'][zoom >= 10]{
    polygon-fill: @beach;
    polygon-opacity: .9; //@high-opacity;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_desert'][zoom >= 8] {
    polygon-fill: #FFF9E0;
    comp-op: multiply;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'highway_services'],
  [feature = 'highway_rest_area'] {
    [zoom >= 10] {
      polygon-fill: @rest_area;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'railway_station'][zoom >= 10] {
    polygon-fill: @railway;
  }

  [feature = 'leisure_stadium'] {
    [zoom >= 10] {
      polygon-fill: @stadium;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
      [zoom >= 12] {
        line-width: .5;
        line-color: darken(@stadium, 30%);
      }
    }
  }

  [feature = 'leisure_sports_centre'][is_building = 'no'],
  [feature = 'leisure_water_park']{
    [zoom >= 10] {
      polygon-fill: @grass;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
      [zoom >= 12] {
        line-width: .5;
        line-color: darken(@grass, 30%);
      }
    }
  }

  [feature = 'leisure_track'][zoom >= 10] {
    polygon-fill: @track;
    polygon-opacity: .4;
    [zoom >= 15] {
      line-width: 0.4;
      line-opacity: .4;
      line-color: @hiking-fill;
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'sport_basketball'][zoom >= 14] ,
  [feature = 'sport_tennis'][zoom >= 14] {
      polygon-fill: #DBD6C5;
      [zoom >= 15] {
        line-width: 0.5;
        line-color: darken(#DFD5C3, 15);
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'leisure_pitch'][zoom >= 14] {
    polygon-fill: @pitch;
    [zoom >= 15] {
      line-width: 0.5;
      line-color: darken(@park, 20);
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

}
}

/* man_made=cutline */
#landcover-line {
  [zoom >= 14] {
    line-width: 3;
    line-join: round;
    line-cap: square;
    line-color: @grass;
    [zoom >= 16] {
      line-width: 6;
      [zoom >= 18] {
        line-width: 12;
      }
    }
  }
}

#landcover-area-symbols {

  ::first {
    [natural = 'mud'],
    [int_wetland = 'tidalflat'] {
      [zoom >= 8] {
        comp-op: multiply;
        polygon-fill: @mud;
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }
      }
    }
  }


  [int_wetland != null][zoom >= 10] {
      polygon-fill: @wetland;  //@mud;
      comp-op: multiply;
     polygon-pattern-file: url('symbols/wetland.png');
     polygon-pattern-alignment: global;
  }
  [natural = 'reef'][zoom >= 10] {
    polygon-pattern-file: url('symbols/reef.png');
    polygon-pattern-alignment: global;
  }


  [zoom >= 13] {
    [int_wetland = 'saltmarsh'],
    [int_wetland = 'wet_meadow'] {
      polygon-pattern-file: url('symbols/wetland_marsh.png');
      polygon-pattern-alignment: global;
      polygon-opacity: .5;
    }
    [int_wetland = 'reedbed'] {
      polygon-pattern-file: url('symbols/wetland_reed.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'mangrove'] {
      polygon-pattern-file: url('symbols/wetland_mangrove.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'swamp'] {
      polygon-pattern-file: url('symbols/wetland_swamp.png');
      polygon-pattern-alignment: global;
    }
    [int_wetland = 'bog'],
    [int_wetland = 'fen'],
    [int_wetland = 'string_bog'] {
      polygon-pattern-file: url('symbols/wetland_bog.png');
      polygon-pattern-alignment: global;
    }
    [landuse = 'salt_pond'] {
      polygon-pattern-file: url('symbols/salt_pond.png');
      polygon-pattern-alignment: global;
    }
    [natural = 'beach'],
    [natural = 'shoal'] {
      [surface = 'sand'] {
        polygon-pattern-file: url('symbols/beach.png');
        polygon-pattern-alignment: global;
      }
      [surface = 'gravel'],
      [surface = 'fine_gravel'],
      [surface = 'pebbles'],
      [surface = 'pebblestone'],
      [surface = 'shingle'],
      [surface = 'stones'],
      [surface = 'shells'] {
        polygon-pattern-file: url('symbols/beach_coarse.png');
        polygon-pattern-alignment: global;
      }
    }

    [natural = 'mud'] [zoom >= 8] {
        polygon-opacity: .7; //@low-opacity;
        polygon-fill: @mud;
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }
      }

    [natural = 'scrub'] {
      //polygon-pattern-file: url('symbols/scrub.png');
      //polygon-pattern-alignment: global;
    }
  }

  //Also landuse = forest, converted in the SQL

/*
  [natural = 'wood'][zoom >= 16]::wood {
    polygon-pattern-file: url('symbols/leaftype_unknown.svg'); // Lch(55,30,135)
    [leaf_type = "broadleaved"] { polygon-pattern-file: url('symbols/leaftype_broadleaved.svg'); }
    [leaf_type = "needleleaved"] { polygon-pattern-file: url('symbols/leaftype_needleleaved.svg'); }
    [leaf_type = "mixed"] { polygon-pattern-file: url('symbols/leaftype_mixed.svg'); }
    [leaf_type = "leafless"] { polygon-pattern-file: url('symbols/leaftype_leafless.svg'); }
    polygon-pattern-alignment: global;
    opacity: @low-opacity; // The entire layer has opacity to handle overlapping forests
  } */

}

#landuse-overlay {
  [landuse = 'military'][zoom >= 9][way_pixels > 900],
  [landuse = 'military'][zoom >= 13] {
    polygon-fill: @military;
    polygon-opacity: @med-opacity;
    polygon-pattern-file: url('patterns/military_red_hatch.svg');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-opacity: 0.3;
    line-width: 1.0;
    line-offset: -0.5;
    [zoom >= 15] {
      line-width: 2;
      line-offset: -1.0;
    }
  }

  [military = 'danger_area'][zoom >= 9] {
    polygon-fill: #ff5555;
    polygon-opacity: @med-opacity;
    polygon-pattern-file: url('patterns/danger_red_hatch.svg');
    polygon-pattern-alignment: global;
    line-color: @military;
    line-opacity: 0.2;
    line-width: 2;
    line-offset: -1.0;
  }
}

#cliffs {
  [natural = 'cliff'][zoom >= 21] {
    line-pattern-file: url('symbols/cliff.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/cliff2.svg');
    }
  }

  [landuse = 'plate_boundary'][zoom >= 8]{
    line-color: red;
    line-opacity: .7;
    line-width: 2;
    line-dasharray: 4,4;
  }

  [natural = 'ridge'][zoom >= 8],
   [natural = 'mountain_range'][zoom >= 8]{
    line-pattern-file: url('symbols/ridge-mid.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/ridge2.svg');
    }
  }

  [natural = 'arete'][zoom >= 14] {
    line-pattern-file: url('symbols/arete-mid.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/arete2.svg');
    }
  }

  [man_made = 'embankment'][zoom >= 15]::man_made {
    line-pattern-file: url('symbols/embankment.svg');
  }
}

#barriers {
  // fence, etc
  [zoom >= 17] {
    line-width: 0.4;
    line-color: #444;
  }

  [feature = 'barrier_hedge'][zoom >= 17] {
    line-color: darken(@park, 2);
    [zoom >= 17] {
      line-width: 2;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }

  [feature = 'historic_citywalls'],
  [feature = 'barrier_city_wall'] {
    [zoom >= 15] {
      line-width: 3;
      line-color: lighten(#444, 30%);
    }
    [zoom >= 16] {
      line-width: 3;
    }
    [zoom >= 17] {
      line-width: 2;
      barrier/line-width: 0.4;
      barrier/line-color: #444;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }

  [feature = 'barrier_retaining_wall']  {
    [zoom >= 17] {
      line-width: .7;
      barrier/line-width: 0.7;
      barrier/line-color: #666;
    }
    [zoom >= 18] {
      line-width: 3;
    }
    [zoom >= 19] {
      line-width: 4;
    }
    [zoom >= 20] {
      line-width: 5;
    }
  }
}

#tourism-boundary {
  [tourism = 'attraction'][zoom >= 10]{
  a/line-width: 2;
    a/line-offset: -0.5;
    a/line-color: pink;
    a/line-opacity: 0.5;
    a/line-join: round;
    a/line-cap: round;
    polygon-fill:pink;
}

  [tourism = 'zoo'][zoom >= 10][way_pixels >= 750],
  [tourism = 'zoo'][zoom >= 17],
  [tourism = 'theme_park'][zoom >= 10][way_pixels >= 750],
  [tourism = 'theme_park'][zoom >= 17] {
    a/line-width: 2;
    a/line-offset: -0.5;
    a/line-color: @tourism;
    a/line-opacity: 0.5;
    a/line-join: round;
    a/line-cap: round;
    [zoom >= 17],
    [way_pixels >= 60] {
      b/line-width: 4;
      b/line-offset: -2;
      b/line-color: @tourism;
      b/line-opacity: 0.3;
      b/line-join: round;
      b/line-cap: round;
    }
    [zoom >= 17] {
      a/line-width: 2;
      a/line-offset: -1;
      b/line-width: 6;
      b/line-offset: -3;
    }
  }
}


#text-line {
  [feature = 'natural_mountain_range'][zoom >= 6],
  [feature = 'natural_arete'][zoom >= 15],
  [feature = 'natural_cliff'][zoom >= 15],
  [feature = 'natural_ridge'][zoom >= 14],
  [feature = 'man_made_embankment'][zoom >= 15] {
    text-name: "[name]";
    text-fill: #4D4C60; //@nature-text;
    text-size: 16;
    text-face-name: @oblique-fonts;
    text-placement: line;
    text-dy: 8;
    text-vertical-alignment: middle;
    text-spacing: 8000;
  }
}
