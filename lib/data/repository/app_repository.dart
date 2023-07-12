import 'package:login_and_notification/data/repository/authentication_repository/firebase_auth_repo.dart';

class AppRepository{

  static final authRepository=FirebaseAuthRepository();

  static final AppRepository _instance = AppRepository._internal();

  factory AppRepository(){
    return _instance;
  }
  AppRepository._internal();

}