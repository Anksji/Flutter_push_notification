import 'package:clipboard/clipboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:login_and_notification/data/api/firebase_api.dart';
import 'package:login_and_notification/data/api/notification_setup.dart';
import 'package:login_and_notification/presentation/widgets/custom_rounded_btn.dart';
import 'package:login_and_notification/utills/color_const.dart';
import 'package:login_and_notification/utills/dimensions/app_dimensions.dart';
import 'package:login_and_notification/utills/font_const.dart';
import 'package:login_and_notification/utills/public_methods.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String? initialMessage;
  String userDeviceToken='';

  @override
  void initState() {
    setUpNotification();
    super.initState();
    getDeviceToken();
  }

  getDeviceToken()async{
    userDeviceToken=await FirebaseMessagingApi().getToken();
    setState(() {
    });
    print('current user home page device token $userDeviceToken');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Task App',),
        backgroundColor: COLOR_CONST.primaryColor,
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding.biggerValue),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('!!Welcome!! to Push Notification App',style: FONT_CONST.BOLD_DEFAULT_24,textAlign: TextAlign.center,),
              SizedBox(height: 40,),

              Text(userDeviceToken,style: FONT_CONST.MEDIUM_DEFAULT_20,textAlign: TextAlign.center),
              SizedBox(height: 30,),
              Text('Copy device token of your device and send push notification from firebase.',style: FONT_CONST.REGULAR_DEFAULT_16,textAlign: TextAlign.center),
              SizedBox(height: 10,),
              Center(
                child: CustomRoundedBtn(title:'Copy device token',
                    iconImage: Icons.copy,
                    isActive: true, onClicked: buttonClicked),
              )
            ],
          ),
        ),
      ));
  }

  String message='Hello, Dear button clicked 0 times';
  int count=0;

  buttonClicked(){

    FlutterClipboard.copy(userDeviceToken).then((result) {
      PublicMethods.showSuccessSnackBar(
          context: context, message: 'Token copied to clipboard');
    });
  }

  }




