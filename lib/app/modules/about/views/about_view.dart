import 'package:emusic/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/about_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// About view

class AboutView extends GetView<AboutController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
          toolbarHeight: 60.sp,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22.sp,
                  color: Colors.black,
                )),
          ),
          title: Text(
            'About',
            style: titleStyle.copyWith(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Image.asset(
                AppImages.logo,
                height: 150,
              )),
              SizedBox(
                height: 10,
              ),
              Text(
                'E-Music',
                style:
                    titleStyle.copyWith(color: Colors.black, fontSize: 30.sp),
              ),
              Text(
                'Version : 1.0',
                style: titleStyle.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.sp),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 2,
              ),
              buildDeveloperTile(),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  'Undergrauduate project\n             Available on',
                  style: titleStyle.copyWith(color: Colors.black, fontSize: 15),
                ),
              ),
              MaterialButton(
                  onPressed: () {
                    controller.launchurl('https://github.com/jyodesh10/Emusic');
                  },
                  color: Colors.grey.shade200,
                  highlightColor: Colors.amber,
                  child: Text(
                    "GITHUB",
                    style: titleStyle.copyWith(color: AppColors.primaryClr),
                  ))
            ],
          ),
        ));
  }

  buildDeveloperTile() {
    return Container(
      height: 70,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow, blurRadius: 4, offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Center(
        child: ListTile(
          leading: Image.asset(AppImages.developer),
          title: Text('Jyodesh Shakya'),
          subtitle: Text('App Developer'),
          trailing: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryClr,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                controller.launchurl('https://github.com/jyodesh10');
              },
              icon: FaIcon(FontAwesomeIcons.github, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
