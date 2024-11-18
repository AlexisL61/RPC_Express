class ResponsiveData {
  static double getPadding(double width, {double ratio = 1}) {
    if (width < 800*ratio) {
      return 0;
    } else if (width < 1200*ratio) {
      return (width - 800*ratio) / 2;
    } else if (width < 1600*ratio) {
      return (width - 1200*ratio) / 2;
    } else {
      return (width - 1600*ratio) / 2;
    }
  }

  static int getColumns(double width, {double ratio = 1}) {
    if (width < 800*ratio) {
      return 1;
    } else if (width < 1200*ratio) {
      return 2;
    } else if (width < 1600*ratio) {
      return 3;
    } else {
      return 4;
    }
  }
}