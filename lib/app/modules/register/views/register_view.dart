import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/widgets/custombutton.dart';
import 'package:emusic/app/widgets/input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              buildAppbar(),
              Padding(
                padding: EdgeInsets.only(top: 70.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', height: 100),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Center(
                      child: Text(
                        'Register',
                        style: titleStyle,
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    buildUserDetailsTile(),
                    SizedBox(
                      height: 50.sp,
                    ),
                    CustomButton(title: 'Register'),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: 'Already a member? ',
                            style: subtitleStyle.copyWith(
                                color: Colors.grey, fontSize: 12.sp),
                            children: [
                              TextSpan(
                                  text: 'Sign in',
                                  style: subtitleStyle.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.primaryClr,
                                      fontSize: 12.sp),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Get.toNamed(Routes.LOGIN))
                            ]),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  buildAppbar() {
    return Container(
      height: 300.h,
      decoration: BoxDecoration(
          color: AppColors.primaryClr,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(150),
              bottomRight: Radius.circular(150))),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Get.back();
          },
        ),
      ),
    );
  }

  buildUserDetailsTile() {
    return Container(
      // height: 300.h,
      margin: EdgeInsets.symmetric(horizontal: 25.sp),
      padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 15.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow, blurRadius: 10, offset: Offset(0, 2))
          ]),
      child: Column(
        children: [
          Text(
            'User Details',
            style: subtitleStyle.copyWith(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 15.sp,
          ),
          MyInputField(
            icon: Icon(
              Icons.email,
              size: 18.sp,
            ),
            title: 'Email',
          ),
          SizedBox(
            height: 15.sp,
          ),
          MyInputField(
            icon: Icon(
              Icons.person,
              size: 18.sp,
            ),
            title: 'Username',
          ),
          SizedBox(
            height: 15.sp,
          ),
          MyInputField(
            icon: Icon(
              Icons.password,
              size: 18.sp,
            ),
            title: 'Password',
          ),
          SizedBox(
            height: 15.sp,
          ),
          MyInputField(
            icon: Icon(
              Icons.password,
              size: 18.sp,
            ),
            title: 'Confirm Password',
          ),
          SizedBox(
            height: 15.sp,
          ),
        ],
      ),
    );
  }
}
