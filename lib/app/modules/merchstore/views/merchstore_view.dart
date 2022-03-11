import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../controllers/merchstore_controller.dart';

class MerchstoreView extends GetView<MerchstoreController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppbar(),
          buildMerchTop(),
          SizedBox(
            height: 15.sp,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'New Arrivals',
              style: titleStyle.copyWith(color: Colors.black, fontSize: 15.sp),
            ),
          ),
          Container(
            height: 180.sp,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int i) {
                  return buildMerchCard();
                }),
          ),
        ],
      ),
    );
  }

  buildMerchTop() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 300.h,
          child: Image.asset(
            AppImages.merch,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          height: 300.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              gradient: LinearGradient(
                colors: [
                  // Colors.white24,
                  Colors.transparent,
                  // Color.fromRGBO(255, 252, 252, 1),
                  Colors.black12,
                  // Color.fromRGBO(0, 0, 0, 0.35),
                  Colors.black54
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(30.sp, 200.sp, 30.sp, 0.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Facelift T-shirt\nRs.1500',
                style:
                    titleStyle.copyWith(fontSize: 16.sp, color: Colors.white),
              ),
              Container(
                height: 40.sp,
                width: 100.sp,
                decoration: BoxDecoration(
                    color: AppColors.primaryClr,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color: AppColors.shadow,
                          offset: Offset(1, 4))
                    ],
                    borderRadius: BorderRadius.circular(40.r)),
                child: Center(
                  child: Text(
                    'Buy Now',
                    style: titleStyle.copyWith(
                        fontSize: 12.sp, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  buildAppbar() {
    return AppBar(
      toolbarHeight: 60.sp,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, size: 22.sp, color: Colors.black)),
      title: Text(
        'Merch Store',
        style: titleStyle.copyWith(color: Colors.black),
      ),
    );
  }

  buildMerchCard() {
    return Container(
      height: 200.sp,
      width: 150.sp,
      margin: EdgeInsets.symmetric(horizontal: 10.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                blurRadius: 5, color: AppColors.shadow, offset: Offset(1, 4))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
                  height: 120.sp, child: Image.asset(AppImages.merch))),
          Padding(
            padding: EdgeInsets.only(left: 10.sp),
            child: Text(
              'FaceLift T-shirt\nRs. 1500',
              overflow: TextOverflow.fade,
              style: subtitleStyle.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
