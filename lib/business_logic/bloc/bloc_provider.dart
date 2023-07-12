
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/authentication/auth_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/login_bloc/bloc.dart';
import 'package:login_and_notification/business_logic/bloc/signup_bloc/bloc.dart';

class MyBlocProvider{
  static final loginBloc = LoginBloc();
  static final signupBloc = SignupBloc();
  static final authencationBloc = AuthenticationBloc();

  static final List<BlocProvider> blocProviders=[
    BlocProvider<LoginBloc>(
      create:(context) => loginBloc,lazy: true,),

    BlocProvider<SignupBloc>(
      create:(context) => signupBloc,lazy: true,),

    BlocProvider<AuthenticationBloc>(
      create:(context) => authencationBloc,lazy: true,),

  ];

  static void dispose(){
    loginBloc.close();
    signupBloc.close();
  }

  static final MyBlocProvider _instance = MyBlocProvider._internal();

  factory MyBlocProvider() {
    return _instance;
  }

  MyBlocProvider._internal();

}