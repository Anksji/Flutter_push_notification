

import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AuthenticationStarted extends AuthenticationEvent{}

class LoggedIn extends AuthenticationEvent{}

class LoggedOut extends AuthenticationEvent{}