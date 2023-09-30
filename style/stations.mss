@transit_station:  #86649A;
@station-text: @transit_station;

// GROUP -Station markers and names

#stations {
  [railway = 'subway_entrance'][zoom >= 17] {
    marker-file: url('symbols/amenity/entrance.svg');
    marker-fill: @transportation-icon;
    marker-clip: false;
      [zoom >= 16] {
      text-name: [ref];
      text-face-name: @bold-fonts;
      text-size: 15;
      text-fill: @transportation-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
    }
    [zoom >= 16] {
      text-name: [ref];
      text-face-name: @bold-fonts;
      text-size: 14;
      text-fill: @transportation-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: 0;
    }
  }

  [railway = 'station'][zoom >= 10] {
    marker-file: url('symbols/square.svg');
    marker-fill: @transit;
    marker-clip: false;

    [station != 'subway'] {
      marker-width: 9;
    }

    [zoom >= 13][station = 'subway'] {
      marker-width: 7;
    }

    [zoom >= 15] {
      text-name: "[name]";
      text-face-name: @oblique-fonts;
      marker-width: 7;
      text-fill: @transit;
      text-size: 15;
      text-wrap-width: 33; // 3 em
      text-line-spacing: -1.65; // -0.15 em
      text-dy: 13;
    }

    [zoom >= 17] {
      marker-width: 9;
      text-size: 13;
      text-wrap-width: 33; // 3 em
      text-line-spacing: -1.65; // -0.15 em
      text-dy: 10;
    }
  }

    [railway = 'tram_stop'] {
    [zoom >= 15] {
      marker-file: url('symbols/square.svg');
      marker-fill: @transit_station;
      marker-width: 6;
      marker-clip: false;
    }
    [zoom >= 16] {
      text-name: "[name]";
              text-face-name: @oblique-fonts;
      text-size: @standard-font-size;
      text-fill: @station-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
    }
  }

  [aerialway = 'station']::aerialway {
    [zoom >= 13] {
      marker-file: url('symbols/square.svg');
      marker-fill: @transit_station;
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
      text-fill: @station-text;
      text-dy: 10;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-halo-fill: @standard-halo-fill;
      text-wrap-width: @standard-wrap-width;
      text-line-spacing: @standard-line-spacing-size;
    }
  }
}
