@ferry-route: desaturate(lighten(@water-color, 5),13); //#D1D5E1;
@ferry-route-text: @ferry-route;

#ferry-routes {
  [zoom >= 8] {
    /* background prevents problems with overlapping ferry-routes, see #457 */
    background/line-color: @water-color;
    background/line-width: 3; /* Needs to be a bit wider than the route itself because of antialiasing */
    line-color: @ferry-route;
    line-width: 3;
    line-dasharray: 4,2;
    [zoom >= 10] {
      background/line-width: 1;
      line-width: 1.5;
      line-dasharray: 6,2;
    }
    [zoom >= 11] {
      background/line-width: .8;
      line-width: .8;
      line-dasharray: 6,2;
    }
    [zoom >= 14] {
      background/line-width: 1;
      line-width: 2;
      line-dasharray: 6,2;
    }
  }
}

#ferry-routes-text {
  [zoom >= 21] {
    text-name: "[name]";
    text-face-name: @book-fonts;
    text-placement: line;
    text-fill: @ferry-route-text;
    text-spacing: 1000;
    text-size: 12;
    text-dy: -8;
  }
}
