abstract class AuthStates {}
class LoginInitialState extends AuthStates{}

// login state
class LoginLoadingState extends AuthStates{}
class LoginSuccessState extends AuthStates{}
class LoginErrorState extends AuthStates{

  final String error ;
  LoginErrorState({required this.error});
}

//signup
class SignupLoadingState extends AuthStates{}
class SignupSuccessState extends AuthStates{}
class SignupErrorState extends AuthStates{

  final String error ;
  SignupErrorState({required this.error});
}
