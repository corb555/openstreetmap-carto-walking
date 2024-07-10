

// GROUP - Station markers and names

#stations {
  // ENTRANCES
  [railway = 'subway_entrance'][zoom >= 17] {
    marker-file: url('symbols/amenity/entrance.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
    [zoom >= 21] {
      text-name: [ref];
      text-face-name: @bold-fonts;
      text-size: 15;
      text-fill: @transit-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
    }
    [zoom >= 18] {
      text-name: [ref];
      text-face-name: @bold-fonts;
      text-size: 14;
      text-fill: @transit-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
    }
  }

  // RAILWAY STATION
  [railway = 'station'][zoom >= 12] {
    marker-file: url('symbols/square.svg');
    marker-fill: @transit-text;
    marker-clip: false;
    marker-width: 4;

    [zoom >= 8]  {marker-width: 4;}
    [zoom >= 10] {marker-width: 4;}
    [zoom >= 12] {marker-width: 4;}

    [zoom >= 14] {
      marker-width: 7;

      text-transform: uppercase;
      text-name: "[name]";
      text-face-name: @oblique-fonts;
      text-fill: @transit-text;
      text-wrap-width: 53; // 3 em
      text-line-spacing: -1.65; // -0.15 em
      text-dy: 7;
      text-allow-overlap: false; //true;
      text-size: @standard-font-size - 1;
    }

    [zoom >= 15] {
      marker-width: 8;
      text-size: @standard-font-size;
    }

    [zoom >= 16] {
      marker-width:8;
      text-size: @standard-font-size + 2;
    }

    [zoom >= 17] {
      marker-width:8;
    }

  }

    [railway = 'tram_stop'] {
      [zoom >= 15] {
        marker-file: url('symbols/square.svg');
        marker-fill: @transit-text;
        marker-width: 6;
        marker-clip: false;
      }
      [zoom >= 21] {
        text-name: "[name]";
        text-face-name: @oblique-fonts;
        text-size: @standard-font-size - 3;
        text-fill: @transit-text;
        text-dy: 12;
        //text-halo-radius: @standard-halo-radius * 1.5;
        //text-halo-fill: @standard-halo-fill;
        text-wrap-width: @standard-wrap-width;
        text-line-spacing: @standard-line-spacing-size;
      }
  }

  [aerialway = 'station']::aerialway {
    [zoom >= 13] {
      marker-file: url('symbols/square.svg');
      marker-fill: @transit; // darken(@aerialway-color,10);  //@transit_station;
      marker-width: 4;
      marker-clip: false;
    }
    [zoom >= 15] {
      marker-width: 6;
    }
    [zoom >= 14] {
      text-name: "[name]";
      text-face-name: @book-fonts;
      text-size: @standard-font-size;
      text-fill: @transit-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
    }
  }
}
