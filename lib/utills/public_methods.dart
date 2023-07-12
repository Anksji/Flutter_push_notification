import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_and_notification/utills/font_const.dart';

class PublicMethods{

  static String getSubmittedAnswerSheetId(String userId,String subChapterId){
    String submittedAnsSheetId='';
    submittedAnsSheetId='$subChapterId++${userId}';
    return submittedAnsSheetId;
  }

  static void showSuccessSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Padding(padding: EdgeInsets.all(16),
        child: Text(message,style: FONT_CONST.MEDIUM_WHITE_20,),),
      backgroundColor: Colors.greenAccent, // Set the desired background color here
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showErrorSnackBar({required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: Padding(padding: EdgeInsets.all(16),
        child: Text(message,style: FONT_CONST.MEDIUM_WHITE_20,),),
      backgroundColor: Colors.redAccent, // Set the desired background color here
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static bool isValidEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return false;
    else
      return true;
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    RegExp regex = RegExp(r'^(\+91[\-\s]?)?[0]?(91)?[6789]\d{9}$');
    return regex.hasMatch(phoneNumber);
  }

  static String getOnlyNumbersFromString(String text){
    return text.replaceAll(new RegExp(r'[^0-9]'),'');
  }



}