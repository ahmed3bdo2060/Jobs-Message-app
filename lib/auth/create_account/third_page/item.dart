import 'package:flutter/material.dart';
import 'package:jobs/auth/create_account/third_page/model.dart';

import '../../../core/componnet/app_image.dart';
import '../../../core/componnet/colors.dart';
import '../second_page/model.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.model, required this.callback});

  final ContriesModel model;
  final  void Function(ContriesModel,bool) callback;

  @override
  State<Item> createState() => ItemState();
}

class ItemState extends State<Item> {
  bool change = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        change = !change;
        widget.callback(widget.model,change==false);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: change == true ? Colors.white : Color(0xffD6E4FF),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: change == true
                  ? AppColors.unSelectedItem
                  : AppColors.selectedItem,
              width: 1.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          child: Row(mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            AppImage(
              widget.model.flag,
              width: 26,
              hieght: 26,
              color: change == true ? Colors.black : AppColors.buttonColor,
            ),
            SizedBox(
              width: 2.5,
            ),
            Text(
              widget.model.title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }
}