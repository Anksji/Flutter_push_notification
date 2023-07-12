import 'package:flutter/material.dart';

class COLOR_CONST {
  static const primaryColor = Color(0xfffa7928);
  static const primary2ndColor = Color(0xfffdb771);
  static const primarydarkColor = Color(0xff774a0e);
  static const primaryColor100 = Color(0xffffd7bb);
  static const accentTintColor = Color(0xfff58913);

  static const whiteColor = Color(0xffffffff);

  static const cardShadowColor = Color(0xFFd3d1d1);
  static const dividerColor = Colors.black12;
  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF25164d), Colors.white],
  );

  static const secondaryColor = Color(0xFF979797);
  static const textColor = Color(0xFF4a4a4a);

  static const Color gray100 = Color(0xFFF0F0F0);
  static const Color gray200 = Color(0xFFE8E7EC);
  static const Color gray300 = Color(0xFFC9C9C9);
  static const Color gray400 = Color(0xFF929292);
  static const Color gray500 = Color(0xFF4A4A4A);
  static const Color gray600 = Color(0xFF414141);
  static const Color gray700 = Color(0xFF363636);
  static const Color gray800 = Color(0xFF2A2A2A);
  static const Color grayIconColor = Color(0xFF797979);


  ///Singleton factory
  static final COLOR_CONST _instance = COLOR_CONST._internal();

  factory COLOR_CONST() {
    return _instance;
  }

  COLOR_CONST._internal();
}

const mAnimationDuration = Duration(milliseconds: 200);
