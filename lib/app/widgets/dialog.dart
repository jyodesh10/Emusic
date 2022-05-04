import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants.dart';
import '../modules/payment/views/payment_view.dart';

dialog() {
  Get.defaultDialog(
      title: "Not Subscribed Yet",
      middleText: "Subscribe",
      backgroundColor: Colors.white,
      titleStyle: subtitleStyle.copyWith(
          fontSize: 20, color: Colors.black87, fontWeight: FontWeight.normal),
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            child: Text(
              'Subscribe Now',
              style: subtitleStyle.copyWith(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ));
}
