import 'package:flutter/material.dart';
import 'package:jobs/core/componnet/app_image.dart';

import '../../../../core/componnet/colors.dart';

class EditLanguage extends StatefulWidget {
  const EditLanguage({super.key});

  @override
  State<EditLanguage> createState() => _EditLanguageState();
}

class _EditLanguageState extends State<EditLanguage> {
  List<String> list = [
    "English",
    "Indonesia",
    "Arabic",
    "Chinese",
    "Dutch",
    "French",
    "German",
    "Japanese",
    "Korean",
  ];
  String? language;
  List<String> languageContries = [
    "assets/images/1England.png",
    "assets/images/1Indonesia.png",
    "assets/images/1Saudi Arabia.png",
    "assets/images/1China (1).png",
    "assets/images/1Netherlands.png",
    "assets/images/1France.png",
    "assets/images/1Germany.png",
    "assets/images/1Japan.png",
    "assets/images/1South Korea.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: list.length,
          itemBuilder: (context, index) =>
              RadioListTile(value: list[index],
                  contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  title: Row(children: [
                    AppImage(languageContries[index],width: 30,hieght: 20),
                    SizedBox(width: 12,),
                    Text(list[index])]),
                  groupValue: language,
                  controlAffinity: ListTileControlAffinity.trailing,
                shape: Border(
                  bottom: BorderSide(color: AppColors.borderColor)
                ),
                  onChanged: (value) {
                    language=value;
                    setState(() {

                    });
                  },))
    );
  }
}
