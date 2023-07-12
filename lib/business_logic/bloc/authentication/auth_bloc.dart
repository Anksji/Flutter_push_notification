

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_notification/business_logic/bloc/authentication/auth_event.dart';
import 'package:login_and_notification/data/repository/app_repository.dart';
import 'package:login_and_notification/data/repository/authentication_repository/auth_repo.dart';

import 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{

  final AuthRepository _authRepository = AppRepository.authRepository;

  AuthenticationBloc() : super(Uninitialized());


  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event)async*{
    if(event is AuthenticationStarted){
      yield* _mapAppStartedToState();
    }else if(event is LoggedIn){
      yield* _mapLoggedInToState();
    }else if(event is LoggedOut){
      yield* _mapLoggedOutToState();
    }
  }


  Stream<AuthenticationState>_mapAppStartedToState() async*{
    try{
      bool isLoggedIn = _authRepository.isLoggedIn();

      //For display splash screen
      await Future.delayed(Duration(seconds: 3));

      if(isLoggedIn){
        final loggedFirebaseUser = _authRepository.getCurrentUser();
        yield Authenticated(loggedFirebaseUser);
      }else {
        yield Unauthenticated();
      }
    }catch(e){
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState>_mapLoggedInToState() async*{
    yield Authenticated(_authRepository.getCurrentUser());
  }

  Stream<AuthenticationState>_mapLoggedOutToState() async*{
    yield Unauthenticated();
    _authRepository.logOut();
  }


}