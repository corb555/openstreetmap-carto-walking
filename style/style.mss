Map {
[zoom >= 5] [zoom < 16]{
    background-color: #DDDBD7;
    }
    //background-image:url(img/natural_paper.png);
}

// Medium zoom color relief

#color_shade_200m {
[zoom >= 5] [zoom < 11]{
     raster-scaling:bilinear;
     [zoom >= 5] {
       raster-opacity:1;
     }
     [zoom >= 10] {
       raster-opacity:.8;
     }
     [zoom >= 11] {
       raster-opacity:.6;
     }
   }
}



// High zoom color relief 1
#hillshade, #hillshade2 {
  [zoom >= 11][zoom <= 14] {
      //raster-comp-op: multiply;
      raster-scaling:bilinear;
      [zoom >= 11] {
        raster-opacity: 0;
      }
      [zoom >= 12] {
        raster-opacity: .5;
      }
      [zoom >= 13] {
        raster-opacity: .5;
      }
      [zoom >= 14] {
        raster-opacity: .7;
      }
   }
}
