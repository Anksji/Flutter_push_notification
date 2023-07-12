import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_and_notification/utills/color_const.dart';

class FONT_CONST {

  static final FONT=GoogleFonts.karla(
    fontSize: 14,
  );
  static final REGULAR = FONT.copyWith(
    color: Colors.black,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  static final MEDIUM = FONT.copyWith(
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 14,
  );

  static final BOLD = FONT.copyWith(
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 14,
  );

  //REGULAR
  static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.textColor);

  static final REGULAR_DEFAULT_08 =
  REGULAR_DEFAULT.copyWith(fontSize:8);
  static final REGULAR_DEFAULT_10 =
  REGULAR_DEFAULT.copyWith(fontSize: 10);
  static final REGULAR_DEFAULT_12 =
  REGULAR_DEFAULT.copyWith(fontSize: 12);
  static final REGULAR_DEFAULT_14 =
  REGULAR_DEFAULT.copyWith(fontSize: 14);
  static final REGULAR_DEFAULT_16 =
  REGULAR_DEFAULT.copyWith(fontSize: 16);
  static final REGULAR_DEFAULT_18 =
  REGULAR_DEFAULT.copyWith(fontSize: 18);
  static final REGULAR_DEFAULT_20 =
  REGULAR_DEFAULT.copyWith(fontSize: 20);
  static final REGULAR_DEFAULT_24 =
  REGULAR_DEFAULT.copyWith(fontSize: 24);

  static final REGULAR_PRIMARY =
  REGULAR.copyWith(color: COLOR_CONST.primaryColor);

  static final REGULAR_PRIMARY_16 =
  REGULAR_PRIMARY.copyWith(fontSize:16);
  static final REGULAR_PRIMARY_18 =
  REGULAR_PRIMARY.copyWith(fontSize: 18);
  static final REGULAR_PRIMARY_20 =
  REGULAR_PRIMARY.copyWith(fontSize: 20);

  static final REGULAR_WHITE = REGULAR.copyWith(color: Colors.white);

  static final REGULAR_WHITE_16 =
  REGULAR_WHITE.copyWith(fontSize: 16);
  static final REGULAR_WHITE_18 =
  REGULAR_WHITE.copyWith(fontSize: 18);
  static final REGULAR_WHITE_20 =
  REGULAR_WHITE.copyWith(fontSize:20);


  //MEDIUM (SEMIBOLD)
  static final MEDIUM_DEFAULT = MEDIUM.copyWith(color: COLOR_CONST.textColor);
  static final MEDIUM_DEFAULT_16 =
  MEDIUM_DEFAULT.copyWith(fontSize:16);
  static final MEDIUM_DEFAULT_18 =
  MEDIUM_DEFAULT.copyWith(fontSize:18);
  static final MEDIUM_DEFAULT_20 =
  MEDIUM_DEFAULT.copyWith(fontSize: 20);
  static final MEDIUM_DEFAULT_24 =
  MEDIUM_DEFAULT.copyWith(fontSize: 24);

  static final MEDIUM_PRIMARY =
  MEDIUM.copyWith(color: COLOR_CONST.primaryColor);
  static final MEDIUM_PRIMARY_16 =
  MEDIUM_PRIMARY.copyWith(fontSize: 16);
  static final MEDIUM_PRIMARY_18 =
  MEDIUM_PRIMARY.copyWith(fontSize: 18);
  static final MEDIUM_PRIMARY_20 =
  MEDIUM_PRIMARY.copyWith(fontSize: 20);
  static final MEDIUM_PRIMARY_24 =
  MEDIUM_PRIMARY.copyWith(fontSize: 24);

  static final MEDIUM_WHITE = MEDIUM.copyWith(color: Colors.white);

  static final MEDIUM_WHITE_16 =
  MEDIUM_WHITE.copyWith(fontSize: 16);
  static final MEDIUM_WHITE_18 =
  MEDIUM_WHITE.copyWith(fontSize: 18);
  static final MEDIUM_WHITE_20 =
  MEDIUM_WHITE.copyWith(fontSize: 20);

  //BOLD
  static final BOLD_DEFAULT = BOLD.copyWith(color: COLOR_CONST.textColor);
  static final BOLD_DEFAULT_16 =
  BOLD_DEFAULT.copyWith(fontSize: 16);
  static final BOLD_DEFAULT_18 =
  BOLD_DEFAULT.copyWith(fontSize: 18);
  static final BOLD_DEFAULT_20 =
  BOLD_DEFAULT.copyWith(fontSize: 20);
  static final BOLD_DEFAULT_24 =
  BOLD_DEFAULT.copyWith(fontSize: 24);
  static final BOLD_DEFAULT_26 =
  BOLD_DEFAULT.copyWith(fontSize: 26);
  static final BOLD_DEFAULT_28 =
  BOLD_DEFAULT.copyWith(fontSize: 28);
  static final BOLD_DEFAULT_30 =
  BOLD_DEFAULT.copyWith(fontSize: 30);
  static final BOLD_DEFAULT_32 =
  BOLD_DEFAULT.copyWith(fontSize: 32);

  static final BOLD_PRIMARY = BOLD.copyWith(color: COLOR_CONST.primaryColor);
  static final BOLD_PRIMARY_16 =
  BOLD_PRIMARY.copyWith(fontSize:16);
  static final BOLD_PRIMARY_18 =
  BOLD_PRIMARY.copyWith(fontSize:18);
  static final BOLD_PRIMARY_20 =
  BOLD_PRIMARY.copyWith(fontSize: 20);
  static final BOLD_PRIMARY_24 =
  BOLD_PRIMARY.copyWith(fontSize: 24);
  static final BOLD_PRIMARY_26 =
  BOLD_PRIMARY.copyWith(fontSize:26);
  static final BOLD_PRIMARY_28 =
  BOLD_PRIMARY.copyWith(fontSize: 28);
  static final BOLD_PRIMARY_30 =
  BOLD_PRIMARY.copyWith(fontSize: 30);
  static final BOLD_PRIMARY_32 =
  BOLD_PRIMARY.copyWith(fontSize: 32);


  static final BOLD_WHITE = BOLD.copyWith(color: Colors.white);
  static final BOLD_WHITE_16 =
  BOLD_WHITE.copyWith(fontSize: 16);
  static final BOLD_WHITE_18 =
  BOLD_WHITE.copyWith(fontSize: 18);
  static final BOLD_WHITE_20 =
  BOLD_WHITE.copyWith(fontSize: 20);
  static final BOLD_WHITE_26 =
  BOLD_WHITE.copyWith(fontSize: 26);
  static final BOLD_WHITE_32 =
  BOLD_WHITE.copyWith(fontSize: 32);

  ///Singleton factory
  static final FONT_CONST _instance = FONT_CONST._internal();

  factory FONT_CONST() {
    return _instance;
  }

  FONT_CONST._internal();
}
