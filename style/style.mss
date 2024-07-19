Map {
    //background-color: @background;
    //background-image:url(img/natural_paper.png);
}

@hill_opacity: .5;

// Medium zoom color relief
#color_shade_200m {
[zoom >= 5] [zoom <= 7]{
     raster-comp-op: multiply;
     raster-scaling:bilinear;
     [zoom >= 5] {
       raster-opacity:   1;
     }
     [zoom >= 9] {
       raster-opacity:.9;
     }
     [zoom >= 10] {
       raster-opacity:.7;
     }
     [zoom >= 11] {
       raster-opacity:.4;
     }
   }
}



// High zoom color relief
#hillshade {
  [zoom >= 8][zoom < 13] {
      raster-comp-op: multiply;
      raster-scaling:bilinear;
      raster-opacity: 1; //@hill_opacity;
      [zoom >= 11] {
        raster-opacity: 1;
      }
      [zoom >= 12] {
        raster-opacity: .5;
      }
      [zoom >= 13] {
        raster-opacity: .5;
      }
      [zoom >= 14] {
        raster-opacity: .4;
      }
   }
}

// High zoom color relief
#hillshade2 {
  [zoom >= 12][zoom < 18] {
      raster-comp-op: multiply;
      raster-scaling:bilinear;
      raster-opacity: .7; //@hill_opacity;
      [zoom >= 13] {
        raster-opacity: 1;
      }
      [zoom >= 14] {
        raster-opacity: 1;
      }
      [zoom >= 15] {
        raster-opacity: 1;
      }
      [zoom >= 16] {
        raster-opacity: 1;
      }
      [zoom >= 17] {
        raster-opacity: .6;
      }
   }
}
