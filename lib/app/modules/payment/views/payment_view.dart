import 'package:emusic/app/widgets/custombutton.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constants.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryClr,
      body: Column(
        children: [
          buildPaymentTop(),
          buildPaymentBottom(),
        ],
      ),
    );
  }

  buildPaymentTop() {
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
                onPressed: () => Get.back(),
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
                'Payment',
                style:
                    titleStyle.copyWith(fontSize: 30.sp, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 50.sp,
            ),
            Text(
              'Payment Methods',
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

  buildPaymentBottom() {
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
            buildPaymentTiles(AppIcons.esewa),
            SizedBox(
              height: 20.sp,
            ),
            buildPaymentTiles(AppIcons.khalti),
            // SizedBox(
            //   height: 150.sp,
            // ),
            Spacer(),
            Center(
                child: CustomButton(
              title: 'Proceed',
              // ontap: () => Get.toNamed(Routes.PAYMENT),
            )),
            SizedBox(
              height: 40.sp,
            ),
          ],
        ),
      ),
    );
  }

  buildPaymentTiles(
    image,
  ) {
    return Container(
      height: 80.sp,
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(24, 59, 58, 58),
                blurRadius: 10,
                offset: Offset(2, 2))
          ]),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 30.sp,
          ),
        ],
      ),
    );
  }
}
