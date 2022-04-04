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
  final FormFieldValidator? validator;
  const MyInputField(
      {Key? key,
      required this.title,
      this.hint,
      this.controller,
      this.widget,
      this.ismultiline = false,
      this.customtitle = false,
      this.containsPadding = true,
      this.icon,
      this.validator})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 50,
      // padding: EdgeInsets.symmetric(horizontal: 40.sp),
      // color: Colors.white,
      // width: double.infinity,
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
        validator: validator,

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

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      this.controller,
      this.hintText = '',
      this.icon = Icons.error,
      this.validator,
      this.isMultiline = false,
      required this.label,
      this.widget,
      this.isReadonly = false,
      this.obscureText = false})
      : super(key: key);
  final bool isMultiline;
  // ignore: prefer_typing_uninitialized_variables
  final validator;
  final TextEditingController? controller;
  final String hintText;
  final String label;
  final IconData? icon;
  final Image? widget;
  final bool isReadonly;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      // height: getProportionateScreenHeight(60),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        // vertical: getProportionateScreenHeight(10),
      ),
      child: obscureText
          ? TextFormField(
              obscureText: obscureText,
              readOnly: isReadonly,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: FocusNode(),
              controller: controller,
              validator: validator,
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(164, 164, 164, .5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(164, 164, 164, 1)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: widget ??
                      Icon(
                        icon,
                      ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey)),
            )
          : TextFormField(
              obscureText: obscureText,
              readOnly: isReadonly,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              focusNode: FocusNode(),
              controller: controller,
              validator: validator,
              maxLines: isMultiline ? 4 : null,
              decoration: InputDecoration(
                  labelText: label,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(164, 164, 164, .5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: const BorderSide(
                        color: Color.fromRGBO(164, 164, 164, 1)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  prefixIcon: widget ??
                      Icon(
                        icon,
                      ),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.grey)),
            ),
    );
  }
}
