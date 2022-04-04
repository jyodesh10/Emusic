import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:emusic/app/widgets/customdrawer.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.sp,
            ),
            buildAppBar(context),
            Hero(
              tag: 'search',
              child: GestureDetector(
                onTap: () => Get.toNamed(Routes.SEARCH),
                child: Container(
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(10),
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              // blurStyle: BlurStyle.solid,
                              // spreadRadius: 2,
                              color: AppColors.shadow,
                              offset: Offset(0, 2))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.search,
                          size: 22.sp,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text('Songs, Albums and Artists')
                      ],
                    )),
              ),
            ),
            // SizedBox(
            //   height: 40.sp,
            // ),
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
              height: 100.sp,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingMusicWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  buildAppBar(context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.mainBackground,
      automaticallyImplyLeading: false,
      leading: Builder(
        builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 22.sp,
              color: Colors.black,
            )),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Evening,",
            style: titleStyle.copyWith(color: Colors.black, fontSize: 20.sp),
          ),
          Text(
            "Jyodesh",
            style: subtitleStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 15.sp),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            AppImages.developer,
            height: 100,
            fit: BoxFit.contain,
          ),
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
                      fontSize: 16.sp)),
              Text('See All',
                  style: subtitleStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                      fontSize: 10.sp)),
            ],
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Container(
          height: 130.sp,
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
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.ARTIST);
          },
          child: CircleAvatar(
            radius: 50,
            backgroundImage: ExactAssetImage('assets/images/artist.png'),
          ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Center(
          child: Text('Alice in Chains',
              style: subtitleStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 10.sp)),
        )
      ],
    );
  }
}
