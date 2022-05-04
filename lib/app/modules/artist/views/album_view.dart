import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emusic/app/modules/nowplaying/views/nowplaying_view.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../nowplaying/controllers/nowplaying_controller.dart';

class AlbumView extends StatelessWidget {
  AlbumView({Key? key, this.data, this.albumindex}) : super(key: key);
  final QueryDocumentSnapshot<Object?>? data;
  final int? albumindex;
  NowplayingController nowController = Get.put(NowplayingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.sp,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 22.sp,
                color: Colors.black,
              )),
        ),
        title: Text(
          data!['album'][albumindex]['album_name'],
          style: titleStyle.copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 500,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundImage:
                        NetworkImage(data!['album'][albumindex]['album_art']),
                  ),
                  title: Text('${index + 1}  ' +
                      data!['album'][albumindex]['songs'][index]['song_name']),
                  trailing: IconButton(
                      onPressed: () {
                        Get.to(() => NowplayingView(
                              song_url: data!['album'][albumindex]['songs']
                                  [index]['url'],
                              album: data!['album'][albumindex]['album_name'],
                              album_art: data!['album'][albumindex]
                                  ['album_art'],
                              artist: data!['artist'],
                              song: data!['album'][albumindex]['songs'][index]
                                  ['song_name'],
                            ));
                        nowController.audioPlayer.stop().then((value) =>
                            nowController
                                .play(data!['album'][albumindex]['songs']));
                      },
                      icon: Icon(
                        Icons.play_arrow,
                        color: Colors.black,
                      )),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 5,
                  thickness: 1,
                );
              },
              itemCount: data!['album'][albumindex]['songs'].length),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingMusicWidget(),
    );
  }
}
