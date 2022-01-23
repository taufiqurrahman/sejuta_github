import 'package:flutter/material.dart';

class SizeLayoutConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizontal;
  static double blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 200;
    blockSizeVertical = screenHeight / 200;
  }
}

double getblockSizeHorizontal(double input) {
  double size = SizeLayoutConfig.blockSizeHorizontal * input;
  return size;
}

double getblockSizeVertical(double input) {
  double size = SizeLayoutConfig.blockSizeVertical * input;
  return size;
}
