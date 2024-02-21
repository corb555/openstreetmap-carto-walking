

// GROUP -Station markers and names

#stations {
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
    [zoom >= 16] {
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

  [railway = 'station'][zoom >= 12] {
    marker-file: url('symbols/square.svg');
    marker-fill: @transit;
    marker-clip: false;
    marker-width: 5;

    [zoom >= 8]  {
      marker-width: 5;
    }
    [zoom >= 10] {
      marker-width: 5;
    }
    [zoom >= 12] {
      marker-width: 6;
    }
    [zoom >= 15] {
      marker-width: 9;
      text-name: "[name]";
      text-face-name: @oblique-fonts;
      text-fill: @transit-text;
      text-size: @standard-font-size;
      text-wrap-width: 53; // 3 em
      text-line-spacing: -1.65; // -0.15 em
      text-dy: 12;
    }
    [zoom >= 16] {
      text-size: @standard-font-size;
      marker-width:10;
    }
    [zoom >= 17] {
      text-size: @standard-font-size;
      //marker-width:8;
    }
     [zoom >= 18] {
      text-size: @standard-font-size;
      //marker-width:9;
    }
  }

    [railway = 'tram_stop'] {
      [zoom >= 15] {
        marker-file: url('symbols/square.svg');
        marker-fill: @transit;
        marker-width: 6;
        marker-clip: false;
      }
      [zoom >= 16] {
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
      [zoom >= 17] {
        marker-width: 8;
      }
      [zoom >= 18] {
        marker-width: 10;
      }
  }

  [aerialway = 'station']::aerialway {
    [zoom >= 13] {
      marker-file: url('symbols/square.svg');
      marker-fill: darken(@aerialway-color,10);  //@transit_station;
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
