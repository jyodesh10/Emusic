import 'package:emusic/app/constants/firebase_auth_constants.dart';
import 'package:emusic/app/controller/app_controller.dart';
import 'package:emusic/app/modules/login/controllers/login_controller.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final google = Google();

  AppController appcontroller = Get.put(AppController());

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
              height: MediaQuery.of(context).size.height - 100.sp,
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
                        buildDrawerItemTile('Search', Icons.search_rounded, () {
                          Get.toNamed(Routes.SEARCH);
                        }),
                        buildDrawerItemTile('Home', Icons.home_filled, () {
                          Get.toNamed(Routes.HOME);
                        }),
                        buildDrawerItemTile(
                            'Playlists', Icons.playlist_play, () {}),
                        buildDrawerItemTile('Downloads', Icons.download, () {}),
                        buildDrawerItemTile('Merch Store', Icons.store, () {
                          Get.toNamed(Routes.MERCHSTORE);
                        }),
                        buildDrawerItemTile('About', Icons.info_rounded, () {
                          Get.toNamed(Routes.ABOUT);
                        }),
                        buildDrawerItemTile('Log out', Icons.logout, () {
                          auth.signOut();
                          google.handleLogOut();
                          Get.offAllNamed(Routes.LOGIN);
                        }),
                        buildDrawerItemTile(
                            appcontroller.isSubscribed.value
                                ? 'Subscribed'
                                : ' Not Subscibed',
                            appcontroller.isSubscribed.value
                                ? Icons.check
                                : Icons.close, () {
                          Get.offAllNamed(Routes.SUBSCRIPTION);
                        }),
                      ],
                    ),
                    // Align(
                    //   alignment: Alignment.bottomCenter,
                    //   child: Text(
                    //     'Designed by:\n Jyodesh',
                    //     style: TextStyle(fontSize: 10.sp),
                    //   ),
                    // )
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
