import 'package:jobs/auth/create_account/second_page/model.dart';

class SecondCreateEvents{}
class SecondCreateEvent extends SecondCreateEvents{}
class SecondCreateSuccessEvent extends SecondCreateEvents{}
class SecondCreateFailedEvent  extends SecondCreateEvents{}
class SecondCreateAddEvent  extends SecondCreateEvents{
  final WorkTypesModel model;

  SecondCreateAddEvent(this.model);
}
class SecondCreateRemoveEvent  extends SecondCreateEvents{
  final WorkTypesModel model;

  SecondCreateRemoveEvent(this.model);
}