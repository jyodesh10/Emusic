import 'package:emusic/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryClr,
      child: ListView(
        children: [
          SizedBox(
            height: 170.sp,
            child: DrawerHeader(
                margin: EdgeInsets.zero,
                curve: Curves.ease,
                decoration: BoxDecoration(
                  color: AppColors.primaryClr,
                ),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(AppImages.logo, height: 100.sp),
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Text(
                      'E MUSIC',
                      style: titleStyle.copyWith(fontSize: 20.sp),
                    )
                  ],
                )),
          ),
          Container(
              height: MediaQuery.of(context).size.height - 200.sp,
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
              decoration: BoxDecoration(
                  color: AppColors.mainBackground,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        buildDrawerItemTile(
                            'Now Playing', Icons.audiotrack, () {}),
                        buildDrawerItemTile('Home', Icons.home_filled, () {
                          Get.toNamed(Routes.HOME);
                        }),
                        buildDrawerItemTile('Artists', Icons.my_library_music,
                            () {
                          Get.toNamed(Routes.ARTIST);
                        }),
                        buildDrawerItemTile(
                            'Albums', Icons.audio_file_rounded, () {}),
                        buildDrawerItemTile(
                            'Genres', Icons.movie_filter, () {}),
                        buildDrawerItemTile('Merch Store', Icons.store, () {
                          Get.toNamed(Routes.MERCHSTORE);
                        }),
                        buildDrawerItemTile('About', Icons.info_rounded, () {
                          Get.toNamed(Routes.ABOUT);
                        }),
                        buildDrawerItemTile('Log out', Icons.logout, () {
                          Get.offAllNamed(Routes.LOGIN);
                        }),
                        buildDrawerItemTile('Not Subscribed', Icons.close, () {
                          Get.offAllNamed(Routes.SUBSCRIPTION);
                        }),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Designed by:\n Jyodesh',
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  buildDrawerItemTile(title, IconData icon, VoidCallback ontap) {
    return ListTile(
      minVerticalPadding: 0,
      leading: Icon(
        icon,
        color: Colors.black,
        size: 20.sp,
      ),
      minLeadingWidth: 0,
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.bold),
      ),
      onTap: ontap,
    );
  }
}
