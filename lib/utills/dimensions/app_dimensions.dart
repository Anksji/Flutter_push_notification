import 'package:flutter/material.dart';

part 'app_dimensions_padding.dart';
part 'app_dimensions_radius.dart';
part 'app_dimensions_length.dart';

class AppDimensions {
  static const double buttonHeight=48.0;

  const AppDimensions._();

  static const _Padding padding = _Padding();
  static const _Radius radius = _Radius();
  static const _Length length= _Length();


  static double safeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static getLength(double value) {
    return value;
  }
}
