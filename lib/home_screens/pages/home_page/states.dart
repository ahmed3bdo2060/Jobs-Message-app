import 'jobs.dart';

class HomePageStates{}
class HomePageState extends HomePageStates{}
class HomePageLoadingState extends HomePageStates{}
class HomePageSuccessState extends HomePageStates{
  final List<JobsModel> list;

  HomePageSuccessState(this.list);
}
class HomePageFailedState extends HomePageStates{
  final String? msg;

  HomePageFailedState(this.msg);

}