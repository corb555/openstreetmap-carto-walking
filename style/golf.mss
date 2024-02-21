
@golf_course: #B6C69D;

#landcover[zoom >= 12] {
  ::high-zoom[zoom >= 12] {
    [feature = 'golf_tee'],
    [feature = 'golf_fairway'],
    [feature = 'golf_rough'],
    [feature = 'golf_driving_range'] {
      polygon-opacity: @fill-opacity;
      polygon-fill: @golf_course;
    }
  }
  ::high-zoom[zoom >= 13] {
    [feature = 'golf_green'] {
      polygon-opacity: @fill-opacity;
      polygon-fill: @golf_course;
    }
    [feature = 'golf_bunker'] {
      polygon-fill: @sand;
    }
  }
  ::high-zoom[zoom >= 15] {
    [feature = 'golf_rough'] {
      polygon-pattern-file: url('symbols/golf_rough.svg');
    }
  }
}

#golf-line[zoom >= 16] {
  [golf = 'hole'] {
    line-color: @golf_course;
    line-width: 0.5;
  }
}

#text-line[zoom >= 16] {
  [feature = 'golf_hole'][ref != ''],
  [feature = 'golf_hole'][name != ''] {
    text-placement: line;
    text-size: 11;
    text-fill: @golf_course;
    text-face-name: @book-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-name: "[ref]";

    [name != ''] { text-name: "[name]"; }

    [zoom >= 17] { text-size: 13; }
  }
}

#amenity-points[zoom >= 16] {
  [feature = 'golf_pin'] {
    marker-file: url('symbols/leisure/golf_pin.svg');
    marker-fill: @golf_course;
    marker-clip: false;
  }
}

#text-point[zoom >= 17] {
  [feature = 'golf_pin'][ref != ''] {
    text-name: "[ref]";
    text-size: @standard-font-size;
    text-fill: @golf_course;
    text-face-name: @book-fonts;
    text-halo-radius: @standard-halo-radius;
    text-halo-fill: @standard-halo-fill;
    text-horizontal-alignment: middle;
    text-dx: 1;
    text-dy: 6;
  }
}
