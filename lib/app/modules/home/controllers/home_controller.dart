import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/controller/app_controller.dart';
import 'package:emusic/app/modules/payment/views/payment_view.dart';
import 'package:emusic/app/widgets/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

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
  void onInit() async {
    await Permission.storage.status;
    print(now);
    notSubscribed();
    date();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  date() {
    DateTime now = DateTime.now();
  }

  // checks if subscribed or not

  notSubscribed() async {
    await appController.isSubscribed.value;
    if (appController.isSubscribed.value == false) {
      dialog();
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
