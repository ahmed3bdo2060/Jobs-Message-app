import 'package:jobs/auth/create_account/second_page/model.dart';
import 'package:jobs/auth/create_account/third_page/model.dart';

class ThirdCreateEvents{}
class ThirdCreateEvent extends ThirdCreateEvents{}
class ThirdCreateSuccessEvent extends ThirdCreateEvents{}
class ThirdCreateFailedEvent  extends ThirdCreateEvents{}
class ThirdCreateAddRemoteEvent  extends ThirdCreateEvents{
  final ContriesModel model;

  ThirdCreateAddRemoteEvent(this.model);
}
class ThirdCreateRemoveRemoteEvent  extends ThirdCreateEvents{
  final ContriesModel model;

  ThirdCreateRemoveRemoteEvent(this.model);
}
class ThirdCreateAddOflineEvent  extends ThirdCreateEvents{
  final ContriesModel model;

  ThirdCreateAddOflineEvent(this.model);
}
class ThirdCreateRemoveOflineEvent  extends ThirdCreateEvents{
  final ContriesModel model;

  ThirdCreateRemoveOflineEvent(this.model);
}