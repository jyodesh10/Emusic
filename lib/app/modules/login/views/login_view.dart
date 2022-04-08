import 'package:emusic/app/constants/auth_controller.dart';
import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/modules/adminpanel/views/adminpanel_view.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:emusic/app/utils/validators.dart';
import 'package:emusic/app/widgets/custombutton.dart';
import 'package:emusic/app/widgets/input_field.dart';
import 'package:emusic/app/widgets/snackbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends GetView<LoginController> {
  final _formKey = GlobalKey<FormState>();
  @override
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        body: SingleChildScrollView(
          child: Container(
            // height: 800.h,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 520.h,
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
                      height: 430.h,
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
                      height: 320.h,
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
                      height: 236.h,
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
                            Image.asset('assets/images/logo.png', height: 100),
                            SizedBox(
                              height: 20,
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
                          top: 250,
                          left: 23,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Form(
                            autovalidateMode: AutovalidateMode.always,
                            key: _formKey,
                            child: Column(
                              children: [
                                Text('Login',
                                    style:
                                        titleStyle.copyWith(fontSize: 30.sp)),
                                SizedBox(
                                  height: 60,
                                ),
                                MyInputField(
                                  title: 'email',
                                  controller: controller.emailController,
                                  validator: (v) => validateEmail(string: v),
                                  icon: Icon(
                                    Icons.email,
                                    size: 22,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                MyInputField(
                                  controller: controller.passwordController,
                                  validator: (v) => validatePassword(string: v),
                                  title: 'Password',
                                  icon: Icon(
                                    Icons.password,
                                    size: 22,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Forget Password?',
                                    style: subtitleStyle.copyWith(
                                        fontSize: 12,
                                        color: Colors.grey.shade300),
                                  ),
                                ),
                                SizedBox(
                                  height: 40.sp,
                                ),
                                CustomButton(
                                  title: 'Login',
                                  ontap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      AuthController.authInstance.login(
                                        controller.emailController.text.trim(),
                                        controller.passwordController.text
                                            .trim(),
                                      );
                                      // Get.snackbar('Log in', 'Successfull');
                                    } else {
                                      buildSnackbar(
                                          'Error',
                                          'Email or password',
                                          Colors.white,
                                          Color.fromARGB(188, 219, 5, 5));
                                    }

                                    if (controller.emailController.text ==
                                            "jyodesh@gmail.com" &&
                                        controller.passwordController.text ==
                                            "jyodesh") {
                                      Get.to(AdminpanelView());
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Text(
                                  '-------------------- Or Connect with --------------------',
                                  style: subtitleStyle.copyWith(
                                      fontSize: 10.sp,
                                      color: Colors.grey.shade500),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                SizedBox(
                                  width: 250.w,
                                  height: 50.h,
                                  child: MaterialButton(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    color: Colors.white,
                                    onPressed: () async {
                                      Google google = Google();
                                      await google.handleLogIn();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(AppIcons.google),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Google',
                                          style: titleStyle.copyWith(
                                              color: Colors.grey,
                                              fontSize: 20.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: RichText(
                                    text: TextSpan(
                                        text: 'Not a member yet? ',
                                        style: subtitleStyle.copyWith(
                                            color: Colors.grey,
                                            fontSize: 12.sp),
                                        children: [
                                          TextSpan(
                                              text: 'Sign up',
                                              style: subtitleStyle.copyWith(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: AppColors.primaryClr,
                                                  fontSize: 12.sp),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () => Get.toNamed(
                                                    Routes.REGISTER))
                                        ]),
                                  ),
                                ),
                              ],
                            ),
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
