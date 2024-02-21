
#hillshade {
    raster-scaling: bilinear;
    raster-comp-op: multiply;
    raster-opacity: 0.85;

    [zoom >= 5] {
      raster-opacity: .9; // 0.65;
    }
    [zoom >= 7] {
      raster-opacity: .9; //0.55;
    }
    [zoom >= 14] {
      raster-opacity: .9; //0.45;
    }
    [zoom >= 16] {
      raster-opacity: .9; //0.35;
    }
  }
