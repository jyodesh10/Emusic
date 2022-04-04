import 'package:emusic/app/routes/app_pages.dart';
import 'package:emusic/app/widgets/customdrawer.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:emusic/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../controllers/nowplaying_controller.dart';

class NowplayingView extends GetView<NowplayingController> {
  @override
  NowplayingController controller = Get.put(NowplayingController());

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
          Text('Alice in Chains',
              style: titleStyle.copyWith(color: Colors.black)),
          // Obx(() => controller.musicList.value != null
          //     ? Text('Alice in Chains', style: titleStyle.copyWith(color: Colors.black))
          //     : Text('data')),
          Text('Them Bones',
              style: titleStyle.copyWith(fontSize: 16.sp, color: Colors.black)),
          Text('Dirt',
              style: titleStyle.copyWith(fontSize: 14.sp, color: Colors.black)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => CircleAvatar(
                  backgroundColor: controller.isOnRepeat.value
                      ? AppColors.primaryClr
                      : Colors.transparent,
                  radius: 30,
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          controller.repeat();

                          // CustomSnackbar(title: 'title', message: 'message');
                        },
                        icon: Icon(
                          Icons.repeat,
                          // size: 22.sp,
                          color: controller.isOnRepeat.value
                              ? Colors.white
                              : Colors.black,
                        )),
                  ),
                ),
              ),
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
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    // size: 22.sp,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(
            height: 30.sp,
          ),

          Container(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Column(
                children: [
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.position.value.timeFormat),
                        Text(controller.duration.value.timeFormat)
                      ],
                    ),
                  ),
                  Obx(
                    () => Slider(
                        activeColor: AppColors.primaryClr,
                        inactiveColor: Colors.grey.shade400,
                        value: controller.position.value.inSeconds.toDouble(),
                        min: 0.0,
                        max: controller.duration.value.inSeconds.toDouble() +
                            1.0,
                        onChanged: (double value) {
                          controller.setPositionValue = value;
                        }),
                  ),
                ],
              )),

          SizedBox(
            height: 30.sp,
          ),
          Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppIcons.skipback),
                SizedBox(
                  width: 20.sp,
                ),
                InkWell(
                  onTap: () {
                    controller.play();
                    controller.pause();
                    controller.playingStatus();
                  },
                  child: Image.asset(controller.isPlaying.value
                      ? AppIcons.pause
                      : AppIcons.play),
                ),
                SizedBox(
                  width: 20.sp,
                ),
                Image.asset(AppIcons.skipfwd)
              ],
            ),
          )
        ],
      ),
    );
  }
}
