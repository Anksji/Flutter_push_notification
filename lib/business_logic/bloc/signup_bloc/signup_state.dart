import 'package:meta/meta.dart';

@immutable
class SignupState {
  final bool isEmailValid;
  final bool isUserNameValid;
  final bool isPasswordValid;
  final bool isConfirmPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;
  final String? message;

  bool get isFormValid =>
      isEmailValid && isPasswordValid && isConfirmPasswordValid;

  SignupState(
      {
        required this.isUserNameValid,
        required this.isEmailValid,
        required this.isPasswordValid,
        required this.isConfirmPasswordValid,
        required this.isSubmitting,
        required this.isSuccess,
        required this.isFailure,
        this.message});

  factory SignupState.empty() {
    return SignupState(
      isUserNameValid:true,
      isEmailValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  factory SignupState.loading() {
    return SignupState(
      isUserNameValid:true,
      isEmailValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
      message: "Registering ...",
    );
  }

  factory SignupState.failure(String message) {
    return SignupState(
      isUserNameValid:true,
      isEmailValid: true,
      isPasswordValid: true,
      isConfirmPasswordValid: true,
      isSuccess: false,
      isSubmitting: false,
      isFailure: true,
      message: message,
    );
  }

  factory SignupState.success() {
    return SignupState(
        isUserNameValid:true,
        isEmailValid: true,
        isPasswordValid: true,
        isConfirmPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        message: "Register success");
  }

  SignupState update({bool? isUserNamevalid,bool? isEmailValid,
    bool? isPasswordValid, bool? isConfirmPasswordValid}) {
    return cloneWith(
      isUserNameValid:isUserNamevalid,
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isConfirmPasswordValid: isConfirmPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
      message: "",
    );
  }

  SignupState cloneWith({
    bool? isUserNameValid,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isConfirmPasswordValid,
    bool? isNameValid,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
    String? message,
  }) {
    return SignupState(
      isUserNameValid:isUserNameValid?? this.isUserNameValid,
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isConfirmPasswordValid:
      isConfirmPasswordValid ?? this.isConfirmPasswordValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'RegisterState{isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, isConfirmPasswordValid: $isConfirmPasswordValid, isSubmitting: $isSubmitting, isSuccess: $isSuccess, isFailure: $isFailure}';
  }
}
