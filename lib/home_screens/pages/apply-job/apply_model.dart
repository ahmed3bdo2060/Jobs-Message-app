class Applied {
  late final List<AppliedModel> list;

  Applied.fromJson(Map<String, dynamic> json) {

    list = List.from(json["data"] ?? {})
        .map((e) => AppliedModel.fromJson(e))
        .toList();
  }
  // Applied.fromJson(Map<String, dynamic> json) {
  //   if (json['data'] != null) {
  //     data = new List<Data>();
  //     json['data'].forEach((v) {
  //       data.add(new Data.fromJson(v));
  //     });
  //   }
  // }
}

class AppliedModel {
  late final int id;
  late final String name;
  late final String email;
  late final String mobile;
  late final String workType;
  late final String cvFile;
  late final String otherFile;
  late final int jobsId;
  late final int userId;
  late final int reviewed;
  late final Null accept;
  late final String createdAt;
  late final String updatedAt;


  AppliedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    workType = json['work_type'];
    cvFile = json['cv_file'];
    otherFile = json['other_file'];
    jobsId = json['jobs_id'];
    userId = json['user_id'];
    reviewed = json['reviewed'];
    accept = json['accept'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}