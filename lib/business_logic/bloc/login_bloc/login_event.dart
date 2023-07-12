import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable{

  const LoginEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];



}

class EmailChanged extends LoginEvent{

  final String email;

  const EmailChanged({required this.email});

  @override
  // TODO: implement props
  List<Object?> get props => [email];

  @override
  String toString() {
    // TODO: implement toString
    return 'EmailChanged{email: $email}';
  }
}

class PasswordChanged extends LoginEvent{
  final String password;

  const PasswordChanged({required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [];

  @override
  String toString() {
    // TODO: implement toString
    return 'PasswordChanged{password: $password}';
  }

}

class LoginWithCredential extends LoginEvent{
  final String email;
  final String password;

  LoginWithCredential({required this.email,required this.password});

  @override
  // TODO: implement props
  List<Object?> get props => [email,password];

}