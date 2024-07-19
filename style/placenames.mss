
@country-labels: @placenames;
@state-labels: @placenames;
@county-labels: @placenames;

// Calculations for font size based on population
@town_base: 15;
@town_mult: 0.00018;

@s_city_base: @city_base;
@s_city_mult: @city_mult;

@city_base: 24; // xyzzy 10;
@city_mult: 0.000008;

// zoom cutoffs by population
@pop_z4: 600000;
@pop_z5: 550000;
@pop_z6: 500000;
@pop_z7: 300000;
//@pop_z8: 180000;
@pop_z8: 400;
@pop_z9:  80000;
@pop_z10: 60000;
@pop_z11:  8000;

// todo this shouldnt be needed
@m-name-size-z4:  @m-name-size-z10 - 6;
@m-name-size-z6:  @m-name-size-z10 - 4;
@m-name-size-z8:  @m-name-size-z10 - 2;
@m-name-size-z10: 12;
@m-name-size-z12: @m-name-size-z10 + 2;
@m-name-size-z14: @m-name-size-z10 + 4;
@m-name-size-z16: @m-name-size-z10 + 6;

@s-name-size-z4:  @m-name-size-z4  * .6;
@s-name-size-z6:  @m-name-size-z6  * .6;
@s-name-size-z8:  @m-name-size-z8  * .6;
@s-name-size-z10: @m-name-size-z10 * .6;
@s-name-size-z12: @m-name-size-z12 * .6;
@s-name-size-z14: @m-name-size-z14 * .6;
@s-name-size-z16: @m-name-size-z16 * .6;

@l-name-size-z4:  @m-name-size-z4  * 2;
@l-name-size-z6:  @m-name-size-z6  * 2;
@l-name-size-z8:  @m-name-size-z8  * 2;
@l-name-size-z10: @m-name-size-z10 * 2;
@l-name-size-z12: @m-name-size-z12 * 2;
@l-name-size-z14: @m-name-size-z14 * 2;
@l-name-size-z16: @m-name-size-z16 * 2;

@xl-name-size-z4:  @m-name-size-z4  * 3;
@xl-name-size-z6:  @m-name-size-z6  * 3;
@xl-name-size-z8:  @m-name-size-z8  * 3;
@xl-name-size-z10: @m-name-size-z10 * 3;
@xl-name-size-z12: @m-name-size-z12 * 3;
@xl-name-size-z14: @m-name-size-z14 * 3;
@xl-name-size-z16: @m-name-size-z16 * 3;


/*
Score: is population if present, otherwise for 'city' it's 100,000
and for 'town'  it's 1000
*/

#placenames-medium::high-importance {
  // CITIES - Category 1 is city
  [category = 0][zoom < 15],
  [category = 1][zoom < 15]
   {
     [zoom >= 4] [score >= @pop_z4] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames_lowz;
      text-size: @city_base - 2 + [score] * 0.0000035 ;
      [score >= 2600000] {
        text-size: @city_base - 2  + [score] * 0.0000013 ;
        }
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
    }

    [zoom >= 5] [score >= @pop_z5] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: @city_base - 3 + [score] * @city_mult ;

      [score >= 2600000] {
      text-size: 13 + [score] * 0.0000011 ;
      }
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
    }

    [zoom >= 6] [score >= @pop_z6] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: @city_base - 2 + [score] * 0.000006 ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
    }

    [zoom >= 7] [score >= @pop_z7] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: @city_base + [score] * @city_mult ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      //text-halo-fill: @standard-halo-fill;
      //text-halo-radius: @standard-halo-radius;
    }

    [zoom >= 8] [score >= @pop_z8] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: @city_base + 3 + [score] * @city_mult ;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
      //text-halo-fill: @standard-halo-fill;
      //text-halo-radius: @standard-halo-radius;
    }

    [zoom >= 9] [score >= @pop_z9] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: @city_base + [score] * @city_mult ;
      text-wrap-width: 40; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
      //text-halo-fill: @standard-halo-fill;
      //text-halo-radius: @standard-halo-radius;
    }

    [zoom >= 10] [score >= @pop_z10] {
       text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: @city_base + 4 + [score] * @city_mult ;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
    }

    [zoom >= 11] [score >= @pop_z11] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 18 + [score] * @city_mult ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      //text-halo-fill: @standard-halo-fill;
      //text-halo-radius: @standard-halo-radius;
    }
  }
}

// small cities
#placenames-medium::medium-importance {
  [category = 1][score < 4000][zoom < 15] {
      [zoom >= 8] [score > @pop_z8]{
      text-name: "[name]";
      text-face-name: @book-fonts;
      text-size: @s_city_base + [score] * @s_city_mult ;
      text-fill: red; //@placenames_lowz;
      text-wrap-width: 40; // 4.0 em
      text-line-spacing: -1.0; // -0.10 em
      text-margin: 7.0; // 0.7 em
      }
    [zoom >= 9] [score > @pop_z9]{
      text-name: "[name]";
      text-face-name: @book-fonts;
      text-size: @s_city_base + [score] * @s_city_mult ;
      text-fill: @placenames;
      text-wrap-width: 40; // 4.0 em
      text-line-spacing: -1.0; // -0.10 em
      text-margin: 7.0; // 0.7 em
      }

    [zoom >= 10] [score > @pop_z10] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: @s_city_base + [score] * @s_city_mult ;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 9.1; // 0.7 em
      }

    [zoom >= 12] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: @s_city_base + [score] * @s_city_mult ;
        text-wrap-width: 70; // 5.0 em
        text-line-spacing: -0.7; // -0.05 em
        text-margin: 9.8; // 0.7 em
      }

     [zoom >= 14] {
        text-name: '[name]';
        text-fill: @placenames;
        text-face-name: @book-fonts;
        text-size: @s_city_base + [score] * @s_city_mult ;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.7; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
  }
}

// towns
#placenames-medium::low-importance {
  [category = 2] {

    [zoom >= 8][zoom < 16]  {
      text-allow-overlap: false;
      text-name: "[name]";
      text-size: @town_base + [score] * @town_mult ;
      text-fill: @placenames_lowz;
      text-face-name: @book-fonts;
      text-wrap-width: 45; // 4.5 em
      text-line-spacing: -0.8; // -0.08 em
      text-margin: 7; // 0.7 em

      [zoom >= 11] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: @town_base + [score] * @town_mult ;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }

      [zoom >= 12] {
        text-size: @town_base + [score] * @town_mult ;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }
      [zoom >= 14] {
      text-fill: @placenames;
        text-size: @town_base + [score] * @town_mult ;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.75; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
    }
  }
}

@name-size-z12: 12;
@name-size-z14: 17;
@name-size-z16: 22;

// Neighborhood, Suburb
#placenames-small::suburb {
  [place = 'suburb'][zoom >= 14][zoom < 17] {
    text-transform: uppercase;
    text-name: "[name]";
    text-size: @name-size-z12 + 3;
    text-fill: @placenames;
    text-opacity: 1;
    text-face-name: @oblique-fonts;
    text-wrap-width: 55; // 5.0 em
    //text-line-spacing: -0.55; // -0.05 em
    //text-margin: 7.7; // 0.7 em
    [zoom >= 14] {
      text-size: @name-size-z14  ;
      text-wrap-width: 60; // 5.0 em
      //text-line-spacing: -0.60; // -0.05 em
      //text-margin: 8.4; // 0.7 em
    }
    [zoom >= 16] {
      text-size: @name-size-z16 + 2;
      text-wrap-width: 75; // 5.0 em
      //text-line-spacing: -0.75; // -0.05 em
      //text-margin: 10.5; // 0.7 em
    }
  }
}

#placenames-small::village {
  [place = 'village'] {
    [zoom >= 11][zoom < 17] {
      text-name: "[name]";
      text-size: 13;
      text-fill: @placenames_lowz;
      text-face-name: @oblique-fonts;
      text-wrap-width: 50; // 5.0 em
      text-line-spacing: -0.50; // -0.05 em
      text-margin: 7.0; // 0.7 em
      [zoom >= 13] {
        text-size: 11;
        text-fill: @placenames;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom >= 14] {
        text-size: 15;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 9.1; // 0.7 em
      }
      [zoom >= 15] {
        text-size: 16;
        text-wrap-width: 70; // 5.0 em
        text-line-spacing: -0.70; // -0.05 em
        text-margin: 9.8; // 0.7 em
      }
      [zoom >= 16] {
        text-size: 16;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.75; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
    }
  }
}


#placenames-small::quarter {
  [place = 'quarter'] {
    [zoom >= 15][zoom < 17] {
      text-name: "[name]";
      text-fill: @placenames;
      text-face-name: @oblique-fonts;
      [zoom >= 16] {
        text-size: @name-size-z16 - 4;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
    }
  }
  [place = 'hamlet'] {
    [zoom >= 11][zoom < 18] {
      text-name: "[name]";
      text-fill: @placenames;
      text-face-name: @oblique-fonts;
      [zoom >= 14] {
        text-size: 10;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom >= 15] {
        text-size: 11;
        text-wrap-width: 45; // 4.5 em
        text-line-spacing: -0.8; // -0.08 em
        text-margin: 7.0; // 0.7 em
      }
      [zoom >= 16] {
        text-size: 15;
        text-wrap-width: 60; // 5.0 em
        text-line-spacing: -0.60; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }
    }
  }
}

#placenames-small::neighborhood {
  [place = 'neighbourhood'][zoom >= 15][zoom < 20],
  [place = 'isolated_dwelling'][zoom >= 15],
  [place = 'farm'][zoom >= 14] {
    text-name: "[name]";
    text-size: 16;
    text-fill: @placenames;
    text-face-name: @oblique-fonts;
    //text-halo-fill: @standard-halo-fill;
    //text-halo-radius: @standard-halo-radius;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= 17] {
      text-size: 16;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
      text-halo-fill: @standard-halo-fill;
    }
  }
}

#protected-areas-text[zoom >= 21] {
  text-name: "[name]";
  text-face-name: @book-fonts;
  text-fill: @protected-area;
  [boundary='aboriginal_lands'] {
    text-fill: @aboriginal;
  }
  text-halo-radius: @standard-halo-radius;
  text-halo-fill: @standard-halo-fill;
  text-largest-bbox-only: false;
  text-placement: line;
  text-spacing: 750;
  text-repeat-distance: 250;
  text-margin: 10;
  text-clip: true;
  text-vertical-alignment: middle;
  text-dy: -10;
}

