/* Features related to (postal) addresses: */

@address-color: #272EB6;

#interpolation {
  [zoom >= 22] {
    line-color: @address-color;
    line-width: 1;
    line-dasharray: 2,4;
  }
}

#addresses {
  [zoom >= 25] {
    text-name: "[addr_housename]";
    ["addr_housenumber" != null] {
      text-name: [addr_housenumber];
      ["addr_housename" != null] {
        text-name: [addr_housenumber] + "\n" + [addr_housename];
      }

    }
    text-face-name: @book-fonts;
    text-fill: @address-color;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-size: 10;
    text-wrap-width: 30; // 3.0 em
    text-line-spacing: -1.5; // -0.15 em
    text-margin: 3; // 0.3 em
    [zoom >= 25] {
      text-halo-radius: @standard-halo-radius * 1.25;
      ["addr_unit" != null]["addr_housenumber" = null] {
        text-name: [addr_unit];
      }
      ["addr_flats" != null]["addr_housenumber" = null] {
        text-name: [addr_flats];
      }
      ["addr_unit" != null] {
        text-name: [addr_housenumber] + " " + [addr_unit];
        ["addr_housename" != null] {
          text-name: [addr_housenumber] + " " + [addr_unit] + "\n" + [addr_housename];
        }
      }
      ["addr_flats" != null] {
        text-name: [addr_housenumber] + " " + [addr_flats];
        ["addr_housename" != null] {
          text-name: [addr_housenumber] + " " + [addr_flats] + "\n" + [addr_housename];
        }
      }
    }
    [zoom >= 25] {
        text-size: 11;
        text-wrap-width: 22; // 2.0 em
        text-line-spacing: -1.65; // -0.15 em
        text-margin: 3.3; // 0.3 em
    }
  }
}

/* Building names  */

#building-text {
  [zoom >= 14][zoom <= 19]  [name != null][way_pixels > 700]
  [zoom >= 18] [name != null]
   {
    text-allow-overlap: false;
    opacity: .7;
    text-name: "[name]";
    text-face-name: @book-fonts;
    text-fill: red; //@culture;
    text-size: 12;
    text-wrap-width: 22; // 2.0 em
    text-line-spacing: -1.65; // -0.15 em
  }
}
