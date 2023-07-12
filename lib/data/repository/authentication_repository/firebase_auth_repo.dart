

import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_and_notification/data/models/UserModel.dart';
import 'package:login_and_notification/data/repository/user_repository/user_repo.dart';

import '../user_repository/firebase_user_repo.dart';
import 'auth_repo.dart';

class FirebaseAuthRepository implements AuthRepository{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserRepository _userRepository=FirebaseUserRepository();
  String _authException="Authentication Failure";

  String get authException => _authException;

  @override
  User get loggedFirebaseUser => _firebaseAuth.currentUser!;


  @override
  UserModel getCurrentUser() {
    UserModel userModel=UserModel(userId: loggedFirebaseUser.uid,email: loggedFirebaseUser.email);
    return userModel;
  }

  @override
  bool isLoggedIn() {
   return _firebaseAuth.currentUser!=null;
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) async{
   try{
     await _firebaseAuth.signInWithEmailAndPassword(
         email: email, password: password);
   }on FirebaseAuthException catch(e){
     _authException = e.message.toString();
     UserModel userModel=UserModel();

   }
  }

  @override
  Future<void> logOut() async{
    await _firebaseAuth.signOut()
        .catchError((error){
          print(error);
    });
  }


  @override
  Future<void> signUp(UserModel newUser, String password) async{
    try{
      var userCredential =await _firebaseAuth.createUserWithEmailAndPassword(
          email: newUser.email??'', password: password);
      newUser=newUser.cloneWith(userId: userCredential.user!.uid);
      await _userRepository.addUserData(newUser);
    }on FirebaseAuthException catch(e){
      _authException = e.message.toString();
    }
  }


}