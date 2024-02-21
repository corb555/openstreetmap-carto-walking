
@entrance-permissive: darken(@building-line, 15);
@entrance-normal: @building-line;

// Building Fill (building names are in Addressing and Amenity-Points)

// All buildings are filled when above zoom level below (with opacity)
// Some buildings are also filled in landcover.mss
// Museum, Transit, and Religious get special fill

#buildings {
  [zoom >= 16]    {
    polygon-fill: @building-low-zoom;
    polygon-clip: false;
    [zoom >= 16] {
       opacity: 1;
       polygon-fill: @building-fill;
    }
    [zoom >= 16] {
        line-width: .8;
        line-color: @building-line;
    }

    [building = 'museum'] {
      opacity: 1;
      polygon-fill: @landmark-building-layer;
      line-width: .6;
      line-opacity: .6;
      line-color: @landmark-outline;
      //line-pattern-file:url(img/line_solid_6.png);

    }

    [building = 'temple'],
    [building = 'church'],
    [building = 'shrine'],
    [building = 'cathedral'],
    [building = 'mosque'],
    [building = 'gurdwara'],
    [building = 'synagogue'] {
      opacity: 1;
      polygon-fill: @religious-building;
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
       opacity: 1;
       polygon-fill: @building-transit;
       [zoom >= 15] {
         polygon-gamma: 0.2;
         line-color: @building-major-line;
       }
    }

    [building = 'parking']{
      polygon-fill: lighten(@parking, 5);
      [zoom >= 15] {
        polygon-gamma: 0.2;
        line-color: @building-major-line;
      }
    }

    [building = 'transportation']{
       opacity: 1;
       polygon-fill: @building-fill;
       [zoom >= 15] {
         polygon-gamma: 0.2;
         line-color: @building-major-line;
       }
    }
  }
}

/*
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
} */
