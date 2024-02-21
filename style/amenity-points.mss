// Markers and Text labels for amenities

// Area sizes
@small-building: 10;
@med-building: 100;
@large-building: 800;
@small-area: 3000;
@large-area: 12000;
@huge-area: 48000;

// Zoom cutoffs for attractions
@local-attraction-zoom: 19;
@minor-attraction-zoom: 18;
@attraction-zoom: 17;
@city-attraction-zoom: 15;
@county-attraction-zoom: 14;
@major-attraction-zoom: 13;
@regional-attraction-zoom: 10;

@landcover-font-size: 12;
@landcover-wrap-width-size: 30; // 3 em
@landcover-line-spacing-size: -1.5; // -0.15 em
@landcover-font-size-big: 14;
@landcover-wrap-width-size-big: 36; // 3 em
@landcover-line-spacing-size-big: -1.8; // -0.15 em
@landcover-font-size-bigger: 20;
@landcover-wrap-width-size-bigger: 45; // 3 em
@landcover-line-spacing-size-bigger: -2.25; // -0.15 em
@landcover-face-name: @oblique-fonts;

@small-font-size: 10;
@standard-font-size: 14;
@medium-font-size: 17;
@large-font-size: 19;

@standard-wrap-width: 32; // 3 em
@standard-line-spacing-size: -2; // -0.15 em
@standard-font: @book-fonts;

@private-opacity: 0.3;

@marina-text: white; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for mud */

@transportation-icon: #A645BA;
@transportation-text: darken(@transportation-icon, 15);

@shop-icon: #ac39ac;
@shop-text: @amenity-color;
@accommodation-icon: @amenity-color;
@accommodation-text: @amenity-color;
@airtransport: #FDC243;
@health-color: #CD5353;
@amenity-color: @culture;
@public-service: @amenity-color;
@memorials: @culture;
@religious-icon: @culture;
@placenames: @culture;
@placenames-light: @placenames;
@aquarium: darken(@culture,5);
@culture: #4D5672;

@gastronomy-icon: @culture;
@gastronomy-text: @gastronomy-icon;
@tourism: #555B6B;
@highlight: #602E91;

@hiking: #E5A202;
@nature-text: @hiking;

@office: #4863A0;
@man-made-icon: #969EB4; //#8990A4;
@advertising-grey: @man-made-icon;
@barrier-icon: #3f3f3f;
@landform-color: white; //#FFED97;
@leisure-color: darken(@park, 25);
@protected-area: #008000;
@aboriginal: #82643a;

@tree-color: #68AD70;
@hotspring: @highlight;
@pier-color: #BCB4A7;
@dam: #939393;

@marker-op: .8;

@waterfall: #BBD2FD;
@waterfall-text: #607397;


// GROUP
#amenity-points {
  [feature = 'tourism_alpine_hut'][zoom >= @major-attraction-zoom],
  [feature = 'tourism_wilderness_hut'][zoom >= @major-attraction-zoom],
  [feature = 'amenity_shelter'][zoom >= 16] {
    marker-file: url('symbols/amenity/shelter.svg');
    [feature = 'tourism_wilderness_hut'] {
      marker-file: url('symbols/tourism/wilderness_hut.svg');
    }
    [feature = 'tourism_alpine_hut'] {
      marker-file: url('symbols/tourism/alpinehut.svg');
    }
    [feature = 'amenity_shelter'] {
      marker-fill: @man-made-icon;
    }
    marker-fill: @accommodation-icon;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_bank'][zoom >= @local-attraction-zoom] {
    marker-file: url('symbols/amenity/bank.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_bar'][zoom >= @city-attraction-zoom][zoom < @attraction-zoom],
  [feature = 'amenity_biergarten'][zoom >= @city-attraction-zoom] [zoom < @attraction-zoom],
  [feature = 'amenity_cafe'][zoom >= @city-attraction-zoom] [zoom < @attraction-zoom],
  [feature = 'amenity_internet_cafe'][zoom >= @city-attraction-zoom] [zoom < @attraction-zoom],
  [feature = 'amenity_food_court'][zoom >= @city-attraction-zoom][zoom < @attraction-zoom],
  [feature = 'amenity_ice_cream'][zoom >= @city-attraction-zoom][zoom < @attraction-zoom],
  [feature = 'amenity_pub'][zoom >= @city-attraction-zoom] [zoom < @attraction-zoom],
  [feature = 'amenity_nightclub'][zoom >= @city-attraction-zoom] [zoom < @attraction-zoom] ,
  [feature = 'amenity_restaurant'][zoom >= @city-attraction-zoom] [zoom < @attraction-zoom] {
      [zoom >= @attraction-zoom] {
          marker-clip: true;
          marker-fill: @gastronomy-icon;
          marker-opacity: .4; //@marker-op;
          marker-width: 7;

          [zoom >= 16] {
              marker-width: 9;
              marker-opacity: .6;
          }
          [feature != 'amenity_food_court'][zoom = 18] {
            marker-line-width: 0;
          }
          [feature = 'amenity_bar'] {
            marker-file: url('symbols/amenity/bar.svg');
          }
          [feature = 'amenity_nightclub'] {
             marker-file: url('symbols/amenity/nightclub.svg');
          }
          [feature = 'amenity_biergarten'] {
            marker-file: url('symbols/amenity/biergarten.svg');
          }
          [feature = 'amenity_cafe'] ,
          [feature = 'amenity_internet_cafe'] {
            marker-file: url('symbols/amenity/cafe.svg');
          }
          [feature = 'amenity_food_court'],
          [feature = 'amenity_restaurant']{
            marker-file: url('symbols/amenity/restaurant.svg');
          }
          [feature = 'amenity_ice_cream'] {
            marker-file: url('symbols/amenity/ice_cream.svg');
          }
          [feature = 'amenity_pub'] {
            marker-file: url('symbols/amenity/pub.svg');
          }
      }
  }

  [feature = 'amenity_bicycle_rental'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/amenity/rental_bicycle.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'highway_bus_stop'] {
    [zoom >= @attraction-zoom] {
      marker-allow-overlap: true;
      marker-file: url('symbols/circle.svg');
      marker-fill: #5D75C1;
      marker-width: 7;
      marker-clip: false;
    }
    [zoom >= @minor-attraction-zoom] {
          marker-width: 6;
    }
  }

  [feature = 'amenity_bus_station'][zoom >= @city-attraction-zoom] {
    marker-file: url('symbols/amenity/bus_station.svg');
    // use colors from SVG to allow for white background
    marker-clip: false;
    //marker-fill: red;
    marker-height: 16;
  }

  [feature = 'barrier_toll_booth'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/barrier/toll_booth.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_artwork'][zoom >= @local-attraction-zoom] {
    [artwork_type != 'statue'] {
      marker-file: url('symbols/tourism/artwork.svg');
    }
    [artwork_type = 'statue'] {
      marker-file: url('symbols/historic/statue.svg');
    }
    [artwork_type = 'bust'] {
      marker-file: url('symbols/historic/bust.svg');
    }
    marker-fill: @memorials;
  }

  [feature = 'tourism_camp_site'][zoom >= @major-attraction-zoom][zoom < 17] ,
  [feature = 'tourism_camp_pitch'][zoom >= @attraction-zoom]
  {
    marker-file: url('symbols/tourism/camping.svg');
    marker-fill: @hiking;
    marker-height: 15;
    marker-clip: false;
  }

  // Ford tagging on points - ford on lines is defined later
  [feature = 'highway_ford'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: blue; //@transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_caravan_site'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/tourism/caravan_park.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_chalet'][zoom >= 21] {
    marker-file: url('symbols/tourism/chalet.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'amenity_cinema'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/cinema.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_public_bath'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/amenity/public_bath.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
  }

  [feature = 'amenity_fire_station'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/firestation.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_fountain'] [zoom >= @city-attraction-zoom] {
        nozzle/marker-file: url('symbols/amenity/fountain.svg');
        nozzle/marker-fill: @waterfall;
        nozzle/marker-clip: false;
        nozzle/marker-width: 14;
        [height >= 4] {
        nozzle/marker-width: 20;
        }
  }

  [feature = 'amenity_fuel'][zoom >= @local-attraction-zoom] {
    marker-file: url('symbols/amenity/fuel.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_guest_house'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/tourism/guest_house.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_apartment'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/tourism/apartment.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_repair_station'][zoom >= @local-attraction-zoom] {
    marker-file: url('symbols/amenity/bicycle_repair_station.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_casino'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/casino.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
  }

  [feature = 'tourism_hostel'][zoom >= @city-attraction-zoom] {
    marker-file: url('symbols/tourism/hostel.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_hotel'][zoom >= 21] [zoom < 17]{
    marker-file: url('symbols/tourism/hotel.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_motel'][zoom >= 21][zoom < 17] {
    marker-file: url('symbols/tourism/hotel.svg');
    marker-clip: true;
    marker-fill: @accommodation-icon;
  }

  [feature = 'highway_trailhead'] [zoom >= 12] [zoom <= 16]{
        marker-file: url('symbols/shop/outdoor.svg');
        marker-fill: @hiking; //@man-made-icon;
        marker-clip: false;
        marker-width: 15;
        [zoom <= 16]{
            //marker-width: 13;
        }
  }

  [feature = 'tourism_information'][information = 'guidepost'][zoom >= @county-attraction-zoom],
  [feature = 'tourism_information'][information = 'board'][zoom >= @county-attraction-zoom],
  [feature = 'tourism_information']["information"='office'][zoom >= @county-attraction-zoom] {
    [information = 'board'] {
      marker-file: url('symbols/tourism/board.svg');
            marker-fill: @hiking;
    }
    [information = 'guidepost'] {
      marker-file: url('symbols/tourism/guidepost.svg');
    }
    [information = 'office'] {
      marker-file: url('symbols/tourism/office.svg');
      marker-fill: @amenity-color;
      marker-height: 17;
    }
    [information = 'terminal'] {
      marker-file: url('symbols/tourism/terminal.svg');
    }
      marker-file: url('symbols/tourism/guidepost.svg');
      marker-clip: false;
  }

  [feature = 'amenity_library'][zoom >= 21] [zoom < 17]  {
    marker-opacity: @marker-op;
    marker-file: url('symbols/amenity/library.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_courthouse'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/courthouse.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_community_centre'][zoom >= 21] {
    marker-file: url('symbols/amenity/community_centre.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_shower'][zoom >= @local-attraction-zoom] {
    marker-file: url('symbols/amenity/shower.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_social_facility'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/amenity/social_facility.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_townhall'] ,
  [feature = 'office']  [office = 'government'] {
     [zoom >= 21] [zoom < 17] {
        marker-file: url('symbols/amenity/town_hall.svg');
        marker-fill: @public-service;
        marker-clip: false;
     }
  }

  [feature = 'man_made_mast']["tower:type" != 'lighting'],
  [feature = 'man_made_mast']["tower:type" = 'lighting'][zoom >= @minor-attraction-zoom]   {
    [zoom >= @county-attraction-zoom][height >= 160],
    [zoom >= @city-attraction-zoom][height >= 80],
    [zoom >= 16][height >= 40],
    [zoom >= @local-attraction-zoom][height >= 20],
    [zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/man_made/mast.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
      ["tower:type" = 'lighting'] {
        marker-file: url('symbols/man_made/mast_lighting.svg');
      }
     // ["tower:type" = 'communication'] {
      //  marker-file: url('symbols/man_made/mast_communications.svg');
      //}
    }
  }

  [feature = 'man_made_tower']["tower:type" = 'communication'][zoom >= @county-attraction-zoom],
  [feature = 'man_made_tower']["tower:type" = 'bell_tower'][zoom >= @county-attraction-zoom],
  [feature = 'man_made_tower']["tower:type" = 'watchtower'][zoom >= @county-attraction-zoom],
  [feature = 'man_made_tower']["tower:type" = 'observation'][zoom >= @county-attraction-zoom],
  [feature = 'man_made_tower']["tower:type" = 'clock'][zoom >= @county-attraction-zoom],
  [feature = 'man_made_tower']["tower:type" = 'monument'][zoom >= @county-attraction-zoom]
  {
    [zoom >= @county-attraction-zoom][height >= 160],
    [zoom >= @city-attraction-zoom][height >= 80],
    [zoom >= 16][height >= 40],
    [zoom >= @attraction-zoom] {
      marker-file: url('symbols/man_made/tower_lattice.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
      marker-width: 16;
      [zoom >= @county-attraction-zoom] {
           marker-width: 10; //3 + [height] * 0.05 ;
      }
      [zoom >= @minor-attraction-zoom] {
           marker-width:  10 + [height] * 0.25 ;
      }
      ["tower:type" = 'defensive'] {
        marker-file: url('symbols/man_made/tower_defensive.svg');
      }

      ["tower:type" = 'monument'],
      ["tower:type" = 'watchtower'],
      ["tower:type" = 'clock']{
            marker-file: url('symbols/man_made/tower_generic.svg');
      }

      ["tower:type" = 'observation'] {
        marker-file: url('symbols/man_made/tower_lattice.svg');
      }

      ["tower:type" = 'bell_tower'] {
        marker-file: url('symbols/man_made/bell_tower.svg');
      }
    }
  }

  [feature = 'man_made_communications_tower'][zoom >= @county-attraction-zoom] {
    marker-file: url('symbols/man_made/communications_tower.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'man_made_chimney'] {
    [zoom >= 16][height > 50],
    [zoom >= @minor-attraction-zoom][height > 30],
    [zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/man_made/chimney.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'man_made_crane'] {
    [zoom >= @county-attraction-zoom][height > 70],
    [zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/man_made/crane.svg');
      marker-fill: #E2E3E7; //@man-made-icon;
      marker-clip: false;
      [zoom >= @county-attraction-zoom] {
           marker-width:  3 + [height] * 0.15 ;
      }
      [zoom >= @minor-attraction-zoom] {
           marker-width:  10 + [height] * 0.2 ;
      }
    }
  }

  [feature = 'historic_city_gate'][zoom >= @county-attraction-zoom] {
    marker-file: url('symbols/historic/city_gate.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
    [zoom >= @attraction-zoom] {
          text-name: "[name]";
          text-fill:  @culture;
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          //text-dy: 11;
          text-face-name: @standard-font;
          text-halo-radius: @standard-halo-radius;
          text-halo-fill: @standard-halo-fill;
          text-size: 12;
       }
  }

   // Museum name
   [feature = 'tourism_museum'][zoom >= 16],
   [feature = 'tourism_gallery'][zoom >= @attraction-zoom]{
       [feature = 'tourism_museum'] [zoom >= 16] ,
        [feature = 'tourism_gallery'][zoom >= 16]{
          text-name: "[name]";
          text-fill:  @amenity-color;  // HIGHLIGHT TEXT: MUSEUM
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          // text-dy: 11;
          text-face-name: @standard-font;
          //text-halo-radius: @standard-halo-radius;
          //text-halo-fill: @standard-halo-fill;
          text-size: @standard-font-size - 3;
       }

       [feature = 'tourism_museum'] [zoom >= @attraction-zoom],
       [feature = 'tourism_gallery'][way_pixels > @small-building][zoom >= 12]{
          marker-file: url('symbols/tourism/museum.svg');
          marker-fill: @culture;
          marker-clip: false;
       }
  }

    [feature = 'tourism_aquarium'][zoom >= @county-attraction-zoom] {
    marker-file: url('symbols/leisure/fishing.svg');
    marker-fill: @aquarium; //@waterfall;
    marker-clip: false;
    marker-height: 11;
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @large-font-size - 3;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @aquarium;
      text-face-name: @standard-font;
      text-dy: 15;
      }
  }

  [feature = 'amenity_clinic'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/doctors.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_hospital'][zoom >= 16] {
    marker-file: url('symbols/amenity/hospital.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_pharmacy'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/pharmacy.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_veterinary'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/amenity/veterinary.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_place_of_worship'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/place_of_worship.svg');
    marker-fill: @religious-icon;
    marker-clip: false;
    [religion = 'christian'] {
      marker-file: url('symbols/religion/christian.svg');
      // Some Christian denominations do not use a cross, so reset them to the default marker
      [denomination = 'jehovahs_witness'],
      [denomination = 'la_luz_del_mundo'],
      [denomination = 'iglesia_ni_cristo'],
      [denomination = 'mormon'] {
        marker-file: url('symbols/amenity/place_of_worship.svg');
      }
    }
    [religion = 'muslim'] {
      marker-file: url('symbols/religion/muslim.svg');
    }
    [religion = 'sikh'] {
      marker-file: url('symbols/religion/sikhist.svg');
    }
    [religion = 'jewish'] {
      marker-file: url('symbols/religion/jewish.svg');
    }
    [religion = 'hindu'] {
      marker-file: url('symbols/religion/hinduist.svg');
    }
    [religion = 'buddhist'] {
      marker-file: url('symbols/religion/buddhist.svg');
    }
    [religion = 'shinto'] {
      marker-file: url('symbols/religion/shintoist.svg');
    }
    [religion = 'taoist'] {
      marker-file: url('symbols/religion/taoist.svg');
    }
  }

  [feature = 'man_made_storage_tank'][zoom >= @attraction-zoom],
  [feature = 'man_made_silo'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/man_made/storage_tank.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'amenity_police'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/police.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_post_office'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/amenity/post_office.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_recycling'][recycling_type = 'centre'][zoom >= @local-attraction-zoom],
  [feature = 'amenity_recycling'][zoom >= @local-attraction-zoom] {
    marker-file: url('symbols/amenity/recycling.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_theatre'],
    [feature = 'amenity_arts_centre']{
      [zoom >= @local-attraction-zoom]  {
         [zoom >= @city-attraction-zoom] [zoom < @attraction-zoom]{
           marker-opacity: @marker-op;
           marker-file: url('symbols/amenity/theatre.svg');
           marker-fill: @culture;
           marker-clip: false;
        }

        [zoom >= @city-attraction-zoom]  {
        text-name: "[name]";
        text-fill: @culture;  // HIGHLIGHT TEXT: THEATRE
        text-size: @standard-font-size - 3;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
        //text-dy: 11;
        text-face-name: @bold-fonts;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
        }
      }
  }

  [feature = 'amenity_toilets'] {
    [int_access = 'yes'][zoom > 17],
    [zoom > 17] {
      marker-file: url('symbols/amenity/toilets.svg');
      marker-fill: lighten(@amenity-color, 15);
      marker-height: 11;
      marker-clip: true;
      marker-opacity: .6;
      [int_access = 'restricted'] {
        marker-opacity: @private-opacity;
      }
    }
  }

  [feature = 'amenity_prison'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/prison.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_nursing_home'],
  [feature = 'amenity_childcare'] {
    [zoom >= @minor-attraction-zoom] {
      marker-width: 4;
      [zoom >= @minor-attraction-zoom] {
        marker-width: 6;
      }
      marker-line-width: 0;
      marker-clip: false;
      marker-fill: darken(@societal_amenities, 80%);
    }
  }

  [feature = 'tourism_viewpoint'][zoom >= @county-attraction-zoom],
  [feature = 'tourism_attraction'][zoom >= @county-attraction-zoom][zoom <= 17] {
    marker-file: url('symbols/tourism/viewpoint.svg');
    marker-fill: @highlight;
    marker-clip: false;
    marker-width: 9;
    [zoom >= @attraction-zoom] {
        marker-width: 13;
    }
    [feature = 'tourism_attraction'] [way_pixels > @med-building] {
      text-name: "[name]";
      text-fill: @culture;  // HIGHLIGHT TEXT
      text-size: @standard-font-size - 3;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 11;
      text-face-name: @book-fonts;
      text-allow-overlap: false;
      [way_pixels > @med-building] {
           text-size: @standard-font-size-1;
      }
      [way_pixels > @large-building] {
           text-size: @standard-font-size;
      }

      [attraction = 'big_wheel'] {
        marker-fill: white;
        marker-width: 20;
      }
    }
   }

  [feature = 'man_made_water_tower'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/man_made/water_tower.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'historic_memorial'][memorial = null][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= 16],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= @local-attraction-zoom],
  [feature = 'man_made_obelisk'][zoom >= @attraction-zoom],
  [feature = 'historic_monument'][zoom >= 16] ,
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= @local-attraction-zoom] {
    marker-width: 2 + [height] * 0.05;
    marker-opacity: @marker-op;
    marker-file: url('symbols/historic/memorial.svg');

    [memorial = 'bust']{
      marker-file: url('symbols/historic/bust.svg');
    }
    [memorial = 'blue_plaque'],
    [memorial = 'plaque'] {
      marker-file: url('symbols/historic/plaque.svg');
    }
    [memorial = 'statue'] {
      marker-file: url('symbols/historic/obelisk.svg');
    }
    [memorial = 'statue'] [height >= 5]{
      marker-file: url('symbols/historic/city_gate.svg');
    }
    [memorial = 'stone'] {
      marker-file: url('symbols/historic/stone.svg');
    }
    [feature = 'man_made_obelisk'] {
    marker-file: url('symbols/historic/obelisk.svg');
    }
    [feature = 'historic_monument']{
    marker-file: url('symbols/historic/monument.svg');
    }

    marker-fill: @memorials;
    marker-clip: false;
  }



  [feature = 'historic_fort'][zoom >= 16] {
    marker-file: url('symbols/historic/fort.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_castle'][castle_type != 'stately'][castle_type != 'manor'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_castle'][castle_type = 'stately'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_castle'][castle_type = 'manor'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_manor'] [castle_type = 'palace'] [zoom >= @major-attraction-zoom] {
    marker-file: url('symbols/historic/castle.svg');
    marker-fill: @memorials;
    marker-clip: false;
    [castle_type = 'palace'],
    [castle_type = 'stately'] {
      marker-file: url('symbols/historic/palace.svg');
    }
    [castle_type = 'manor'],
    [castle_type = 'tower'],
    [feature = 'historic_manor'] {
      marker-file: url('symbols/historic/manor.svg');
    }
    [castle_type = 'fortress'],
    [castle_type = 'defensive'],
    [castle_type = 'castrum'],
    [castle_type = 'shiro'],
    [castle_type = 'kremlin'] {
      marker-file: url('symbols/historic/fortress.svg');
    }
  }

  [feature = 'historic_archaeological_site'][zoom >= @major-attraction-zoom] [zoom < 15]{
    marker-file: url('symbols/historic/archaeological_site.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  //[feature = 'amenity_marketplace'][zoom >= @city-attraction-zoom][way_pixels > @small-area],
  [feature = 'amenity_marketplace'][zoom >= @attraction-zoom] {
    marker-opacity: @marker-op;
    marker-clip: false;
    marker-fill: @shop-icon;
    marker-file: url('symbols/shop/marketplace.svg');
  }

  [feature = 'shop'] [zoom > 17] [zoom < 18]{
    [shop = 'supermarket'][zoom > 17],
    [shop = 'department_store'][zoom > 17] {
       marker-opacity: @marker-op;
       marker-clip: false;
       marker-fill: @shop-icon;
    }

    [shop = 'supermarket'][zoom > 17] {
       marker-opacity: @marker-op;
       marker-file: url('symbols/shop/supermarket.svg');
    }

    [shop = 'art'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/art.svg');
    }

    [shop = 'bakery'][zoom = 17] {
       marker-opacity: @marker-op;
       marker-file: url('symbols/shop/bakery.svg');
       marker-fill: @gastronomy-icon;
    }

    [shop = 'beverages'][zoom >= @minor-attraction-zoom] {
       marker-file: url('symbols/shop/beverages.svg');
    }

    [shop = 'books'][zoom >= @minor-attraction-zoom] {
      marker-opacity: @marker-op;
      marker-file: url('symbols/amenity/library.svg');
    }

    [shop = 'butcher'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/butcher.svg');
    }

    [shop = 'charity'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/charity.svg');
    }

    [shop = 'chemist'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/chemist.svg');
    }

    [shop = 'fashion'] [zoom >= 22]{
       marker-file: url('symbols/shop/clothes.svg');
       marker-width: 0;
       marker-line-width: 0;
    }

    [shop = 'clothes'] [zoom >= 22]{
       marker-file: url('symbols/shop/clothes.svg');
       marker-width: 0;
       marker-line-width: 0;
    }

    [shop = 'coffee'][zoom >= @attraction-zoom][zoom < 19] {
      marker-opacity: @marker-op;
      marker-file: url('symbols/amenity/cafe.svg');
      marker-fill: @gastronomy-text;
    }

    [shop = 'computer'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/computer.svg');
    }

    [shop = 'convenience'][zoom > 17] ,
    [shop = 'gift'][zoom > 17]
    {
      marker-file: url('symbols/shop/convenience.svg');
    }

    [shop = 'chocolate'][zoom >= @minor-attraction-zoom],
    [shop = 'confectionery'][zoom >= @minor-attraction-zoom],
    [shop = 'pastry'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/confectionery.svg');
    }

    [shop = 'deli'] {
      [zoom = 16] {
        marker-fill: @gastronomy-text;
        marker-opacity: @marker-op;
        marker-file: url('symbols/amenity/fast_food.svg');
      }
    }

    [shop = 'department_store'][zoom >= 16] {
      marker-file: url('symbols/shop/department_store.svg');
    }

    [shop = 'doityourself'],
    [shop = 'hardware'] {
      [zoom >= @minor-attraction-zoom] {
        marker-file: url('symbols/shop/diy.svg');
      }
    }

    [shop = 'fishmonger'],
    [shop = 'seafood'] {
      [zoom >= @minor-attraction-zoom] {
        marker-file: url('symbols/shop/seafood.svg');
      }
    }

    [shop = 'florist'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/florist.svg');
    }

    [shop = 'garden_centre'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/garden_centre.svg');
    }

    [shop = 'greengrocer'],
    [shop = 'farm']
      [zoom >= @minor-attraction-zoom] {
        marker-file: url('symbols/shop/greengrocer.svg');
    }

    [shop = 'houseware'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/houseware.svg');
    }

    [shop = 'dairy'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/dairy.svg');
    }

    [shop = 'bicycle'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/bicycle.svg');
    }

    [shop = 'pet'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/pet.svg');
    }

    [shop = 'photo'],
    [shop = 'photo_studio'],
    [shop = 'photography'] {
      [zoom >= @minor-attraction-zoom] {
        marker-file: url('symbols/shop/photo.svg');
      }
    }

    [shop = 'paint'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/paint.svg');
    }

    [shop = 'shoes'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/shoes.svg');
    }

    [shop = 'electronics'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/electronics.svg');
    }

    [shop = 'alcohol'],
    [shop = 'wine'] {
      [zoom >= @minor-attraction-zoom] {
        marker-file: url('symbols/shop/alcohol.svg');
      }
    }

    [shop = 'optician'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/optician.svg');
    }

    [shop = 'outdoor'][zoom >= @city-attraction-zoom] {
      [zoom < 18] { marker-file: url('symbols/shop/outdoor.svg');
        }
      [zoom >= @minor-attraction-zoom] {
        text-face-name: @book-fonts;
        text-name: "[name]";
        text-fill: saturate(darken(@transportation-text,10),20);
        text-size: @landcover-font-size;
        text-wrap-width: @landcover-wrap-width-size;
        text-line-spacing: @landcover-line-spacing-size;
      }
    }

    [shop = 'furniture'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/furniture.svg');
    }

    [shop = 'interior_decoration'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/interior_decoration.svg');
    }

    [shop = 'medical_supply'][zoom >= @local-attraction-zoom]{
      marker-file: url('symbols/shop/medical_supply.svg');
    }

    [shop = 'mobile_phone'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/mobile_phone.svg');
    }

    [shop = 'motorcycle'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/motorcycle.svg');
    }

    [shop = 'music'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/music.svg');
    }

    [shop = 'musical_instrument'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/musical_instrument.svg');
    }

    [shop = 'jewelry'],
    [shop = 'jewellery'] {
      [zoom >= @local-attraction-zoom] {
        marker-file: url('symbols/shop/jewelry.svg');
      }
    }

    [shop = 'toys'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/toys.svg');
    }

    [shop = 'travel_agency'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/travel_agency.svg');
    }

    [shop = 'sports'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/sports.svg');
    }

    [shop = 'stationery'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/stationery.svg');
    }

    [shop = 'tea'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/tea.svg');
    }

    [shop = 'ticket'][zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/shop/ticket.svg');
    }

    [shop = 'trade'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/trade.svg');
    }

    [shop = 'wholesale'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/trade.svg');
    }

    [shop = 'variety_store'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/variety_store.svg');
    }

    [shop = 'video'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/video.svg');
    }

    [shop = 'video_games'][zoom >= @minor-attraction-zoom] {
      marker-file: url('symbols/shop/video_games.svg');
    }
  }

  // office points
  [feature = 'office'][zoom >= 21] {
    marker-width: 6;
    marker-line-width: 0;
    marker-clip: false;
    marker-fill: @office;
  }

  [feature = 'diplomatic_embassy'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/office/embassy.svg');
    marker-fill: @office;
    marker-clip: false;
  }

  [feature = 'diplomatic_consulate'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/office/consulate.svg');
    marker-fill: @office;
    marker-clip: false;
  }

  [feature = 'leisure_water_park'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_sports_centre'][sport = 'swimming'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_swimming_area'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/leisure/water_park.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'leisure_fitness_centre'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_fitness_station'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/leisure/fitness.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_dog_park'][zoom >= @attraction-zoom]  {
    marker-file: url('symbols/shop/pet.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'leisure_playground'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/leisure/playground.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_miniature_golf'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/leisure/miniature_golf.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'leisure_golf_course'][zoom >= @city-attraction-zoom] {
    marker-file: url('symbols/leisure/golf.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'tourism_picnic_site'][zoom >= @city-attraction-zoom] {
    marker-file: url('symbols/tourism/picnic.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_sauna'][zoom >= @minor-attraction-zoom] {
     marker-file: url('symbols/leisure/sauna.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_beach_resort'][zoom >= 16] {
     marker-file: url('symbols/leisure/beach_resort.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_bowling_alley'][zoom >= @minor-attraction-zoom] {
     marker-file: url('symbols/leisure/bowling_alley.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_outdoor_seating'][zoom >= @attraction-zoom] {
     marker-file: url('symbols/leisure/outdoor_seating.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_bird_hide'][zoom >= @minor-attraction-zoom] {
     marker-file: url('symbols/leisure/bird_hide.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_amusement_arcade'][zoom >= @minor-attraction-zoom] {
     marker-file: url('symbols/leisure/amusement_arcade.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_fishing'][zoom >= @minor-attraction-zoom] {
     marker-file: url('symbols/leisure/fishing.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
  }

  // Slipway tagging on points - slipway on lines is defined later
  [feature = 'leisure_slipway'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'amenity_boat_rental'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/boat_rental.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }
  [feature = 'aeroway_helipad'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/amenity/helipad.svg');
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_aerodrome']['int_access' = 'yes'][zoom >= @regional-attraction-zoom][zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'restricted'][zoom >= 12][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= @county-attraction-zoom][zoom < 18] {
    [way_pixels > @med-building],
    [way_pixels = null] {
        marker-width: 15;
      marker-file: url('symbols/amenity/aerodrome.svg');
      marker-clip: false;
      marker-fill: @airtransport;
    }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= @county-attraction-zoom] {
    text-face-name: @book-fonts;
    text-name: "[name]";
    text-fill: saturate(darken(@transportation-text,10),20);
    text-size: @landcover-font-size;
    text-wrap-width: @landcover-wrap-width-size;
    text-line-spacing: @landcover-line-spacing-size;
  }

  [feature = 'man_made_lighthouse'][zoom >= @major-attraction-zoom] {
    marker-file: url('symbols/man_made/lighthouse.svg');
    marker-clip: false;
    marker-fill: #EBEBEB;  //@man-made-icon;
    marker-width:  15 ;
    [zoom >= @county-attraction-zoom] {
    marker-width:  18 ;
    }
        [zoom >= 16] {
    marker-width:  30 ;
    }
  }

  [feature = 'natural_peak'] {
    [zoom >= @county-attraction-zoom] [score > 2000]{
    marker-opacity: [score] * 0.000179 + .41;
        marker-file: url('symbols/natural/peak.svg');
       marker-fill: @landform-color;
        marker-width: [score] * 0.00167 + 5;
        marker-clip: false;
     }
   }

  [feature = 'natural_volcano'][zoom >= 7] {
    marker-file: url('symbols/natural/peak.svg');
    marker-fill: #d40000;
    marker-clip: false;

  }

  [feature = 'natural_saddle'][zoom >= @city-attraction-zoom] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @landform-color;
    marker-clip: false;
  }

  [feature = 'mountain_pass'][zoom >= @major-attraction-zoom] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'natural_spring'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/natural/spring.svg');
    marker-fill: #638CC3;
    marker-clip: false;
  }

    [feature = 'natural_hot_spring'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/natural/spring.svg');
    marker-fill: purple;
    marker-clip: false;
  }

    [feature = 'natural_fumarole'][zoom >= @city-attraction-zoom] {
    marker-file: url('symbols/historic/obelisk.svg');
    marker-fill: red;
    marker-clip: false;
  }

  [feature = 'natural_cave_entrance'][zoom >= @county-attraction-zoom] {
    marker-file: url('symbols/natural/cave.svg');
    marker-clip: false;
  }

  [feature = 'natural_geyser'][zoom >= @county-attraction-zoom]["geyser:height" != null],
  [feature = 'natural_geyser'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/natural/cave.svg');
    marker-clip: false;
    marker-fill: @hotspring;
    marker-width: 11;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= @regional-attraction-zoom][height > 60],
    [zoom >= @major-attraction-zoom][height > 20],
    [zoom >= @county-attraction-zoom][height > 10],
    [zoom >= @city-attraction-zoom][height > 5],
     {
      marker-file: url('symbols/natural/waterfall.svg');
      marker-width: 10 + [height] / 27; //35;
      marker-clip: false;
      marker-fill: desaturate(darken(@waterfall, 25), 10);
      //[zoom < 14] {
      //      marker-width: 18;
      //      marker-fill: desaturate(darken(@waterfall, 25), 10);
      //}
    }
  }

  [feature = 'military_bunker'][zoom >= @minor-attraction-zoom] {
    marker-file: url('symbols/man_made/bunker.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'power_generator']['generator:source' = 'wind'] {
    [zoom >= @city-attraction-zoom][location != 'rooftop'][location != 'roof'],
    [zoom >= @city-attraction-zoom][location = null],
    [zoom >= @local-attraction-zoom] {
      marker-file: url('symbols/man_made/generator_wind.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'man_made_windmill'][zoom >= 16] {
    marker-file: url('symbols/man_made/windmill.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }


  [feature = 'amenity_parking'] [zoom >= @attraction-zoom],
  [feature = 'amenity_parking_entrance'] [zoom >= @attraction-zoom] {
    [zoom >= @attraction-zoom]["parking" != 'street_side']["parking" != 'lane'],
    [zoom >= @minor-attraction-zoom][feature = 'amenity_parking']["parking" != 'street_side']["parking" != 'lane'],
    [zoom >= @minor-attraction-zoom] {
      [feature = 'amenity_parking'] {
         marker-file: url('symbols/amenity/parking_subtle.svg');
         marker-height: 8;
         }
      [feature = 'amenity_parking']["parking" = 'street_side'],
      [feature = 'amenity_parking']["parking" = 'lane'] {
        marker-file: url('symbols/amenity/parking_subtle.svg');
      }
      [feature = 'amenity_parking_entrance']["parking"='underground'] { marker-file: url('symbols/amenity/parking_entrance_underground.svg'); }
      [feature = 'amenity_parking_entrance']["parking"='multi-storey'] { marker-file: url('symbols/amenity/parking_entrance_multistorey.svg'); }
      marker-clip: false;
      marker-fill: @culture; //@transportation-icon;
      [int_access = 'restricted'] { marker-opacity: @private-opacity; }
    }
  }
}



// GROUP
#amenity-low-priority {
  [feature = 'railway_level_crossing'][zoom >= @attraction-zoom]::railway,
  [feature = 'railway_crossing'][zoom >= @attraction-zoom]::railway{
    marker-file: url('symbols/barrier/level_crossing.svg');
    marker-fill: #4d4d4d;
    marker-clip: false;
    [zoom >= @attraction-zoom] {
      marker-file: url('symbols/barrier/level_crossing2.svg');
    }
  }

  [feature = 'barrier_gate']::barrier {
    [zoom >= @attraction-zoom] {
      marker-file: url('symbols/barrier/gate.svg');
      marker-clip: false;
    }
  }

  [feature = 'barrier_lift_gate'][zoom >= @attraction-zoom]::barrier,
  [feature = 'barrier_swing_gate'][zoom >= @attraction-zoom]::barrier {
    marker-file: url('symbols/barrier/lift_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_full-height_turnstile'][zoom >= @attraction-zoom]::barrier {
    marker-file: url('symbols/barrier/full-height_turnstile.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_kissing_gate'][zoom >= @attraction-zoom]::barrier {
    marker-file: url('symbols/barrier/kissing_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }
}


/* Note that these layers are also used in water.mss */
// GROUP
#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= @regional-attraction-zoom] {

  [feature = 'place_island'][zoom >= 4][way_pixels > @small-area],
  [feature = 'place_island'][zoom >= 16],
  [feature = 'place_islet'][zoom >= 11][way_pixels > @small-area],
  [feature = 'place_islet'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-fill: @placenames;
    text-size: @landcover-font-size;
    text-wrap-width: @landcover-wrap-width-size;
    text-line-spacing: @landcover-line-spacing-size;
    [way_pixels > @large-area] {
      text-size: @landcover-font-size-big;
      text-wrap-width: @landcover-wrap-width-size-big;
      text-line-spacing: @landcover-line-spacing-size-big;
    }
    [way_pixels > @huge-area] {
      text-size: @landcover-font-size-bigger;
      text-wrap-width: @landcover-wrap-width-size-bigger;
      text-line-spacing: @landcover-line-spacing-size-bigger;
    }
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'place_locality'][zoom >= 16] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @placenames;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= @attraction-zoom] {
      text-size: 12;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
      text-halo-fill: white;
    }
  }

  [feature = 'place_square'][zoom >= 16] {
    text-fill: @culture;
    text-name: "[name]";
    text-size: 11;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= @attraction-zoom] {
        text-size: 12;
      }
  }


  [feature = 'amenity_pub'][zoom >= @attraction-zoom],
  [feature = 'amenity_fast_food'][zoom >= @attraction-zoom],
  [feature = 'amenity_restaurant'][zoom >= @attraction-zoom],
  [feature = 'amenity_food_court'][zoom >= @attraction-zoom],
  [feature = 'amenity_cafe'][zoom >= @attraction-zoom],
  [feature = 'amenity_biergarten'][zoom >= @attraction-zoom],
  [feature = 'amenity_bar'][zoom >= @attraction-zoom],
  [feature = 'amenity_ice_cream'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-fill: @gastronomy-text;
    text-size: 12; //@standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    // text-dy: 11;
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
    [zoom >= @local-attraction-zoom] {
      text-size: 14;
    }
  }

  [feature = 'amenity_library'],
  [feature = 'amenity_cinema'],
  [feature = 'amenity_community_centre'],
  [feature = 'amenity_nightclub'] {
    [zoom >= 21] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @culture;
      // text-dy: 11;
      [feature = 'amenity_community_centre'] {
      // text-dy: 10;
      }
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'amenity_nightclub']{
        // text-dy: 12;
      }
    }
  }

    [feature = 'historic_archaeological_site'] {
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @placenames;
      // text-dy: 11;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'amenity_nightclub'] [zoom >= @local-attraction-zoom],
  [feature = 'amenity_car_rental'][zoom >= @local-attraction-zoom],
  [feature = 'amenity_bicycle_rental'][zoom >= @minor-attraction-zoom],
  [feature = 'amenity_boat_rental'][zoom >= @minor-attraction-zoom],
  [feature = 'barrier_toll_booth'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_slipway'][zoom >= @minor-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @transportation-text;
    [feature = 'amenity_car_rental']     { text-dy: 10; }
    [feature = 'amenity_bicycle_rental'] { text-dy: 10; }
    [feature = 'amenity_boat_rental']    { text-dy: 13; }
    [feature = 'barrier_toll_booth']     { text-dy: 13; }
    [feature = 'leisure_slipway']        { text-dy: 13; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_courthouse'][zoom >= @attraction-zoom],
  [feature = 'amenity_townhall'][zoom >= @attraction-zoom],
  [feature = 'amenity_police'][zoom >= @attraction-zoom],
  [feature = 'amenity_social_facility'][zoom >= @local-attraction-zoom],
  [feature = 'amenity_fire_station'][zoom >= @attraction-zoom],
  [feature = 'amenity_post_office'][zoom >= @minor-attraction-zoom],
  [feature = 'amenity_prison'][zoom >= @minor-attraction-zoom],
  [feature = 'amenity_bank'][zoom >= @minor-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @public-service;
    // text-dy: 11;
    [feature = 'amenity_courthouse'] { text-dy: 1; }
    [feature = 'amenity_townhall'] {
       text-size: @standard-font-size+2;
    }
    [feature = 'amenity_prison'] { text-dy: 1; }
    [feature = 'amenity_bank'] { text-dy: 1; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_internet_cafe'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_bowling_alley'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_beach_resort'][zoom >= @attraction-zoom],
  [feature = 'leisure_bird_hide'][zoom >= @minor-attraction-zoom],
  [feature = 'leisure_amusement_arcade'][zoom >= @local-attraction-zoom],
  [feature = 'leisure_outdoor_seating'][zoom >= @local-attraction-zoom],
  [feature = 'leisure_fishing'][zoom >= @minor-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    [feature = 'leisure_outdoor_seating'],
    [feature = 'leisure_fishing'],
    [feature = 'leisure_bowling_alley'],
    [feature = 'leisure_bird_hide'],
    [feature = 'leisure_beach_resort'] {
      text-fill: @amenity-color;
    }
    [feature = 'leisure_amusement_arcade'] {
      text-fill: @amenity-color;
    }
    // text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_bicycle_repair_station'][zoom >= @local-attraction-zoom],
  [feature = 'tourism_picnic_site'][zoom >= @city-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size - 3;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    [feature = 'tourism_picnic_site'] {
      text-fill: @amenity-color;
    }
    text-dy: 10;
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
    [int_access = 'restricted'] {
      text-opacity: @private-opacity;
      text-halo-radius: 0;
    }
  }

  // religious building name
  [feature = 'amenity_place_of_worship'][zoom >= @city-attraction-zoom][way_pixels > @large-building]{
    text-name: "[name]";
          text-fill:  @culture;  // HIGHLIGHT TEXT: RELIGIOUS
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          // text-dy: 11;
          text-face-name: @bold-fonts;
          text-halo-radius: @standard-halo-radius;
          text-halo-fill: @standard-halo-fill;
          text-size: @standard-font-size - 1;
  }

  [feature = 'amenity_marketplace'][zoom >= 16][way_pixels > @small-area],
  [feature = 'amenity_marketplace'][zoom >= @local-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    //text-dy: 12;
    text-fill: @shop-text;
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: rgba(255, 255, 255, 0.6);
  }

  [feature = 'natural_cape'][zoom >= @county-attraction-zoom] {
    text-name: "[name]";
    text-fill: white; //@landform-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
  }

  //[feature = 'tourism_information'][zoom >= @county-attraction-zoom],
  [feature = 'tourism_information'][information = 'office'][zoom >= 16] {
    text-name: "[name]";
    text-size: @standard-font-size - 2;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @accommodation-text;
    [information = 'office'] { text-fill: @amenity-color; }
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
    text-dy: 11;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 11][height > 50],
    [zoom >= @major-attraction-zoom][height > 30],
    [zoom >= @county-attraction-zoom][height > 10],
    [zoom >= @city-attraction-zoom][name != null],
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @small-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @waterfall-text; //@water-text;
      text-dy: 20;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'power_generator']['generator:source' = 'wind'][location != 'rooftop'][location != 'roof'][zoom >= @local-attraction-zoom],
  [feature = 'power_generator']['generator:source' = 'wind'][location = null][zoom >= @local-attraction-zoom],
  [feature = 'power_generator']['generator:source' = 'wind'][zoom >= @local-attraction-zoom],
  [feature = 'historic_city_gate'][zoom >= @attraction-zoom],
  [feature = 'natural_cave_entrance'][zoom >= @city-attraction-zoom],
  [feature = 'man_made_mast'][zoom >= @local-attraction-zoom],
  [feature = 'man_made_tower'][zoom >= 16],
  [feature = 'man_made_storage_tank'][zoom >= @local-attraction-zoom],
  [feature = 'man_made_silo'][zoom >= @local-attraction-zoom],
  [feature = 'man_made_communications_tower'][zoom >= @attraction-zoom],
  [feature = 'man_made_observation_tower'][zoom >= @attraction-zoom],
  [feature = 'man_made_telescope']["telescope:type" != 'optical']["telescope:type" != null][zoom >= @attraction-zoom],
  [feature = 'man_made_telescope'][zoom >= @attraction-zoom],
  [feature = 'man_made_water_tower'][zoom >= @attraction-zoom],
  [feature = 'man_made_chimney'][zoom >= @attraction-zoom],
  [feature = 'man_made_crane'][zoom >= @attraction-zoom],
  [feature = 'man_made_waste_water_plant'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    [feature = 'power_generator']['generator:source' = 'wind'],
    [feature = 'historic_city_gate'],
    [feature = 'man_made_mast'],
    [feature = 'man_made_tower'],
    [feature = 'man_made_communications_tower'],
    [feature = 'man_made_telescope'],
    [feature = 'man_made_water_tower'],
    [feature = 'man_made_storage_tank'],
    [feature = 'man_made_silo'],
    [feature = 'man_made_chimney'],
    [feature = 'man_made_crane'] {
      text-dy: 10;
    }
    [feature = 'natural_cave_entrance'] {
      text-dy: 11;
    }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'tourism_artwork'][zoom >= @local-attraction-zoom],
  [feature = 'historic_memorial'][memorial = null][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= @attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= @local-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= @minor-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= @local-attraction-zoom],
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= @local-attraction-zoom],
  [feature = 'man_made_obelisk'][zoom >= @attraction-zoom],
  [feature = 'historic_monument'][zoom >= @attraction-zoom],
  [feature = 'historic_fort'][zoom >= 16],
  [feature = 'historic_manor'][zoom >= 16] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @memorials;
    // text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'historic_castle'] [zoom >= @city-attraction-zoom]  {
       [way_pixels > 500]{
        text-name: "[name]";
    text-size: @standard-font-size - 3;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;  // HIGHLIGHT TEXT: PALACE
    text-dy: 11;
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
    }

    [way_pixels > 1400]  {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;  // HIGHLIGHT TEXT: PALACE
    // text-dy: 11;
    text-face-name: @bold-fonts;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
  }

  }

  [feature = 'military_bunker'][zoom >= 16] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    // text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'leisure_water_park'],
  [feature = 'leisure_sports_centre'][sport = 'swimming'],
  [feature = 'leisure_swimming_area'] {
    [zoom >= @county-attraction-zoom][way_pixels > @small-area],
    [zoom >= @minor-attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @leisure-color;
      // text-dy: 11;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'leisure_swimming_pool'][is_building = 'no'] {
    [zoom >= @county-attraction-zoom][way_pixels > @small-area],
    [zoom >= @minor-attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: @marina-text;
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'leisure_playground'],
  [feature = 'leisure_dog_park'],
  [feature = 'leisure_fitness_centre'],
  [feature = 'leisure_fitness_station'] {
    [zoom >= @major-attraction-zoom][way_pixels > @med-building],
    [zoom >= @minor-attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 13;
      text-fill: @leisure-color;
      text-face-name: @standard-font;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;
      [int_access = 'restricted'] {
        text-fill: darken(@park, 35%);
      }
    }
  }

  [feature = 'landuse_military'],
  [feature = 'natural_wood'],
  [feature = 'landuse_forest'],
  [feature = 'boundary_national_park'],
  [feature = 'leisure_nature_reserve'],
  [feature = 'boundary_protected_area'],
  [feature = 'boundary_aboriginal_lands'] {
    [zoom >= 8][way_pixels>3500][is_building = 'no'],
    [zoom >= 16] {
    text-allow-overlap: true;
      text-fill: @forest-text;
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;

     [zoom >= 8] {
        text-fill: @forest-text;
        text-size: 10 + [way_pixels] * 0.0005 ;
        text-wrap-width: @landcover-wrap-width-size;
        text-line-spacing: @landcover-line-spacing-size;
      }

      [zoom >= 9] {
        text-fill: @forest-text;
        text-size: 11 + [way_pixels] * 0.0002 ;
        text-wrap-width: @landcover-wrap-width-size;
        text-line-spacing: @landcover-line-spacing-size;
      }

      [zoom >= @regional-attraction-zoom] {
        text-size: 12 + [way_pixels] * 0.00008 ;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }

      [zoom >= 12] {
        text-size: 12 + [way_pixels] * 0.00008 ;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }

      text-face-name: @landcover-face-name;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;
      [feature = 'landuse_military'] {
        text-fill: darken(@military, 35%);
      }
      [feature = 'boundary_aboriginal_lands'] {
        text-fill: @aboriginal;
      }

      [feature = 'natural_wood'],
      [feature = 'landuse_forest'] {
        text-fill: @forest-text;
      }

      [feature = 'boundary_national_park'],
      [feature = 'leisure_nature_reserve'],
      [feature = 'boundary_protected_area'] {
        text-fill: @forest-text;
      }
    }
  }

  [feature = 'natural_mountain_range']  [zoom >= 5] [zoom < 12],
  [feature = 'natural_peak']  [zoom >= @major-attraction-zoom],
  [feature = 'natural_valley']  [zoom >= @major-attraction-zoom],
  [feature = 'natural_peak']  [zoom >= @regional-attraction-zoom] [score > 3400],
  //[feature = 'natural_peak']  [zoom >= 8] [score > 3400],
  [feature = 'natural_volcano'][zoom >= @major-attraction-zoom],
  [feature = 'natural_saddle'][zoom >= @city-attraction-zoom],
  [feature = 'mountain_pass'][zoom >= @county-attraction-zoom],
  [feature = 'desert'][zoom >= 8],
  [feature = 'mountain_pass']  [zoom >= @regional-attraction-zoom] [score > 1300],
  [feature = 'tourism_viewpoint'][zoom >= @county-attraction-zoom] {
    text-name: "[name]";
    text-size: @small-font-size;
    text-wrap-width: 20; //@standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: white; //@hiking;
    //text-dy: 10;
    text-face-name: @standard-font;
    //text-face-name:  @bold-fonts;
    text-allow-overlap: false;
    //text-size: 14;

    [feature = 'natural_mountain_range'],
    [feature = 'desert'],
    [feature = 'tourism_viewpoint'] {
            text-fill: @highlight;
            text-size: @small-font-size + 2;
            [zoom >= @county-attraction-zoom] {
                text-size: @small-font-size + 2;
            }
    }
    [feature = 'natural_volcano'] { text-fill: #767676; }
  }

  [feature = 'military_danger_area'][is_building = 'no'] {
    [zoom >= 9][way_pixels > @small-area],
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@military, 20%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'landuse_garages'][is_building = 'no'] {
    [zoom >= @major-attraction-zoom][way_pixels > @small-area],
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@garages, 35%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }


  [feature = 'landuse_industrial'],
  [feature = 'landuse_quarry'],
  [feature = 'landuse_railway'],
  [feature = 'landuse_construction'],
  [feature = 'man_made_works'],
  [feature = 'man_made_water_works'],
  [feature = 'man_made_wastewater_plant'],
  [feature = 'landuse_commercial'],
  [feature = 'landuse_brownfield'],
  [feature = 'landuse_landfill']{
    [zoom >= @regional-attraction-zoom][way_pixels > @small-area][is_building = 'no'],
    [zoom >= @local-attraction-zoom][is_building = 'no'],
    [zoom >= @regional-attraction-zoom][way_pixels > @small-area] {
      text-face-name: @landcover-face-name;
      text-name: "[name]";  // HIGHLIGHT TEXT: INDUSTRIAL
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-fill: darken(@industrial, 35%);
     }
  }


  [feature = 'natural_wetland'],
  [feature = 'natural_mud'],
  [feature = 'leisure_park'],
  [feature = 'landuse_recreation_ground'],
  [feature = 'landuse_village_green'],
  [feature = 'leisure_garden'],
  [feature = 'landuse_vineyard'],
  [feature = 'landuse_orchard'],
  [feature = 'landuse_plant_nursery'],
  [feature = 'landuse_cemetery'] [zoom > 14],
  [feature = 'amenity_grave_yard'],
  [feature = 'landuse_residential'] [zoom > 15],
  [feature = 'landuse_meadow'],
  [feature = 'natural_grassland'],
  [feature = 'landuse_grass'],
  [feature = 'landuse_allotments'],
  [feature = 'landuse_farmyard'],
  [feature = 'landuse_farmland'],
  [feature = 'landuse_greenhouse_horticulture'],
  [feature = 'shop'][shop = 'mall'][location != 'underground'],
  [feature = 'landuse_retail'],
  [feature = 'landuse_salt_pond'],
  [feature = 'tourism_theme_park'],
  [feature = 'tourism_zoo'],
  [feature = 'amenity_kindergarten'],
  [feature = 'amenity_school'],
  [feature = 'amenity_college'],
  [feature = 'amenity_university'],
  [feature = 'landuse_religious'],
  [feature = 'natural_heath'],
  [feature = 'natural_scrub'],
  [feature = 'natural_beach'],
  [feature = 'natural_shoal'],
  [feature = 'natural_reef'],
  [feature = 'leisure_fitness_centre'],
  [feature = 'leisure_fitness_station'],
  [feature = 'leisure_sports_centre'],
  [feature = 'leisure_stadium'],
  [feature = 'leisure_track'],
  [feature = 'leisure_dog_park'],
  [feature = 'leisure_ice_rink'],
  [feature = 'leisure_pitch'] {
    [zoom >= 12][way_pixels > 700][is_building = 'no'],
    [zoom >= @regional-attraction-zoom][way_pixels > 500][is_building = 'yes'],
    [zoom >= @local-attraction-zoom][is_building = 'no'] {
      text-fill: @culture;
      text-face-name: @book-fonts;
      text-name: "[name]";  // HIGHLIGHT TEXT: LAND medium size
      text-size: 9; // @standard-font-size - 2;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;

       [zoom >= @city-attraction-zoom][is_building = 'no'] {
          text-fill: @culture;
          text-face-name: @bold-fonts;
          //text-name: "[way_pixels]";  // HIGHLIGHT TEXT: LAND medium size
          text-size: 11;
       }

      [way_pixels > @small-area] {   // HIGHLIGHT TEXT: Land large size
        text-fill: @culture;
        text-size: 8 + [way_pixels] / 800 ;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }

      [way_pixels > 5000] {   // HIGHLIGHT TEXT: Land large size
        text-fill: @culture;
        text-size: 8 + [way_pixels] / 900 ;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }

       [way_pixels > @large-area] {   // HIGHLIGHT TEXT: Land large size
        text-fill: @culture;
        text-size: 5 + [way_pixels] / 1900 ;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }

      [way_pixels > @huge-area] {   // HIGHLIGHT TEXT: VERY LARGE SIZE
        text-fill: red; //@culture;
        text-size: 12; // @standard-font-size + 6 ;
        text-wrap-width: @landcover-wrap-width-size-bigger + 40;
        text-line-spacing: @landcover-line-spacing-size-bigger;
        text-min-padding: 40;
      }

      text-face-name: @landcover-face-name;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;

      [feature = 'natural_reef'],
      [feature = 'natural_wetland'],
      [feature = 'natural_mud'],
      [feature = 'landuse_salt_pond'] {
        //text-fill: @wetland-text;
      }

      [feature = 'leisure_park'],
      [feature = 'landuse_recreation_ground'],
      [feature = 'landuse_village_green'],
      [feature = 'leisure_garden'] {
         //text-fill: @placenames;
      }

      [feature = 'landuse_vineyard'],
      [feature = 'landuse_orchard'],
      [feature = 'landuse_plant_nursery'] {
        text-fill: darken(@orchard, 35%);
      }

      [feature = 'landuse_cemetery'],
      [feature = 'amenity_grave_yard'] {
        //text-fill: darken(@cemetery, 35%);
        text-halo-radius: @standard-halo-radius * 1.5; /* extra halo needed to overpower the cemetery polygon pattern */
      }

      [feature = 'landuse_residential']  {
        text-fill: darken(@residential, 35%);
      }

      [feature = 'landuse_meadow'],
      [feature = 'natural_grassland'],
      [feature = 'landuse_grass'] {
        text-fill: darken(@grass, 35%);
      }

      [feature = 'landuse_allotments'] {
        text-fill: darken(@allotments, 35%);
      }
      [feature = 'landuse_farmyard'] {
        text-fill: darken(@farmyard, 35%);
      }
      [feature = 'landuse_farm'],
      [feature = 'landuse_farmland'],
      [feature = 'landuse_greenhouse_horticulture'] {
        text-fill: darken(@farmland, 35%);
      }
      [feature = 'shop'][shop = 'mall'],
      [feature = 'landuse_retail'] {
        text-fill: darken(@retail, 35%);
      }

      [feature = 'landuse_commercial'] {
        text-fill: darken(@commercial, 35%);
      }

      [feature = 'tourism_caravan_site'] {
        text-fill: darken(@campsite, 35%);
        // text-dy: 15;
      }
      [feature = 'tourism_theme_park'],
      [feature = 'tourism_zoo'] {
        text-fill: @placenames;
        //text-face-name: @bold-fonts;
        text-allow-overlap: true;
      }
      [feature = 'amenity_college'],
      [feature = 'amenity_university'] {
        //text-face-name: @bold-fonts;
        text-allow-overlap: true;

        //text-fill: darken(@placenames, 40%);
      }
      [feature = 'landuse_religious'] {
        text-fill: darken(@place_of_worship, 50%);
      }
      [feature = 'natural_heath'] {
        text-fill: darken(@heath, 35%);
      }
      [feature = 'natural_scrub'] {
        text-fill: darken(@scrub, 35%);
      }
      [feature = 'natural_beach'],
      [feature = 'natural_shoal'] {
        text-fill: #DFBB2D;
      }
      [feature = 'leisure_sports_centre'],
      [feature = 'leisure_stadium'] {
        //text-fill: darken(@stadium, 45%);
      }
      [feature = 'leisure_fitness_centre'],
      [feature = 'leisure_fitness_station'] {
        text-fill: @leisure-color;
        [int_access = 'restricted'] {
          text-opacity: @private-opacity;
          text-halo-radius: 0;
        }
      }
      [feature = 'leisure_dog_park'] {
        text-fill: @leisure-color;
        text-halo-radius: @standard-halo-radius * 1.5; /* Extra halo needed to stand out from paw pattern. */
        text-halo-fill: @standard-halo-fill;
      }
      [feature = 'leisure_track'] {
        text-fill: darken(@track, 35%);
      }
      [feature = 'leisure_ice_rink'],
      [feature = 'leisure_pitch'] {
        text-fill: darken(@pitch, 35%);
      }
    }
  }

  [feature = 'natural_spring'][zoom >= @attraction-zoom][spring_type = 'hot'] ,
  [feature = 'natural_spring'][zoom >= @attraction-zoom][spring_type != 'hot']
   {
    text-name: "[name]";
    text-size: 10;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;
    text-face-name: @standard-font;

    text-dy: 7;
    [spring_type = 'hot'] {
       text-fill: darken(@hotspring, 30);
    }
  }

    [feature = 'natural_geyser'][zoom >= @county-attraction-zoom]["geyser:height" != null],
    [feature = 'natural_geyser'][zoom >= @attraction-zoom],
    [feature = 'natural_hot_spring'][zoom >= @attraction-zoom],
    [feature = 'natural_fumarole'][zoom >= @county-attraction-zoom]  {
    text-name: "[name]";
    text-size: 9;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@hotspring, 10);
    text-face-name: @standard-font;
    text-allow-overlap: false;
    text-dy: 10;

    ["geyser:height" != null] {
    text-face-name:  @bold-fonts;
    text-allow-overlap: true;
    text-size: 11;
    }

    [feature = 'natural_fumarole'] {
    text-name: "Fumarole";
    }
  }


  [feature = 'tourism_alpine_hut'][zoom >= @county-attraction-zoom],
  [feature = 'tourism_camp_pitch'][zoom >= @minor-attraction-zoom],
  [feature = 'amenity_shelter'][zoom >= @city-attraction-zoom],
  [feature = 'leisure_picnic_table'][zoom >= @minor-attraction-zoom],
  [feature = 'tourism_hotel'][zoom >= 16],
  [feature = 'tourism_motel'][zoom >= 16],
  [feature = 'tourism_hostel'][zoom >= 16],
  //[feature = 'tourism_chalet'][zoom >= @attraction-zoom],
  [feature = 'tourism_guest_house'][zoom >= @attraction-zoom],
  [feature = 'tourism_apartment'][zoom >= @minor-attraction-zoom],
  [feature = 'tourism_wilderness_hut'][zoom >= @county-attraction-zoom],
  [feature = 'tourism_camp_site'][zoom >= 16],
  [feature = 'tourism_caravan_site'][zoom >= @attraction-zoom], {
    text-name: "[name]";
    text-size: 10; //@standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @highlight; //@accommodation-text;
    //text-dy: 11;
    //text-face-name: @standard-font;
    text-face-name: @standard-font;

    [feature = 'tourism_camp_site'][zoom >= 16],
    [feature = 'tourism_caravan_site'][zoom >= @attraction-zoom], {
    text-fill: @hiking;
    }
  }


  [feature = 'highway_bus_stop'],
  [feature = 'amenity_charging_station'],
  [feature = 'amenity_fuel'],
  [feature = 'amenity_bus_station'] {
    [zoom >= 21] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @transportation-text;
      // text-dy: 11;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'highway_bus_stop'] {
        // text-dy: 9;
      }
      [int_access = 'restricted'] {
        text-opacity: @private-opacity;
        text-halo-radius: 0;
      }
    }
  }

  [feature = 'leisure_marina'][zoom >= @city-attraction-zoom] {
    [zoom >= @regional-attraction-zoom][way_pixels > @small-area],
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: @marina-text;
      text-face-name: @standard-font;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'amenity_fountain'][zoom >= @minor-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size - 2;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @waterfall;
    text-dy: 15;
    text-face-name: @standard-font;
    [zoom >= @minor-attraction-zoom] {
      // text-dy: 10;
    }
  }

  [feature = 'man_made_lighthouse'][zoom >= @major-attraction-zoom],
  [feature = 'man_made_windmill'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size - 3;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: white; //@man-made-icon;
    text-dy: 10;
    text-face-name: @standard-font;
    //text-halo-radius: @standard-halo-radius;
    //text-halo-fill: @standard-halo-fill;
    [zoom >= @county-attraction-zoom] {
    text-size: @standard-font-size;
    }
  }

  [feature = 'amenity_hospital'][zoom >= 16] {
    text-name: "[name]";
    text-fill: @health-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    // text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_clinic'],
  [feature = 'amenity_pharmacy'],
  [feature = 'amenity_veterinary'] {
    [zoom >= @minor-attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 12;
      text-fill: @health-color;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'amenity_nursing_home'],
  [feature = 'amenity_childcare'] {
    [zoom >= @minor-attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      // text-dy: 8;
      text-fill: darken(@societal_amenities, 80%);
    }
  }

  [feature = 'shop'][shop != 'mall']{
    [way_pixels > @small-area][zoom >= 16],
    [zoom >= @attraction-zoom] [way_pixels > @med-building]{
      text-name: "[name]";  //HIGHIGHT TEXT: SHOP
      text-size: @small-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-fill: green; //@shop-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
      [shop = 'massage'] {
        text-fill: @leisure-color;
      }
    }
  }

  [feature = 'office'] {
    [zoom >= 22] {
      [office = 'accountant'],
      [office = 'adoption_agency'],
      [office = 'advertising_agency'],
      [office = 'architect'],
      [office = 'association'],
      [office = 'charity'],
      [office = 'company'],
      [office = 'educational_institution'],
      [office = 'diplomatic'],
      [office = 'employment_agency'],
      [office = 'energy_supplier'],
      [office = 'estate_agent'],
      [office = 'financial'],
      [office = 'forestry'],
      [office = 'foundation'],
      [office = 'guide'],
      [office = 'insurance'],
      [office = 'it'],
      [office = 'lawyer'],
      [office = 'logistics'],
      [office = 'moving_company'],
      [office = 'newspaper'],
      [office = 'ngo'],
      [office = 'notary'],
      [office = 'political_party'],
      [office = 'private_investigator'],
      [office = 'property_management'],
      [office = 'quango'],
      [office = 'religion'],
      [office = 'research'],
      [office = 'surveyor'],
      [office = 'tax'],
      [office = 'tax_advisor'],
      [office = 'telecommunication'],
      [office = 'travel_agent'],
      [office = 'water_utility'] {
        text-name: "[name]";
        text-size: @standard-font-size;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
        text-dy: 8;
        text-fill: gray; //@office;
        text-face-name: @standard-font;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: rgba(255, 255, 255, 0.6);
      }
    }

    // all other offices
    [zoom >= 22] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 8;
      text-fill: @office;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }

  [feature = 'diplomatic_embassy'],
  [feature = 'diplomatic_consulate'] {
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 10;
      text-fill: @office;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }

    [feature = 'office']  [office = 'government'] {
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size ;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 10;
      text-fill: @office;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }

  [feature = 'shop_supermarket'],
  [feature = 'shop_department_store'] {
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size - 1;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }

  [feature = 'aeroway_gate'][zoom >= @attraction-zoom] {
    text-name: "[ref]";
    text-size: @standard-font-size - 1;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @placenames;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'power_plant'][is_building = 'no'][zoom >= @regional-attraction-zoom],
  [feature = 'power_generator'][is_building = 'no']["generator:source" != 'wind'][zoom >= @regional-attraction-zoom],
  [feature = 'power_substation'][is_building = 'no'][zoom >= @major-attraction-zoom]{
    [way_pixels > @small-area],
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@power, 40%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'natural_scree'][zoom >= 9],
  [feature = 'natural_shingle'][zoom >= 9],
  [feature = 'natural_bare_rock'],
  [feature = 'natural_sand'] {
    [zoom >= 8][way_pixels > @small-area][is_building = 'no'],
    [zoom >= @attraction-zoom][is_building = 'no'] {
    //text-dx: 1;
      text-name: "[name]";
      text-size: @landcover-font-size + 2;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      //text-fill: black;

      [way_pixels > @large-area] {
        //text-fill: blue;
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }

      [way_pixels > @huge-area] {
        //text-fill: orange;
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }

      text-face-name: @landcover-face-name;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;
      [feature = 'natural_scree'],
      [feature = 'natural_shingle'],
      [feature = 'natural_bare_rock'] {
        text-fill: darken(@bare_ground, 50%);
      }
      [feature = 'natural_sand'] {
        text-fill: darken(@sand, 60);
      }
    }
  }

  [feature = 'highway_services'][is_building = 'no'],
  [feature = 'highway_rest_area'][is_building = 'no'] {
    [zoom >= @regional-attraction-zoom][way_pixels > @small-area],
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size+3;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@rest_area, 40%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'natural_glacier'][is_building = 'no'] {
    [zoom >= 8][way_pixels > 10000],
    [zoom >= @regional-attraction-zoom][way_pixels > 750],
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: mix(darken(@glacier, 40%), darken(@glacier-line, 30%), 50%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'aeroway_helipad'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @airtransport;
    // text-dy: -10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'aeroway_aerodrome']['int_access' = 'yes']['iata' != null][zoom >= @regional-attraction-zoom] [zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'yes'][zoom >= 12] [zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'restricted'][zoom >= @major-attraction-zoom][zoom < 18],
  [feature = 'aeroway_aerodrome']['icao' = null][zoom >= @major-attraction-zoom][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= @major-attraction-zoom][zoom < 18] {
    [way_pixels <= 1920000],
    [way_pixels = null] {
      text-name: "[name]";
      text-size: @small-font-size+4;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: white; //@placenames;
      text-dy: 10;
      text-face-name: @oblique-fonts;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;

     [zoom >= 11]{
           text-size: @small-font-size+2;
     }
     [zoom >= @county-attraction-zoom]{
           text-size: @standard-font-size;
     }
    }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= @major-attraction-zoom] {
    [zoom >= @major-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size - 2;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    text-dy: 10;
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: white;
    }
    [zoom >= @county-attraction-zoom] {
         text-fill: @amenity-color;
          text-size: @standard-font-size - 7;
          }
    [zoom >= @attraction-zoom] {
       text-size: @medium-font-size;
      }
  }


  [feature = 'natural_tree'][zoom >= @minor-attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @tree-color;
    // text-dy: 7;

    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_casino'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-fill: @amenity-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    // text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'highway_trailhead'] [zoom >= 16] {
      text-name: "[name]";
      text-fill:  @culture;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 11;
      text-face-name: @bold-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-size: @standard-font-size;
  }

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance']["parking"='underground'] {
    [zoom >= @attraction-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size - 3;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @culture; //@transportation-text;
      text-dy: 9;
      text-face-name: @standard-font;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @standard-halo-fill;
      [int_access = 'restricted'] {
        text-opacity: @private-opacity;
        text-halo-radius: 0;
      }
      [feature = 'amenity_bicycle_parking'],
      [feature = 'amenity_motorcycle_parking'] { text-dy: 12; }
    }
  }
}


// GROUP
#amenity-line {
  // Ford tagging on ways
  [feature = 'highway_ford'][zoom >= 16] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: blue; //@transportation-icon;
  }
  // Slipway tagging on ways
  [feature = 'leisure_slipway'][zoom >= @attraction-zoom] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: @transportation-icon;
  }

  [feature = 'leisure_track'] {
    [zoom >= 16] {
      [zoom >= @attraction-zoom] {
        bridgecasing/line-color: saturate(darken(@pitch, 30%), 20%);
        bridgecasing/line-join: round;
        bridgecasing/line-width: 1.25;
        [zoom >= @minor-attraction-zoom] { bridgecasing/line-width: 2.5; }
        [zoom >= @local-attraction-zoom] { bridgecasing/line-width: 5; }
      }
      line-color: @pitch;
      line-join: round;
      line-cap: round;
      line-width: 1;
      [zoom >= @minor-attraction-zoom] { line-width: 2; }
      [zoom >= @local-attraction-zoom] { line-width: 4; }
    }
  }

  [feature = 'attraction_water_slide'] {
    [zoom >= @attraction-zoom] {
      [zoom >= @attraction-zoom] {
        bridgecasing/line-color: blue;
        bridgecasing/line-join: round;
        bridgecasing/line-width: 1.25;
        [zoom >= @minor-attraction-zoom] { bridgecasing/line-width: 2.5; }
        [zoom >= @local-attraction-zoom] { bridgecasing/line-width: 5; }
      }
      line-color: @pitch;
      line-join: round;
      line-cap: round;
      line-width: 1;
      [zoom >= @minor-attraction-zoom] { line-width: 2; }
      [zoom >= @local-attraction-zoom] { line-width: 4; }
    }
  }
}


// GROUP
#text-line {
  [feature = 'leisure_track'],
  [feature = 'attraction_water_slide'] {
    [zoom >= @local-attraction-zoom] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: darken(@pitch, 40%);
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      text-placement: line;
      text-vertical-alignment: middle;
      text-repeat-distance: @waterway-text-repeat-distance;
      // text-dy: 8;
    }
  }

  [feature = 'leisure_slipway'][zoom >= @attraction-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @transportation-text;
    // text-dy: 13;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }
}


// GROUP
#trees [zoom >= @minor-attraction-zoom] {
  ::canopy {
    opacity: 0.6;
    [natural = 'tree_row'] {
      line-color: darken(@forest,20%);
      line-cap: round;
      line-width: 2.5;
      [zoom >= @attraction-zoom] {
        line-width: 5;
      }
      [zoom >= @minor-attraction-zoom] {
        line-width: 10;
      }
      [zoom >= @local-attraction-zoom] {
        line-width: 15;
      }
      [zoom >= 20] {
        line-width: 30;
      }
    }

    [natural = 'tree'] [zoom >= 22]  {
        opacity: 0.6;
      marker-fill: darken(@forest,20%);
      marker-allow-overlap: true;
      marker-line-width: 0;
      marker-ignore-placement: true;
      marker-width: 2.5;
      marker-height: 2.5;
      [zoom >= 22] {
        marker-width: 26;
        marker-height: 22;
      }
      [zoom >= 22] {
        marker-width: 30;
        marker-height: 28;
      }
      [zoom >= 22] {
        marker-width: 38;
        marker-height: 36;
      }
    }
  }
  /*
  [natural = 'tree']::trunk {
    [zoom >= 22] {
      trunk/opacity: 0.4;
      trunk/marker-fill: #6b8d5e; // Same opacity and color as forest svg patterns
      trunk/marker-allow-overlap: true;
      trunk/marker-line-width: 0;
      trunk/marker-width: 2;
      trunk/marker-height: 2;
      trunk/marker-ignore-placement: true;
    }
    [zoom >= 22] {
      trunk/marker-width: 3;
      trunk/marker-height: 3;
    }
    [zoom >= 22] {
      trunk/marker-width: 6;
      trunk/marker-height: 6;
    }
  } */
}
