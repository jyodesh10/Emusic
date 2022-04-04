import 'package:emusic/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar extends StatelessWidget {
  final String title;

  final String message;

  final Color? txtcolor;

  final Color? bgcolor;

  const CustomSnackbar(
      {Key? key,
      required this.title,
      required this.message,
      this.txtcolor,
      this.bgcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildSnackbar(title, message, txtcolor!, bgcolor!);
  }
}

buildSnackbar(title, message, Color txtcolor, Color bgcolor) {
  return Get.snackbar(title, message,
      animationDuration: Duration(seconds: 1),
      duration: Duration(seconds: 2),
      colorText: txtcolor,
      backgroundColor: bgcolor,
      snackPosition: SnackPosition.BOTTOM);
}
