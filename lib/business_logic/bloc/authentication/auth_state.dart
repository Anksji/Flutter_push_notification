

import 'package:equatable/equatable.dart';
import 'package:login_and_notification/data/models/UserModel.dart';

abstract class AuthenticationState extends Equatable{

  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class Uninitialized extends AuthenticationState{}

class Authenticated extends AuthenticationState{

  final UserModel loggedFirrebaseUser;

  const Authenticated(this.loggedFirrebaseUser);

  @override
  List<Object?> get props => [loggedFirrebaseUser];

  @override
  String toString(){
    return 'Authenticated{email: ${loggedFirrebaseUser.email}}';
  }

}

class Unauthenticated extends AuthenticationState{}