import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs/core/componnet/colors.dart';

import 'app_image.dart';
enum InputType{normal,password,phone}
class AppInput extends StatefulWidget {
  final String? label , hint,prefixIcon;
  final bool isPassword;
  final InputType inputType;
  final bool isMultiLines;
  final bool alignHint;
  void Function(String)? onChange;
  final TextEditingController? controller;
  final String? Function(String? value)? validate;
  final TextInputType? keyboardType;
  final FloatingLabelAlignment lableAlign;
   AppInput({super.key,
    this.label,
    this.keyboardType,
    this.isPassword=false,
    this.hint,
    this.onChange,
    this.lableAlign=FloatingLabelAlignment.start,
    this.alignHint=true,
    this.isMultiLines=false,this.validate,
    this.controller,
    this.prefixIcon,
    this.inputType=InputType.normal,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}
class _AppInputState extends State<AppInput> {
  bool isHidden = true;
  bool focus = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: TextFormField(
        obscureText: isHidden&&widget.inputType==InputType.password,
        maxLines: widget.isMultiLines?3:1,
        keyboardType: widget.keyboardType,
        controller: widget.controller ,
        validator:widget.validate,
        onChanged: widget.onChange,
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            icon: widget.inputType==InputType.phone?Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white10),
                borderRadius: BorderRadius.circular(16.r)
              ),
              padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: AppImage("assets/images/saudi.png",
                    width: 32.w,
                    hieght: 20.h,)),
                  SizedBox(height: 4.h,),
                  Text("+966",textDirection: TextDirection.ltr,style: TextStyle(
                    color: Colors.white10,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ):null,
            alignLabelWithHint: widget.alignHint,
            floatingLabelAlignment: widget.lableAlign,
            prefixIcon: widget.prefixIcon != null ? Padding(
              padding: EdgeInsets.all(16.r),
              child: AppImage(widget.prefixIcon!,
                width: 20.w,
                hieght: 20.h,
                color:widget.controller!.text.isEmpty?AppColors.borderColor:Colors.black,
                ),
            ):null,
            suffixIcon: widget.inputType==InputType.password?IconButton(
              icon: Icon(
                  isHidden?Icons.visibility_off:Icons.visibility,
                  color:widget.controller!.text.isEmpty?AppColors.borderColor:Colors.black),
              onPressed: (){
                isHidden= !isHidden;
                setState(() {
      
                });
              },):null
        ),
      ),
    ) ;
  }
}
