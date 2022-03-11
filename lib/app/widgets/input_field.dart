import 'package:emusic/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String title;
  final String? hint;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? ismultiline;
  final bool customtitle;
  final bool? containsPadding;
  final Icon? icon;
  const MyInputField(
      {Key? key,
      required this.title,
      this.hint,
      this.controller,
      this.widget,
      this.ismultiline = false,
      this.customtitle = false,
      this.containsPadding = true,
      this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.sp,
      // padding: EdgeInsets.symmetric(horizontal: 40.sp),
      // color: Colors.white,
      width: double.infinity,
      // decoration: BoxDecoration(
      //   boxShadow: [
      //   BoxShadow(
      //       color: AppColors().shadow, blurRadius: 5, offset: Offset(0, 9))
      // ]),
      child: TextFormField(
        keyboardType: TextInputType.multiline,
        readOnly: widget == null ? false : true,
        autofocus: false,
        cursorColor: Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
        controller: controller,
        style: subtitleStyle.copyWith(
            color: Colors.grey.shade600, fontSize: 16.sp),
        minLines: ismultiline! ? 2 : null,
        maxLines: ismultiline! ? 6 : null,
        // expands: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: icon,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            title,
            style: subtitleStyle.copyWith(
                fontSize: 15.sp, color: Colors.grey.shade600),
          ),
          hintText: hint,
          hintStyle: subtitleStyle.copyWith(color: Colors.grey.shade300),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.grey.shade300)),
        ),
      ),
    );
  }
}
