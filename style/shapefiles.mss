#necountries {
  [zoom >= 1][zoom < 4] {
    line-width: 0.2;
    [zoom >= 2] {
      line-width: 0.3;
    }
    [zoom >= 3] {
      line-width: 0.4;
    }
    line-color: @placenames;
  }
}

#ocean-lz,
#ocean {
  polygon-fill: @water-color;
}




