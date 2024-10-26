import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';

import '../../../../core/componnet/app_image.dart';
import '../../../../core/componnet/colors.dart';

class EditPortfolioPage extends StatefulWidget {
  const EditPortfolioPage({super.key});

  @override
  State<EditPortfolioPage> createState() => _EditPortfolioState();
}

class _EditPortfolioState extends State<EditPortfolioPage> {
  List pickedFiles = [];
  List pickedFilesName = [];
  List pickedFilesSize = [];


  pickFiles() async {
    var result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );
    print(result);
    if (result != null) {
      pickedFiles = result.files.map((file) => File(file.path!)).toList();
      pickedFilesName = result.files.map((file) => File(file.name!)).toList();
      pickedFilesSize = result.files.map((file) =>
          File((file.size / 1024).round().toString())).toList();
      setState(() {

      });
    }
  }
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio"),
        centerTitle: true,
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add portfolio here", style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
            ),),
            SizedBox(
              height: 12.h,
            ),
            Container(width: double.infinity, decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Color(0xff6690FF),
              ),
            ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppImage("assets/images/document-upload.png", width: 56.w,
                        hieght: 56.h,),
                      SizedBox(height: 16.h,),
                      Text("Upload your other file",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),),
                      SizedBox(height: 8.h,),
                      Text("Max. file size 10 MB",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.iconColor)),
                      SizedBox(height: 24.h,),
                      FilledButton(
                        onPressed: pickFiles,
                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            AppImage("assets/svg/export.svg",color: AppColors.buttonColor,
                                width: 20,
                                hieght: 20),
                            SizedBox(width: 10,),
                            Text("Add file",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 16,
                                    color: AppColors.buttonColor)),
                          ],),
                        style: FilledButton.styleFrom(
                            fixedSize: Size.fromHeight(48.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: BorderSide(color: AppColors.buttonColor)
                            ),
                            backgroundColor: AppColors.buttonColor.withOpacity(.2)),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 24.h,),
            pickedFiles.isNotEmpty ?
            Expanded(
              child: ListView.builder(itemCount: pickedFiles.length,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.borderColor,
                            )
                        ),
                        child: GestureDetector(
                          onTap: () {
                            openFile(pickedFiles[index]);
                            openFile(pickedFilesName[index]);
                            openFile(pickedFilesSize[index]);
                          },
                          child: ListTile(
                            subtitle: Text("${pickedFilesSize[index]}KB",
                                style: TextStyle(color: AppColors.iconColor)),
                            leading: AppImage(
                                "assets/images/pdf.png", hieght: 40, width: 40),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    pickFiles();
                                  },
                                  child: AppImage("assets/images/edit-2.png",
                                    width: 24,
                                    hieght: 24,),
                                ),
                                InkWell(
                                  onTap: () {
                                    pickedFiles.clear();
                                    setState(() {

                                    });
                                  },
                                  child: AppImage(
                                    "assets/images/close-circle.png",
                                    width: 24,
                                    hieght: 24,),
                                ),
                              ],
                            ),
                            title: Text("${pickedFilesName[index]}"),
                          ),
                        ),
                      ),
                    ),),
            ) : Container(),
          ],
        ),
      )
    );
  }
}
