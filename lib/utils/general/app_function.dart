import 'package:flutter/cupertino.dart';

class AppFunctions {
  static double getOrientationDimension(BuildContext context, {double portraitDim = 10, double landscapeDim = 10}) {
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return portraitDim;
    }
    return landscapeDim;
  }
}