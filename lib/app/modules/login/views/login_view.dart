import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:emusic/app/widgets/custombutton.dart';
import 'package:emusic/app/widgets/input_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: SingleChildScrollView(
          child: Container(
            height: 800.h,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 520.sp,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 30.sp),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 83, 152, 1),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 10,
                                offset: Offset(0, 9))
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200))),
                    ),
                    Container(
                      height: 430.sp,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 30.sp),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(8, 95, 174, 1),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 10,
                                offset: Offset(0, 9))
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200))),
                    ),
                    Container(
                      height: 320.sp,
                      width: double.infinity,
                      padding: EdgeInsets.only(bottom: 30.sp),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(11, 119, 218, 1),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 10,
                                offset: Offset(0, 9))
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200))),
                      // child: Align(
                      //     alignment: Alignment.bottomCenter,
                      //     child: Text('Login', style: titleStyle)),
                    ),
                    Container(
                      height: 236.sp,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryClr,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadow,
                                blurRadius: 10,
                                offset: Offset(0, 9))
                          ],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(200))),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo.png',
                                height: 100.sp),
                            SizedBox(
                              height: 20.sp,
                            ),
                            Text(
                              'E Music',
                              style: titleStyle.copyWith(fontSize: 25.sp),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: 300,
                          left: 23,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              Text('Login',
                                  style: titleStyle.copyWith(fontSize: 30.sp)),
                              SizedBox(
                                height: 60.sp,
                              ),
                              MyInputField(
                                title: 'email',
                                icon: Icon(
                                  Icons.email,
                                  size: 22.sp,
                                ),
                              ),
                              SizedBox(
                                height: 30.sp,
                              ),
                              MyInputField(
                                title: 'Password',
                                icon: Icon(
                                  Icons.password,
                                  size: 22.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forget Password?',
                                  style:
                                      subtitleStyle.copyWith(fontSize: 12.sp),
                                ),
                              ),
                              SizedBox(
                                height: 40.sp,
                              ),
                              CustomButton(
                                title: 'Login',
                                ontap: () => Get.toNamed(Routes.HOME),
                              ),
                              SizedBox(
                                height: 40.sp,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Not a member yet? ',
                                      style: subtitleStyle.copyWith(
                                          color: Colors.grey, fontSize: 12.sp),
                                      children: [
                                        TextSpan(
                                            text: 'Sign up',
                                            style: subtitleStyle.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                color: AppColors.primaryClr,
                                                fontSize: 12.sp),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () =>
                                                  Get.toNamed(Routes.REGISTER))
                                      ]),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
