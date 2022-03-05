import 'package:emusic/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FloatingMusicWidget extends StatelessWidget {
  const FloatingMusicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Container(
              height: 80.h,
              // width: 310.w,
              decoration: BoxDecoration(
                color: AppColors.primaryClr,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: ListTile(
                  contentPadding: EdgeInsets.only(left: 120, right: 26),
                  title: Text(
                    'Them Bones',
                    style: subtitleStyle.copyWith(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Alice in Chains',
                    style: subtitleStyle.copyWith(
                      fontSize: 13.sp,
                      color: Colors.white,
                    ),
                  ),
                  trailing: Image.asset(
                    'assets/icons/Pause.png',
                    color: Colors.white,
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30),
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/vinyl.png',
                  height: 150,
                ),
                Positioned(
                  left: 37.5,
                  top: 47,
                  child: CircleAvatar(
                    radius: 35.r,
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                      'assets/images/artist.png',
                      height: 64,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
