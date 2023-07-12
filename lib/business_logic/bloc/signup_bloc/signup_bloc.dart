import 'package:login_and_notification/business_logic/bloc/signup_bloc/signup_event.dart';
import 'package:login_and_notification/business_logic/bloc/signup_bloc/signup_state.dart';
import 'package:login_and_notification/data/models/UserModel.dart';
import 'package:bloc/bloc.dart';
import '../../../../../data/repository/app_repository.dart';
import '../../../../../data/repository/authentication_repository/auth_repo.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository = AppRepository.authRepository;

  SignupBloc() : super(SignupState.empty());



  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
  if (event is Submitted) {
      yield* _mapFormSubmittedToState(
        event.newUser,
        event.password
      );
    }
  }


  /// Map from submit event => states
  Stream<SignupState> _mapFormSubmittedToState(
      UserModel newUser,
      String password,
      ) async* {
    try {
      yield SignupState.loading();
      await _authRepository.signUp(newUser, password);

      bool isLoggedIn = _authRepository.isLoggedIn();
      if (isLoggedIn) {
        yield SignupState.success();
      } else {
        final message = _authRepository.authException;
        yield SignupState.failure(message);
      }
    } catch (e) {
      yield SignupState.failure("Register Failure");
    }
  }

}
