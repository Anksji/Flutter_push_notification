
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/authentication/auth_event.dart';
import 'package:login_and_notification/business_logic/bloc/bloc_provider.dart';
import 'package:login_and_notification/business_logic/bloc/login_bloc/login_event.dart';
import 'package:login_and_notification/business_logic/bloc/login_bloc/login_state.dart';
import 'package:login_and_notification/presentation/widgets/custom_edit_text_field.dart';
import 'package:login_and_notification/presentation/widgets/custom_rounded_btn.dart';
import 'package:login_and_notification/route/app_route_management.dart';
import 'package:login_and_notification/utills/color_const.dart';
import 'package:login_and_notification/utills/dimensions/app_dimensions.dart';
import 'package:login_and_notification/utills/font_const.dart';
import 'package:login_and_notification/utills/public_methods.dart';
import 'package:login_and_notification/utills/utill_dialog.dart';

import '../../../../business_logic/bloc/login_bloc/login_bloc.dart';


class UserLoginScreen extends StatelessWidget {


  TextEditingController emailTextController=TextEditingController();
  TextEditingController passwordTextController=TextEditingController();

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              BlocConsumer<LoginBloc,LoginState>(builder: (context,state){
                return Container();
              }, listener: (context,state){
                /// Success
                if (state.isSuccess) {
                  UtilDialog.hideWaiting(context);
                  MyBlocProvider.authencationBloc.add(LoggedIn());
                }

                /// Failure
                if (state.isFailure) {
                  UtilDialog.hideWaiting(context);
                  UtilDialog.showInformation(context, content: state.message);
                }

                /// Logging
                if (state.isSubmitting) {
                  UtilDialog.showWaiting(context);
                }
              }),
              
              Padding(padding: EdgeInsets.all(AppDimensions.padding.biggerValue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Center(child: Container(
                      height: 60,
                      width: 200,
                      child: Icon(Icons.account_circle,size: 52,color: COLOR_CONST.primaryColor.withOpacity(0.5),),
                    ),),
                    Align(
                        alignment: Alignment.center,
                        child: Padding(padding: EdgeInsets.symmetric(horizontal: AppDimensions.padding.biggerValue),
                          child: Text('Login to your previous account, Login implement via firebase authentication.',
                            textAlign: TextAlign.center,
                            style: FONT_CONST.REGULAR_DEFAULT_16.copyWith(color: COLOR_CONST.gray500),),)
                    ),

                    SizedBox(height: 50,),
                    Text('Login', textAlign: TextAlign.left,
                      style: FONT_CONST.BOLD_DEFAULT_20.copyWith(color: COLOR_CONST.gray600),),

                    SizedBox(height: 30,),



                    CustomEditTextField(lableText: 'Email', prefixIcon: Icons.email_outlined,
                        suffixIcon: null, tfController: emailTextController,
                      validator:(value)=> emailValidator(emailTextController.text)),
                    SizedBox(height: 20,),
                    CustomEditTextField(lableText: 'Password', prefixIcon: Icons.password,
                        inputType: TextInputType.text,isHideText: true,
                        suffixIcon:null, tfController: passwordTextController,
                    validator:(value)=> passwordValidator(passwordTextController.text),),

                    SizedBox(height: 100,),
                    CustomRoundedBtn(title:'Login', isActive: true, onClicked: onLogin),
                  ],
                ),)
            ],
          ),
        ),
        bottomNavigationBar: _buildNoAccountText(context),
      ),
    );
  }

  String? passwordValidator(String value){
    if(value.length>=6){
      return null;
    }else{
      return 'Invalid Password';
    }
  }

  String? emailValidator(String value){
    if(PublicMethods.isValidEmail(value)){
      return null;
    }else{
      return 'Invalid Email';
    }
  }

  _buildNoAccountText(context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimensions.padding.bigValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Do not have account?',
            style: FONT_CONST.REGULAR_DEFAULT_20,
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.REGISTER,
            ),
            child: Text('Sign up',
              style: FONT_CONST.BOLD_PRIMARY_20,
            ),
          ),
        ],
      ),
    );
  }

  bool isLoginButtonEnabled() {
    return MyBlocProvider.loginBloc.state.isFormValid &&
        !MyBlocProvider.loginBloc.state.isSubmitting &&
        isPopulated;
  }
  bool get isPopulated => emailTextController.text.isNotEmpty && passwordTextController.text.isNotEmpty;
  void onLogin() {
    if (isLoginButtonEnabled()) {

      print("current is login with value ${emailTextController.text}");

      MyBlocProvider.loginBloc.add(LoginWithCredential(
        email: emailTextController.text,
        password: passwordTextController.text,
      ));
    }
  }

}


class CustomCliper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width*0.0575000,size.height*0.2387500);
    path0.lineTo(size.width*0.3750000,size.height*0.3137500);
    path0.lineTo(size.width,0);
    path0.lineTo(0,0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
class CustomCliper2 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(size.width*0.2250000,size.height*0.1325000);
    path0.lineTo(size.width*0.0350000,size.height*0.3587500);
    path0.lineTo(size.width,0);
    path0.lineTo(0,0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}