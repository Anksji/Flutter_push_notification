import 'package:flutter/material.dart';
import 'package:login_and_notification/utills/color_const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String appRoute="/splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double customOpacity =0;

  void onEndOfAnimation() {
    setState(() {
      customOpacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    // SplashScreenCubit screenCubit = context.watch<SplashScreenCubit>();
    // screenCubit.onReady(context);
    return WillPopScope(
        onWillPop: ()async{
          return false;
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: COLOR_CONST.whiteColor,
          ),
        ));
  }
}
