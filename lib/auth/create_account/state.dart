class CreateAccountStates{}
class CreateAccountState extends CreateAccountStates{}
class CreatAccountLoadingState extends CreateAccountStates{}
class CreatAccountSuccessState extends CreateAccountStates{}
class CreateAccountFailedState extends CreateAccountStates{
  final String? msg;

  CreateAccountFailedState(this.msg);
}