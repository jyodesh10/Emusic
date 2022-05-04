import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emusic/app/modules/nowplaying/views/nowplaying_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../constants/constants.dart';
import '../../../model/favourites_model.dart';
import '../controllers/favourites_controller.dart';

class FavouritesView extends GetView<FavouritesController> {
  var data = Favourite();
  Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance.collection('favourites').snapshots();
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
                  Icons.arrow_back_ios,
                  size: 22.sp,
                  color: Colors.black,
                )),
          ),
          title: Text(
            'Favourites',
            style: titleStyle.copyWith(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: StreamBuilder(
              stream: collectionStream,
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.grey,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primaryClr),
                    ),
                  );
                }
                if (snapshot.data == null) {
                  return Center(child: Text('No Data'));
                }

                return Column(
                  children: [
                    ...List.generate(
                      snapshot.data!.docs.length,
                      (index) {
                        var result = snapshot.data?.docs[index];
                        return buildList(result!['album_art'], result!['song'],
                            result!['artist'], () {
                          // FirebaseFirestore.instance
                          //     .collection('favourites')
                          //     .get()
                          //     .then(
                          //   (snapshot) {
                          //     for (DocumentSnapshot ds in snapshot.docs) {
                          //       ds.reference.delete();
                          //     }
                          //   },
                          // );
                          controller.deleteAll();
                        }, () {
                          Get.to(() => NowplayingView(
                                album: result!['album'],
                                album_art: result!['album_art'],
                                artist: result!['artist'],
                                song: result!['song'],
                                song_url: result!['url'],
                              ));
                        });
                      },
                    ),
                  ],
                );
                // ListView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: snapshot.data?.docs.length,
                //   itemExtent: 110.0,
                //   itemBuilder: (BuildContext context, int index) {
                //     var result = snapshot.data?.docs[index];
                //     return buildList(result!['song'], result!['artist'], () {
                //       FirebaseFirestore.instance
                //           .collection('favourites')
                //           .doc()
                //           .delete();
                //     });

                //     // result!['artist'], result!['band_img'], 'album');
                //   },
                // );
              },
            ),
          ),
        ));
  }

  buildList(String img, String song_name, String artist, ontap, play) {
    return ListTile(
      onTap: play,
      contentPadding: EdgeInsets.zero,
      leading: Image.network(img),
      title:
          // Text(controller.data.read('playlist')['song']),

          Text(song_name),
      subtitle: Text(artist),
      trailing: IconButton(
          onPressed: ontap,
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          )),
    );
  }
}
