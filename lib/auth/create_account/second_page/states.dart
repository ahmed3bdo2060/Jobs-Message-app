

class SecondCreateStates{}
class SecondCreateLoadingState extends SecondCreateStates{}
class SecondCreateSuccessState extends SecondCreateStates{}
class SecondCreateFailedState extends SecondCreateStates{
  final String msg;

  SecondCreateFailedState(this.msg);
}