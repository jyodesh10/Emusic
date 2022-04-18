import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/controller/app_controller.dart';
import 'package:emusic/app/modules/payment/views/payment_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  DateTime now = DateTime.now();
  String formattedDate =
      DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  var morning = false.obs;
  var afternoon = false.obs;

  var evening = false.obs;
  var night = false.obs;

  AppController appController = Get.put(AppController());

  @override
  void onInit() {
    print(now);
    notSubscribed();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  notSubscribed() async {
    await appController.isSubscribed.value;
    if (appController.isSubscribed.value == false) {
      Get.defaultDialog(
          title: "Not Subscribed Yet",
          middleText: "Subscribe",
          backgroundColor: Colors.white,
          titleStyle: titleStyle.copyWith(color: Colors.black),
          middleTextStyle: subtitleStyle.copyWith(color: Colors.black),
          content: Column(
            children: [
              CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                  child: Icon(Icons.close, size: 35, color: Colors.white)),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Get.to(() => PaymentView());
                },
                color: AppColors.primaryClr,
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text(
                  'Subscribe Now',
                  style:
                      subtitleStyle.copyWith(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ));
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
