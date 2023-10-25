
@country-labels: orange; //lighten(@placenames, 15);
@state-labels: orange; //lighten(@placenames, 15);
@county-labels: orange; //lighten(@placenames, 15);

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

#country-names {
  [zoom >= 3][zoom < 5][way_pixels > 1000],
  [zoom >= 5][zoom < 7] {
    text-name: "[name]";
    text-size: @m-name-size-z8;
    text-wrap-width: 35; // 3.5 em
    text-line-spacing: -1.5; // -0.15 em
    text-margin: 7.0; // 0.7 em
    [zoom >= 4] {
      text-size: 11;
      text-wrap-width: 40; // 3.6 em
      text-line-spacing: -1.4; // -0.13 em
      text-margin: 7.7; // 0.7 em
    }
    [zoom >= 5] {
      text-size: @l-name-size-z6;
      text-wrap-width: 45; // 3.7 em
      text-line-spacing: -1.2; // -0.10 em
      text-margin: 8.4; // 0.7 em
    }
    [zoom >= 6] {
      text-size: @xl-name-size-z6;
      text-wrap-width: 45; // 3.7 em
      text-line-spacing: -1.2; // -0.10 em
      text-margin: 8.4; // 0.7 em
    }
    text-fill: @country-labels;
    text-face-name: @oblique-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-character-spacing: 0.5;
  }
}

#capital-names {
  [zoom >= 5][zoom < 8][population > 600000] {
        shield-file: url('symbols/place/place-capital-6.svg');
  [zoom < 7] {
      shield-file: url('symbols/place/place-capital-6.svg');
      shield-face-name: @book-fonts;
      shield-text-dx: 6;
      shield-text-dy: 6;
      shield-name: '[name]';
      shield-fill: @placenames;
      shield-size: 11;
      shield-wrap-width: 30; // 2.7 em
      shield-line-spacing: -1.6; // -0.15 em
      shield-margin: 7.7; // 0.7 em
      shield-halo-fill: @standard-halo-fill;
      shield-halo-radius: @standard-halo-radius * 1.5;
      shield-placement-type: simple;
      shield-placements: 'S,N,E,W';
      [dir = 1] {
        shield-placements: 'N,S,E,W';
      }
      shield-unlock-image: true;
    }

    [zoom >= 5]   {
      shield-file: url('symbols/place/place-capital-6.svg');
      shield-face-name: @book-fonts;
      shield-wrap-width: 45; // 4.1 em
      shield-line-spacing: -1.1; // -0.10 em
    }
    [zoom >= 6]   {
      shield-file: url('symbols/place/place-capital-6.svg');
      shield-face-name: @book-fonts;
      shield-size: 12;
      shield-wrap-width: 60; // 5.0 em
      shield-line-spacing: -0.6; // -0.05 em
      shield-margin: 8.4; // 0.7 em
    }
  }
}

/*
Score: is population if present, otherwise for 'city' it's 100,000
                    and for 'town'  it's 1000
*/

#placenames-medium::high-importance {
  // Category 1 is city
  [category = 1][zoom < 14] {
     [zoom >= 4] [score >= 400000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 4 + [score] * 0.000008 ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }

    [zoom >= 5] [score >= 350000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 4 + [score] * 0.000008 ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }

    [zoom >= 6] [score >= 200000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 4 + [score] * 0.000008 ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }

    [zoom >= 7] [score >= 200000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 7 + [score] * 0.000008 ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }

    [zoom >= 8] [score >= 180000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 9 + [score] * 0.000008 ;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }

    [zoom >= 9] [score >= 80000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 10 + [score] * 0.000008 ;
      text-wrap-width: 40; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }

    [zoom >= 10] [score >= 80000] {
       text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 12 + [score] * 0.000008 ;
      text-wrap-width: 70; // 5.0 em
      text-line-spacing: -0.7; // -0.05 em
      text-margin: 9.8; // 0.7 em
    }

    [zoom >= 11] [score >= 8000] {
      text-name: '[name]';
      text-face-name: @book-fonts;
      text-fill: @placenames;
      text-size: 14 + [score] * 0.000008 ;
      text-wrap-width: 65; // 5.0 em
      text-line-spacing: -0.65; // -0.05 em
      text-margin: 9.1; // 0.7 em
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
    }
  }
}

#placenames-medium::medium-importance {
  [category = 1][score < 4000][zoom < 15] {
    [zoom >= 9] [score > 30000]{
      text-name: "[name]";
      text-face-name: @book-fonts;
      text-size: 6 + [score] * 0.000008 ;
      text-fill: @placenames;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 40; // 4.0 em
      text-line-spacing: -1.0; // -0.10 em
      text-margin: 7.0; // 0.7 em
      }

    [zoom >= 9] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: 6 + [score] * 0.000008 ;
        text-wrap-width: 60; // 5.0 em
        text-line-spacing: -0.6; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }

    [zoom >= 10] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: 6 + [score] * 0.000008 ;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 9.1; // 0.7 em
      }

    [zoom >= 12] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: 6 + [score] * 0.000008 ;
        text-wrap-width: 70; // 5.0 em
        text-line-spacing: -0.7; // -0.05 em
        text-margin: 9.8; // 0.7 em
      }

     [zoom >= 14] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: 6 + [score] * 0.000008 ;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.7; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
  }
}


#placenames-medium::low-importance {
  [category = 2] {
    [zoom >= 10][zoom < 16] [score > 20000] {
      text-name: "[name]";
      //text-size: 15;
      text-size: 10 + [score] * 0.000008 ;

      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 45; // 4.5 em
      text-line-spacing: -0.8; // -0.08 em
      text-margin: 7; // 0.7 em

      [zoom >= 11] {
        text-name: '[name]';
        text-face-name: @book-fonts;
        text-size: 12 + [score] * 0.000008 ;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }

      [zoom >= 12] {
      text-size: 12 + [score] * 0.000008 ;
        text-wrap-width: 65; // 5.0 em
        text-line-spacing: -0.65; // -0.05 em
        text-margin: 8.4; // 0.7 em
      }
      [zoom >= 14] {
        text-size:  12 + [score] * 0.000008 ;
        text-wrap-width: 75; // 5.0 em
        text-line-spacing: -0.75; // -0.05 em
        text-margin: 10.5; // 0.7 em
      }
    }
  }
}

@name-size-z12: 12;
@name-size-z14: 19;
@name-size-z16: 22;

#placenames-small::suburb {
  [place = 'suburb'][zoom >= 11][zoom < 17] {
    text-name: "[name]";
    text-size: @name-size-z12;
    text-fill: @placenames;
    text-face-name: @oblique-fonts;
    text-halo-fill: white; //@standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 55; // 5.0 em
    text-line-spacing: -0.55; // -0.05 em
    text-margin: 7.7; // 0.7 em
    [zoom >= 14] {
      text-size: @name-size-z14 - 3;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
    }
    [zoom >= 16] {
      text-size: @name-size-z16+4;
      text-wrap-width: 75; // 5.0 em
      text-line-spacing: -0.75; // -0.05 em
      text-margin: 10.5; // 0.7 em
    }
  }
}

#placenames-small::village {
  [place = 'village'] {
    [zoom >= 12][zoom < 17] {
      text-name: "[name]";
      text-size: 12;
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      text-wrap-width: 50; // 5.0 em
      text-line-spacing: -0.50; // -0.05 em
      text-margin: 7.0; // 0.7 em
      [zoom >= 13] {
        text-size: 11;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom >= 14] {
        text-halo-fill: white;
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
    [zoom >= 16][zoom < 18] {
      text-name: "[name]";
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-fill: @standard-halo-fill;
      text-halo-radius: @standard-halo-radius * 1.5;
      [zoom >= 16] {
        text-halo-fill: white;
        text-size: @name-size-z16 - 4;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
    }
  }
  [place = 'hamlet'] {
    [zoom >= 14][zoom < 18] {
      text-name: "[name]";
      text-fill: @placenames;
      text-face-name: @book-fonts;
      text-halo-fill: white;
      text-halo-radius: @standard-halo-radius * 1.5;
      [zoom >= 14] {
        text-size: 10;
        text-wrap-width: 55; // 5.0 em
        text-line-spacing: -0.55; // -0.05 em
        text-margin: 7.7; // 0.7 em
      }
      [zoom >= 15] {
        text-size: 11;
        text-halo-fill: @standard-halo-fill;
        text-wrap-width: 45; // 4.5 em
        text-line-spacing: -0.8; // -0.08 em
        text-margin: 7.0; // 0.7 em
      }
      [zoom >= 16] {
        text-size: 12;
        text-wrap-width: 60; // 5.0 em
        text-line-spacing: -0.60; // -0.05 em
        text-margin: 8.4; // 0.7 em
        text-halo-fill: white;
      }
    }
  }
}

#placenames-small::neighborhood {
  [place = 'neighbourhood'][zoom >= 19][zoom < 20],
  [place = 'isolated_dwelling'][zoom >= 14],
  [place = 'farm'][zoom >= 14] {
    text-name: "[name]";
    text-size: 10;
    text-fill: @placenames;
    text-face-name: @book-fonts;
    text-halo-fill: @standard-halo-fill;
    text-halo-radius: @standard-halo-radius * 1.5;
    text-wrap-width: 45; // 4.5 em
    text-line-spacing: -0.8; // -0.08 em
    text-margin: 7.0; // 0.7 em
    [zoom >= 17] {
      text-size: 13;
      text-wrap-width: 60; // 5.0 em
      text-line-spacing: -0.60; // -0.05 em
      text-margin: 8.4; // 0.7 em
      text-halo-fill: white;
    }
  }
}
