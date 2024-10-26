

class ThirdCreateStates{}
class ThirdCreateLoadingState extends ThirdCreateStates{}
class ThirdCreateSuccessState extends ThirdCreateStates{}
class ThirdCreateFailedState extends ThirdCreateStates{
  final String msg;

  ThirdCreateFailedState(this.msg);
}