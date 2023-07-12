import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/bloc_observer.dart';
import 'package:login_and_notification/business_logic/bloc/bloc_provider.dart';
import 'package:login_and_notification/data/api/firebase_api.dart';
import 'package:login_and_notification/data/configuration/firebase_options.dart';
import 'package:login_and_notification/main_view.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  try{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }catch(e){
    print(e);
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: MyBlocProvider.blocProviders,
        child: const MainView(),
    );
  }
}
