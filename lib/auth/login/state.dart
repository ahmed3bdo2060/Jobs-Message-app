class LoginStates{}
class LoginState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSuccessState extends LoginStates{}
class LoginFailedState extends LoginStates{
  final String? msg;

  LoginFailedState(this.msg);
}