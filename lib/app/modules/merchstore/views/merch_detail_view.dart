import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/modules/payment/views/payment_view.dart';
import 'package:emusic/app/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MerchDetailView extends StatelessWidget {
  const MerchDetailView({Key? key, this.img, this.title, this.price})
      : super(key: key);
  final String? img;
  final String? title;
  final String? price;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 20,
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(img!))),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.mainBackground,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: AppColors.shadow,
                            offset: Offset(1, 4))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title!,
                        style: titleStyle.copyWith(color: Colors.black),
                      ),
                      Text(
                        'Rs. ${price!}',
                        style: titleStyle.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: CustomButton(
                        title: 'Buy Now',
                        ontap: () {
                          Get.to(() => PaymentView(
                                amount: price,
                              ));
                        },
                      ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
