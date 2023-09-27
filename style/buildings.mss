// Building Fill

@building-line: darken(@building-fill, 15%);  // Lch(70, 9, 66)
@building-low-zoom: darken(@building-fill, 4%);

@building-major-fill: darken(@building-fill, 18%);  // Lch(75, 8, 67)
@building-major-line: darken(@building-major-fill, 20%);  // Lch(61, 13, 65)
@building-major-z15: darken(@building-major-fill, 16%);  // Lch(70, 9, 66)
@building-major-z14: darken(@building-major-fill, 16%);  // Lch(66, 11, 65)

@entrance-permissive: darken(@building-line, 15%);
@entrance-normal: @building-line;



// All buildings are filled above zoom level (with opacity)
// Some buildings are also filled in landcover.mss
// Museum, Transit, and Religious get special fill
#buildings {
  [zoom >= 15]    {
    polygon-fill: @building-low-zoom;
    polygon-clip: false;
    opacity: 0.6;
    [zoom >= 15] {
      polygon-fill: @building-fill;
      line-color: @building-line;
      line-width: 0;
      line-clip: false;
    }

    [building = 'museum'] {
      polygon-fill: @landmark-building-layer;
      line-width: .6;
      line-opacity: .6;
      line-color: @landmark-outline;
      line-pattern-file:url(img/line_solid_6.png);
      ::shadow {
        polygon-fill: #000;
        polygon-geometry-transform:translate(0,2);
        image-filters:agg-stack-blur(3,3);
        opacity:0.3;
      }
    }

    [building = 'temple'],
    [building = 'church'],
    [building = 'shrine'],
    [building = 'cathedral'],
    [building = 'mosque'],
    [building = 'gurdwara'],
    [building = 'synagogue'] {
      polygon-fill: @landmark-building-layer;
      [zoom >= 15] {
        line-width: .6;
        line-color: @landmark-outline;
        line-opacity: .6;
      }
    }

    [aeroway = 'terminal'],
    [aerialway = 'station'],
    [building = 'train_station'],
    [public_transport = 'station'] {
      polygon-fill: @building-transit;
      [zoom >= 15] {
        polygon-gamma: 0.2;
        line-color: @building-major-line;
      }
    }

    [building = 'transportation']{
      polygon-fill: @building-fill;
      [zoom >= 15] {
        polygon-gamma: 0.2;
        line-color: @building-major-line;
      }
    }
  }
}

#bridge {
  [zoom >= 12] {
    polygon-fill: #B8B8B8;
  }
}

#entrances {
  [zoom >= 18]["entrance" != null]  {
    marker-fill: @entrance-normal;
    marker-allow-overlap: true;
    marker-ignore-placement: true;
    marker-file: url('symbols/rect.svg');
    marker-width: 5.0;
    marker-height: 5.0;
    marker-opacity: 0.0;
    ["entrance" = "main"] {
      marker-opacity: 1.0;
      marker-file: url('symbols/square.svg');
    }
  }
  [zoom >= 19]["entrance" != null] {
    ["entrance" = "yes"],
    ["entrance" = "main"],
    ["entrance" = "home"],
    ["entrance" = "service"],
    ["entrance" = "staircase"] {
      marker-opacity: 1.0;
      marker-width: 6.0;
      marker-height: 6.0;
      ["entrance" = "service"] {
        marker-file: url('symbols/corners.svg');
      }
    }
    ["access" = "yes"],
    ["access" = "permissive"] {
      marker-fill: @entrance-permissive;
    }
    ["access" = "no"] {
      marker-fill: @entrance-normal;
      marker-file: url('symbols/rectdiag.svg');
    }
  }
  [zoom >= 20]["entrance" != null] {
    marker-width: 8.0;
    marker-height: 8.0;
  }
}
