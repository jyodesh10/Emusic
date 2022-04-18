import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/modules/merchstore/views/merch_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../modules/payment/views/payment_view.dart';

class Carousel extends StatefulWidget {
  const Carousel(
      {Key? key, required this.img, required this.title, required this.price})
      : super(key: key);

  final String img;
  final String title;
  final String price;
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentPage = 0;
  final List<Widget> _banners = List.generate(
    3,
    (index) => Image.asset(
      AppImages.developer,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildCarousel(widget.img, widget.title, widget.price),
        buildSizedBox(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _banners.length,
            (index) => buildDot(index: index),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? AppColors.primaryClr : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  buildSizedBox() {
    return const SizedBox(
      height: 18,
    );
  }

  buildCarousel(String img, String title, String price) {
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentPage = value;
            });
          },
          itemCount: _banners.length,
          itemBuilder: (context, index) => Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300.h,
                    child: Image.network(
                      img,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: 300.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        gradient: LinearGradient(
                          colors: [
                            // Colors.white24,
                            Colors.transparent,
                            // Color.fromRGBO(255, 252, 252, 1),
                            Colors.black12,
                            // Color.fromRGBO(0, 0, 0, 0.35),
                            Colors.black54
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.sp, 170.sp, 30.sp, 0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${title}\nRs.${price}',
                          style: titleStyle.copyWith(
                              fontSize: 16.sp, color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => MerchDetailView(
                                  img: img,
                                  price: price,
                                  title: title,
                                ));
                          },
                          child: Container(
                            height: 40.sp,
                            width: 100.sp,
                            decoration: BoxDecoration(
                                color: AppColors.primaryClr,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: AppColors.shadow,
                                      offset: Offset(1, 4))
                                ],
                                borderRadius: BorderRadius.circular(40.r)),
                            child: Center(
                              child: Text(
                                'Buy Now',
                                style: titleStyle.copyWith(
                                    fontSize: 12.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )

          //  Container(
          //       decoration:
          //           BoxDecoration(borderRadius: BorderRadius.circular(30)),
          //       padding: const EdgeInsets.all(20.0),
          //       child: _banners[index],
          //     )
          ),
    );
  }
}
