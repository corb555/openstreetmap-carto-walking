@water-text: lighten(@water-color, 60);
@water-halo-fill: @water-color;
@glacier: #ddecec;
@glacier-line: #9cf;
@waterway-text-repeat-distance: 200;
@int-water: #A6C7D8;

#water-areas {
  [natural = 'glacier']::natural {
    [zoom >= 7] {
      polygon-fill: @glacier;
      polygon-opacity: .5;
    }
  }

  // Water polygons - lakes, rivers
  [waterway = 'dock'],
  [landuse = 'basin'],
  [natural = 'water'],
  [natural = 'lake'],
  [landuse = 'reservoir'],
  [waterway = 'river'],
  [waterway = 'riverbank'] {
    [int_intermittent = 'no'] [zoom >= 8] {
      polygon-fill:  @river-color;
      polygon-opacity:1;
      [way_pixels >= 4] { polygon-gamma: 0.75; }
      [way_pixels >= 64] { polygon-gamma: 0.6; }

    }
    [int_intermittent = 'yes'] [zoom >= 11] {
      polygon-fill: @int-water;
      polygon-opacity: .7;
    }
    //[water = 'wastewater'] {
    //polygon-fill:  red;
    //}
  }
}

#water-lines-low-zoom {
  [waterway = 'river'][zoom >= 7][zoom < 12] {
    [int_intermittent = 'yes'][zoom >= 11] {
      line-dasharray: 8,4;
      line-cap: butt;
      line-join: round;
      line-clip: false;
      line-color:  @int-water;
    }

    line-color:  @river-color;
    line-width: 1.7;
    line-opacity: .5;
    [zoom >= 9] { line-width: 1.4; }
    [zoom >= 10] { line-width: 1.5; }
    [zoom >= 11] {
       line-width: 1.9;
       line-opacity: .6;
       }
    [zoom >= 15] {
       line-opacity:1;
       line-color: @river-color;
    }
  }
}

#water-lines,
#waterway-bridges {
  [waterway = 'canal'][zoom >= 12],
  [waterway = 'river'][zoom >= 12] {
    // the additional line of land color is used to provide a background for dashed casings
    [int_tunnel = 'yes'] {
      background/line-color: #69709A; //@land-color;
      background/line-width: 2;
      background/line-cap: round;
      background/line-join: round;
    }

    [bridge = 'yes'] {
      [zoom >= 14] {
        bridgecasing/line-color: gray;
        bridgecasing/line-join: round;
        bridgecasing/line-width: 6;
        [zoom >= 15] { bridgecasing/line-width: 7; }
        [zoom >= 17] { bridgecasing/line-width: 11; }
        [zoom >= 18] { bridgecasing/line-width: 13; }
      }
    }

    water/line-color: @river-color;
    water/line-width: 1.7;
    water/line-cap: round;
    water/line-join: round;

    [int_intermittent = 'yes'] [zoom >= 11]{
      [bridge = 'yes'][zoom >= 14] {
        water/line-color: @int-water;
        water/line-opacity: .6;
        bridgefill/line-color: white;
        bridgefill/line-join: round;
        bridgefill/line-width: 4;
        [zoom >= 15] { bridgefill/line-width: 5; }
        [zoom >= 17] { bridgefill/line-width: 9; }
        [zoom >= 18] { bridgefill/line-width: 11; }
      }
      water/line-color: @int-water;
      water/line-dasharray: 4,3;
      water/line-cap: butt;
      water/line-join: round;
      water/line-clip: false;
    }

    [zoom >= 13] { water/line-width: 3; }
    [zoom >= 14] { water/line-width: 5; }
    [zoom >= 15] { water/line-width: 6; }
    [zoom >= 17] { water/line-width: 10; }
    [zoom >= 18] { water/line-width: 12; }

    [int_tunnel = 'yes'] {
      [zoom >= 13] { background/line-width: 3; }
      [zoom >= 14] { background/line-width: 5; }
      [zoom >= 15] { background/line-width: 6; }
      [zoom >= 17] { background/line-width: 10; }
      [zoom >= 18] { background/line-width: 12; }

      water/line-dasharray: 4,2;
      background/line-cap: butt;
      background/line-join: miter;
      water/line-cap: butt;
      water/line-join: miter;
      tunnelfill/line-color: #69709A; // orange; //#f3f7f7;
      tunnelfill/line-width: 1;
      [zoom >= 14] { tunnelfill/line-width: 2; }
      [zoom >= 15] { tunnelfill/line-width: 3; }
      [zoom >= 17] { tunnelfill/line-width: 7; }
      [zoom >= 18] { tunnelfill/line-width: 8; }
    }
  }

  [waterway = 'stream'],
  [waterway = 'ditch'],
  [waterway = 'drain'] {
    [int_intermittent != 'yes'][zoom >= 14],
    [zoom >= 17] {
       //water/line-width: 1.6;
      // the additional line of land color is used to provide a background for dashed casings
      [int_tunnel = 'yes'] {
        background/line-width: 0;
        background/line-color:@stream-color;
      }
      water/line-color: @stream-color;
      water/line-opacity: .8;
      water/line-width: 1.9;

      [bridge = 'yes'] {
        bridgecasing/line-color: gray;
        bridgecasing/line-join: round;
        bridgecasing/line-width: 4;
        [waterway = 'stream'][zoom >= 15] { bridgecasing/line-width: 4; }
        bridgeglow/line-color: white;
        bridgeglow/line-join: round;
        bridgeglow/line-width: 3;
        [waterway = 'stream'][zoom >= 15] { bridgeglow/line-width: 3; }
      }

      [int_intermittent = 'yes'] [zoom >= 14]{
        water/line-dasharray: 2,4;
        water/line-width: 3;
        water/line-cap: butt;
        water/line-join: round;
        water/line-clip: false;
        water/line-color: darken(@int-water,10);
      }

      [int_tunnel = 'yes'][zoom >= 15] {
        background/line-width: 0; //3.5;
        water/line-width: 2; //3.5;
        [waterway = 'stream'] {
          background/line-width: 0;//4.5;
          water/line-width: 0;//4.5;
        }
        water/line-dasharray: 4,2;
        tunnelfill/line-width: 0;//1;
        [waterway = 'stream'] { tunnelfill/line-width: 0; }
        tunnelfill/line-color: #f3f7f7;
      }
    }
  }
}

#water-lines-text {
  [lock = 'yes'][zoom >= 17] {
      text-name: "[lock_name]";
      text-face-name: @oblique-fonts;
      text-placement: line;
      text-fill: @water-text;
      text-spacing: 1600;
      text-size: 10;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @standard-halo-fill;
  }

  [lock != 'yes'][int_tunnel != 'yes'] {
    [waterway = 'river'][zoom >= 7] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-spacing: 1600;
      text-placement: line;
      text-repeat-distance: @waterway-text-repeat-distance;
      [zoom >= 14] { text-size: 12; }
    }

    [waterway = 'canal'][zoom >= 13] {
      text-name: "[name]";
      text-size: 10;
      text-face-name: @oblique-fonts;
      text-fill: @water-text;
      text-halo-radius: @standard-halo-radius;
      text-halo-fill: @water-halo-fill;
      text-placement: line;
      text-repeat-distance: @waterway-text-repeat-distance;
    }

    [waterway = 'stream'][zoom >= 14] {
      text-name: "[name]";
      text-size: 11;
      text-face-name: @oblique-fonts;
      text-fill: @water-color;
      //text-halo-radius: @standard-halo-radius;
      //text-halo-fill: @water-halo-fill;
      text-spacing: 600;
      text-placement: line;
      text-vertical-alignment: middle;
      text-dy: 8;
      text-repeat-distance: @waterway-text-repeat-distance;
    }

    [waterway = 'drain'],
    [waterway = 'ditch'] {
      [zoom >= 15] {
        text-name: "[name]";
        text-size: 10;
        text-face-name: @oblique-fonts;
        text-fill: @water-text;
        text-halo-radius: @standard-halo-radius;
        text-halo-fill: @water-halo-fill;
        text-spacing: 600;
        text-placement: line;
        text-vertical-alignment: middle;
        text-dy: 8;
        text-repeat-distance: @waterway-text-repeat-distance;
      }
    }
  }
  [natural = 'bay'][zoom >= 10],
  [natural = 'strait'][zoom >= 10] {
    text-name: "[name]";
    text-size: 12;
    text-face-name: @oblique-fonts;
    text-fill: @water-text;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @water-halo-fill;
    text-max-char-angle-delta: 15;
    text-spacing: 400;
    text-placement: line;
    [zoom >= 15] {
      text-size: 12;
    }
  }
}


#text-poly-low-zoom[zoom < 10],
#text-point[zoom >= 10] {

  [feature = 'natural_lake'],
  [feature = 'natural_water'],
  [feature = 'landuse_reservoir'],
  [feature = 'landuse_basin'],
  [feature = 'waterway_dock'],
  [feature = 'natural_strait'],
  [feature = 'natural_bay'] {
    [zoom >= 5] [way_pixels > 12000],
    [zoom >= 16] ,
    [zoom >= 14] [way_pixels > 1200]{
      text-fill: @water-text;
      text-name: "[name]";
      text-size: 10;
      text-wrap-width: 15; // 2.5 em
      text-line-spacing: -1.5; // -0.15 em
      text-face-name: @oblique-fonts;
      text-placement: interior;

      [way_pixels > 1500] {
            text-size: 12;
      }

      [way_pixels > 12000]{
        text-size: 12;
        text-wrap-width: 15; // 3.1 em
        text-line-spacing: -1.6; // -0.13 em
      }

      [way_pixels > 48000] {
      text-fill: @water-text;
        text-size: 15;
        text-wrap-width: 15; // 3.9 em
        text-line-spacing: -1.5; // -0.10 em
      }

      [way_pixels > 192000] {
        text-size: 20;
        text-wrap-width: 15; // 5.0 em
        text-line-spacing: -0.95; // -0.05 em
      }
    }
  }
}
