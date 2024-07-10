
@entrance-permissive: darken(@building-line, 15);
@entrance-normal: @building-line;

// Building Fill (building names are in Addressing and Amenity-Points)

// All buildings are filled when above zoom level below (with opacity)
// Some buildings are also filled in landcover.mss
// Museum, Transit, and Religious get special fill

@build-zoom: 16;

#buildings {
  [zoom >= @build-zoom]    {
    // STANDARD BUILDING

    /*
    [zoom >= 16] [building = 'apartments']  ,
    [zoom >= @build-zoom] [building = 'dormitory']  ,
    [zoom >= @build-zoom] [building = 'cathedral']  ,
    [zoom >= 16] [building = 'hotel']  ,
    [zoom >= 16] [tourism = 'hotel'] ,
    [zoom >= @build-zoom] [building = 'retail']  ,
    [zoom >= @build-zoom] [building = 'barn']  ,
    [zoom >= @build-zoom] [building = 'industrial']  ,
    [zoom >= @build-zoom] [building = 'commercial']  ,
    [zoom >= @build-zoom] [building = 'residential']  ,
    [zoom >= 16] [building = 'hangar']  ,
    [zoom >= @build-zoom] [building = 'house'] ,
    [zoom >= @build-zoom] [building = 'church']  ,
    [zoom >= @build-zoom] [building = 'government']  ,
    [zoom >= @build-zoom] [building = 'public']  ,
    [zoom >= @build-zoom] [building = 'office']  ,
    [zoom >= @build-zoom] [building = 'yes']    {
    */

    // Any building
    [zoom >= @build-zoom] [building =~ '\w+']    {
       polygon-clip: false;

       [building = 'yes'] ,
       [building = 'house'] {
         polygon-fill: @building-fill;
         line-color: darken(@building-fill, 7);
         line-width: .8;
         }

       [building = 'barn']    {
              polygon-fill: #D4CCBB;
              line-color: darken(#D4CCBB, 15);
              }

       // Zoom  use different colors based on type
       [building != 'yes'] [building != 'house'] {
           line-width: .8;
           polygon-fill: @building-fill;
           line-color: darken(@building-fill, 7);

          [building = 'industrial'] {
             polygon-fill: darken(@industrial, 8);
             line-color: darken(@industrial, 20);
          }

          [building = 'church']  ,
          [building = 'cathedral']  ,
          [building = 'hotel']  ,
          [tourism = 'hotel']    {
            polygon-fill: darken(@building-fill, 2);
            line-color: darken(@building-fill, 15);
          }
       }

       [ruins = 'yes'] {
          line-width: .6;
          line-color: #6A6A6A;
          }

    }

    // LANDMARK
    [amenity = 'stock_exchange'] ,
    [amenity = 'theatre'] ,
    [amenity = 'events_venue'] ,
    [amenity = 'arts_centre'] ,
    [amenity = 'exhibition_centre'] ,
    [amenity = 'conference_centre'],
    [tourism = 'information'] ,
    [tourism = 'museum'] ,
    [tourism = 'attraction'] ,
    [tourism = 'gallery'] ,
    [building = 'university'] ,
    [building = 'college'] ,
    [building = 'school'] ,
    [building = 'stadium'] ,
    [building = 'hospital'] ,
    [amenity = 'townhall'] ,
    [building = 'museum']
       {
       building-fill: @landmark;
       building-height: 2;
       [building = 'hospital']      {
         building-fill: @hospital-fill;
       }
    }

    [amenity = 'parking'] [zoom >= 17] ,
    [building = 'parking'] [zoom >= 17]
       {
       building-fill: @garages;
       building-height: 1;
    }

    // SHIP
    [building = 'ship'] {
        polygon-fill: white;
        line-width: .6;
        line-color: @landmark-outline;
        line-opacity: 1;
    }

    // TRANSIT BUILDING
    [aeroway = 'terminal'],
    //[building = 'transportation'],
    [building = 'train_station'],
    [public_transport = 'station'] {
       [location != 'underground'] {
           building-fill: @building-transit;
           building-height: 3;
       }
       [location = 'underground'] {
               polygon-fill: lighten(desaturate(@building-transit, 1), 20);
       }
    }
  }
}
