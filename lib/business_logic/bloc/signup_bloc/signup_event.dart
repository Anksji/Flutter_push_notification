import 'package:equatable/equatable.dart';
import 'package:login_and_notification/data/models/UserModel.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

/// When user changes email
class EmailChanged extends SignupEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}

class UserNameChanged extends SignupEvent{
  final String userName;

  UserNameChanged({required this.userName});

  @override
  String toString() {
    return 'UserNameChanged{userName:$userName}';
  }

}

/// When user changes password
class PasswordChanged extends SignupEvent {
  final String password;

  PasswordChanged({required this.password});

  @override
  String toString() {
    return 'PasswordChanged{password: $password}';
  }
}

/// When user changes confirmed password
class ConfirmPasswordChanged extends SignupEvent {
  final String password;
  final String confirmPassword;

  ConfirmPasswordChanged(
      {required this.password, required this.confirmPassword});

  @override
  String toString() {
    return 'ConfirmPasswordChanged{password: $password ,confirmPassword: $confirmPassword}';
  }
}

/// When clicks to register button
class Submitted extends SignupEvent {
  final UserModel newUser; // contains new user's information
  final String password;
  final String confirmPassword;

  const Submitted({
    required this.newUser,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'Submitted{email: ${newUser.email}, password: $password, confirmPassword: $confirmPassword}';
  }
}
