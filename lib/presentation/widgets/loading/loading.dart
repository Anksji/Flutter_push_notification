import 'package:flutter/material.dart';
import 'package:login_and_notification/utills/color_const.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(COLOR_CONST.primaryColor),
        ),
      ),
    );
  }
}
