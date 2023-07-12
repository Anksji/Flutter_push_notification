
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_and_notification/data/models/UserModel.dart';


abstract class AuthRepository{


  String get authException;

  Future<void> signUp(UserModel newUser, String password);


  Future<void> logInWithEmailAndPassword(String email,String password);

  bool isLoggedIn();

  Future<void> logOut();

  UserModel getCurrentUser();
}