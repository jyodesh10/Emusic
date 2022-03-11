import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../widgets/custombutton.dart';
import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryClr,
      body: Column(
        children: [
          buildSubscriptionTop(),
          buildSubscriptionBottom(),
        ],
      ),
    );
  }

  buildSubscriptionTop() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.sp,
            ),
            IconButton(
                onPressed: () => Get.toNamed(Routes.HOME),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 22.sp,
                )),
            SizedBox(
              height: 40.sp,
            ),
            Center(
              child: Text(
                'Subscription',
                style:
                    titleStyle.copyWith(fontSize: 30.sp, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
            Text(
              'Available',
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  buildSubscriptionBottom() {
    return Expanded(
      flex: 2,
      child: Container(
        // height: 500,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.sp),
        decoration: BoxDecoration(
            color: AppColors.mainBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.sp,
            ),
            Text(
              'LifeTime Subscription',
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.black),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Container(
              height: 80.sp,
              decoration: BoxDecoration(
                  color: AppColors.primaryClr,
                  borderRadius: BorderRadius.circular(100.r),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      AppColors.primaryClr,
                      Colors.red,
                    ],
                  ),
                  boxShadow: [BoxShadow(blurRadius: 5, offset: Offset(2, 2))]),
              child: Center(
                child: Text(
                  'Rs. 1000 only',
                  style: titleStyle.copyWith(shadows: [
                    Shadow(
                        blurRadius: 5,
                        color: Colors.white,
                        offset: Offset(2, 1))
                  ], color: Colors.white, fontSize: 30.sp),
                ),
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Text(
              'Features',
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.sp, top: 10.sp),
              child: Text(
                '* Access on all devices\n* Stream High quality audio\n* Download music',
                style: subtitleStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: Colors.black),
              ),
            ),
            Spacer(),
            Center(
                child: CustomButton(
              title: 'Subscribe',
              ontap: () => Get.toNamed(Routes.PAYMENT),
            )),
            SizedBox(
              height: 40.sp,
            )
          ],
        ),
      ),
    );
  }
}
