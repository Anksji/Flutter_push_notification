import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_and_notification/data/repository/app_repository.dart';
import 'package:login_and_notification/data/repository/authentication_repository/auth_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{

  final AuthRepository _authRepository = AppRepository.authRepository;

  LoginBloc(): super(LoginState.empty());



  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
   if(event is LoginWithCredential){
     yield* _mapLoginWithCredentialToState(event.email, event.password);
   }
  }


  Stream<LoginState>_mapLoginWithCredentialToState(String email, String password) async*{
    try{
      yield LoginState.logging();
      print("start login $email");
      await _authRepository.logInWithEmailAndPassword(email, password);
      bool isLoggedIn = _authRepository.isLoggedIn();
      print('in repository islogged in value $isLoggedIn');
      if(isLoggedIn){
        yield LoginState.success();
      }else{
        final message = _authRepository.authException;
        yield LoginState.failure(message);
      }
    }catch(error){
      yield LoginState.failure(error.toString());
    }
  }


}