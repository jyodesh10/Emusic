import 'dart:io';

import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/widgets/custombutton.dart';
import 'package:emusic/app/widgets/input_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/adminpanel_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminpanelView extends GetView<AdminpanelController> {
  @override
  AdminpanelController controller = Get.put(AdminpanelController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Admin Panel',
          style: titleStyle.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Form(
          child: Obx(
            () => Column(
              children: [
                controller.selectedImagePath.value.isNotEmpty
                    ?
                    //  CircleAvatar(
                    //     radius: 60,
                    //     backgroundImage:
                    //         FileImage(File(controller.selectedImagePath.value)),
                    //   )
                    Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: FileImage(
                              File(controller.selectedImagePath.value)),
                        )),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: FileImage(
                              File(controller.selectedImagePath.value)),
                        )),
                      ),
                MaterialButton(
                  onPressed: () {
                    controller.getImage();
                  },
                  color: AppColors.primaryClr,
                  child: Text(
                    'Upload Album Image',
                    style: subtitleStyle,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: AppColors.primaryClr,
                  child: Text(
                    'Upload Mp3 File',
                    style: subtitleStyle,
                  ),
                ),
                InputField(label: 'Album name'),
                InputField(label: 'Artist'),
                InputField(label: 'Genre'),
                InputField(label: 'Song title'),
                CustomButton(title: 'Upload')
              ],
            ),
          ),
        )),
      ),
    );
  }
}
