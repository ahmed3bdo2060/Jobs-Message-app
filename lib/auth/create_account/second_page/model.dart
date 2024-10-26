class WorkTypesModel{
  final String image;
  final String job;

  WorkTypesModel({required this.image, required this.job});
}
List<WorkTypesModel> workType=[
  WorkTypesModel(image: "assets/svg/uidesigner.svg", job: "UI/UX Designer"),
  WorkTypesModel(image: "assets/svg/illustrator.svg", job: "Ilustrator Designer"),
  WorkTypesModel(image: "assets/svg/developer.svg", job: 'Developer'),
  WorkTypesModel(image: "assets/svg/management.svg", job: "Management"),
  WorkTypesModel(image: "assets/svg/infotechno.svg", job: "Information Technology"),
  WorkTypesModel(image: "assets/svg/research.svg", job: "Research and Analytics"),
];