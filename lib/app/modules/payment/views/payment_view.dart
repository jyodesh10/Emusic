import 'package:emusic/app/widgets/custombutton.dart';
import 'package:esewa_pnp/esewa.dart';
import 'package:esewa_pnp/esewa_pnp.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constants.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends StatefulWidget {
  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  late ESewaPnp _esewaPnp;
  late ESewaConfiguration _configuration;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _configuration = ESewaConfiguration(
      clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
      secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
      environment: ESewaConfiguration.ENVIRONMENT_TEST,
    );
    _esewaPnp = ESewaPnp(configuration: _configuration);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryClr,
      body: Column(
        children: [
          buildPaymentTop(),
          buildPaymentBottom(),
        ],
      ),
    );
  }

  buildPaymentTop() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.sp,
            ),
            IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 22.sp,
                )),
            Spacer(),
            Center(
              child: Text(
                'Payment',
                style:
                    titleStyle.copyWith(fontSize: 30.sp, color: Colors.white),
              ),
            ),
            Spacer(),
            Text(
              'Payment Methods',
              style: titleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10.sp,
            )
          ],
        ),
      ),
    );
  }

  buildPaymentBottom() {
    return Expanded(
      flex: 2,
      child: Container(
        // height: 500,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 25.sp),
        decoration: BoxDecoration(
            color: AppColors.mainBackground,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.r),
                topRight: Radius.circular(40.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.sp,
            ),
            buildPaymentTiles(AppIcons.esewa),
            SizedBox(
              height: 20.sp,
            ),
            buildPaymentTiles(AppIcons.khalti),
            // SizedBox(
            //   height: 150.sp,
            // ),
            // Spacer(),
            ESewaPaymentButton(
              this._esewaPnp,
              amount: 1000,
              productId: '1',
              productName: 'Emusic Subscription',
              callBackURL: '',
              onSuccess: (result) {
                ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(
                    Color.fromRGBO(65, 161, 36, 1), result.message.toString()));
              },
              onFailure: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                    buildSnackBar(Colors.red, e.message.toString()));
              },
            ),
            Center(
                child: CustomButton(
              title: 'Proceed',
              // ontap: () => Get.toNamed(Routes.PAYMENT),
            )),
            SizedBox(
              height: 40.sp,
            ),
          ],
        ),
      ),
    );
  }

  buildSnackBar(Color color, String msg) {
    return SnackBar(
      backgroundColor: color,
      content: Text(msg),
    );
  }

  buildPaymentTiles(
    image,
  ) {
    return Container(
      height: 80.sp,
      padding: EdgeInsets.symmetric(horizontal: 30.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(24, 59, 58, 58),
                blurRadius: 10,
                offset: Offset(2, 2))
          ]),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 30.sp,
          ),
        ],
      ),
    );
  }
}
