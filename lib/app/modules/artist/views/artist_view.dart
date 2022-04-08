import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/modules/artist/views/album_view.dart';
import 'package:emusic/app/modules/nowplaying/views/nowplaying_view.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/artist_controller.dart';

class ArtistView extends GetView<ArtistController> {
  final QueryDocumentSnapshot<Object?>? data;

  ArtistView(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
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
                      data!['artist'],
                      style: titleStyle.copyWith(
                          fontSize: 30.sp,
                          color: Colors.black54,
                          fontWeight: FontWeight.w800),
                    ),
                    // buildMusicTile('as', data!['artist']),
                    ...List.generate(1, (index) {
                      var result = data!['album'][index]['songs'][index];
                      return buildMusicTile(
                          result['song_name'],
                          data!['artist'],
                          data!['album'][index]['album_art'],
                          data!['album'][index]['album_name'],
                          data!['album'][index]['songs'][index]['url']);
                    }),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Discography",
                          style: titleStyle.copyWith(
                              fontSize: 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    Container(
                      height: 130.sp,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data!['album'].length,
                        itemExtent: 110.0,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => AlbumView(
                                        data: data,
                                        albumindex: index,
                                      ));
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(
                                      data!['album'][index]['album_art']),
                                ),
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Center(
                                child: Text(data!['album'][index]['album_name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: subtitleStyle.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        fontSize: 10.sp)),
                              )
                            ],
                          );
                        },
                      ),
                    ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  buildMusicTile(String songname, String artistname, String album_img,
      String album, String song_url) {
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
                image: DecorationImage(image: NetworkImage(album_img)),
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10.r)),
            // child: Image.network(bandimg!),
          ),
          SizedBox(
            width: 15.sp,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                songname,
                style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Text(
                artistname,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Spacer(),
          Text('3:30'),
          IconButton(
              onPressed: () {
                Get.to(NowplayingView(
                    artist: artistname,
                    album: album,
                    song: songname,
                    album_art: album_img,
                    song_url: song_url));
              },
              icon: Icon(Icons.play_arrow)),
        ],
      ),
    );
  }

  buildArtistImg() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        height: 230.h,
        child: Image.network(
          data!['band_img'],
          fit: BoxFit.fitHeight,
        )

        // Image.asset(
        //   'assets/images/cover.png',
        //   fit: BoxFit.fitHeight,
        // ),
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
