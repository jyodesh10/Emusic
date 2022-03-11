import 'package:emusic/app/widgets/customdrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../controllers/nowplaying_controller.dart';

class NowplayingView extends GetView<NowplayingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        toolbarHeight: 60.sp,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 22.sp,
                color: Colors.black,
              )),
        ),
        title: Text(
          'Now Playing',
          style: titleStyle.copyWith(color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizedBox(
          //   height: 40.sp,
          // ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 150.r,
              // foregroundImage: AssetImage(AppImages.vinyl2),
              backgroundImage: AssetImage(AppImages.vinyl2),
              child: CircleAvatar(
                radius: 60.r,
                child: Image.asset(
                  AppImages.artist,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Text('Alice In Chains',
              style: titleStyle.copyWith(color: Colors.black)),
          Text('Them Bones',
              style: titleStyle.copyWith(fontSize: 16.sp, color: Colors.black)),
          Text('Dirt',
              style: titleStyle.copyWith(fontSize: 14.sp, color: Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: MaterialButton(
                  onPressed: () {},
                  color: AppColors.primaryClr,
                  height: 20.sp,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.r)),
                  child: Text(
                    'Download',
                    style: subtitleStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 70.sp,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    size: 22.sp,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 30.sp,
              )
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Image.asset(
                'assets/icons/slider.png',
              )),
          SizedBox(
            height: 30.sp,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppIcons.skipback),
              Image.asset(AppIcons.pause),
              Image.asset(AppIcons.skipfwd)
            ],
          )
        ],
      ),
    );
  }
}
