import 'package:flutter/material.dart';
import 'package:login_and_notification/utills/color_const.dart';
import 'package:login_and_notification/utills/dimensions/app_dimensions.dart';
import 'package:login_and_notification/utills/font_const.dart';


class CustomRoundedBtn extends StatefulWidget {
  final bool isActive;
  final String title;
  final Function onClicked;
  //0 primary-netural, 1 green-positive, 2 red-negative
  int? positiveNegativeBtnType=0;
  IconData? iconImage;
  double? buttonWidth;

  CustomRoundedBtn({Key? key,required this.title, required this.isActive,
    required this.onClicked,this.positiveNegativeBtnType,this.iconImage,this.buttonWidth}) : super(key: key);

  @override
  State<CustomRoundedBtn> createState() => _CustomButtonState();

}

class _CustomButtonState extends State<CustomRoundedBtn> {
  // final bool isActive;
  // final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: widget.buttonWidth==null?PcsAppLayout.getSize(context):widget.buttonWidth,
        height: AppDimensions.buttonHeight,
        alignment: Alignment.center,
        margin: EdgeInsets.all(AppDimensions.length.margin10),
        decoration: BoxDecoration(
          color: widget.positiveNegativeBtnType==null||widget.positiveNegativeBtnType==0?widget.isActive?COLOR_CONST.
          primaryColor:Colors.grey.shade300:(widget.positiveNegativeBtnType==1)?Colors.greenAccent:Colors.redAccent,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: widget.positiveNegativeBtnType==null||widget.positiveNegativeBtnType==0?
                widget.isActive?COLOR_CONST.primaryColor.withOpacity(0.30):COLOR_CONST.gray300.withOpacity(0.20):
                (widget.positiveNegativeBtnType==1)?Colors.greenAccent.withOpacity(0.18):Colors.redAccent.withOpacity(0.18),
                blurRadius: 20.0,
                offset: Offset(0,10)
            ),
          ],
        ),
        child:Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: AppDimensions.length.margin10,),
                widget.iconImage!=null?Icon(widget.iconImage,color: widget.isActive?COLOR_CONST.whiteColor:COLOR_CONST.gray500,):Container(),
                widget.iconImage!=null?SizedBox(width:AppDimensions.length.margin10,):SizedBox(width: 0,),
                Align(
                  alignment: Alignment.center,
                  child: Text(widget.title,style: FONT_CONST.BOLD_DEFAULT_20.copyWith(color: widget.isActive?Colors.white:Colors.grey.shade800,fontWeight: FontWeight.w600),),
                ),
                SizedBox(width: AppDimensions.length.margin10,),
              ],
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: ()=> widget.onClicked(),
                borderRadius: BorderRadius.circular(20),
                highlightColor: Colors.transparent,
                splashColor: COLOR_CONST.primary2ndColor.withOpacity(0.5),
              ),
            ),
          ],
        )
    );
  }
}
