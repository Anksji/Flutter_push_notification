import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/authentication/auth_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/authentication/auth_event.dart';
import 'package:login_and_notification/business_logic/bloc/authentication/auth_state.dart';
import 'package:login_and_notification/business_logic/bloc/bloc_provider.dart';
import 'package:login_and_notification/route/app_route_management.dart';


class MainView extends StatefulWidget {
  const MainView({super.key});


  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  void initState() {
    super.initState();
    MyBlocProvider.authencationBloc.add(AuthenticationStarted());
  }

  @override
  void dispose() {
    MyBlocProvider.dispose();
    super.dispose();
  }

  void onNavigate(String route){
    _navigator!.pushNamedAndRemoveUntil(route, (route) => false);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Flutter Task',
        onGenerateRoute: AppRoutes.generateRoute,
        initialRoute: AppRoutes.SPLASH,
        debugShowCheckedModeBanner : false,
        builder: (context,child){
          return BlocListener<AuthenticationBloc,AuthenticationState>(
            listener: (context,authState) {
              print("current auth state is showing $authState");
              if(authState is Unauthenticated){
                onNavigate(AppRoutes.LOGIN);
              }else if(authState is Uninitialized){
                onNavigate(AppRoutes.SPLASH);
              }else if(authState is Authenticated){
                onNavigate(AppRoutes.HOME);
              }
            },
            child: child,
          );
        });
  }


}


