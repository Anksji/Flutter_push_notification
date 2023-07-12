

import 'package:login_and_notification/data/models/UserModel.dart';

abstract class UserRepository{

  Stream<UserModel> loggedUserStream(UserModel loggedFirebaseUser);

  Future<UserModel> getUserById(String uid);

  Future<void> addUserData(UserModel newUser);

  Future<void> updateUserData(UserModel updatedUser);

}