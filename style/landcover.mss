// --- Fill for Parks, woods, other areas ---
@low-opacity:  .25;
@med-opacity:  .5;
@high-opacity: .9;

@water-color: #5F6F8E; //#7F92A8; //#334459;  //#253A54 ;
@stream-color: lighten(@water-color, 5);
@river-color: lighten(@water-color, 1);

@land-color: #FCFAEC;
@pool-color: #6CB7DD;
@swamp: #ECDC9C;
@wetland: #D5D8CC;
@meadow: desaturate(@forest, 3);
@park: #438327; //#40A115;          //  Lch(94,30,145)
@grass: lighten(@park, 5); //#75B455; //lighten(@park, 3);
@forest: #3B7A30; //#5D905B; //#789176; //#5B924A; //#A0C191; //#9DB98C;
@forest-text: #597051;  // Lch(40,30,135)
@light-forest: lighten(@forest, 20);
@hedge: @forest;       // Lch(80,30,135)
@garden: darken(@park, 3);        //

@scrub: desaturate(lighten(@forest, 5), 5); //#BCC49A; //#C6CFA2;        // Lch(84,24,122)
@allotments: #A9D498;   // Lch(87,20,135)
@orchard: #aedfa3; // also vineyard, plant_nursery
@scree: #676767;
@sand: #D1CCBD;
@beach: #fff1ba;
@societal_amenities: #ECE8A8;   // Lch(99,13,109)
@tourism: #A9AAC7;

// --- Sports ---
@pitch: darken(@park, 10); //#6DBB67;           // Lch(85,22,168) also track
@track: @pitch;
@stadium: #E9DB99; // also sports_centre
@golf_course: #C5D1AF;

// --- "Base" landuses ---
@standard-halo-radius: .5;
@standard-halo-fill: rgba(243,255,217,255);

// Building Fill
@building-fill: #D6D4C6;
@building-line: darken(@building-fill, 10);  // Lch(70, 9, 66)
@building-low-zoom: darken(@building-fill, 15);

@building-major-fill: darken(@building-fill, 18);  // Lch(75, 8, 67)
@building-major-line: darken(@building-major-fill, 20);  // Lch(61, 13, 65)
@building-major-z15: darken(@building-major-fill, 16);  // Lch(70, 9, 66)
@building-major-z14: darken(@building-major-fill, 16);  // Lch(66, 11, 65)

// theatre, museum
@landmark: darken(@building-fill, 6); //#B8B19C;  // Goes over building fill
@religious: purple; //#C7B57C;
@religious-building: @landmark;   // Used in buildings.mss
@place_of_worship: blue; //#d0d0d0; // also landuse_religious
@place_of_worship_outline: darken(@place_of_worship, 20 );

// Religious,landmark
@landmark-building-layer:  @landmark; //   // Instead of building fill
@landmark-outline: darken(@landmark, 40);

@building-transit: desaturate(lighten(@transit, 10),30);

// Residential, retail, commercial, industrial
@built-up-lowzoom: #DAD9D7; //lighten(@building-fill, 30); //#d0d0d0;
@built-up-z12: #DAD9D7; //@built-up-lowzoom; //#dddddd;

@residential: #DAD9D7; //#A6A298; //@building-fill-light;      // Lch(89,0,0)
@residential-light: lighten(@residential, 15); //#F3F2EE;      // Lch(89,0,0)
@residential-line: darken(@residential, 20); // Lch(75,0,0)

@retail: darken(@residential, 10); //#F2EFDA;           // Lch(89,16,30)
@retail-line: darken(@retail, 20);      // Lch(70,25,30)

@commercial: @retail;       // Lch(89,8.5,25)
@commercial-line: darken(@commercial, 20);  // Lch(75,12,25)

@industrial: #A09B8B;       // Lch(89,9,330) (Also used for railway, wastewater_plant)
@industrial-line: #D8CFB8;  // Lch(75,11,330) (Also used for railway-line, wastewater_plant-line)
@farmland: #eef0d5;         // Lch(94,14,112)
@farmland-line: #c7c9ae;    // Lch(80,14,112)
@farmyard: #f5dcba;         // Lch(89,20,80)
@farmyard-line: #d1b48c;    // Lch(75,25,80)

// --- Transport ----
@transportation-area: #A645BA;
@aerodrome-area:#B9B7CE;
@apron: @aerodrome-area;
@parking: #B9B9B9;
@parking-outline: @parking;
@garages: darken(@parking, 30);
@railway: @industrial;
@railway-line: @industrial-line;
@rest_area: #efc8c8; // also services

// --- Other ----

@bare_ground: #8D8C8C;
@campsite: #A8BFA2; // also caravan_site, picnic_site
@cemetery: #CADFCD; // also grave_yard
@construction: #CBC48F; // also brownfield
@heath: #DCE4C2;
@mud: #e6dcd1; //rgba(203,177,154,0.3); // produces #e6dcd1 over @land
@leisure: lighten(@park, 5%);
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
      line-width: 0.5;
      line-color: saturate(darken(@pool-color, 20), 20);
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_recreation_ground'][zoom >= 10],
  [feature = 'leisure_playground'][zoom >= 13],
  [feature = 'leisure_fitness_station'][zoom >= 13] {
    polygon-fill: @leisure;
     polygon-opacity: @low-opacity;
    [zoom >= 15] {
      line-color: darken(@leisure, 60%);
      line-width: 0.3;
    }
    //[way_pixels >= 4]  { polygon-gamma: 0.75; }
    //[way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'tourism_camp_site'],
  [feature = 'tourism_caravan_site'],
  [feature = 'tourism_picnic_site'] {
    [zoom >= 10] {
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

  [feature = 'landuse_quarry'][zoom >= 10] {
    polygon-fill: @quarry;
    polygon-pattern-file: url('symbols/quarry.svg');
    polygon-opacity: @med-opacity;
    [way_pixels >= 4]  { polygon-pattern-gamma: 0.75; }
    [way_pixels >= 64] { polygon-pattern-gamma: 0.3;  }
  }

  [feature = 'landuse_vineyard'] {
    [zoom >= 5] {
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
    [zoom >= 10] {
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
    [zoom >= 10] {
      polygon-fill: @cemetery;
      polygon-opacity: @med-opacity;

      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'amenity_place_of_worship'][zoom >= 22],
  [feature = 'landuse_religious'][zoom >= 22] {
    polygon-fill:  @place_of_worship;
    polygon-clip: false;
    [zoom >= 15] {
      line-color: @place_of_worship_outline;
      line-opacity: .6;
      line-width: 0.3;
      line-clip: false;
    }
  }

  [feature = 'amenity_prison'][zoom >= 10][way_pixels > 75] {
    polygon-fill: #8e8e8e;
    polygon-opacity: @med-opacity;
    polygon-pattern-file: url('patterns/grey_vertical_hatch.svg');
    polygon-pattern-alignment: global;
    line-color: #888;
    line-width: 3;
    line-opacity: 0.3;
  }

// xyzzy
  [feature = 'landuse_residential'][zoom >= 21][zoom < 22] {
    polygon-fill: @residential;
    polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_garages'][zoom >= 13] {
    polygon-fill: @garages;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'leisure_park'] [zoom >= 10]{
    [zoom >= 10] {
      polygon-fill: @park;
      polygon-opacity:  @low-opacity;
    }
    [zoom >= 14] {
      polygon-fill: @park;
      polygon-opacity: @med-opacity;
    }
    [zoom >= 15] {
    comp-op: overlay;
    raster-comp-op: overlay;
      polygon-opacity: 1; //@high-opacity;
      polygon-fill: @park;
    }
    //[way_pixels >= 4]  { polygon-opacity:  @med-opacity; }
    //[way_pixels >= 64] { polygon-opacity:  @low-opacity;  }
  }

  [feature = 'leisure_ice_rink'][is_building = 'no'] {
    [zoom >= 10] {
      polygon-fill: @glacier;
      line-width: 0.5;
      line-color: saturate(darken(@pitch, 30%), 20%);
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'leisure_dog_park'] {
    [zoom >= 10] {
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

  [feature = 'leisure_golf_course'][zoom >= 10],
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


  [feature = 'landuse_forest'],
  [feature = 'natural_wood'] [zoom >= 14] {
      [zoom >= 14] {
      comp-op: multiply;
      //polygon-opacity: @med-opacity;
      polygon-fill: @forest;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 17] {
      polygon-fill: @forest;
      polygon-opacity: @high-opacity;

      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_nature_park'][zoom > 13] {
      [zoom >= 13] {
      comp-op: multiply;
      polygon-fill: @park;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
    [zoom >= 14] {
      polygon-fill: @park;
      polygon-opacity: 1;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_farmyard'][zoom >= 10] {
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

  [feature = 'landuse_farmland'],
  [feature = 'landuse_greenhouse_horticulture'] {
    [zoom >= 5] {
      polygon-fill: @farmland;
           polygon-opacity: @med-opacity;

      [zoom >= 16] {
        line-width: .5;
        line-color: @farmland-line;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_grass'][zoom >= 5],
  [feature = 'landuse_village_green'][zoom >= 5] {
    polygon-fill: @grass;
    //polygon-opacity: @med-opacity;
  }

  [feature = 'natural_grassland'][zoom >= 5],
  [feature = 'landuse_meadow'][zoom >= 5] {
    polygon-fill: @meadow;
    polygon-opacity: @med-opacity;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_retail'],
  [feature = 'shop_mall'],
  [feature = 'amenity_marketplace']
  {
    [zoom >= 8] [zoom < 13] {
      polygon-fill: @built-up-lowzoom;
      polygon-opacity: @high-opacity;
      [zoom >= 12] { polygon-fill: @built-up-z12; }
      [zoom >= 13] { polygon-fill: @retail; }
    }
  }

  [feature = 'landuse_industrial'][zoom >= 8] {
    polygon-fill: @built-up-lowzoom;
    [zoom >= 10] { polygon-fill: lighten(saturate(@industrial, 5%), 10%);  }
    [zoom >= 14] {
       polygon-fill: @industrial;
       polygon-opacity: @med-opacity;
       }
    [zoom >= 16] {
      line-width: .5;
      line-color: @industrial-line;
      [name != ''] {
        line-width: 0.7;
      }
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

  [feature = 'landuse_railway'][zoom >= 22] {
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
    polygon-fill: @industrial;
    [zoom >= 15] {
      polygon-fill: @power;
    }
    [zoom >= 16] {
      line-width: 0.5;
      line-color: @power-line;
      [name != ''] {
        line-width: 0.7;
      }
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'landuse_commercial'][zoom >= 8] [zoom < 13] {
    polygon-fill: @built-up-lowzoom;
    polygon-opacity: @high-opacity;
    [zoom >= 12] { polygon-fill: @built-up-z12; }
    [zoom >= 13] {
        polygon-opacity: @med-opacity;
    polygon-fill: @commercial; }
    [zoom >= 16] {
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'tourism_museum'] {
      opacity: @med-opacity;

    [zoom >= 10] {
      polygon-fill: @landmark;
      //[way_pixels >= 4]  { polygon-gamma: 0.75; }
      //[way_pixels >= 64] { polygon-gamma: 0.3;  }
      line-width: .6;
      line-opacity: .6;

      line-color: @landmark-outline;
      //line-pattern-file:url(img/line_solid_6.png);
    }
  }

  [feature = 'tourism_attraction'],
  [feature = 'amenity_arts_centre'],
  [feature = 'tourism_gallery'],
  [feature = 'amenity_theatre'] {
      opacity: @med-opacity;

    [zoom >= 10] {
      polygon-fill: @landmark;
      //[way_pixels >= 4]  { polygon-gamma: 0.75; }
      //[way_pixels >= 64] { polygon-gamma: 0.3;  }
      line-width: .6;
      line-opacity: .6;

      line-color: @landmark-outline;
      //line-pattern-file:url(img/line_solid_6.png);
    }
  }


  [feature = 'landuse_brownfield'],
  [feature = 'landuse_construction'] {
    [zoom >= 10] {
      polygon-fill: @construction;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'landuse_landfill'] {
    [zoom >= 10] {
      polygon-fill: #b6b592;
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

  [feature = 'natural_bare_rock'][zoom >= 12] {
    polygon-fill: @bare_ground;
    comp-op: multiply;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_scree'],
  [feature = 'natural_shingle'] {
    [zoom >= 12] {
    polygon-opacity: @low-opacity;
      polygon-fill: @scree; //@bare_ground;
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'natural_sand'][zoom >= 5] {
    polygon-fill: @sand;
    comp-op: multiply;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_heath'][zoom >= 5] {
    polygon-fill: @heath;
    polygon-opacity: @low-opacity;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'natural_scrub'][zoom >= 5] {
    comp-op: multiply;
    polygon-fill: @scrub;
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

    [feature = 'wetland_mud'][zoom >= 5] {
    polygon-fill: @swamp;
    polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_swamp'][zoom >= 5] {
    polygon-fill: @swamp;
    polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_mangrove'][zoom >= 5] {
    polygon-fill: @scrub;
         polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_reedbed'][zoom >= 5] {
    polygon-fill: @grass;
         polygon-opacity: @low-opacity;

    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'wetland_bog'],
  [feature = 'wetland_string_bog'] {
    [zoom >= 5] {
      polygon-fill: @heath;
      polygon-opacity: @low-opacity;

      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
    }
  }

  [feature = 'wetland_wet_meadow'],
  [feature = 'wetland_fen'],
  [feature = 'wetland_saltmarsh'],
  [feature = 'wetland_marsh'] {
    [zoom >= 5] {
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
  }

  [feature = 'amenity_hospital'],
  [feature = 'amenity_clinic'],
  [feature = 'amenity_university'],
  [feature = 'amenity_college'],
  [feature = 'amenity_school'],
  [feature = 'amenity_kindergarten'],
  [feature = 'amenity_community_centre'],
  [feature = 'amenity_social_facility'] {
    [zoom >= 10] [zoom < 16] {
        polygon-opacity: @med-opacity;
        polygon-fill:  @societal_amenities;
        [way_pixels >= 4]  { polygon-gamma: 0.75; }
        [way_pixels >= 64] { polygon-gamma: 0.3;  }

        [zoom >= 12] {
          polygon-fill:  @societal_amenities;
        }
        [zoom >= 14] {
          polygon-opacity: @high-opacity;
          polygon-fill: @societal_amenities;
        }
    }
  }

  [feature = 'amenity_fire_station'][zoom >= 8][way_pixels > 900],
  [feature = 'amenity_police'][zoom >= 8][way_pixels > 900],
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

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_taxi'] {
    [zoom >= 16] {
    polygon-opacity: 1;
      polygon-fill: @parking;
      [zoom >= 15] {
        line-width: 0.3;
        line-color: @parking-outline;
      }
      [way_pixels >= 4]  { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.3;  }
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
    polygon-fill: @transportation-area;
    line-width: 0.2;
    line-color: saturate(darken(@transportation-area, 40%), 20%);
    // [way_pixels >= 4]  { polygon-gamma: 0.75; }
    // [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }


  [feature = 'natural_beach'][zoom >= 10],
  [feature = 'natural_shoal'][zoom >= 10] {
    polygon-fill: @beach;
         polygon-opacity: .40; //@high-opacity;
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

  [feature = 'leisure_sports_centre'],
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
    [zoom >= 15] {
      line-width: 0.5;
      line-color: desaturate(darken(@track, 20%), 10%);
    }
    [way_pixels >= 4]  { polygon-gamma: 0.75; }
    [way_pixels >= 64] { polygon-gamma: 0.3;  }
  }

  [feature = 'leisure_pitch'][zoom >= 10] {
    polygon-fill: @pitch;
    [zoom >= 15] {
      line-width: 0.5;
      line-color: desaturate(darken(@pitch, 20%), 10%);
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
      polygon-opacity: .1;
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
  [natural = 'cliff'][zoom >= 13] {
    line-pattern-file: url('symbols/cliff.svg');
    [zoom >= 15] {
      line-pattern-file: url('symbols/cliff2.svg');
    }
  }
  [natural = 'ridge'][zoom >= 14],
   [natural = 'mountain_range'][zoom >= 14]{
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
  [zoom >= 16] {
    line-width: 0.4;
    line-color: #444;
  }
  [feature = 'barrier_hedge'][zoom >= 16] {
    line-width: 1.5;
    line-color: @hedge;
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
      line-width: 1;
      line-color: lighten(#444, 30%);
    }
    [zoom >= 16] {
      line-width: 1.5;
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
    text-fill: @nature-text;
    text-size: 15;
    text-face-name: @book-fonts;
    text-placement: line;
    text-dy: 8;
    text-vertical-alignment: middle;
    text-spacing: 400;
  }
}
