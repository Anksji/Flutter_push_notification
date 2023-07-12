import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userId;
  final String ? username;
  final String? email;
  final String? userDeviceToken;


  UserModel(
      { this.userId,
         this.email,
         this.username,
         this.userDeviceToken});

  UserModel fromMap(Map<String, dynamic> data) {

    return UserModel(
      userId: data["userId"] ?? "",
      username: data["username"] ?? "",
      email: data["email"] ?? "",
      userDeviceToken: data["userDeviceToken"] ?? "",
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "username": username,
      "email": email,
      "userDeviceToken": userDeviceToken
    };
  }

  UserModel cloneWith({
    email,
    userId,
    username,
    userDeviceToken
  }) {
    return UserModel(
      email: email ?? this.email,
      userId: userId ?? this.userId,
      username: username??this.username,
      userDeviceToken:userDeviceToken??this.userDeviceToken
    );
  }

  @override
  List<Object?> get props => [email, userId,username];

}
