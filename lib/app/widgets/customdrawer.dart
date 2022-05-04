import 'dart:async';

import 'package:emusic/app/constants/firebase_auth_constants.dart';
import 'package:emusic/app/controller/app_controller.dart';
import 'package:emusic/app/modules/downloads/controllers/downloads_controller.dart';
import 'package:emusic/app/modules/downloads/views/downloads_view.dart';
import 'package:emusic/app/modules/login/controllers/login_controller.dart';
import 'package:emusic/app/modules/register/controllers/register_controller.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../modules/nowplaying/controllers/nowplaying_controller.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final google = Google();
  var trialMode = false.obs;

  AppController appcontroller = Get.put(AppController());
  RegisterController regcontroller = Get.put(RegisterController());
  NowplayingController npcontroller = Get.put(NowplayingController());
  DownloadsController dcontroller = Get.put(DownloadsController());
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
                            'Favourites', Icons.favorite_rounded, () {
                          Get.toNamed(Routes.FAVOURITES);
                        }),
                        buildDrawerItemTile('Downloads', Icons.download, () {
                          Get.to(() => DownloadsView());
                        }),
                        buildDrawerItemTile('Merch Store', Icons.store, () {
                          Get.toNamed(Routes.MERCHSTORE);
                        }),
                        buildDrawerItemTile('About', Icons.info_rounded, () {
                          Get.toNamed(Routes.ABOUT);
                        }),
                        buildDrawerItemTile('Log out', Icons.logout, () {
                          auth.signOut();
                          google.handleLogOut();
                          npcontroller.audioPlayer.stop();
                          Get.offAllNamed(Routes.LOGIN);
                          regcontroller.data.remove('username');
                          dcontroller.deleteAll();
                        }),
                        Obx(
                          () => buildDrawerItemTile(
                              appcontroller.isSubscribed.value
                                  ? 'Subscribed'
                                  : ' Not Subscibed',
                              appcontroller.isSubscribed.value
                                  ? Icons.check
                                  : Icons.close, () {
                            Get.offAllNamed(Routes.SUBSCRIPTION);
                          }),
                        ),
                        Obx(
                          () => SwitchListTile(
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                '1 Day Trial Mode',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text('24:00'),
                              value: appcontroller.trialMode.value,
                              onChanged: (val) {
                                print(val);
                                appcontroller.trialMode.value =
                                    !appcontroller.trialMode.value;
                                if (appcontroller.trialMode.value) {
                                  appcontroller.isSubscribed.value = true;
                                  Timer.periodic(Duration(hours: 24), (Timer) {
                                    // print(Timer.tick);
                                    appcontroller.isSubscribed.value = false;
                                  });
                                  Get.defaultDialog(
                                      middleText: '24 hour Trial has started');
                                } else {
                                  appcontroller.isSubscribed.value = false;
                                }
                              }),
                        )
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
