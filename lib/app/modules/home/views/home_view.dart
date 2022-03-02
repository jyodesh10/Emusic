import 'package:emusic/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().mainBackground,
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.sp,
            ),
            buildAppBar(),
            SizedBox(
              height: 40.sp,
            ),
            buildHomeTiles('Your Favourite Artists'),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Recommended for you'),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Top Artists'),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Top Genres'),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Top Albums'),
            SizedBox(
              height: 25.sp,
            ),
          ],
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors().mainBackground,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 22.sp,
            color: Colors.black,
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Evening,",
            style: titleStyle.copyWith(color: Colors.black, fontSize: 25.sp),
          ),
          Text(
            "Jyodesh",
            style: subtitleStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 20.sp),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 30,
        ),
        SizedBox(
          width: 20.sp,
        )
      ],
    );
  }

  buildHomeTiles(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: subtitleStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 20.sp)),
              Text('See All',
                  style: subtitleStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 12.sp)),
            ],
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Container(
          height: 130,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemExtent: 110.0,
            itemBuilder: (BuildContext context, int index) {
              return buildImageTextCard();
            },
          ),
        )
      ],
    );
  }

  buildImageTextCard() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundImage: ExactAssetImage('assets/images/artist.png'),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Center(
          child: Text('Alice in Chains',
              style: subtitleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 15.sp)),
        )
      ],
    );
  }
}
