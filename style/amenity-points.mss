// Markers and Text labels for amenities

// Area sizes
@small-building: 10;
@med-building:   200;
@large-building: 900;
@small-area:    3000;
@large-area:   12000;
@huge-area:    51000;

// Zoom cutoffs for items
@local-item-zoom: 19;
@minor-item-zoom: 16;
@city-item-zoom: 15;
@county-item-zoom: 14;
@major-item-zoom: 13;
@regional-item-zoom: 10;

// Markers
@small-marker: 10;
@medium-marker: 12;
@large-marker: 16;

@marker-op: .6;

// Font Sizes
@small-font-size: 10;
@standard-font-size: 14;
@medium-font-size: 16;
@large-font-size: 19;

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

@standard-wrap-width: 32; // 3 em
@standard-line-spacing-size: -4; // -0.15 em
@standard-font: @book-fonts;

@private-opacity: 0.3;

@standard-halo-radius: .7; //.5;
@standard-halo-fill: rgba(255, 255, 255, 100);
@dark-halo-fill: rgba(110, 110, 134, 128);
@water-text: lighten(@water-color, 40);
@water-halo-fill: @water-color;

// Text Color
@highlight: #194D75; //#715D92; //#55228D; //#551A8F; //#620FB4; //#6A5F8F;
@main-text: #515A78;
@gastronomy-icon: #5346A1;
@gastronomy-text: #5346A1; //#5F55A5; //#4D457F;
@placenames: white; //#0C2984; //#1E357B; //#25366B;
@placenames_lowz: white;
@placenames-light: @placenames;
@park-text: #144B17;
@forest-text: #E3EADD;

@culture: @main-text;
@amenity-color: #1E357B;
@memorials: @main-text;
@religious-icon: @main-text;
@health-color: #B75F5F;
@leisure-color: @main-text;
@shop-text: #4C7686;
@accommodation-icon: @main-text;
@accommodation-text: @main-text;
@public-service: @main-text;

@marina-text: #E2E4E7; // also swimming_pool
@wetland-text: darken(#4aa5fa, 25%);
@transportation-icon: @transit;
@transportation-text: darken(@transit, 10);
@shop-icon: #4C7686;

@airtransport: #FDC243;
@hiking: #E5BD4E;
@nature-text: @hiking;
@bus_stop: #96A4D5;
@office: #4863A0;
@man-made-icon: #7F8491; //#8990A4;
@advertising-grey: @man-made-icon;
@barrier-icon: #807CBE;
@landform-color: white; //#FFED97;
@protected-area: #008000;
@aboriginal: #82643a;
@tree-color: #82A285;
@hotspring: @highlight;
@market: #2E809B;
@hotel: #2E809B;
@beach-text: #3E728F; //#1D6FA1;

@waterfall: #76B0DE;
@waterfall-text: #607397;
@fountain-color: #5682BF;
@aquarium: @fountain-color;

// GROUP - AMENITY POINTS
#amenity-points {
  [feature = 'tourism_attraction'][zoom >= @county-item-zoom] [way_pixels > @med-building],
  [feature = 'tourism_attraction'][zoom >= 11]
      {
      // Attraction
        text-name: "[name]";
        text-fill: @highlight;
        text-size: @standard-font-size ;
        text-wrap-width: 30;
        //text-line-spacing: @standard-line-spacing-size;
        text-dy: 11;
        text-face-name: @bold-fonts;
        text-allow-overlap: true;
        text-halo-radius: .5;
        text-halo-fill: #C5B5D8;
        [zoom >= 16] {
          //text-size: @medium-font-size;
        }
  }

  [feature = 'amenity_ferry_terminal'][zoom >= 15],
  [feature = 'tourism_gallery'][way_pixels > @med-building][zoom >= 17],
  //[feature = 'tourism_museum'][way_pixels > 100][zoom >= 15],
  [feature = 'amenity_conference_centre'][zoom >= 16]  {
      // Ferris Wheel
      [attraction = 'big_wheel'] {
        marker-fill: white;
        marker-width: 15;
        marker-clip: true;
        marker-file: url('symbols/tourism/viewpoint.svg');

        text-name: "[name]";
        text-fill: white;  // HIGHLIGHT TEXT
        text-size: @medium-font-size;
        text-wrap-width: @standard-wrap-width;
        //text-line-spacing: @standard-line-spacing-size;
        text-dy: 9;
        text-face-name: @bold-fonts;
        text-allow-overlap: true;
        [zoom >= 16] {
          text-size: @medium-font-size;
        }
      }

      // Attraction
     [zoom >= 15] {
        //text-min-padding: 10;
        //text-avoid-edges: true;
        //text-clip: false;
        text-name: "[name]";
        text-fill: @highlight;
        text-size: @medium-font-size;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
        text-dy: 9;
        text-face-name: @bold-fonts;
        text-allow-overlap: false;
        text-halo-radius: .5;
        text-halo-fill: #C5B5D8;

        [feature = 'amenity_ferry_terminal'] {
           text-allow-overlap: false;
           text-fill: @beach-text; //@placenames; //@water-color; //#5C553C;
           text-halo-radius: 1;
           text-halo-fill: #C9DCE8;
           text-size: @medium-font-size;
           marker-opacity: 1;
          marker-width: 10;
          marker-file: url('symbols/amenity/ferry.svg');
          marker-fill: @highlight;
          marker-clip: false;
        }

        [feature = 'building_train_station']{
           text-allow-overlap: false;
        }

        [feature = 'amenity_cafe']{
           text-size: @small-font-size;
        }

        [feature = 'amenity_conference_centre'] {
        text-wrap-width: 52;
        }
     }
  }

  // Museum marker
  [feature = 'tourism_museum'][zoom >= 15],
  [feature = 'tourism_gallery'][zoom >= @minor-item-zoom]{
      marker-opacity: 1;
      marker-width: 12;
      marker-file: url('symbols/tourism/museum.svg');
      marker-fill: @highlight;
      marker-clip: false;

      [feature = 'tourism_museum'][zoom >= 16] {
        text-name: "[name]";
        text-fill: @highlight;  // HIGHLIGHT TEXT
        text-size: @standard-font-size;
        text-wrap-width: @standard-wrap-width;
        //text-line-spacing: @standard-line-spacing-size;
        text-dy: 8;
        text-face-name: @bold-fonts;
        text-allow-overlap: true;
      }
  }

  [feature = 'tourism_viewpoint'][zoom >= 12]{
      marker-opacity: 1;
      marker-width: 12;
      marker-file: url('symbols/tourism/viewpoint.svg');
      marker-fill: @highlight;
      marker-clip: false;
      }

  [feature = 'amenity_marketplace'][zoom >= 16][way_pixels > 200],
  [feature = 'amenity_marketplace'][zoom >= @local-item-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    //text-dy: 12;
    text-fill:  @shop-text;
    text-face-name: @standard-font;
  }

  [feature = 'place_square'][zoom >= 16][way_pixels>800] {
    text-fill: @highlight;
    text-name: "[name]";
    text-size: @standard-font-size;
    text-face-name: @oblique-fonts;
    
    //text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
  }


  [feature = 'man_made_tower']["tower:type" = 'communication'][zoom >= @county-item-zoom],
  [feature = 'man_made_communications_tower'][zoom >= @county-item-zoom],
  [feature = 'man_made_tower']["tower:type" = 'bell_tower'][zoom >= @county-item-zoom],
  [feature = 'man_made_tower']["tower:type" = 'watchtower'][zoom >= @county-item-zoom],
  [feature = 'man_made_tower']["tower:type" = 'observation'][zoom >= @county-item-zoom],
  [feature = 'man_made_tower']["tower:type" = 'clock'][zoom >= @county-item-zoom],
  [feature = 'man_made_tower']["tower:type" = 'monument'][zoom >= @county-item-zoom]
  {
    [zoom >= @county-item-zoom][height >= 160],
    [zoom >= @city-item-zoom][height >= 60],
    [zoom >= @minor-item-zoom][height >= 40],
    [zoom >= @minor-item-zoom] {
      marker-file: url('symbols/man_made/tower_lattice.svg');
      marker-fill: @man-made-icon;
      marker-clip: true;
      marker-width: 5; //16;

      ["tower:type" = 'communication'] {
         marker-width: 3 + [height] * 0.05 ;
      }

      ["tower:type" != 'communication'] {
         marker-width: [height] * 0.5 ;
      }

      ["tower:type" = 'defensive'] {
        marker-file: url('symbols/man_made/tower_defensive.svg');
      }

      ["tower:type" = 'monument'],
      ["tower:type" = 'watchtower'],
      ["tower:type" = 'clock']{
            marker-file: url('symbols/man_made/tower_generic.svg');
      }

      ["tower:type" = 'observation']  {
      marker-file: url('symbols/man_made/tower_generic.svg');
      marker-width: 12;
      [height >= 80] {
        marker-file: url('symbols/man_made/tower_lattice.svg');
        }
      }

      ["tower:type" = 'bell_tower'] {
        marker-height: [height] * 0.8 ;
        marker-width: [height] * 0.3 ;
        marker-file: url('symbols/man_made/bell_tower.svg');
      }
    }
  }

  //[feature = 'amenity_bar'][zoom >= @city-item-zoom][zoom <= @minor-item-zoom],
  [feature = 'amenity_biergarten'][zoom >= @minor-item-zoom] [zoom <= @minor-item-zoom],
  [feature = 'amenity_cafe'][zoom >= @minor-item-zoom] [zoom <= 18],
  //[feature = 'amenity_fast_food'][zoom >= @city-item-zoom] [zoom <= 18],
  [feature = 'amenity_internet_cafe'][zoom >= @city-item-zoom] [zoom <= @minor-item-zoom],
  //[feature = 'amenity_ice_cream'][zoom >= @city-item-zoom][zoom <= @minor-item-zoom],
  [feature = 'amenity_pub'][zoom >= @minor-item-zoom] [zoom <= @minor-item-zoom],
  //[feature = 'amenity_nightclub'][zoom >= @city-item-zoom] [zoom <= @minor-item-zoom] ,
  [feature = 'amenity_restaurant'][zoom >= @minor-item-zoom] [zoom <= 18] {
     [zoom >= 14] [zoom < 18] {
          marker-opacity: @marker-op ;
          marker-width: @small-marker;
          marker-clip: true;
          marker-allow-overlap: true;
          marker-fill: @gastronomy-icon;
          marker-file: url('symbols/circle.svg');

          [zoom <= 17] {
             marker-opacity: 1; //@marker-op ;
          }
          [zoom <= 16] {
             marker-opacity: 1; //@marker-op - .3 ;
          }
          [zoom <= 15] {
             marker-opacity: .3; //@marker-op - .3 ;
          }

          [feature = 'amenity_bar'] {
            marker-file: url('symbols/amenity/bar.svg');
            marker-width: @small-marker - 1;
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
          [feature = 'amenity_restaurant']{
            marker-file: url('symbols/amenity/restaurant.svg');
          }
          [feature = 'amenity_fast_food']{
            marker-file: url('symbols/amenity/fast_food.svg');
          }
          [feature = 'amenity_ice_cream'] {
            marker-file: url('symbols/amenity/ice_cream.svg');
          }
          [feature = 'amenity_pub'] {
            marker-file: url('symbols/amenity/pub.svg');
            marker-width: @small-marker - 1;
          }
     }
  }

  [feature = 'amenity_bicycle_rental'][zoom >= 21] {
    marker-file: url('symbols/amenity/rental_bicycle.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'highway_bus_stop'][zoom >= 21] {
    [zoom >= @minor-item-zoom] {
      marker-opacity: .6;
      marker-allow-overlap: true;
      marker-file: url('symbols/circle.svg');
      marker-fill: @bus_stop;
      marker-width: 5;
      marker-clip: false;
    }
    [zoom >= @minor-item-zoom] {
    marker-fill: @bus_stop;
          marker-width: 5;
    }
  }

  [feature = 'amenity_bus_station'][zoom >= 21] {     // @city-item-zoom] {
    marker-file: url('symbols/amenity/bus_station.svg');
    // use colors from SVG to allow for white background
    marker-clip: false;
    marker-height: @large-marker;
  }

  [feature = 'barrier_toll_booth'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/barrier/toll_booth.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  /*
  [feature = 'tourism_artwork'][zoom >= 21] {
    marker-opacity: @marker-op;
    marker-width: @small-marker;
    [artwork_type != 'statue'] {
      marker-file: url('symbols/tourism/artwork.svg');
    }
    [artwork_type = 'statue'] {
      marker-file: url('symbols/historic/statue.svg');
      marker-opacity: .6;
      marker-width: @medium-marker - 3;
    }
    [artwork_type = 'bust'] {
      marker-file: url('symbols/historic/bust.svg');
    }
    marker-fill: @memorials;
  }  */

  //  town hall, apartments
  //[feature = 'building_apartments'][zoom >= 17] [way_pixels > 500],
  //[feature = 'building_apartments'][zoom >= 17] ,
  [feature = 'amenity_townhall'][zoom >= 16] [way_pixels > 300]{
          text-name: "[name]";
          text-min-distance: 40;
          text-allow-overlap: false;
          text-fill: @culture;
          text-size: @small-font-size ;
          text-face-name: @standard-font;
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          [way_pixels > 400] {text-size: @standard-font-size;}
          // text-dy: 11;
  }

  [feature = 'tourism_aquarium'][zoom >= @county-item-zoom] {
    marker-file: url('symbols/leisure/fishing.svg');
    marker-fill: white;
    marker-clip: false;
    marker-height: @medium-marker - 2;
    [zoom >= 16] {
      text-name: "[name]";
      text-size: @standard-font-size ;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @beach-text; //@placenames; //@water-color; //#5C553C;
      text-halo-radius: 1;
      text-halo-fill: #C9DCE8; //#F0ECDB; //@standard-halo-fill;
      text-face-name: @bold-fonts;
      text-dy: 15;
      }
  }

  [feature = 'amenity_place_of_worship'][zoom >= 17] {
    marker-file: url('symbols/amenity/place_of_worship.svg');
    marker-fill: @religious-icon;
    marker-clip: false;
    marker-opacity: .6;
    marker-height: @medium-marker - 2;
    marker-allow-overlap: true;
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


  [feature = 'tourism_camp_site'][zoom >= @major-item-zoom][zoom < 17] ,
  [feature = 'tourism_camp_pitch'][zoom >= @minor-item-zoom]
  {
    marker-file: url('symbols/tourism/camping.svg');
    marker-fill: @hiking;
    marker-height: @large-marker;
    marker-clip: false;
  }

  // Ford tagging on points - ford on lines is defined later
  [feature = 'highway_ford'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
  }

  [feature = 'tourism_caravan_site'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/tourism/caravan_park.svg');
    marker-clip: false;
    marker-fill: @accommodation-icon;
  }

  [feature = 'amenity_cinema'][zoom >= 21] {
    marker-file: url('symbols/amenity/cinema.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_fire_station'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/amenity/firestation.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_fountain'] [zoom >= 17] ,
  [feature = 'amenity_fountain'] [zoom >= 16]  [way_pixels > 20]
  {
        nozzle/marker-file: url('symbols/amenity/fountain.svg');
        nozzle/marker-fill: @fountain-color;
        nozzle/marker-clip: false;
        nozzle/marker-width: 16;
        [height >= 4] {
        nozzle/marker-width: 20;
        }
  }

  [feature = 'amenity_casino'][zoom >= @minor-item-zoom] {
    marker-opacity: @marker-op;
    marker-width: @small-marker;
    marker-file: url('symbols/amenity/casino.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
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

  [feature = 'tourism_information']["information"='office'][zoom >= 16] {
    [information = 'office'] {
      marker-file: url('symbols/tourism/office.svg');
      marker-fill: @amenity-color;
      marker-height: @large-marker;
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

  [feature = 'amenity_courthouse'][zoom >= 21] {
    marker-opacity: @marker-op;
    marker-width: @small-marker;
    marker-file: url('symbols/amenity/courthouse.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'amenity_community_centre'][zoom >= 21] {
    marker-file: url('symbols/amenity/community_centre.svg');
    marker-fill: @culture;
    marker-clip: false;
  }

  [feature = 'amenity_shower'][zoom >= 21] {
    marker-file: url('symbols/amenity/shower.svg');
    marker-fill: @amenity-color;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'amenity_community_centre'][zoom >= 21] ,
  [feature = 'amenity_social_facility']  [zoom >= 21] {
  // [social_facility='assisted_living']
     marker-fill: @public-service;
     marker-height: @small-marker;
     marker-opacity: @marker-op;
     marker-clip: false;
     [feature = 'amenity_social_facility'] {
        marker-file: url('symbols/amenity/social_facility.svg');
     }
     [feature = 'amenity_community_centre'] {
        marker-file: url('symbols/amenity/community_centre.svg');
     }
  }

  [feature = 'amenity_townhall'] ,
  [feature = 'office']  [office = 'government'] {
     [zoom >= 21]  {
        marker-height: @small-marker;
        marker-opacity: @marker-op;
        marker-file: url('symbols/amenity/town_hall.svg');
        marker-fill: @public-service;
        marker-clip: false;
     }
  }

  [feature = 'man_made_mast']["tower:type" != 'lighting'],
  [feature = 'man_made_mast']["tower:type" = 'lighting'][zoom >= @minor-item-zoom]   {
    [zoom >= @county-item-zoom][height >= 160],
    [zoom >= @city-item-zoom][height >= 80],
    [zoom >= @minor-item-zoom], {
      marker-file: url('symbols/man_made/mast.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
      marker-height: @large-marker;
      ["tower:type" = 'lighting'] {
        marker-file: url('symbols/man_made/mast_lighting.svg');
      }
     // ["tower:type" = 'communication'] {
      //  marker-file: url('symbols/man_made/mast_communications.svg');
      //}
    }
  }

  [feature = 'man_made_chimney'] {
    [zoom >= 16][height > 50],
    [zoom >= @minor-item-zoom][height > 30],
    [zoom >= @minor-item-zoom] {
      marker-file: url('symbols/man_made/chimney.svg');
      marker-fill: @man-made-icon;
      marker-clip: false;
    }
  }

  [feature = 'man_made_crane'] {
    [zoom >= @county-item-zoom][height > 70],
    [zoom >= @minor-item-zoom] {
      marker-file: url('symbols/man_made/crane.svg');
      marker-fill: #E2E3E7; //@man-made-icon;
      marker-clip: false;
      [zoom >= @county-item-zoom] {
           marker-width:  3 + [height] * 0.15 ;
      }
      [zoom >= @minor-item-zoom] {
           marker-width:  10 + [height] * 0.2 ;
      }
    }
  }

  [feature = 'historic_city_gate'][zoom >= @county-item-zoom] {
    marker-file: url('symbols/historic/city_gate.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
    [zoom >= @minor-item-zoom] {
          text-name: "[name]";
          text-fill:  @culture;
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          //text-dy: 11;
          text-face-name: @standard-font;
          text-size: @standard-font-size;
       }
  }


  [feature = 'amenity_clinic'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/amenity/doctors.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_hospital'][zoom >= 17] {
    marker-file: url('symbols/amenity/hospital.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_pharmacy'][zoom >= 21] {
    marker-file: url('symbols/amenity/pharmacy.svg');
    marker-height: @medium-marker;
    marker-clip: true;
    marker-opacity: .7;
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'amenity_veterinary'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/amenity/veterinary.svg');
    marker-fill: @health-color;
    marker-clip: false;
  }

  [feature = 'man_made_storage_tank'][zoom >= @minor-item-zoom],
  [feature = 'man_made_silo'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/man_made/storage_tank.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

/*
  [feature = 'amenity_post_office'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/amenity/post_office.svg');
    marker-fill: @culture;
    marker-clip: false;
    marker-width: @small-marker;
  } */

  [feature = 'amenity_theatre'] [zoom >= 15] [way_pixels > @med-building],
  [feature = 'amenity_arts_centre'][zoom >= 15] [way_pixels > @med-building],
  [feature = 'tourism_museum'][zoom >= 16] {
      [zoom >= 21] [zoom < @city-item-zoom]{
        marker-opacity: @marker-op;
        marker-file: url('symbols/amenity/theatre.svg');
        marker-fill: @culture;
        marker-clip: false;
      }
      [zoom >= 16] [way_pixels > @med-building] ,
      [zoom >= 17]  {
        text-name: "[name]";
        text-fill: @amenity-color;
        text-size: @standard-font-size ;
        text-face-name: @bold-fonts;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
        //text-dy: 11;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
      }
  }

  [feature = 'amenity_toilets'][zoom >= 17] {
    [int_access = 'yes'][zoom > 17],
    [zoom > 17] {
      marker-file: url('symbols/amenity/toilets.svg');
      marker-fill: lighten(@amenity-color, 15);
      marker-height: @medium-marker;
      marker-clip: true;
      marker-opacity: @marker-op;
      [int_access = 'restricted'] {
        marker-opacity: @private-opacity;
      }
    }
  }

  [feature = 'amenity_prison'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/amenity/prison.svg');
    marker-fill: @public-service;
    marker-clip: false;
  }

  [feature = 'man_made_water_tower'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/man_made/water_tower.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'historic_memorial'][memorial = null][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= 16],
  [feature = 'historic_memorial'][memorial = 'bust'][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial = 'stele'][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial = 'stone'][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial = 'obelisk'][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= @local-item-zoom],
  [feature = 'man_made_obelisk'][zoom >= @minor-item-zoom],
  [feature = 'historic_archaeological_site'][zoom >= @minor-item-zoom],
  [feature = 'historic_monument'][zoom >= 16] ,
  [feature = 'historic_memorial'][memorial = 'plaque'][zoom >= @local-item-zoom] {
    marker-width: 9;
    [height >= 1] {
    marker-width: 5 + [height] * 0.08;
    }

    marker-opacity: .7;
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
    [feature = 'historic_archaeological_site'] {
     marker-width: 10;
     marker-opacity: .6;
    marker-file: url('symbols/historic/archaeological_site.svg');
     }

    marker-fill: @memorials;
    marker-clip: false;
  }

  [feature = 'historic_fort'][zoom >= 16] {
    marker-file: url('symbols/historic/fort.svg');
    marker-fill: @memorials;
    marker-clip: false;
  }

  //[feature = 'historic_castle'][castle_type != 'stately'][castle_type != 'manor'][zoom >= @minor-item-zoom],
  [feature = 'historic_castle'][castle_type = 'stately'][zoom >= @minor-item-zoom],
  [feature = 'historic_castle'][castle_type = 'manor'][zoom >= @minor-item-zoom],
  [feature = 'historic_manor'] [castle_type = 'palace'] [zoom >= @major-item-zoom] [way_pixels > 20] {
    marker-file: url('symbols/historic/castle.svg');
    marker-fill: @memorials;
    marker-clip: false;
    marker-opacity: @marker-op ;
    marker-width: @small-marker;
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

  //[feature = 'amenity_marketplace'][zoom >= @city-item-zoom][way_pixels > @small-area],
  [feature = 'amenity_marketplace'][zoom >= 21] { //@city-item-zoom] {
    marker-opacity: @marker-op;
    marker-clip: false;
    marker-fill: @shop-icon;
    marker-file: url('symbols/shop/marketplace.svg');
  }

  [shop = 'outdoor'][zoom >= 17] {
  [zoom < 17] {
     marker-opacity: .7;
     marker-height: @medium-marker;
       marker-file: url('symbols/shop/outdoor.svg');
        }
      [zoom >= @minor-item-zoom] {
        text-face-name: @book-fonts;
        text-name: "[name]";
        text-fill: saturate(darken(@transportation-text,10),20);
        text-size: @standard-font-size;
        text-wrap-width: @landcover-wrap-width-size;
        text-line-spacing: @landcover-line-spacing-size;
      }
    }

  // SHOPS
    [feature = 'shop_supermarket'] [zoom = 14] {
         marker-opacity: @marker-op ;
         marker-width: @small-marker + 2;
         marker-clip: true;
         marker-fill: @amenity-color;
       marker-file: url('symbols/shop/supermarket.svg');
   }

  [feature = 'shop'] [shop != 'other'] [zoom >= 21] [zoom < 18]{
     marker-opacity: @marker-op;
     marker-clip: false;
     marker-fill: @shop-icon;
     marker-height: @small-marker;
     [zoom >= 17]{
          marker-height: @small-marker;
     }

    [shop = 'department_store'][zoom >= @minor-item-zoom],
    [shop = 'general'][zoom >= @minor-item-zoom],
    [shop = 'food'][zoom >= @minor-item-zoom] {
       marker-file: url('symbols/shop/supermarket.svg');
    }

    // TODO  cheese, cannabis
    [shop = 'art'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/art.svg');
    }

    [shop = 'bakery'][zoom >= @minor-item-zoom] {
       marker-file: url('symbols/shop/bakery.svg');
    }

    [shop = 'beverages'][zoom >= @minor-item-zoom] {
       marker-file: url('symbols/shop/beverages.svg');
    }

    [shop = 'books'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/amenity/library.svg');
    }

    [shop = 'butcher'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/butcher.svg');
    }

    [shop = 'charity'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/charity.svg');
    }

    [shop = 'chemist'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/chemist.svg');
    }

    [shop = 'fashion'] [zoom >= @minor-item-zoom]{
       marker-file: url('symbols/shop/clothes.svg');
       marker-opacity: @marker-op - .2;
       marker-height: @small-marker - 2;
    }

    [shop = 'clothes'] [zoom >= @minor-item-zoom]{
       marker-file: url('symbols/shop/clothes.svg');
       marker-opacity: @marker-op - .2;
       marker-height: @small-marker - 2;

       [zoom >=21] {
        text-face-name: @book-fonts;
        text-name: "[name]";
        text-fill: @culture;
        text-size: @small-font-size;
        text-wrap-width: @landcover-wrap-width-size;
        text-line-spacing: @landcover-line-spacing-size;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @standard-halo-fill;
      }
    }

    [shop = 'coffee'][zoom >= @minor-item-zoom][zoom < 19] {
      marker-file: url('symbols/amenity/cafe.svg');
    }

    [shop = 'convenience'][zoom >= @minor-item-zoom] ,
    [shop = 'gift'][zoom >= @minor-item-zoom]
    {
      marker-file: url('symbols/shop/convenience.svg');
    }

    [shop = 'chocolate'][zoom >= @minor-item-zoom],
    [shop = 'confectionery'][zoom >= @minor-item-zoom],
    [shop = 'pastry'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/confectionery.svg');
    }

    [shop = 'deli'] [zoom >= @minor-item-zoom]  {
        marker-file: url('symbols/amenity/fast_food.svg');
    }

    [shop = 'department_store'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/department_store.svg');
    }

    [shop = 'doityourself'] [zoom >= @minor-item-zoom] ,
    [shop = 'hardware'] [zoom >= @minor-item-zoom]  {
        marker-file: url('symbols/shop/diy.svg');
    }

    [shop = 'fishmonger'][zoom >= @minor-item-zoom],
    [shop = 'seafood'] [zoom >= @minor-item-zoom]{
        marker-file: url('symbols/shop/seafood.svg');
    }

    [shop = 'florist'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/florist.svg');
    }

    [shop = 'garden_centre'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/garden_centre.svg');
    }

    [shop = 'greengrocer'] [zoom >= @minor-item-zoom],
    [shop = 'farm'] [zoom >= @minor-item-zoom] {
        marker-file: url('symbols/shop/greengrocer.svg');
    }

    [shop = 'houseware'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/houseware.svg');
    }

    [shop = 'dairy'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/dairy.svg');
    }

    [shop = 'bicycle'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/bicycle.svg');
    }

    [shop = 'pet'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/pet.svg');
    }

    [shop = 'photo'] [zoom >= @minor-item-zoom],
    [shop = 'photo_studio'] [zoom >= @minor-item-zoom],
    [shop = 'photography'] [zoom >= @minor-item-zoom] {
        marker-file: url('symbols/shop/photo.svg');
    }

    [shop = 'electronics'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/electronics.svg');
    }

    [shop = 'alcohol'],
    [shop = 'wine'] {
      [zoom >= @minor-item-zoom] {
        marker-file: url('symbols/shop/alcohol.svg');
      }
    }

    [shop = 'music'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/music.svg');
    }

    [shop = 'jewelry'],
    [shop = 'jewellery'] {
       [zoom >= @minor-item-zoom] {
        marker-file: url('symbols/shop/jewelry.svg');
      }
    }

    [shop = 'toys'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/toys.svg');
    }

    [shop = 'sports'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/sports.svg');
    }

    [shop = 'tea'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/tea.svg');
    }

    [shop = 'ticket'][zoom >= @local-item-zoom] {
      marker-file: url('symbols/shop/ticket.svg');
    }

    [shop = 'video_games'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/shop/video_games.svg');
    }
  }

  // office
  [feature = 'office'][zoom >= 21] {
    marker-width: 6;
    marker-line-width: 0;
    marker-clip: false;
    marker-fill: @office;
  }

  [feature = 'diplomatic_embassy'][zoom >= 21] {
    marker-file: url('symbols/office/embassy.svg');
         marker-opacity: @marker-op;
    marker-fill: @office;
    marker-clip: false;
  }

  [feature = 'diplomatic_consulate'][zoom >= 21] {
    marker-file: url('symbols/office/consulate.svg');
         marker-opacity: @marker-op;
    marker-fill: @office;
    marker-clip: false;
  }

  [feature = 'leisure_water_park'][zoom >= @minor-item-zoom][zoom < 17] ,
  [feature = 'leisure_sports_centre'][sport = 'swimming'][zoom >= @minor-item-zoom][zoom < 17] ,
  [feature = 'leisure_swimming_area'][zoom >= @minor-item-zoom][zoom < 17] {
    marker-file: url('symbols/leisure/water_park.svg');
    marker-fill: @leisure-color;
    marker-opacity: @marker-op + .2;
    marker-clip: false;
  }

  [feature = 'leisure_fitness_centre'][zoom >= @minor-item-zoom],
  [feature = 'leisure_fitness_station'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/leisure/fitness.svg');
    marker-fill: @leisure-color;
         marker-opacity: @marker-op;
    marker-clip: false;
    marker-height: @small-marker;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_dog_park'][zoom >= @minor-item-zoom]  {
    marker-file: url('symbols/shop/pet.svg');
    marker-fill: @leisure-color;
    marker-opacity: @marker-op;
    marker-height: @small-marker;
    marker-clip: false;
  }

  [feature = 'leisure_playground'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/leisure/playground.svg');
    marker-fill: @highlight;
    marker-opacity: @marker-op;
    marker-height: @medium-marker;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_miniature_golf'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/leisure/miniature_golf.svg');
    marker-fill: @leisure-color;
         marker-opacity: @marker-op;
    marker-clip: false;
  }

  [feature = 'leisure_golf_course'][zoom >= @city-item-zoom] [zoom < 15]{
    marker-file: url('symbols/leisure/golf.svg');
    marker-fill: @leisure-color;
         marker-opacity: @marker-op;
    marker-clip: false;
  }

  [feature = 'tourism_picnic_site'][zoom >= @city-item-zoom] {
    marker-file: url('symbols/tourism/picnic.svg');
    marker-fill: @leisure-color;
    marker-opacity: @marker-op;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

  [feature = 'leisure_beach_resort'][zoom >= 21][zoom < 15] {
     marker-file: url('symbols/leisure/beach_resort.svg');
     marker-fill: @beach-text;
     marker-height: 9;
     marker-clip: false;
   }

  [feature = 'leisure_outdoor_seating'][zoom >= 21] {
     marker-file: url('symbols/leisure/outdoor_seating.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_bird_hide'][zoom >= @minor-item-zoom] {
     marker-file: url('symbols/leisure/bird_hide.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
   }

  [feature = 'leisure_amusement_arcade'][zoom >= @minor-item-zoom] {
     marker-file: url('symbols/leisure/amusement_arcade.svg');
     marker-fill: @leisure-color;
          marker-opacity: @marker-op;
     marker-clip: false;
   }

  [feature = 'leisure_fishing'][zoom >= @minor-item-zoom] {
     marker-file: url('symbols/leisure/fishing.svg');
     marker-fill: @leisure-color;
     marker-clip: false;
  }

  // Slipway tagging on points - slipway on lines is defined later
  [feature = 'leisure_slipway'][zoom >= 14] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: #B3D2F3; //#85B5EC; //
    marker-clip: false;
    marker-width: 20;
  }

  [feature = 'amenity_boat_rental'][zoom >= 16] {
    marker-file: url('symbols/amenity/boat_rental.svg');
    marker-fill: @transportation-icon;
    marker-height: @medium-marker + 4;
    marker-clip: false;
  }
  [feature = 'aeroway_helipad'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/amenity/helipad.svg');
    marker-clip: false;
    marker-fill: @airtransport;
  }

  [feature = 'aeroway_aerodrome']['int_access' = 'yes'][zoom >= @regional-item-zoom][zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'restricted'][zoom >= 12][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= @county-item-zoom][zoom < 18] {
    [way_pixels > @med-building],
    [way_pixels = null] {
        marker-width: 15;
      marker-file: url('symbols/amenity/aerodrome.svg');
      marker-clip: false;
      marker-fill: @airtransport;
    }
  }

  [feature = 'man_made_lighthouse'][zoom >= @major-item-zoom] {
    marker-file: url('symbols/man_made/lighthouse.svg');
    marker-clip: false;
    marker-fill: #EBEBEB;  //@man-made-icon;
    marker-width:  12 ;

    // Named lighthouse
    [name =~ '\w+'] {
      //marker-fill: red;
      marker-width:  20 ;
    }
  }

  [feature = 'natural_peak'] {
    [zoom >= 6] [score > 3200]{   // 1650]{
        marker-opacity: .2; //[score] * 0.000179 + .41;
        marker-file: url('symbols/natural/peak.svg');
        marker-fill: #71654C; //@landform-color;
        marker-width: 4; //[score] * 0.00167 + 5;
        [score > 2300]{
            marker-opacity: .4;
            marker-width: 5;
        }
        [score > 3000]{
           marker-opacity: .6;
           marker-width: 7;
        }
        [score > 3800]{
           marker-opacity: .8;
           marker-width: 9;
        }
        marker-clip: false;
     }
   }

  [feature = 'natural_volcano'][zoom >= 6] {
    marker-file: url('symbols/natural/peak.svg');
    marker-width: 7;
    marker-opacity: .7;
    [score > 50]{
     marker-width: 5;
     marker-opacity: 1;
     }
     [score > 500]{
     marker-width: 8;
     marker-opacity: 1;
     }
    [score > 1000]{
     marker-width: 10;
     marker-opacity: 1;
     }
    marker-fill: #d40000;
    marker-clip: false;
  }

  [feature = 'natural_saddle'][zoom >= 13] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @highlight;
    marker-clip: false;
  }

  [feature = 'mountain_pass'][zoom >= 13] {
    marker-file: url('symbols/natural/saddle.svg');
    marker-fill: @highlight;
    marker-clip: false;
  }

  [feature = 'natural_spring'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/natural/spring.svg');
    marker-fill: #638CC3;
    marker-clip: false;
  }

  [feature = 'natural_hot_spring'][zoom >= 8] {
    marker-file: url('symbols/natural/spring.svg');
    marker-fill: purple;
    marker-clip: false;
    marker-width: 8;
  }

  [feature = 'natural_fumarole'][zoom >= 8] {
    marker-file: url('symbols/historic/obelisk.svg');
    marker-fill: red;
    marker-clip: false;
  }

  [feature = 'natural_cave_entrance'][zoom >= @county-item-zoom] {
    marker-file: url('symbols/natural/cave.svg');
    marker-clip: false;
  }

  [feature = 'natural_geyser'][zoom >= 8]["geyser:height" != null],
  [feature = 'natural_geyser'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/natural/cave.svg');
    marker-clip: false;
    marker-fill: @hotspring;
    marker-width: 11;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 8][height >= 30],
    [zoom >= 15][height > 8],
    [zoom >= 16][height > 5],
     {
      marker-file: url('symbols/natural/waterfall.svg');
      marker-width: 8 + [height] / 22;
      marker-clip: false;
      marker-fill: @waterfall;
      marker-allow-overlap: true;
    }
  }

  [feature = 'military_bunker'][zoom >= @minor-item-zoom] {
    marker-file: url('symbols/man_made/bunker.svg');
    marker-fill: @man-made-icon;
    marker-clip: false;
  }

  [feature = 'power_generator']['generator:source' = 'wind'] {
    [zoom >= @city-item-zoom][location != 'rooftop'][location != 'roof'],
    [zoom >= @city-item-zoom][location = null],
    [zoom >= @local-item-zoom] {
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


  [feature = 'amenity_parking'] [zoom >= @minor-item-zoom] {
    [zoom >= @minor-item-zoom]["parking" != 'street_side']["parking" != 'lane'],
    [zoom >= @minor-item-zoom][feature = 'amenity_parking']["parking" != 'street_side']["parking" != 'lane'],
    [zoom >= @minor-item-zoom] {
      [feature = 'amenity_parking'] {
         marker-file: url('symbols/amenity/parking_subtle.svg');
         marker-height: @small-marker ;
         }
      [feature = 'amenity_parking']["parking" = 'street_side'],
      [feature = 'amenity_parking']["parking" = 'lane'] {
        marker-file: url('symbols/amenity/parking_subtle.svg');
      }
      [feature = 'amenity_parking_entrance']["parking"='underground'] { marker-file: url('symbols/amenity/parking_entrance_underground.svg'); }
      [feature = 'amenity_parking_entrance']["parking"='multi-storey'] { marker-file: url('symbols/amenity/parking_entrance_multistorey.svg'); }
        marker-height: @small-marker;
        marker-clip: true;
        marker-opacity: @marker-op;
        marker-fill: @highlight; //@transportation-icon;
      [int_access = 'restricted'] { marker-opacity: @private-opacity; }
    }
  }

  [feature = 'tourism_alpine_hut'][zoom >= @major-item-zoom],
  [feature = 'tourism_wilderness_hut'][zoom >= @major-item-zoom],
  [feature = 'amenity_shelter'][zoom >= 16] {
    marker-file: url('symbols/amenity/shelter.svg');
    [feature = 'tourism_wilderness_hut'] {
      marker-file: url('symbols/tourism/wilderness_hut.svg');
    }
    [feature = 'tourism_alpine_hut'],
    [feature = 'amenity_shelter']  {
      marker-file: url('symbols/tourism/alpinehut.svg');
    }

    marker-fill: @accommodation-icon;
    marker-clip: false;
    [int_access = 'restricted'] {
      marker-opacity: @private-opacity;
    }
  }

}


// GROUP LOW PRIORITY
#amenity-low-priority {
  [feature = 'railway_level_crossing'][zoom >= 21]::railway,
  [feature = 'railway_crossing'][zoom >= 21]::railway{
    marker-file: url('symbols/barrier/level_crossing.svg');
    marker-fill: #4d4d4d;
    marker-clip: false;
    [zoom >= 21] {
      marker-file: url('symbols/barrier/level_crossing2.svg');
    }
  }

  [feature = 'barrier_gate']::barrier {
    [zoom >= @minor-item-zoom] {
      marker-file: url('symbols/barrier/gate.svg');
      marker-clip: false;
      marker-fill: @barrier-icon;
      marker-height: 8;
      marker-opacity: .7;
    }
  }

  [feature = 'barrier_lift_gate'][zoom >= @minor-item-zoom]::barrier,
  [feature = 'barrier_swing_gate'][zoom >= @minor-item-zoom]::barrier {
    marker-height: 8;
    marker-file: url('symbols/barrier/lift_gate.svg');
    marker-fill: @barrier-icon;
    marker-opacity: .7;
    marker-clip: false;
  }

  [feature = 'barrier_full-height_turnstile'][zoom >= @minor-item-zoom]::barrier {
    marker-file: url('symbols/barrier/full-height_turnstile.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }

  [feature = 'barrier_kissing_gate'][zoom >= @minor-item-zoom]::barrier {
    marker-file: url('symbols/barrier/kissing_gate.svg');
    marker-fill: @barrier-icon;
    marker-clip: false;
  }
}



// GROUP TEXT POINT
//#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 8] {

  [feature = 'place_island'][zoom >= 4] [way_pixels > 400],
  [feature = 'place_island'][zoom >= 14] , //[way_pixels = null],
  [feature = 'place_islet'][zoom >= 9][way_pixels > @small-area],
  [feature = 'place_islet'][zoom >= @minor-item-zoom] {
    text-name: "[name]";
    text-transform: uppercase;
    text-fill: @placenames;
    text-size: @standard-font-size - 2;
    text-wrap-width: @landcover-wrap-width-size;
    text-line-spacing: @landcover-line-spacing-size;

    [way_pixels > @large-area] {
      text-size: @landcover-font-size-big;
      text-wrap-width: @landcover-wrap-width-size-big;
      text-line-spacing: @landcover-line-spacing-size-big;
    }
    [way_pixels > @huge-area] {
      text-size: @landcover-font-size-big;
      text-wrap-width: @landcover-wrap-width-size-bigger;
      text-line-spacing: @landcover-line-spacing-size-bigger;
    }
    text-face-name: @standard-font; // @oblique-fonts;
  }

  [feature = 'natural_cape'][zoom >= 11] {
    text-name: "[name]";
    text-fill: white; //@landform-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-face-name: @standard-font;

    text-halo-radius: 1.3;
    text-halo-fill: #5C6487;

  }

  [feature = 'place_locality'][zoom >= 21] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-fill: purple; // @placenames;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= @minor-item-zoom] {
      text-size: @standard-font-size;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
      text-halo-fill: white;
    }
  }


  [feature = 'amenity_social_facility'] [zoom >= 17] [way_pixels > 200] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @hotel;
    //text-dy: 11;
    //text-face-name: @standard-font;
    text-face-name: @standard-font;
    text-allow-overlap: true;
  }

  /*
  [feature = 'amenity_social_facility'] [zoom >= 17] [way_pixels > 200],
  [feature = 'leisure_golf_course'] [zoom >= 15],
  [feature = 'tourism_alpine_hut'][zoom >= @county-item-zoom],
  [feature = 'tourism_camp_pitch'][zoom >= @minor-item-zoom],
  [feature = 'amenity_shelter'][zoom >= 17],
  [feature = 'building_hotel'][zoom >= 17] ,
  [feature = 'tourism_hotel'][zoom >= 17] ,
  //[feature = 'tourism_hotel'][zoom >= 17] ,
  [feature = 'tourism_motel'][zoom >= 18],
  [feature = 'tourism_hostel'][zoom >= 18],
  //[feature = 'tourism_chalet'][zoom >= @minor-item-zoom],
  [feature = 'tourism_guest_house'][zoom >= @minor-item-zoom],
  [feature = 'tourism_apartment'][zoom >= @minor-item-zoom],
  [feature = 'tourism_wilderness_hut'][zoom >= @county-item-zoom],
  [feature = 'tourism_camp_site'][zoom >= 16],
  [feature = 'tourism_caravan_site'][zoom >= @minor-item-zoom], {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @hotel;
    //text-dy: 11;
    //text-face-name: @standard-font;
    text-face-name: @standard-font;
    text-allow-overlap: true;

    [feature = 'tourism_camp_site'][zoom >= 16],
    [feature = 'tourism_caravan_site'][zoom >= @minor-item-zoom] {
      text-fill: @hiking;
    }
  }

  [feature = 'building_hotel'][zoom >= 14] [way_pixels > 100],
  [feature = 'building_hotel'][zoom >= 15],
  [feature = 'tourism_hotel'][zoom >= 14] [way_pixels > 200],
  [feature = 'tourism_hotel'][zoom >= 15] {
      marker-file: url('symbols/tourism/hotel.svg');
      marker-fill: @hotel;
      marker-opacity: .8;
      marker-width: @medium-marker + 2;
  }
  */

  [feature = 'leisure_picnic_table'][zoom >= @minor-item-zoom] {
      marker-file: url('symbols/tourism/picnic.svg');
      marker-fill: @leisure-color;
      marker-opacity: .8;
      marker-width: @medium-marker + 1;
  }


  [feature = 'tourism_hostel'][zoom >= 18],
  [feature = 'tourism_chalet'][zoom >= 17],
  [feature = 'tourism_guest_house'][zoom >= 17],
  [feature = 'tourism_apartment'][zoom >= 17],
  [feature = 'tourism_motel'][zoom >= 17] {
      marker-file: url('symbols/tourism/hotel.svg');
      marker-fill: @amenity-color;
      marker-opacity: .6;
      marker-width: @medium-marker ;

      [feature = 'tourism_apartment'][zoom >= @minor-item-zoom] {
        marker-file: url('symbols/tourism/apartment.svg');
      }

      [feature = 'tourism_hostel'][zoom >= @minor-item-zoom] {
        marker-file: url('symbols/tourism/hostel.svg');
      }
  }

  [feature = 'shop_supermarket'] [zoom >= 21]{
    text-name: "[name]";
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-face-name: @standard-font;
    text-size: @standard-font-size;
    text-fill: @amenity-color;
    //text-allow-overlap: true;
  }

  [feature = 'amenity_nightclub'] [zoom >= @local-item-zoom],
  [feature = 'amenity_pub'][zoom >= @minor-item-zoom],
  [feature = 'amenity_marketplace'][zoom >= 16][way_pixels > @small-area],
  [feature = 'amenity_marketplace'][zoom >= @minor-item-zoom] ,
  [feature = 'amenity_restaurant'][zoom >= @minor-item-zoom],
  [feature = 'amenity_food_court'][zoom >= @local-item-zoom],
  [feature = 'amenity_cafe'][zoom >= @minor-item-zoom],
  [feature = 'amenity_biergarten'][zoom >= @minor-item-zoom],
  [feature = 'amenity_bar'][zoom >= @minor-item-zoom],
  [feature = 'amenity_boat_rental'][zoom >= 16],
  [feature = 'amenity_ice_cream'][zoom >= @local-item-zoom] {
    text-allow-overlap: true;
    text-name: "[name]";
    text-fill: @gastronomy-text;
    text-size: @standard-font-size ;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 7;
    text-face-name: @standard-font;
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
    [zoom >= @minor-item-zoom] {
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

  [feature = 'leisure_beach_resort'][way_pixels > 100]{
    text-name: "[name]";
    text-size: @standard-font-size ;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @hotel;
    text-face-name: @standard-font;
  }

  [feature = 'amenity_internet_cafe'][zoom >= @minor-item-zoom],
  [feature = 'leisure_bowling_alley'][zoom >= @minor-item-zoom],
  [feature = 'leisure_amusement_arcade'][zoom >= @local-item-zoom],
  [feature = 'leisure_fishing'][zoom >= @minor-item-zoom] {
    text-name: "[name]";
    text-size: @standard-font-size ;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @market;
    text-face-name: @standard-font;
  }

  [feature = 'tourism_picnic_site'][zoom >= @city-item-zoom] {
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
    
    
    [int_access = 'restricted'] {
      text-opacity: @private-opacity;
      text-halo-radius: 0;
    }
  }

  // religious building name
  /*
  [feature = 'amenity_place_of_worship'][zoom >= @city-item-zoom][way_pixels > @large-building]{
    text-name: "[name]";
          text-fill:  red; //@culture;  // HIGHLIGHT TEXT: RELIGIOUS
          text-wrap-width: @standard-wrap-width;
          text-line-spacing: @standard-line-spacing-size;
          // text-dy: 11;
          text-face-name: @book-fonts;
          text-halo-radius: @standard-halo-radius;
          text-halo-fill: @standard-halo-fill;
          text-size: @standard-font-size;
  } */

  //[feature = 'tourism_information'][zoom >= @county-item-zoom],
  [feature = 'tourism_information'][information = 'office'][zoom >= 17] {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @accommodation-text;
    text-allow-overlap: true;
    [information = 'office'] { text-fill: @amenity-color; }
    text-face-name: @standard-font;
    text-dy: 11;
  }

  [feature = 'waterway_waterfall'] {
    [zoom >= 9][height >= 30],
    [zoom >= 15][height > 8],
    [zoom >= 16][height > 5] {
      text-name: "[name]";
      text-size: @standard-font-size - 1;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-face-name: @standard-font;
      //text-allow-overlap: true;
      text-fill: white; //@beach-text;
      text-halo-radius: .8;
      text-halo-fill: #A2C1D0;
      [height > 20] {
         //text-size: @small-font-size + 3;
      }
    }
  }

  /*
  [feature = 'power_generator']['generator:source' = 'wind'][location != 'rooftop'][location != 'roof'][zoom >= @local-item-zoom],
  [feature = 'power_generator']['generator:source' = 'wind'][location = null][zoom >= @local-item-zoom],
  [feature = 'power_generator']['generator:source' = 'wind'][zoom >= @local-item-zoom],
  [feature = 'historic_city_gate'][zoom >= @minor-item-zoom],
  [feature = 'natural_cave_entrance'][zoom >= @city-item-zoom],
  [feature = 'man_made_mast'][zoom >= @local-item-zoom],
  [feature = 'man_made_tower'][zoom >= 16],
  [feature = 'man_made_storage_tank'][zoom >= @local-item-zoom],
  [feature = 'man_made_silo'][zoom >= @local-item-zoom],
  [feature = 'man_made_communications_tower'][zoom >= @minor-item-zoom],
  [feature = 'man_made_observation_tower'][zoom >= @minor-item-zoom],
  [feature = 'man_made_telescope']["telescope:type" != 'optical']["telescope:type" != null][zoom >= @minor-item-zoom],
  [feature = 'man_made_telescope'][zoom >= @minor-item-zoom],
  [feature = 'man_made_water_tower'][zoom >= @minor-item-zoom],
  [feature = 'man_made_chimney'][zoom >= @minor-item-zoom],
  [feature = 'man_made_crane'][zoom >= @minor-item-zoom],
  [feature = 'man_made_waste_water_plant'][zoom >= @minor-item-zoom] {
    text-name: "[height]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: darken(@man-made-icon, 20%);
    text-dy: 10;
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
    
    
  } */

  [feature = 'tourism_artwork'][zoom >= 21],
  //[feature = 'historic_memorial'][memorial = null][zoom >= @minor-item-zoom],
  //[feature = 'historic_memorial'][memorial != null][memorial != 'blue_plaque'][memorial != 'bust'][memorial != 'plaque'][memorial != 'stele'][memorial != 'stone'][zoom >= @minor-item-zoom],
  [feature = 'historic_memorial'][memorial = 'statue'][zoom >= @minor-item-zoom],
  //[feature = 'historic_memorial'][memorial = 'bust'][zoom >= @local-item-zoom],
  //[feature = 'historic_memorial'][memorial = 'stele'][zoom >= @minor-item-zoom],
  //[feature = 'historic_memorial'][memorial = 'stone'][zoom >= @minor-item-zoom],
  //[feature = 'historic_memorial'][memorial = 'blue_plaque'][zoom >= @local-item-zoom],
  //[feature = 'historic_memorial'][memorial = 'plaque'][zoom >= @local-item-zoom],
  [feature = 'man_made_obelisk'][zoom >= @minor-item-zoom],
  [feature = 'historic_monument'][zoom >= 17],
  [feature = 'historic_fort'][zoom >= 16],
  [feature = 'historic_manor'][zoom >= 16] {
    text-name: "[name]";
    text-size: @small-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;
    text-dy: 11;
    text-face-name: @standard-font;
  }

  [feature = 'historic_castle'] [zoom >= @city-item-zoom]  {
     [way_pixels > @med-building]{
        text-name: "[name]";
        text-size: @small-font-size;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
        text-fill: @culture;  // HIGHLIGHT TEXT: PALACE
        //text-dy: 11;
        text-face-name: @standard-font;
        text-allow-overlap: false;
     }

    [way_pixels > @small-area]  {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @culture;  // HIGHLIGHT TEXT: PALACE
      // text-dy: 11;
      text-face-name: @bold-fonts;
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
    [zoom >= @county-item-zoom][way_pixels > @small-area],
    [zoom >= 17] {
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
    [zoom >= @county-item-zoom][way_pixels > @small-area],
    [zoom >= @minor-item-zoom] {
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
    }
  }

  [feature = 'landuse_winter_sports'] {
    [zoom >= 8][way_pixels>300][is_building = 'no'],
    [zoom >= 16] {
      text-allow-overlap: false;
      text-fill: #63B0C6;
      text-name: "[name]";
      text-size: @landcover-font-size + 3;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-face-name: @landcover-face-name;
     }
 }

  [feature = 'landuse_military'][zoom >= 8],
  [feature = 'natural_wood'][zoom >= 14],
  [feature = 'landuse_forest'][zoom >= 14],
  [feature = 'boundary_national_park'][zoom >= 9],
  [feature = 'leisure_nature_reserve'][zoom >= 14],
  [feature = 'boundary_protected_area'][zoom >= 9],
  [feature = 'boundary_aboriginal_lands'][zoom >= 9] {
    [zoom >= 8][way_pixels>3500][is_building = 'no'],
    [zoom >= 11][way_pixels>2000] {
      text-allow-overlap: false;
      text-transform: uppercase;
      text-fill: @forest-text;
      text-name: "[name]";
      text-size: @medium-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: #165A05;

     [way_pixels>10000] {
        //text-fill: @forest-text;
        text-size: @medium-font-size  ;
        text-wrap-width: @landcover-wrap-width-size;
        text-line-spacing: @landcover-line-spacing-size;
      }

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

  [feature = 'natural_mountain_range']  [zoom >= 5] [zoom < 13],
  [feature = 'natural_peak']  [zoom >= @major-item-zoom],
  [feature = 'natural_valley']  [zoom >= @major-item-zoom],
  [feature = 'natural_peak']  [zoom >= @regional-item-zoom] [score > 3400],
  //[feature = 'natural_peak']  [zoom >= 8] [score > 3400],
  [feature = 'natural_volcano'][zoom >= 8][score > 800],
  [feature = 'natural_volcano'][zoom >= 10],
  [feature = 'natural_saddle'][zoom >= 14],
  [feature = 'mountain_pass'][zoom >= 14],
  [feature = 'desert'][zoom >= 8],
  [feature = 'mountain_pass']  [zoom >= 13] [score > 1300],
  [feature = 'tourism_viewpoint'][zoom >= 14] {
    text-name: "[name]";
    text-size: @small-font-size + 5;
    text-wrap-width: 20; //@standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @highlight;
    text-dy: 7;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;

    [feature = 'natural_mountain_range'],
    [feature = 'desert'],
    [feature = 'mountain_pass'],
    [feature = 'natural_saddle'],
    [feature = 'tourism_viewpoint'] {
            //text-allow-overlap: true;
            text-fill: @highlight;
            text-face-name:  @bold-fonts;
            text-size: @standard-font-size;
    }

    [feature = 'natural_volcano'] {
       text-fill: black;
       text-halo-fill: #D7D7D7;
       text-allow-overlap: true;
     }
  }

  [feature = 'military_danger_area'][is_building = 'no'] {
    [zoom >= 9][way_pixels > @small-area],
    [zoom >= @minor-item-zoom] {
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
  //[feature = 'landuse_residential'] [zoom > 15],
  [feature = 'landuse_meadow'],
  [feature = 'natural_grassland'],
  [feature = 'landuse_grass'],
  [feature = 'landuse_allotments'],
  [feature = 'landuse_farmyard'],
  [feature = 'landuse_farmland'],
  [feature = 'landuse_greenhouse_horticulture'],
  //[feature = 'shop'] [shop = 'mall'][zoom > 21],
  [feature = 'landuse_salt_pond'],
  [feature = 'tourism_theme_park'],
  [feature = 'leisure_marina'],
  [feature = 'tourism_zoo'],
  //[feature = 'amenity_kindergarten'][zoom >= @minor-item-zoom],
  //[feature = 'amenity_school'] [zoom >= 16],
  [feature = 'amenity_college'][zoom >= @minor-item-zoom],
  [feature = 'amenity_university'] [way_pixels > @small-area]  [zoom >= 14],
  [feature = 'landuse_religious'][zoom >= @minor-item-zoom],
  [feature = 'natural_heath'],
  [feature = 'natural_scrub'],
  [feature = 'natural_beach'][zoom >= 13],
  [feature = 'natural_shoal'],
  [feature = 'natural_reef'],
  [feature = 'leisure_fitness_centre'],
  [feature = 'leisure_fitness_station'],
  //[feature = 'leisure_sports_centre'],
  [feature = 'leisure_stadium'],
  [feature = 'leisure_track'],
  [feature = 'leisure_ice_rink'],
  [feature = 'leisure_pitch'] {
    [feature = 'natural_beach'][way_pixels > 200] ,
    [way_pixels > 2300][is_building = 'no'],
    [zoom >= @regional-item-zoom][way_pixels > 1200][is_building = 'yes'],
    [zoom >= 17][is_building = 'no'] [way_pixels > 50]
      {
        //text-avoid-edges: true;
        //text-clip: false;
        text-name: "[name]";
        text-fill: @amenity-color;
        text-size: @standard-font-size;
        text-wrap-width: @standard-wrap-width;
        //text-line-spacing: @standard-line-spacing-size;
        //text-dy: 11;
        text-face-name: @bold-fonts;
        text-allow-overlap: false;
        //text-halo-radius: .7;
        //text-halo-fill: #B49DCE;

      [way_pixels > @huge-area] {   // HIGHLIGHT TEXT: VERY LARGE SIZE
        //text-fill: orange;
        text-size: @medium-font-size ;
        text-wrap-width: @landcover-wrap-width-size-bigger + 40;
      }

      text-face-name: @landcover-face-name;

      [feature = 'natural_reef'],
      [feature = 'natural_wetland'],
      [feature = 'natural_mud'],
      [feature = 'landuse_salt_pond'] {
        //text-fill: @wetland-text;
        //text-size: @small-font-size + 2;
      }


      [feature = 'leisure_park'],
      [feature = 'landuse_recreation_ground'],
      [feature = 'landuse_village_green'],
      [feature = 'leisure_garden'] {
         text-fill: @park-text;
         text-allow-overlap: true;
      }

      [feature = 'leisure_marina']{
        text-fill: @marina-text;
        text-size: @standard-font-size;
        text-halo-radius: @standard-halo-radius;
      text-halo-fill: @water-halo-fill;
      }

      [feature = 'landuse_vineyard'],
      [feature = 'landuse_orchard'],
      [feature = 'landuse_plant_nursery'] {
        text-fill: darken(@orchard, 35%);
      }

      [feature = 'landuse_cemetery'],
      [feature = 'amenity_grave_yard'] {
        text-size: @standard-font-size;
        text-face-name: @book-fonts;
        text-fill: @park-text;
      }

      [feature = 'landuse_residential']  {
        //text-fill: @culture;
      }

      [feature = 'landuse_meadow'],
      [feature = 'natural_grassland'],
      [feature = 'landuse_grass'] {
        text-fill: darken(@grass, 35%);
      }

      [feature = 'landuse_allotments'] {
        text-fill: darken(@allotments, 35%);
      }
      [feature = 'landuse_farmyard'],
      [feature = 'landuse_farm'],
      [feature = 'landuse_farmland'],
      [feature = 'landuse_greenhouse_horticulture'] {
        text-fill: #20644C;
      }
      [feature = 'shop'][shop = 'mall'],
      [feature = 'landuse_retail'] {
        text-allow-overlap: false;
        text-fill: orange; //@market;
        //text-size: @standard-font-size + 1;
      }

      [feature = 'tourism_caravan_site'] {
        text-fill: darken(@campsite, 35%);
        // text-dy: 15;
      }
      [feature = 'tourism_theme_park'],
      [feature = 'tourism_zoo'] {
        //text-fill: @placenames;
        //text-face-name: @bold-fonts;
        text-allow-overlap: true;
      }
      [feature = 'leisure_stadium'] {
        text-size: @medium-font-size;
        text-allow-overlap: true;
      }
      [feature = 'amenity_college'],
      [feature = 'amenity_university'] {
        text-allow-overlap: true;
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
         text-fill: @beach-text; //@placenames; //@water-color; //#5C553C;
         text-halo-radius: 1;
         text-halo-fill: #C9DCE8; //#F0ECDB; //@standard-halo-fill;
         //text-halo-comp-op: lighten;
         text-size: @standard-font-size - 1;
      }

      [feature = 'leisure_fitness_centre'],
      [feature = 'leisure_fitness_station'] {
        //text-fill: @leisure-color;
        [int_access = 'restricted'] {
          text-opacity: @private-opacity;
          text-halo-radius: 0;
        }
      }
      [feature = 'leisure_track'] {
        //text-fill: darken(@track, 35%);
      }
      [feature = 'leisure_ice_rink'],
      [feature = 'leisure_pitch'] {
        //text-fill: darken(@pitch, 35%);
      }
    }
  }

  [feature = 'leisure_playground'],
  //[feature = 'landuse_retail'],
  //[feature = 'leisure_dog_park'],
  [feature = 'leisure_fitness_station'] {
    [zoom >= @major-item-zoom][way_pixels > @large-building],
    [zoom >= @minor-item-zoom] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 13;
      text-fill: @leisure-color;
      text-face-name: @standard-font;

      [int_access = 'restricted'] {
        text-fill: darken(@park, 35%);
      }
    }
  }

  [feature = 'landuse_industrial'],
  [feature = 'landuse_quarry'],
  [feature = 'landuse_railway'],
  [feature = 'landuse_construction'],
  [feature = 'man_made_works'],
  [feature = 'man_made_water_works'],
  [feature = 'man_made_wastewater_plant'],
  [feature = 'landuse_brownfield'],
  [feature = 'landuse_landfill']{
    [zoom >= @regional-item-zoom][way_pixels > @small-area][is_building = 'no'],
    [zoom >= @local-item-zoom][is_building = 'no'],
    [zoom >= @regional-item-zoom][way_pixels > @small-area] {
     text-allow-overlap: true;
      text-face-name: @landcover-face-name;
      text-name: "[name]";  // HIGHLIGHT TEXT: INDUSTRIAL
      text-size: @landcover-font-size - 1;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-fill: darken(@industrial, 40);
      [way_pixels > @large-area] {
         text-size: @landcover-font-size + 1;
      }
     }
  }

  [feature = 'amenity_courthouse'][zoom >= 21],
  {
    text-name: "[name]";
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @public-service;
    text-dy: 11;
    [feature = 'amenity_courthouse'] { text-dy: 1; }
    text-face-name: @standard-font;
  }


  [feature = 'natural_spring'][zoom >= @minor-item-zoom][spring_type = 'hot'] ,
  [feature = 'natural_spring'][zoom >= @minor-item-zoom][spring_type != 'hot']
   {
    text-name: "[name]";
    text-size: @small-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @culture;
    text-face-name: @standard-font;

    text-dy: 7;
    [spring_type = 'hot'] {
       text-fill: darken(@hotspring, 30);
    }
  }

    [feature = 'natural_geyser'][zoom >= @county-item-zoom]["geyser:height" != null],
    [feature = 'natural_geyser'][zoom >= @minor-item-zoom],
    [feature = 'natural_hot_spring'][zoom >= @minor-item-zoom],
    [feature = 'natural_fumarole'][zoom >= @county-item-zoom]  {
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
    text-size: @small-font-size;
    }

    [feature = 'natural_fumarole'] {
    text-name: "Fumarole";
    }
  }

  [feature = 'highway_bus_stop'],
  //[feature = 'amenity_charging_station'],
  //[feature = 'amenity_fuel'],
  [feature = 'amenity_bus_station'] {
    [zoom >= 21] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @highlight;
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

/*
  [feature = 'leisure_marina'][zoom >= @city-item-zoom] {
    [zoom >= @regional-item-zoom][way_pixels > @small-area],
    [zoom >= @minor-item-zoom] {
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
      
      
    }
  } */

  [feature = 'amenity_fountain'][zoom >= 17] {
    text-name: "[name]";
    text-size: @small-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @fountain-color;
    text-dy: 15;
    text-face-name: @standard-font;
    [zoom >= @minor-item-zoom] {
      // text-dy: 10;
    }
  }

  [feature = 'man_made_lighthouse'][zoom >= @major-item-zoom],
  [feature = 'man_made_windmill'][zoom >= @minor-item-zoom] {
    text-name: "[name]";
    text-size: @small-font-size + 1;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: white; //@man-made-icon;
    text-dy: 15;
    text-face-name: @standard-font;

    [zoom >= @county-item-zoom] {
    text-size: @standard-font-size;
    }
  }

  [feature = 'amenity_hospital'][zoom >= 16] {
    text-name: "[name]";
    text-fill: @health-color;
    text-size: @small-font-size + 3; //@standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 10;
    text-face-name: @standard-font;
  }

  [feature = 'amenity_clinic'],
  [feature = 'amenity_pharmacy'],
  [feature = 'amenity_veterinary'] {
    [zoom >= 21] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 12;
      text-fill: @culture;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'amenity_nursing_home'],
  [feature = 'amenity_childcare'] {
    [zoom >= @minor-item-zoom] [way_pixels > @large-building]{
      text-name: "[name]";
      text-size: @small-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-face-name: @standard-font;
      
      
      text-dy: 8;
      text-fill: @culture;
    }
  }

  [feature = 'shop'][shop != 'mall'][zoom > 21]{
    [way_pixels > @large-building][zoom >= 21],
    [zoom >= 21] [way_pixels > @med-building]{
      text-name: "[name]";  //HIGHIGHT TEXT: SHOP
      text-size: @small-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
      [shop = 'massage'] {
        text-fill: @leisure-color;
      }
    }
  }

  [feature = 'amenity_fast_food'][zoom >= @minor-item-zoom] {
    text-allow-overlap: false;
    text-name: "[name]";
    text-fill: @gastronomy-text;
    text-size: @small-font-size + 1;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-dy: 8;
    text-face-name: @standard-font;
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
        text-halo-fill: @standard-halo-fill;
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
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'diplomatic_embassy'],
  [feature = 'diplomatic_consulate'] {
    [zoom >= 21] {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 10;
      text-fill: @office;
      text-face-name: @standard-font;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
    }
  }

  [feature = 'office']  [office = 'government'] [zoom >= 21]  {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 10;
      text-fill: @office;
      text-face-name: @standard-font;
  }

  [feature = 'office']  [office = 'government'] [government = 'parliament'] [zoom >= 16] ,
  [feature = 'office']  [office = 'government'] [government = 'legislative'] [zoom >= 16]  {
      text-name: "[name]";
      text-size: @standard-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 10;
      text-fill: @highlight;
      text-face-name: @bold-fonts;
  }

  [feature = 'shop_department_store'] {
    [zoom >= 17] {
      text-name: "[name]";
      text-size: @small-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      // text-dy: 12;
      text-fill: @shop-text;
      text-face-name: @standard-font;
    }
  }

  [feature = 'aeroway_gate'][zoom >= @minor-item-zoom] {
    text-name: "[ref]";
    text-size: @standard-font-size - 1;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @placenames;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'power_plant'][is_building = 'no'][zoom >= @regional-item-zoom],
  [feature = 'power_generator'][is_building = 'no']["generator:source" != 'wind'][zoom >= @regional-item-zoom],
  [feature = 'power_substation'][is_building = 'no'][zoom >= 17]{
    [way_pixels > @small-area],
    [zoom >= @minor-item-zoom] {
      text-name: "[name]";
      text-size: @landcover-font-size;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      [way_pixels > @large-area] {
        text-size: @landcover-font-size-big - 4;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }
      [way_pixels > @huge-area] {
        text-size: @landcover-font-size-big - 1;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }
      text-fill: darken(@power, 30);
      text-face-name: @landcover-face-name;
    }
  }

  [feature = 'natural_scree'][zoom >= 9],
  [feature = 'natural_shingle'][zoom >= 9],
  [feature = 'natural_bare_rock'],
  [feature = 'natural_sand'] {
    [zoom >= 8][way_pixels > @small-area][is_building = 'no'],
    [zoom >= @minor-item-zoom][is_building = 'no'] {
    //text-dx: 1;
      text-name: "[name]";
      text-size: @medium-font-size; 
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-fill: white;
      text-face-name: @landcover-face-name;

      [way_pixels > @large-area] {
        //text-size: @landcover-font-size-big;
        text-wrap-width: @landcover-wrap-width-size-big;
        text-line-spacing: @landcover-line-spacing-size-big;
      }

      [way_pixels > @huge-area] {
        //text-size: @landcover-font-size-bigger;
        text-wrap-width: @landcover-wrap-width-size-bigger;
        text-line-spacing: @landcover-line-spacing-size-bigger;
      }

      
      [feature = 'natural_scree'],
      [feature = 'natural_shingle'],
      [feature = 'natural_bare_rock'] {
        text-fill: white; //darken(@bare_ground, 30);
      }
      [feature = 'natural_sand'] {
        //text-fill: darken(@sand, 50);
      }
    }
  }

  [feature = 'highway_services'][is_building = 'no'],
  [feature = 'highway_rest_area'][is_building = 'no'] {
    [zoom >= @regional-item-zoom][way_pixels > @small-area],
    [zoom >= @minor-item-zoom] {
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

  [feature = 'natural_glacier'][zoom >= 8][way_pixels >= 2000] {
      text-name: "[name]";
      text-size: @medium-font-size ;
      text-wrap-width: @landcover-wrap-width-size;
      text-line-spacing: @landcover-line-spacing-size;
      text-fill: @hotel;
      text-face-name: @landcover-face-name;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: #CCE0E7;

      /*
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
      */
  }

  [feature = 'aeroway_helipad'][zoom >= 21] {
    text-name: "[name]";
    text-size: @standard-font-size - 1;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    text-fill: @airtransport;
    // text-dy: -10;
    text-face-name: @standard-font;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
  }

  [feature = 'aeroway_aerodrome']['int_access' = 'yes']['iata' != null][zoom >= @regional-item-zoom] [zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'yes'][zoom >= 12] [zoom < 17],
  [feature = 'aeroway_aerodrome']['int_access' = 'restricted'][zoom >= @major-item-zoom][zoom < 18],
  [feature = 'aeroway_aerodrome']['icao' = null][zoom >= @major-item-zoom][zoom < 18],
  [feature = 'aeroway_aerodrome']['iata' = null][zoom >= @major-item-zoom][zoom < 18] {
    [way_pixels > 1200],
    [way_pixels = null] {
      text-name: "[name]";
      text-size: @small-font-size+6;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @placenames;
      text-dy: 10;
      text-face-name: @oblique-fonts;
      
      

     [zoom >= 11]{
           text-size: @small-font-size+4;
     }
     [zoom >= @county-item-zoom]{
           text-size: @standard-font-size;
     }
    }
  }

  [feature = 'amenity_casino'][zoom >= @minor-item-zoom] {
    text-name: "[name]";
    text-fill: @amenity-color;
    text-size: @standard-font-size;
    text-wrap-width: @standard-wrap-width;
    text-line-spacing: @standard-line-spacing-size;
    // text-dy: 10;
    text-face-name: @standard-font;
    
    
  }

  [feature = 'highway_trailhead'] [zoom >= 14] {
      text-name: "[name]";
      text-fill:  @culture;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-dy: 11;
      text-face-name: @bold-fonts;
      
      
      text-size: @standard-font-size;
  }

  [feature = 'amenity_parking'],
  [feature = 'amenity_bicycle_parking'],
  [feature = 'amenity_motorcycle_parking'],
  [feature = 'amenity_parking_entrance']["parking"='underground'] {
    [zoom >= 21] {
      text-name: "[name]";
      text-size: @small-font-size;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
      text-fill: @culture; //@transportation-text;
      text-dy: 9;
      text-face-name: @standard-font;
      
      
      [int_access = 'restricted'] {
        text-opacity: @private-opacity;
        text-halo-radius: 0;
      }
      [feature = 'amenity_bicycle_parking'],
      [feature = 'amenity_motorcycle_parking'] { text-dy: 12; }
    }
  }
}

// GROUP BUILDING NAMES
/*
#building-text {

  [zoom >= 21][way_pixels > 2300]
   {
    text-fill: red; //@culture;
    text-allow-overlap: false;
    opacity: 1;
    text-name: "[name]";
    text-face-name: @book-fonts;
    text-size: @small-font-size + 1;
    text-wrap-width: 22; // 2.0 em
    text-line-spacing: -1.65; // -0.15 em

    [way_pixels > 2300] {
      opacity: 1;
      //text-fill: @culture;
      text-size: @standard-font-size - 1;
    }
  }
} */


// GROUP LINE
#amenity-line {
  // Ford tagging on ways
  [feature = 'highway_ford'][zoom >= 16] {
    marker-file: url('symbols/highway/ford.svg');
    marker-fill: blue; //@transportation-icon;
  }
  // Slipway tagging on ways
  [feature = 'leisure_slipway'][zoom >= 14] {
    marker-file: url('symbols/leisure/slipway.svg');
    marker-fill: @transportation-icon;
  }
}


// GROUP TREES
#trees [zoom >= @minor-item-zoom] {
  ::canopy {
    opacity: .6;
    [natural = 'tree_row'] {
      line-color: @tree-color;
      line-cap: round;
      line-width: 2.5;
      line-dasharray: 4,7;
      [zoom >= @minor-item-zoom] {
        line-width: 8;
      }
      [zoom >= @local-item-zoom] {
        line-width: 15;
      }
    }

    [natural = 'tree'] [zoom >= 21]  {
      opacity: .6;
      marker-fill: @tree-color;
      marker-allow-overlap: true;
      marker-line-width: 0;
      marker-ignore-placement: true;
      marker-width: 12;
      marker-height: 10;
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
}
