import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.title, this.ontap})
      : super(key: key);

  final String title;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45.h,
        width: 250.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.sp)),
            color: AppColors.primaryClr),
        child: Center(
          child: Text(
            title,
            style: titleStyle.copyWith(fontSize: 20.sp),
          ),
        ),
      ),
    );
  }
}
