class OnBoardingModel{
 late final String img;
  late final String title1;
  late final String title2;
  late final String title3;
  late final String desc;

  OnBoardingModel({required this.img, required this.title1,required this.title2,required this.title3, required this.desc});

}
List<OnBoardingModel> onBoardingList =[
  OnBoardingModel(img: "assets/images/onboaring1.png", title1: "Find a job, and  ",title2: "start building ",title3: "your career from now on", desc: "Explore over 25,924 available job roles and upgrade your operator now."),
  OnBoardingModel(img: "assets/images/onboaring2.png", title1: "Hundreds of jobs ",title3: "join together ",title2: "are waiting for you to ", desc: 'Immediately join us and start applying for the job you are interested in.'),
  OnBoardingModel(img: "assets/images/onboaring13.png", title1: "Get the best ",title2: "choice for the job ",title3: "you've always dreamed of ", desc: "The better the skills you have, the greater the good job opportunities for you."),
];