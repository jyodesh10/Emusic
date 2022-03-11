import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FloatingMusicWidget extends StatelessWidget {
  const FloatingMusicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.NOWPLAYING),
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 70.sp, left: 20.sp, right: 20.sp),
              child: Container(
                height: 80.sp,
                // width: 310.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryClr,
                  borderRadius: BorderRadius.circular(40.r),
                ),
                child: Center(
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 110.sp, right: 26.sp),
                    title: Text(
                      'Them Bones',
                      style: subtitleStyle.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      'Alice in Chains',
                      style: subtitleStyle.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Image.asset(
                      'assets/icons/Pause.png',
                      color: Colors.white,
                      height: 24.sp,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // padding: EdgeInsets.only(top: 30.sp,left: 0.sp),
              top: 30.sp, right: 213.sp,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/vinyl.png',
                    height: 150.sp,
                  ),
                  Positioned(
                    left: 37.5.sp,
                    top: 47.sp,
                    child: CircleAvatar(
                      radius: 35.r,
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/images/artist.png',
                        height: 60.sp,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
