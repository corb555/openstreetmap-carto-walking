// Markers and Text labels for amenities

@marina-text: white; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%); /* Also for mud */
@shop-icon: #ac39ac;
@shop-text: #939;
@transportation-icon: #A645BA;
@transportation-text: darken(@transportation-icon, 15);
@accommodation-icon: #1069C6;
@accommodation-text: #1069C6;
@airtransport: #F3B633;
@health-color: #CD5353;
@amenity-color: @culture;
@gastronomy-icon: #0364A1;
@gastronomy-text: @gastronomy-icon;
@memorials: @culture;
@culture: #5C6272;
@public-service: @amenity-color;
@office: #4863A0;
@man-made-icon: #666666;
@advertising-grey: @man-made-icon;
@barrier-icon: #3f3f3f;
@landform-color: #d08f55;
@leisure-color: darken(@park, 10%);
@protected-area: #008000;
@aboriginal: #82643a;
@religious-icon: @culture;
@tourism: @culture;
@tree-color: #68AD70;

@placenames: #4A546E;
@placenames-light: @placenames;

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
@standard-wrap-width: 25; // 3 em
@standard-line-spacing-size: -1.5; // -0.15 em
@standard-font: @book-fonts;
@medium-font-size: 17;
@large-font-size: 19;

@highlight-font-size-z16: 14;

@private-opacity: 0.33;


// GROUP
#amenity-points {
  [feature = 'tourism_alpine_hut'][zoom >= 13],
  [feature = 'tourism_wilderness_hut'][zoom >= 13],
  [feature = 'amenity_shelter'][zoom >= 18] {
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

  [feature = 'amenity_bank'][zoom >= 19] {
    marker-file: url('symbols/amenity/bank.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_bar'][zoom >= 18],
  [feature = 'amenity_biergarten'][zoom >= 18],
  [feature = 'amenity_cafe'][zoom >= 18],
  [feature = 'amenity_fast_food'][zoom >= 18],
  [feature = 'amenity_food_court'][zoom >= 18],
  [feature = 'amenity_ice_cream'][zoom >= 18],
  [feature = 'amenity_pub'][zoom >= 18],
  [feature = 'amenity_restaurant'][zoom >= 18] {
    marker-clip: false;
    marker-fill: @gastronomy-icon;
    [feature != 'amenity_food_court'][zoom = 18] {
      marker-width: 4;
      marker-line-width: 0;
    }
    [feature = 'amenity_bar'][zoom >= 18] {
      marker-file: url('symbols/amenity/bar.svg');
    }
    [feature = 'amenity_biergarten'][zoom >= 18] {
      marker-file: url('symbols/amenity/biergarten.svg');
    }
    [feature = 'amenity_cafe'][zoom >= 18] {
      marker-file: url('symbols/amenity/cafe.svg');
    }
    [feature = 'amenity_fast_food'][zoom >= 18] {
      marker-file: url('symbols/amenity/fast_food.svg');
    }
    [feature = 'amenity_food_court'][zoom >= 18],
    [feature = 'amenity_restaurant'][zoom >= 18] {
      marker-file: url('symbols/amenity/restaurant.svg');
    }
    [feature = 'amenity_ice_cream'][zoom >= 18] {
      marker-file: url('symbols/amenity/ice_cream.svg');
    }
    [feature = 'amenity_pub'][zoom >= 18] {
      marker-file: url('symbols/amenity/pub.svg');
    }
  }

  [feature = 'amenity_internet_cafe'][zoom >= 18] {
    marker-file: url('symbols/amenity/internet_cafe.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
  }

  [feature = 'amenity_bbq'][zoom >= 18] {
    marker-file: url('symbols/amenity/bbq.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }


  [feature = 'amenity_bicycle_rental'][zoom >= 18] {
    marker-file: url('symbols/amenity/rental_bicycle.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'highway_bus_stop'] {
    [zoom >= 17][zoom < 18] {
      marker-file: url('symbols/square.svg');
      marker-fill: @transportation-icon;
      marker-width: 6;
      marker-clip: false;
    }
    [zoom >= 18] {
      marker-file: url('symbols/highway/bus_stop.svg');
      marker-fill: @transportation-icon;
      marker-clip: false;
    }
  }


  [feature = 'amenity_bus_station'][zoom >= 17] {
    marker-file: url('symbols/amenity/bus_station.svg');
    // use colors from SVG to allow for white background
    marker-clip: false;
  }

  [feature = 'amenity_taxi'][zoom >= 18] {
    marker-file: url('symbols/amenity/taxi.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'barrier_toll_booth'][zoom >= 17] {
    marker-file: url('symbols/barrier/toll_booth.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_artwork'][zoom >= 19] {
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

  [feature = 'tourism_camp_site'][zoom >= 17] {
    marker-file: url('symbols/tourism/camping.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  // Ford tagging on points - ford on lines is defined later
  [feature = 'highway_ford'][zoom >= 17] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_caravan_site'][zoom >= 17] {
    marker-file: url('symbols/tourism/caravan_park.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'amenity_car_rental'][zoom >= 18] {
    marker-file: url('symbols/amenity/rental_car.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_chalet'][zoom >= 18] {
    marker-file: url('symbols/tourism/chalet.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'amenity_cinema'][zoom >= 18] {
    marker-file: url('symbols/amenity/cinema.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_public_bath'][zoom >= 18] {
    marker-file: url('symbols/amenity/public_bath.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
  }

  [feature = 'amenity_nightclub'][zoom >= 17] {
    marker-file: url('symbols/amenity/nightclub.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
  }

  [feature = 'amenity_fire_station'][zoom >= 17] {
    marker-file: url('symbols/amenity/firestation.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_fountain'] {
    ::basin {
      [zoom = 18] {
        marker-fill: @water-color;
        marker-allow-overlap: true;
        marker-line-width: 0;
        marker-width: 10;
        marker-height: 10;
        marker-ignore-placement: true;
      }
    }
    ::nozzle {
      [zoom = 18] {
        nozzle/marker-fill: @marina-text;
        nozzle/marker-line-width: 0;
        nozzle/marker-width: 3;
        nozzle/marker-height: 3;
      }
      [zoom >= 18] {
        nozzle/marker-file: url('symbols/amenity/fountain.svg');
        nozzle/marker-fill: @marina-text;
        nozzle/marker-clip: false;
      }
    }
  }


  [feature = 'amenity_fuel'][zoom >= 19] {
    marker-file: url('symbols/amenity/fuel.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_guest_house'][zoom >= 18] {
    marker-file: url('symbols/tourism/guest_house.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_apartment'][zoom >= 18] {
    marker-file: url('symbols/tourism/apartment.svg');
    marker-fill: @accommodation-icon;
    marker-clip: false;
  }

  [feature = 'amenity_bicycle_repair_station'][zoom >= 19] {
    marker-file: url('symbols/amenity/bicycle_repair_station.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_casino'][zoom >= 18] {
    marker-file: url('symbols/amenity/casino.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
  }


  [feature = 'tourism_hostel'][zoom >= 18] {
    marker-file: url('symbols/tourism/hostel.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_hotel'][zoom >= 17] {
    marker-file: url('symbols/tourism/hotel.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_motel'][zoom >= 17] {
    marker-file: url('symbols/tourism/motel.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'tourism_information'][zoom >= 19],
  [feature = 'tourism_information']["information"='office'][zoom >= 18] {
    [information = 'audioguide'] {
      marker-file: url('symbols/tourism/audioguide.svg');
    }
    [information = 'board'] {
      marker-file: url('symbols/tourism/board.svg');
    }
    [information = 'guidepost'] {
      marker-file: url('symbols/tourism/guidepost.svg');
    }
    [information = 'office'] {
      marker-file: url('symbols/tourism/office.svg');
      marker-fill: @amenity-color;
    }
    [information = 'map'],
    [information = 'tactile_map'] {
      marker-file: url('symbols/tourism/map.svg');
    }
    [information = 'terminal'] {
      marker-file: url('symbols/tourism/terminal.svg');
    }
      marker-fill: @man-made-icon;
      marker-clip: false;
  }

  [feature = 'amenity_library'][zoom >= 17] {
    marker-file: url('symbols/amenity/library.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_courthouse'][zoom >= 17] {
    marker-file: url('symbols/amenity/courthouse.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_community_centre'][zoom >= 18] {
    marker-file: url('symbols/amenity/community_centre.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_shower'][zoom >= 19] {
    marker-file: url('symbols/amenity/shower.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_social_facility'][zoom >= 18] {
    marker-file: url('symbols/amenity/social_facility.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_townhall'][zoom >= 17] {
    marker-file: url('symbols/amenity/town_hall.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'man_made_mast']["tower:type" != 'lighting'],
  [feature = 'man_made_mast']["tower:type" = 'lighting'][zoom >= 18]   {
    [zoom >= 14][height >= 160],
    [zoom >= 15][height >= 80],
    [zoom >= 16][height >= 40],
    [zoom >= 19][height >= 20],
    [zoom >= 19] {
      marker-file: url('symbols/man_made/mast.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
      ["tower:type" = 'lighting'] {
        marker-file: url('symbols/man_made/mast_lighting.svg');
      }
      ["tower:type" = 'communication'] {
        marker-file: url('symbols/man_made/mast_communications.svg');
      }
    }
  }

  [feature = 'man_made_tower']["tower:type" = 'communication'][zoom >= 14],
  [feature = 'man_made_tower']["tower:type" = 'bell_tower'][zoom >= 14],
  [feature = 'man_made_tower']["tower:type" = 'watchtower'][zoom >= 14],
  [feature = 'man_made_tower']["tower:type" = 'monument'][zoom >= 14]{
    [zoom >= 14][height >= 160],
    [zoom >= 15][height >= 80],
    [zoom >= 16][height >= 40],
    [zoom >= 18] {
      marker-file: url('symbols/man_made/tower_generic.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
      marker-width: 16;
      [height >= 40] {
            marker-width: 20;
      }
      [height >= 80] {
            marker-width: 30;
      }
      [height >= 120] {
            marker-width: 40;
      }
      ["tower:type" = 'defensive'] {
        marker-file: url('symbols/man_made/tower_defensive.svg');
      }

      ["tower:type" = 'observation'],
      ["tower:type" = 'monument'],
      ["tower:type" = 'watchtower'] {
            marker-file: url('symbols/man_made/tower_generic.svg');

              //marker-file: url('symbols/man_made/bell_tower.svg');

        //marker-file: url('symbols/man_made/tower_observation.svg');
      }

      ["tower:type" = 'bell_tower'] {
        marker-file: url('symbols/man_made/bell_tower.svg');
      }
    }
  }

  [feature = 'man_made_communications_tower'][zoom >= 14] {
    marker-file: url('symbols/man_made/communications_tower.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'man_made_chimney'] {
    [zoom >= 16][height > 50],
    [zoom >= 18][height > 30],
    [zoom >= 18] {
      marker-file: url('symbols/man_made/chimney.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'man_made_crane'] {
    [zoom >= 14][height > 70],
    [zoom >= 18] {
      marker-file: url('symbols/man_made/crane.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'historic_city_gate'][zoom >= 16] {
    marker-file: url('symbols/historic/city_gate.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
    [zoom >= 17] {
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
   [feature = 'tourism_museum'][zoom >= 14],
   [feature = 'tourism_gallery'][zoom >= 14]{
       [feature = 'tourism_museum'] [zoom >= 15] ,
        [feature = 'tourism_gallery'][zoom >= 16]{
          text-name: "[name]";
          text-fill:  @culture;  // HIGHLIGHT TEXT: MUSEUM
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          // text-dy: 11;
          text-face-name: @bold-fonts;
          text-halo-radius: @standard-halo-radius;
          text-halo-fill: @standard-halo-fill;
          text-size: @highlight-font-size-z16;
       }
       [feature = 'tourism_museum'] [zoom >= 17],
       [feature = 'tourism_gallery'][way_pixels > 10][zoom >= 17]{
          marker-file: url('symbols/tourism/museum.svg');
          marker-fill: @culture;
          marker-clip: false;
       }
  }

    [feature = 'tourism_aquarium'][zoom >= 14] {
    marker-file: url('symbols/leisure/fishing.svg');
    marker-fill: @culture;
    marker-clip: false;
    text-name: "[name]";
    text-size: @large-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-face-name: @standard-font;
  }

  [feature = 'amenity_clinic'][zoom >= 17] {
    marker-file: url('symbols/amenity/doctors.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_hospital'][zoom >= 16] {
    marker-file: url('symbols/amenity/hospital.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_pharmacy'][zoom >= 19] {
    marker-file: url('symbols/amenity/pharmacy.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_veterinary'][zoom >= 18] {
    marker-file: url('symbols/amenity/veterinary.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_place_of_worship'][zoom >= 18] {
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

  [feature = 'man_made_storage_tank'][zoom >= 17],
  [feature = 'man_made_silo'][zoom >= 18] {
    marker-file: url('symbols/man_made/storage_tank.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'amenity_police'][zoom >= 17] {
    marker-file: url('symbols/amenity/police.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_post_office'][zoom >= 18] {
    marker-file: url('symbols/amenity/post_office.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_recycling'][recycling_type = 'centre'][zoom >= 19],
  [feature = 'amenity_recycling'][zoom >= 19] {
    marker-file: url('symbols/amenity/recycling.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_theatre'],
    [feature = 'amenity_arts_centre']{
      [zoom >= 15] [way_pixels > 500] {
        text-name: "[name]";
        text-fill: @culture;  // HIGHLIGHT TEXT: THEATRE
        text-size: @highlight-font-size-z16;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
        //text-dy: 11;
        text-face-name: @bold-fonts;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
        [zoom >= 17] {
           marker-file: url('symbols/amenity/theatre.svg');
           marker-fill: @culture;
           marker-clip: false;
           text-fill: lighten(@culture, 10);
           text-size: @standard-font-size - 3;
        }
        [zoom >= 18] {
            text-size: @medium-font-size;
        }
      }
  }


  [feature = 'amenity_toilets'] {
    [int_access = 'yes'][zoom >= 17],
    [zoom >= 18] {
      marker-file: url('symbols/amenity/toilets.svg');
      marker-fill: @amenity-color;
      marker-clip: false;
      [int_access = 'restricted'] {
        marker-opacity: @private-opacity;
      }
    }
  }

  [feature = 'amenity_drinking_water'][zoom >= 19] {
    marker-file: url('symbols/amenity/drinking_water.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_prison'][zoom >= 17] {
    marker-file: url('symbols/amenity/prison.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_nursing_home'],
  [feature = 'amenity_childcare'] {
    [zoom >= 18] {
      marker-width: 4;
      [zoom >= 18] {
        marker-width: 6;
      }
      marker-line-width: 0;
      marker-clip: false;
      marker-fill: darken(@societal_amenities, 80%);
    }
  }


  [feature = 'tourism_viewpoint'][zoom >= 17] {
    marker-file: url('symbols/tourism/viewpoint.svg');
    marker-fill: @tourism;
    marker-clip: false;
          marker-width: 11;
  }

  [feature = 'man_made_water_tower'][zoom >= 18] {
    marker-file: url('symbols/man_made/water_tower.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'historic_memorial'][memorial = null][zoom >= 18],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= 16],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= 19],
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= 19] {
    marker-file: url('symbols/historic/memorial.svg');
    [memorial = 'bust']{
      marker-file: url('symbols/historic/bust.svg');
    }
    [memorial = 'blue_plaque'],
    [memorial = 'plaque'] {
      marker-file: url('symbols/historic/plaque.svg');
    }
    [memorial = 'statue'] {
      marker-file: url('symbols/historic/statue.svg');
      marker-width: 8;
    }
    [memorial = 'stone'] {
      marker-file: url('symbols/historic/stone.svg');
    }
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'man_made_obelisk'][zoom >= 17] {
    marker-file: url('symbols/historic/obelisk.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_monument'][zoom >= 16] {
    marker-file: url('symbols/historic/monument.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_fort'][zoom >= 16] {
    marker-file: url('symbols/historic/fort.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_castle'][castle_type != 'stately'][castle_type != 'manor'][zoom >= 15],
  [feature = 'historic_castle'][castle_type = 'stately'][zoom >= 18],
  [feature = 'historic_castle'][castle_type = 'manor'][zoom >= 18],
  [feature = 'historic_manor'] [castle_type = 'palace'] [zoom >= 13] {
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

  [feature = 'historic_archaeological_site'][zoom >= 13] [zoom < 15]{
    marker-file: url('symbols/historic/archaeological_site.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_marketplace'][zoom >= 15][way_pixels > 3000],
  [feature = 'amenity_marketplace'][zoom >= 17] {
    marker-clip: false;
    marker-fill: @shop-icon;
    marker-file: url('symbols/shop/marketplace.svg');
  }

  [feature = 'shop'] [zoom >= 17] {
    [shop = 'supermarket'][zoom >= 17],
    [shop = 'department_store'][zoom >= 17] {
      marker-clip: false;
      marker-fill: @shop-icon;
    }

    [shop = 'supermarket'][zoom >= 17] {
      marker-file: url('symbols/shop/supermarket.svg');
    }

    [shop = 'art'][zoom >= 18] {
      marker-file: url('symbols/shop/art.svg');
    }

    [shop = 'bakery'][zoom >= 18] {
      marker-file: url('symbols/shop/bakery.svg');
          marker-fill: @gastronomy-icon;
    }

    [shop = 'beverages'][zoom >= 18] {
      marker-file: url('symbols/shop/beverages.svg');
    }

    [shop = 'books'][zoom >= 18] {
      marker-file: url('symbols/amenity/library.svg');
    }

    [shop = 'butcher'][zoom >= 18] {
      marker-file: url('symbols/shop/butcher.svg');
    }

    [shop = 'charity'][zoom >= 18] {
      marker-file: url('symbols/shop/charity.svg');
    }

    [shop = 'chemist'][zoom >= 18] {
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

    [shop = 'coffee'][zoom >= 17] {
      marker-file: url('symbols/amenity/cafe.svg');
          marker-fill: @gastronomy-text;
    }

    [shop = 'computer'][zoom >= 18] {
      marker-file: url('symbols/shop/computer.svg');
    }

    [shop = 'convenience'][zoom >= 18] {
      marker-file: url('symbols/shop/convenience.svg');
    }

    [shop = 'chocolate'][zoom >= 18],
    [shop = 'confectionery'][zoom >= 18],
    [shop = 'pastry'][zoom >= 18] {
      marker-file: url('symbols/shop/confectionery.svg');
    }


    [shop = 'deli'] {
      [zoom >= 17] {
          marker-fill: @gastronomy-text;
        marker-file: url('symbols/amenity/fast_food.svg');
      }
    }

    [shop = 'department_store'][zoom >= 16] {
      marker-file: url('symbols/shop/department_store.svg');
    }

    [shop = 'doityourself'],
    [shop = 'hardware'] {
      [zoom >= 18] {
        marker-file: url('symbols/shop/diy.svg');
      }
    }


    [shop = 'fishmonger'],
    [shop = 'seafood'] {
      [zoom >= 18] {
        marker-file: url('symbols/shop/seafood.svg');
      }
    }

    [shop = 'florist'][zoom >= 18] {
      marker-file: url('symbols/shop/florist.svg');
    }

    [shop = 'garden_centre'][zoom >= 18] {
      marker-file: url('symbols/shop/garden_centre.svg');
    }

    [shop = 'greengrocer'],
    [shop = 'farm'] {
      [zoom >= 18] {
        marker-file: url('symbols/shop/greengrocer.svg');
      }
    }

    [shop = 'hifi'][zoom >= 19] {
      marker-file: url('symbols/shop/hifi.svg');
    }

    [shop = 'houseware'][zoom >= 19] {
      marker-file: url('symbols/shop/houseware.svg');
    }

    [shop = 'car'][zoom >= 18] {
      marker-file: url('symbols/shop/car.svg');
    }

    [shop = 'car_parts'][zoom >= 18] {
      marker-file: url('symbols/shop/car_parts.svg');
    }

    [shop = 'car_repair'][zoom >= 18] {
      marker-file: url('symbols/shop/car_repair.svg');
    }

    [shop = 'dairy'][zoom >= 18] {
      marker-file: url('symbols/shop/dairy.svg');
    }

    [shop = 'bicycle'][zoom >= 18] {
      marker-file: url('symbols/shop/bicycle.svg');
    }

    [shop = 'pet'][zoom >= 18] {
      marker-file: url('symbols/shop/pet.svg');
    }

    [shop = 'photo'],
    [shop = 'photo_studio'],
    [shop = 'photography'] {
      [zoom >= 18] {
        marker-file: url('symbols/shop/photo.svg');
      }
    }

    [shop = 'paint'][zoom >= 19] {
      marker-file: url('symbols/shop/paint.svg');
    }

    [shop = 'shoes'][zoom >= 19] {
      marker-file: url('symbols/shop/shoes.svg');
    }

    [shop = 'electronics'][zoom >= 18] {
      marker-file: url('symbols/shop/electronics.svg');
    }

    [shop = 'alcohol'],
    [shop = 'wine'] {
      [zoom >= 18] {
        marker-file: url('symbols/shop/alcohol.svg');
      }
    }

    [shop = 'optician'][zoom >= 19] {
      marker-file: url('symbols/shop/optician.svg');
    }

    [shop = 'outdoor'][zoom >= 18] {
      marker-file: url('symbols/shop/outdoor.svg');
    }

    [shop = 'furniture'][zoom >= 18] {
      marker-file: url('symbols/shop/furniture.svg');
    }

    [shop = 'interior_decoration'][zoom >= 19] {
      marker-file: url('symbols/shop/interior_decoration.svg');
    }

    [shop = 'medical_supply'][zoom >= 19]{
      marker-file: url('symbols/shop/medical_supply.svg');
    }

    [shop = 'mobile_phone'][zoom >= 19] {
      marker-file: url('symbols/shop/mobile_phone.svg');
    }

    [shop = 'motorcycle'][zoom >= 19] {
      marker-file: url('symbols/shop/motorcycle.svg');
    }

    [shop = 'music'][zoom >= 18] {
      marker-file: url('symbols/shop/music.svg');
    }

    [shop = 'musical_instrument'][zoom >= 18] {
      marker-file: url('symbols/shop/musical_instrument.svg');
    }

    [shop = 'jewelry'],
    [shop = 'jewellery'] {
      [zoom >= 19] {
        marker-file: url('symbols/shop/jewelry.svg');
      }
    }

    [shop = 'toys'][zoom >= 19] {
      marker-file: url('symbols/shop/toys.svg');
    }

    [shop = 'travel_agency'][zoom >= 19] {
      marker-file: url('symbols/shop/travel_agency.svg');
    }

    [shop = 'sports'][zoom >= 18] {
      marker-file: url('symbols/shop/sports.svg');
    }

    [shop = 'stationery'][zoom >= 19] {
      marker-file: url('symbols/shop/stationery.svg');
    }

    [shop = 'tea'][zoom >= 18] {
      marker-file: url('symbols/shop/tea.svg');
    }

    [shop = 'ticket'][zoom >= 19] {
      marker-file: url('symbols/shop/ticket.svg');
    }

    [shop = 'trade'][zoom >= 18] {
      marker-file: url('symbols/shop/trade.svg');
    }

    [shop = 'wholesale'][zoom >= 18] {
      marker-file: url('symbols/shop/trade.svg');
    }

    [shop = 'variety_store'][zoom >= 18] {
      marker-file: url('symbols/shop/variety_store.svg');
    }

    [shop = 'video'][zoom >= 18] {
      marker-file: url('symbols/shop/video.svg');
    }

    [shop = 'video_games'][zoom >= 18] {
      marker-file: url('symbols/shop/video_games.svg');
    }
  }

  // office points
  [feature = 'office'][zoom >= 18] {
    marker-width: 6;
    marker-line-width: 0;
    marker-clip: false;
    marker-fill: @office;
  }

  [feature = 'diplomatic_embassy'][zoom >= 18] {
    marker-file: url('symbols/office/embassy.svg');
    marker-fill: @office;
    marker-clip: false;
  }

  [feature = 'diplomatic_consulate'][zoom >= 18] {
    marker-file: url('symbols/office/consulate.svg');
    marker-fill: @office;
    marker-clip: false;
  }

  [feature = 'leisure_water_park'][zoom >= 18],
  [feature = 'leisure_sports_centre'][sport = 'swimming'][zoom >= 18],
  [feature = 'leisure_swimming_area'][zoom >= 18] {
    marker-file: url('symbols/leisure/water_park.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'leisure_fitness_centre'][zoom >= 18],
  [feature = 'leisure_fitness_station'][zoom >= 18] {
    marker-file: url('symbols/leisure/fitness.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_dog_park'][zoom >= 18] {
    marker-file: url('symbols/shop/pet.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'leisure_playground'][zoom >= 18] {
    marker-file: url('symbols/leisure/playground.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_miniature_golf'][zoom >= 18] {
    marker-file: url('symbols/leisure/miniature_golf.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'leisure_golf_course'][zoom >= 15] {
    marker-file: url('symbols/leisure/golf.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
  }

  [feature = 'tourism_picnic_site'][zoom >= 17] {
    marker-file: url('symbols/tourism/picnic.svg');
    marker-fill: @leisure-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_picnic_table'][zoom >= 18] {
    marker-file: url('symbols/tourism/picnic.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }


  [feature = 'leisure_sauna'][zoom >= 18] {
     marker-file: url('symbols/leisure/sauna.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_beach_resort'][zoom >= 16] {
     marker-file: url('symbols/leisure/beach_resort.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_bowling_alley'][zoom >= 18] {
     marker-file: url('symbols/leisure/bowling_alley.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_outdoor_seating'][zoom >= 17] {
     marker-file: url('symbols/leisure/outdoor_seating.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_bird_hide'][zoom >= 18] {
     marker-file: url('symbols/leisure/bird_hide.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_amusement_arcade'][zoom >= 18] {
     marker-file: url('symbols/leisure/amusement_arcade.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_fishing'][zoom >= 18] {
     marker-file: url('symbols/leisure/fishing.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
  }

  // Slipway tagging on points - slipway on lines is defined later
  [feature = 'leisure_slipway'][zoom >= 18] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'amenity_boat_rental'][zoom >= 17] {
    marker-file: url('symbols/amenity/boat_rental.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'aeroway_helipad'][zoom >= 17] {
    marker-file: url('symbols/amenity/helipad.svg');
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_aerodrome']['int_access' = 'yes']['icao' != null]['iata' != null][zoom >= 10][zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'restricted'][zoom >= 12][zoom < 18],
  [feature = 'aeroway_aerodrome']['icao' = null][zoom >= 12][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= 12][zoom < 18] {
    [way_pixels <= 192000],
    [way_pixels = null] {
      marker-file: url('symbols/amenity/aerodrome.svg');
      marker-clip: false;
      marker-fill: @airtransport;
    }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= 14] {
    text-face-name: @book-fonts;
    text-name: "[name]";
    text-fill: @transportation-text;
    text-size: @landcover-font-size;
    text-wrap-width: @landcover-wrap-width-size;
    text-line-spacing: @landcover-line-spacing-size;
  }

  [feature = 'man_made_lighthouse'][zoom >= 15] {
    marker-file: url('symbols/man_made/lighthouse.svg');
    marker-clip: false;
    marker-fill: @man-made-icon;
  }

  [feature = 'natural_peak'][zoom >= 10] [height > 1800]{
    marker-file: url('symbols/natural/peak.svg');
    marker-fill: darken(@landform-color, 30%);
    marker-clip: false;
  }

  [feature = 'natural_volcano'][zoom >= 11] {
    marker-file: url('symbols/natural/peak.svg');
    marker-fill: #d40000;
    marker-clip: false;
  }

  [feature = 'natural_saddle'][zoom >= 15] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @landform-color;
    marker-clip: false;
  }

  [feature = 'mountain_pass'][zoom >= 13] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @transportation-icon;
    //text-size: @landcover-font-size;
    marker-clip: false;
  }

  [feature = 'natural_spring'][zoom >= 14] {
    marker-file: url('symbols/natural/spring.svg');
    marker-fill: #7abcec;
    marker-clip: false;
  }

  [feature = 'natural_cave_entrance'][zoom >= 15] {
    marker-file: url('symbols/natural/cave.svg');
    marker-clip: false;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 13][height > 20],
    [zoom >= 14][height > 10],
    [zoom >= 15][name != null],
    [zoom >= 16] {
      marker-file: url('symbols/natural/waterfall.svg');
      marker-clip: false;
      marker-fill: @water-text;
    }
  }

  [feature = 'military_bunker'][zoom >= 18] {
    marker-file: url('symbols/man_made/bunker.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'power_generator']['generator:source' = 'wind'] {
    [zoom >= 15][location != 'rooftop'][location != 'roof'],
    [zoom >= 15][location = null],
    [zoom >= 19] {
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


  [feature = 'amenity_parking'],
  [feature = 'amenity_parking_entrance'] {
    [zoom >= 14][way_pixels > 750]["parking" != 'street_side']["parking" != 'lane'],
    [zoom >= 18][feature = 'amenity_parking']["parking" != 'street_side']["parking" != 'lane'],
    [zoom >= 18] {
      [feature = 'amenity_parking'] { marker-file: url('symbols/amenity/parking_subtle.svg'); }
      [feature = 'amenity_parking']["parking" = 'street_side'],
      [feature = 'amenity_parking']["parking" = 'lane'] {
        marker-file: url('symbols/amenity/parking_subtle.svg');
      }
      [feature = 'amenity_parking_entrance']["parking"='underground'] { marker-file: url('symbols/amenity/parking_entrance_underground.svg'); }
      [feature = 'amenity_parking_entrance']["parking"='multi-storey'] { marker-file: url('symbols/amenity/parking_entrance_multistorey.svg'); }
      marker-clip: false;
      marker-fill: @transportation-icon;
      [int_access = 'restricted'] { marker-opacity: @private-opacity; }
    }
  }
}



// GROUP
#amenity-low-priority {
  [feature = 'man_made_cross'][zoom >= 16],
  [feature = 'historic_wayside_cross'][zoom >= 16] {
    marker-file: url('symbols/man_made/cross.svg');
    marker-fill: @religious-icon;
    marker-clip: false;
  }

  [feature = 'historic_wayside_shrine'][zoom >= 18] {
    marker-file: url('symbols/historic/shrine.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'railway_level_crossing'][zoom >= 17]::railway,
  [feature = 'railway_crossing'][zoom >= 17]::railway{
    marker-file: url('symbols/barrier/level_crossing.svg');
    marker-fill: #4d4d4d;
    marker-clip: false;
    [zoom >= 17] {
      marker-file: url('symbols/barrier/level_crossing2.svg');
    }
  }

  [feature = 'barrier_gate']::barrier {
    [zoom >= 17] {
      marker-file: url('symbols/barrier/gate.svg');
      marker-clip: false;
    }
  }

  [feature = 'barrier_lift_gate'][zoom >= 17]::barrier,
  [feature = 'barrier_swing_gate'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/lift_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_cattle_grid'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/cattle_grid.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_stile'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/stile.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_motorcycle_barrier'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/motorcycle_barrier.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_cycle_barrier'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/cycle_barrier.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_full-height_turnstile'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/full-height_turnstile.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_kissing_gate'][zoom >= 17]::barrier {
    marker-file: url('symbols/barrier/kissing_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_bollard'],
  [feature = 'barrier_block'],
  [feature = 'barrier_log'],
  [feature = 'barrier_turnstile'] {
    [zoom >= 17] {
      marker-width: 3;
      marker-line-width: 0;
      marker-fill: #7d7c7c;

      [zoom >= 18] {
        marker-width: 4;
      }
    }
  }

  [feature = 'amenity_bench'][zoom >= 19]::amenity {
    marker-file: url('symbols/amenity/bench.svg');
    marker-fill: @man-made-icon;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }
}





/* Note that these layers are also used in water.mss */
// GROUP
#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {

  [feature = 'place_island'][zoom >= 4][way_pixels > 3000],
  [feature = 'place_island'][zoom >= 16],
  [feature = 'place_islet'][zoom >= 11][way_pixels > 3000],
  [feature = 'place_islet'][zoom >= 17] {
    text-name: "[name]";
    text-fill: @placenames;
    text-size: @landcover-font-size;
    text-wrap-width: @landcover-wrap-width-size;
    text-line-spacing: @landcover-line-spacing-size;
    [way_pixels > 12000] {
      text-size: @landcover-font-size-big;
      text-wrap-width: @landcover-wrap-width-size-big;
      text-line-spacing: @landcover-line-spacing-size-big;
    }
    [way_pixels > 48000] {
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
    [zoom >= 17] {
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
    [zoom >= 17] {
        text-size: 12;
      }
  }

  [feature = 'amenity_pub'][zoom >= 18],
  [feature = 'amenity_restaurant'][zoom >= 18],
  [feature = 'amenity_food_court'][zoom >= 18],
  [feature = 'amenity_cafe'][zoom >= 18],
  [feature = 'amenity_fast_food'][zoom >= 18],
  [feature = 'amenity_biergarten'][zoom >= 18],
  [feature = 'amenity_bar'][zoom >= 18],
  [feature = 'amenity_ice_cream'][zoom >= 18] {
    text-name: "[name]";
    text-fill: @gastronomy-text;
    text-size: 12; //@standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    // text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [feature = 'amenity_bar'] {
      // text-dy: 13;
    }
  }

  [feature = 'amenity_library'],
  [feature = 'amenity_cinema'],
  [feature = 'amenity_community_centre'],
  [feature = 'amenity_nightclub'] {
    [zoom >= 18] {
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
    [zoom >= 17] {
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

   [feature = 'amenity_nightclub'] [zoom >= 19],
  [feature = 'amenity_car_rental'][zoom >= 19],
  [feature = 'amenity_bicycle_rental'][zoom >= 18],
  [feature = 'amenity_boat_rental'][zoom >= 18],
  [feature = 'barrier_toll_booth'][zoom >= 18],
  [feature = 'leisure_slipway'][zoom >= 18] {
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

  [feature = 'amenity_courthouse'][zoom >= 17],
  [feature = 'amenity_townhall'][zoom >= 17],
  [feature = 'amenity_police'][zoom >= 17],
  [feature = 'amenity_social_facility'][zoom >= 19],
  [feature = 'amenity_fire_station'][zoom >= 17],
  [feature = 'amenity_post_office'][zoom >= 18],
  [feature = 'amenity_prison'][zoom >= 18],
  [feature = 'amenity_bank'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @public-service;
    // text-dy: 11;
    [feature = 'amenity_courthouse'] { text-dy: 1; }
    [feature = 'amenity_townhall'] { text-dy: 3; }
    [feature = 'amenity_prison'] { text-dy: 1; }
    [feature = 'amenity_bank'] { text-dy: 1; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_internet_cafe'][zoom >= 18],
  [feature = 'leisure_bowling_alley'][zoom >= 18],
  [feature = 'leisure_beach_resort'][zoom >= 17],
  [feature = 'leisure_bird_hide'][zoom >= 18],
  [feature = 'leisure_amusement_arcade'][zoom >= 19],
  [feature = 'leisure_outdoor_seating'][zoom >= 19],
  [feature = 'leisure_fishing'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    [feature = 'leisure_outdoor_seating'],
    [feature = 'leisure_fishing'],
    [feature = 'leisure_bowling_alley'],
    [feature = 'leisure_bird_hide'],
    [feature = 'leisure_amusement_arcade'],
    [feature = 'leisure_beach_resort'] {
      text-fill: @amenity-color;
    }
    // text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_bbq'][zoom >= 19],
  [feature = 'amenity_bicycle_repair_station'][zoom >= 19],
  [feature = 'amenity_drinking_water'][zoom >= 17],
  [feature = 'tourism_picnic_site'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    [feature = 'tourism_picnic_site'] {
      text-fill: @amenity-color;
    }
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [int_access = 'restricted'] {
      text-opacity: @private-opacity;
      text-halo-radius: 0;
    }
  }

  // religious building name
  [feature = 'amenity_place_of_worship'][zoom >= 15][way_pixels > 800]{
    text-name: "[name]";
          text-fill:  @culture;  // HIGHLIGHT TEXT: RELIGIOUS
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          // text-dy: 11;
          text-face-name: @bold-fonts;
          text-halo-radius: @standard-halo-radius;
          text-halo-fill: @standard-halo-fill;
          text-size: @highlight-font-size-z16 - 1;
  }

  [feature = 'amenity_marketplace'][zoom >= 16][way_pixels > 3000],
  [feature = 'amenity_marketplace'][zoom >= 19] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    //text-dy: 12;
    text-fill: @shop-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: rgba(255, 255, 255, 0.6);
  }

  [feature = 'natural_peak']  [zoom >= 13],
  [feature = 'natural_volcano'][zoom >= 13],
  [feature = 'natural_saddle'][zoom >= 15],
  [feature = 'mountain_pass'][zoom >= 15],
  [feature = 'tourism_viewpoint'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@landform-color, 30%);
    [zoom >= 13]{
        text-size: @small-font-size;
        }

    [feature = 'natural_volcano'] { text-fill: #767676; }
    text-dy: 7;
    [feature = 'tourism_viewpoint'] { text-dy: 11; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'natural_cape'][zoom >= 14] {
    text-name: "[name]";
    text-fill: @landform-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'tourism_information'][information != 'board'][zoom >= 19],
  [feature = 'tourism_information'][information = 'office'][zoom >= 19] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    [information = 'office'] { text-fill: @amenity-color; }
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    // text-dy: 11;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 13][height > 20],
    [zoom >= 14][height > 10],
    [zoom >= 15][name != null],
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @water-text;
      text-dy: 10;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'power_generator']['generator:source' = 'wind'][location != 'rooftop'][location != 'roof'][zoom >= 19],
  [feature = 'power_generator']['generator:source' = 'wind'][location = null][zoom >= 19],
  [feature = 'power_generator']['generator:source' = 'wind'][zoom >= 19],
  [feature = 'historic_city_gate'][zoom >= 17],
  [feature = 'natural_cave_entrance'][zoom >= 15],
  [feature = 'man_made_mast'][zoom >= 19],
  [feature = 'man_made_tower'][zoom >= 17],
  [feature = 'man_made_storage_tank'][zoom >= 19],
  [feature = 'man_made_silo'][zoom >= 19],
  [feature = 'man_made_communications_tower'][zoom >= 17],
  [feature = 'man_made_telescope']["telescope:type" != 'optical']["telescope:type" != null][zoom >= 17],
  [feature = 'man_made_telescope'][zoom >= 17],
  [feature = 'man_made_water_tower'][zoom >= 17],
  [feature = 'man_made_chimney'][zoom >= 17],
  [feature = 'man_made_crane'][zoom >= 17],
  [feature = 'man_made_waste_water_plant'][zoom >= 17] {
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

  [feature = 'tourism_artwork'][zoom >= 19],
  [feature = 'historic_memorial'][memorial = null][zoom >= 18],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= 17],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= 19],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= 18],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= 19],
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= 19],
  [feature = 'man_made_obelisk'][zoom >= 17],
  [feature = 'historic_monument'][zoom >= 17],
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

  [feature = 'historic_castle'] [zoom >= 15]  {
    [way_pixels > 5000] [zoom >= 15]  {
    text-name: "[name]";
    text-size: @highlight-font-size-z16;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;  // HIGHLIGHT TEXT: PALACE
    // text-dy: 11;
    text-face-name: @bold-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }
      [zoom >= 16] {
        text-name: "[name]";
    text-size: @highlight-font-size-z16;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;  // HIGHLIGHT TEXT: PALACE
    text-dy: 11;
    text-face-name: @bold-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'military_bunker'][zoom >= 18] {
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
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 18] {
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
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 18] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
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
    [zoom >= 14][way_pixels > 3000],
    [zoom >= 18] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 13;
      text-fill: @leisure-color;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [int_access = 'restricted'] {
        text-fill: darken(@park, 50%);
      }
    }
  }

  [feature = 'landuse_military'],
  [feature = 'natural_wood'],
  [feature = 'landuse_forest'],
  [feature = 'boundary_national_park'],
  [feature = 'leisure_nature_reserve'],
  [feature = 'boundary_aboriginal_lands'],
  [feature = 'boundary_protected_area'] {
    [zoom >= 8][way_pixels > 3000][is_building = 'no'],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size+2;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'landuse_military'] {
        text-fill: darken(@military, 40%);
      }
      [feature = 'boundary_aboriginal_lands'] {
        text-fill: @aboriginal;
      }
      [feature = 'natural_wood'],
      [feature = 'landuse_forest'] {
        text-fill: #21580D; //@forest-text;
      }
      [feature = 'boundary_national_park'],
      [feature = 'leisure_nature_reserve'],
      [feature = 'boundary_protected_area'] {
        text-fill: #21580D;
      }
    }
  }

  [feature = 'military_danger_area'][is_building = 'no'] {
    [zoom >= 9][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
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
    [zoom >= 13][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@garages, 50%);
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
    [zoom >= 10][way_pixels > 3000][is_building = 'no'],
    [zoom >= 19][is_building = 'no'],
    [zoom >= 10][way_pixels > 3000] {
      text-face-name: @landcover-face-name;
      text-name: "[name]";  // HIGHLIGHT TEXT: INDUSTRIAL
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-fill: darken(@industrial, 25%);
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
  [feature = 'landuse_cemetery'],
  [feature = 'amenity_grave_yard'],
  [feature = 'landuse_residential'],
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
    [zoom >= 14][way_pixels > 3000][is_building = 'no'],
    [zoom >= 10][way_pixels > 3000][is_building = 'yes'],
    [zoom >= 19][is_building = 'no'] {
      text-fill: @culture;
      text-face-name: @bold-fonts;
      text-name: "[name]";  // HIGHLIGHT TEXT: LAND medium size
      text-size: @highlight-font-size-z16 - 2;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;

      [way_pixels > 7000] {   // HIGHLIGHT TEXT: Land large size
            //text-fill: blue;

        text-size: @highlight-font-size-z16 ;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }

      [way_pixels > 30000] {   // HIGHLIGHT TEXT: VERY LARGE SIZE
            //text-fill: purple;

        text-size: @highlight-font-size-z16 + 6 ;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }

      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;

      [feature = 'natural_reef'],
      [feature = 'natural_wetland'],
      [feature = 'natural_mud'],
      [feature = 'landuse_salt_pond'] {
        text-fill: @wetland-text;
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
        text-fill: darken(@orchard, 50%);
      }

      [feature = 'landuse_cemetery'],
      [feature = 'amenity_grave_yard'] {
        text-fill: darken(@cemetery, 50%);
        text-halo-radius: @standard-halo-radius * 1.5; /* extra halo needed to overpower the cemetery polygon pattern */
      }
      [feature = 'landuse_residential'] {
        text-fill: darken(@residential, 50%);
      }
      [feature = 'landuse_meadow'],
      [feature = 'natural_grassland'],
      [feature = 'landuse_grass'] {
        text-fill: darken(@grass, 50%);
      }
      [feature = 'landuse_allotments'] {
        text-fill: darken(@allotments, 50%);
      }
      [feature = 'landuse_farmyard'] {
        text-fill: darken(@farmyard, 50%);
      }
      [feature = 'landuse_farm'],
      [feature = 'landuse_farmland'],
      [feature = 'landuse_greenhouse_horticulture'] {
        text-fill: darken(@farmland, 50%);
      }
      [feature = 'shop'][shop = 'mall'],
      [feature = 'landuse_retail'] {
        text-fill: darken(@retail, 50%);
      }

      [feature = 'landuse_commercial'] {
        text-fill: darken(@commercial, 60%);
      }

      [feature = 'tourism_caravan_site'] {
        text-fill: darken(@campsite, 50%);
        // text-dy: 15;
      }
      [feature = 'tourism_theme_park'],
      [feature = 'tourism_zoo'] {
        text-fill: @tourism;
        text-face-name: @bold-fonts; /*rendered bold to improve visibility since theme parks tend to have crowded backgrounds*/
      }
      [feature = 'amenity_kindergarten'],
      [feature = 'amenity_school'],
      [feature = 'amenity_college'],
      [feature = 'amenity_university'] {
        text-fill: darken(@societal_amenities, 80%);
      }
      //[feature = 'landuse_religious'] {
      //  text-fill: orange; // darken(@place_of_worship, 50%);
      //}
      [feature = 'natural_heath'] {
        text-fill: darken(@heath, 40%);
      }
      [feature = 'natural_scrub'] {
        text-fill: darken(@scrub, 60%);
      }
      [feature = 'natural_beach'],
      [feature = 'natural_shoal'] {
        text-fill: darken(@beach, 60%);
      }
      [feature = 'leisure_sports_centre'],
      [feature = 'leisure_stadium'] {
        text-fill: darken(@stadium, 70%);
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
        text-fill: darken(@track, 40%);
      }
      [feature = 'leisure_ice_rink'],
      [feature = 'leisure_pitch'] {
        text-fill: darken(@pitch, 40%);
      }
    }
  }

  [feature = 'natural_spring'][zoom >= 16] {
    text-name: "[name]";
    text-size: 10;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @water-text;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-dy: 7;
  }


  [feature = 'tourism_alpine_hut'][zoom >= 14],
  [feature = 'amenity_shelter'][zoom >= 18],
  [feature = 'leisure_picnic_table'][zoom >= 18],
  [feature = 'tourism_hotel'][zoom >= 17],
  [feature = 'tourism_motel'][zoom >= 18],
  [feature = 'tourism_hostel'][zoom >= 18],
  [feature = 'tourism_chalet'][zoom >= 17],
  [feature = 'tourism_guest_house'][zoom >= 17],
  [feature = 'tourism_apartment'][zoom >= 18],
  [feature = 'tourism_wilderness_hut'][zoom >= 14],
  [feature = 'tourism_camp_site'][zoom >= 17],
  [feature = 'tourism_caravan_site'][zoom >= 17], {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @accommodation-text;
    // text-dy: 11;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }


  [feature = 'highway_bus_stop'],
  [feature = 'amenity_charging_station'],
  [feature = 'amenity_fuel'],
  [feature = 'amenity_bus_station'] {
    [zoom >= 17] {
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

  [feature = 'leisure_marina'][zoom >= 15] {
    [zoom >= 10][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
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

  [feature = 'amenity_fountain'][zoom >= 18] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: blue;
    // text-dy: 4;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    [zoom >= 18] {
      // text-dy: 10;
    }
  }

  [feature = 'man_made_lighthouse'][zoom >= 15],
  [feature = 'man_made_windmill'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    text-dy: 10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'amenity_hospital'][zoom >= 15] {
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
    [zoom >= 18] {
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
    [zoom >= 18] {
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

  [feature = 'shop'][shop != 'mall'] {
    [way_pixels > 3000][zoom >= 17],
    [zoom >= 19] {
      text-name: "[name]";  //HIGHIGHT TEXT: SHOP
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-fill: @shop-text;
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
      [office = 'government'],
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
    [zoom >= 17] {
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

  [feature = 'shop_supermarket'],
  [feature = 'shop_department_store'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: rgba(255, 255, 255, 0.6);
    }
  }

  [feature = 'aeroway_gate'][zoom >= 17] {
    text-name: "[ref]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: black;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'power_plant'][is_building = 'no'][zoom >= 10],
  [feature = 'power_generator'][is_building = 'no']["generator:source" != 'wind'][zoom >= 10],
  [feature = 'power_substation'][is_building = 'no'][zoom >= 13]{
    [way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
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
    [zoom >= 8][way_pixels > 3000][is_building = 'no'],
    [zoom >= 17][is_building = 'no'] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [feature = 'natural_scree'],
      [feature = 'natural_shingle'],
      [feature = 'natural_bare_rock'] {
        text-fill: darken(@bare_ground, 50%);
      }
      [feature = 'natural_sand'] {
        text-fill: darken(@sand, 50%);
      }
    }
  }

  [feature = 'aeroway_apron'][is_building = 'no'] {
    [zoom >= 10][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
        text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@apron, 60%);
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'highway_services'][is_building = 'no'],
  [feature = 'highway_rest_area'][is_building = 'no'] {
    [zoom >= 10][way_pixels > 3000],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
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
    [zoom >= 10][way_pixels > 750],
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > 12000] {
        text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > 48000] {
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

  [feature = 'aeroway_helipad'][zoom >= 17] {
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

  [feature = 'aeroway_aerodrome']['int_access' = 'yes']['icao' != null]['iata' != null][zoom >= 11][zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'restricted'][zoom >= 13][zoom < 18],
  [feature = 'aeroway_aerodrome']['icao' = null][zoom >= 13][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= 13][zoom < 18] {
    [way_pixels <= 192000],
    [way_pixels = null] {
      text-name: "[name]";
      text-size: @small-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: black;
      text-dy: 10;
      text-face-name: @oblique-fonts;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;

     [zoom >= 11]{
           text-size: @small-font-size;
     }
     [zoom >= 14]{
           text-size: @standard-font-size;
     }
    }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= 13] {
    [zoom >= 13] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @amenity-color;
    // text-dy: 10;
    text-face-name: @oblique-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: white;
    }
    [zoom >= 17] {
       text-size: @medium-font-size;
      }
  }


  [feature = 'natural_tree'][zoom >= 18] {
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

  [feature = 'amenity_casino'][zoom >= 17] {
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

  [feature = 'tourism_attraction'][zoom >= 17] [way_pixels > 5] {
    text-name: "[name]";
          text-fill:  @culture;  // HIGHLIGHT TEXT: ATTRACTION
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          // text-dy: 11;
          text-face-name: @bold-fonts;
          text-halo-radius: @standard-halo-radius;
          text-halo-fill: @standard-halo-fill;
          text-size: @highlight-font-size-z16;
  }

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance']["parking"='underground'] {
    [zoom >= 18] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @transportation-text;
      // text-dy: 9;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
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
    marker-fill: @transportation-icon;
  }
  // Slipway tagging on ways
  [feature = 'leisure_slipway'][zoom >= 17] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: @transportation-icon;
  }

  [feature = 'leisure_track'] {
    [zoom >= 16] {
      [zoom >= 17] {
        bridgecasing/line-color: saturate(darken(@pitch, 30%), 20%);
        bridgecasing/line-join: round;
        bridgecasing/line-width: 1.25;
        [zoom >= 18] { bridgecasing/line-width: 2.5; }
        [zoom >= 19] { bridgecasing/line-width: 5; }
      }
      line-color: @pitch;
      line-join: round;
      line-cap: round;
      line-width: 1;
      [zoom >= 18] { line-width: 2; }
      [zoom >= 19] { line-width: 4; }
    }
  }

  [feature = 'attraction_water_slide'] {
    [zoom >= 17] {
      [zoom >= 17] {
        bridgecasing/line-color: blue;
        bridgecasing/line-join: round;
        bridgecasing/line-width: 1.25;
        [zoom >= 18] { bridgecasing/line-width: 2.5; }
        [zoom >= 19] { bridgecasing/line-width: 5; }
      }
      line-color: @pitch;
      line-join: round;
      line-cap: round;
      line-width: 1;
      [zoom >= 18] { line-width: 2; }
      [zoom >= 19] { line-width: 4; }
    }
  }
}


// GROUP
#text-line {
  [feature = 'leisure_track'],
  [feature = 'attraction_water_slide'] {
    [zoom >= 19] {
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

  [feature = 'leisure_slipway'][zoom >= 17] {
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
#trees [zoom >= 18] {
  ::canopy {
    opacity: 0.6;
    [natural = 'tree_row'] {
      line-color: darken(@forest,20%);
      line-cap: round;
      line-width: 2.5;
      [zoom >= 17] {
        line-width: 5;
      }
      [zoom >= 18] {
        line-width: 10;
      }
      [zoom >= 19] {
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
  }
}
