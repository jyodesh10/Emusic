import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin AppColors {
  static const mainBackground = Color.fromRGBO(248, 248, 248, 1);
  static const primaryClr = Color.fromRGBO(13, 133, 243, 1);
  static const shadow = Color.fromRGBO(0, 0, 0, 0.1);
}

mixin AppImages {
  static const logo = "assets/images/logo.png";
  static const vinyl = "assets/images/vinyl.png";
  static const vinyl2 = "assets/images/vinyl2.png";
  static const merch = "assets/images/merch.png";
  static const artist = "assets/images/artist.png";
  static const developer = "assets/images/jyodesh.png";
}

mixin AppIcons {
  static const esewa = "assets/icons/esewa.png";
  static const khalti = "assets/icons/khalti.png";
  static const pause = "assets/icons/Pause.png";
  static const skipback = "assets/icons/SkipBack.png";
  static const skipfwd = "assets/icons/SkipFwd.png";
  static const share = "assets/icons/Share.png";
}

TextStyle get titleStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Color.fromRGBO(255, 255, 255, 1)));
}

TextStyle get subtitleStyle {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(255, 255, 255, 1)));
}
