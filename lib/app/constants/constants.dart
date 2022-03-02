import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColors {
  var mainBackground = Color.fromRGBO(248, 248, 248, 1);
  var primaryClr = Color.fromRGBO(13, 133, 243, 1);
  var shadow = Color.fromRGBO(0, 0, 0, 0.1);
}

TextStyle get titleStyle {
  return GoogleFonts.roboto(
      textStyle: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(255, 255, 255, 1)));
}

TextStyle get subtitleStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(255, 255, 255, 1)));
}
