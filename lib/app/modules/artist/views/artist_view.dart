import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/controller/app_controller.dart';
import 'package:emusic/app/modules/artist/views/album_view.dart';
import 'package:emusic/app/modules/nowplaying/controllers/nowplaying_controller.dart';
import 'package:emusic/app/modules/nowplaying/views/nowplaying_view.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../controllers/artist_controller.dart';

class ArtistView extends GetView<ArtistController> {
  final QueryDocumentSnapshot<Object?>? data;

  ArtistView(this.data);

  AppController appController = Get.put(AppController());
  NowplayingController nowController = Get.put(NowplayingController());

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
              top: 40,
              left: 15,
              // padding: EdgeInsets.only(top: 50, left: 20),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: IconButton(
                  onPressed: () => Get.back(),
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.keyboard_arrow_left_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 170.sp),
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
                    Text(
                      "Top Tracks",
                      style: titleStyle.copyWith(
                          fontSize: 12.sp,
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
                    ...List.generate(data!['album'].length > 1 ? 1 : 0,
                        (index) {
                      var result = data!['album'][1]['songs'][index];
                      return buildMusicTile(
                          result['song_name'],
                          data!['artist'],
                          data!['album'][1]['album_art'],
                          data!['album'][1]['album_name'],
                          data!['album'][1]['songs'][index]['url']);
                    }),
                    //   data!['album'].length>=2?
                    //  List.generate(length, (index) => null)
                    //  :Container(),
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 20, right: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About",
                              style: titleStyle.copyWith(
                                  fontSize: 15.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              data!['about'],
                              style: subtitleStyle.copyWith(
                                  fontSize: 10.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
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
                image: DecorationImage(
                  image: CachedNetworkImageProvider(album_img),
                  //  NetworkImage(album_img)
                ),
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
          IconButton(
              onPressed: () {
                appController.download(
                    song_url, songname, artistname, album, album_img);
              },
              padding: EdgeInsets.zero,
              icon: Icon(Icons.download)),
          IconButton(
              onPressed: () async {
                await nowController.audioPlayer.pause();
                await nowController.audioPlayer.stop();
                nowController.play(song_url);
                Get.to(NowplayingView(
                    artist: artistname,
                    album: album,
                    song: songname,
                    album_art: album_img,
                    song_url: song_url));

                nowController.refresh();
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
      child: CachedNetworkImage(
        imageUrl: data!['band_img'],
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      // Image.network(
      //   data!['band_img'],
      //   fit: BoxFit.cover,
      // )

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
          Colors.transparent,
          Colors.white.withOpacity(0.0),
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.7),
          Colors.white
        ],
        stops: [0.0, 0.2, 0.5, 0.6, 0.8, 1],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )),
    );
  }
}
