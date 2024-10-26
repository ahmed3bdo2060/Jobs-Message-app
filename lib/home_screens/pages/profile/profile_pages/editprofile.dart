import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/core/componnet/app_image.dart';
import 'package:jobs/core/componnet/app_input.dart';
import 'package:jobs/core/componnet/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
   File? image;
   final picker = ImagePicker();

  Future getImage()async {
    var pickedImage = await picker.pickImage(
        source: ImageSource.camera,imageQuality: 80);
    if(pickedImage!=null){
      image = File(pickedImage.path);
    }else{

    }
    setState(() {

    });
  }
   Future getImageGalary()async {
     var pickedImage = await picker.pickImage(
         source: ImageSource.gallery,imageQuality: 80);
     if(pickedImage!=null){
       image = File(pickedImage.path);
     }else{

     }
     setState(() {

     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edite Profile"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Center(
                  child: Container(
                    height: 90,
                    width: 90,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: image!=null?ClipOval(child: Image.file(height: 90,width: 90,image!.absolute, fit: BoxFit.cover)):
                    Center(child: IconButton(onPressed: (){
                      getImage();
                    },
                        icon: Icon(Icons.camera_alt_outlined),),),
                  ),
                ),
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(context: context, builder: (context) => Container(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text("Choose ....",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            )),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                              InkWell(
                                onTap: () {
                                  getImage();
                                },
                                child: Column(
                                  children: [
                                                        Icon(Icons.camera_alt_outlined,
                                size: 60,),
                                    SizedBox(height: 12,),
                                    Text("Camera",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),)
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  getImageGalary();
                                },
                                child: Column(
                                  children: [
                                    AppImage("assets/images/OIP.jpg",
                                      width: 60,
                                      hieght: 60,fit: BoxFit.cover,),
                                    SizedBox(height: 12,),
                                    Text("Galary",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                      ),)
                                  ],
                                ),
                              ),
                            ],)
                          ],
                        ),
                      ),);
          
                    },
                    child: Text(
                      "Change  Photo",
                      style: TextStyle(color: AppColors.buttonColor),
                    )),
              ),
              SizedBox(height: 24,),
              Text("Name",
              style: TextStyle(color: AppColors.iconColor)),
              SizedBox(height: 6,),
              AppInput(),
              SizedBox(
                height: 16,
              ),
              Text("Bio", style: TextStyle(color: AppColors.iconColor)),
              SizedBox(height: 6,),
              AppInput(),
              SizedBox(
                height: 16,
              ),
              Text("Address", style: TextStyle(color: AppColors.iconColor)),
              SizedBox(height: 6,),
              AppInput(),
              SizedBox(
                height: 16,
              ),
              Text("No.Handphone", style: TextStyle(color: AppColors.iconColor)),
              SizedBox(height: 6,),
              AppInput(),
              SizedBox(
                height: 16,
              ),
              SizedBox(height: 120,),
              FilledButton(
                onPressed: () {},
                child: Text("Save",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                style: FilledButton.styleFrom(
                    fixedSize: Size.fromHeight(48.h),
                    backgroundColor:  AppColors.buttonColor),
              ),
              SizedBox(height: 8,)
            ],
          ),
        ),
      ),
    );
  }
}
