import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/artist_controller.dart';

class ArtistView extends GetView<ArtistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      // appBar: AppBar(
      //   title: Text('ArtistView'),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            buildArtistImg(),
            buildGradient(),
            Positioned(
              top: 30,
              left: 15,
              // padding: EdgeInsets.only(top: 50, left: 20),
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 180.sp),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Alice In Chains',
                      style: titleStyle.copyWith(
                          fontSize: 30.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800),
                    ),
                    ...List.generate(7, (index) => buildMusicTile()),
                    SizedBox(
                      height: 150,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: FloatingMusicWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  buildMusicTile() {
    return Container(
      height: 85.h,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(20.sp, 15.sp, 20.sp, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: AppColors.shadow, blurRadius: 4, offset: Offset(0, 2))
          ],
          borderRadius: BorderRadius.circular(15.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.sp,
          ),
          Container(
            height: 54.sp,
            width: 54.sp,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10.r)),
          ),
          SizedBox(
            width: 15.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Them Bones',
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                'Alice in Chains',
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Spacer(),
          Text('3:30'),
          IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
        ],
      ),
    );
  }

  buildArtistImg() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 230.h,
      child: Image.asset(
        'assets/images/cover.png',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  buildGradient() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 230.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Color.fromRGBO(83, 64, 73, 0),
          Color.fromRGBO(218, 218, 218, 0.42),
          Color.fromRGBO(234, 234, 234, 0.72),
          Color.fromRGBO(248, 248, 248, 1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
    );
  }
}
