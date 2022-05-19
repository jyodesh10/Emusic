import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/constants/firebase_auth_constants.dart';
import 'package:emusic/app/modules/artist/views/album_view.dart';
import 'package:emusic/app/modules/artist/views/artist_view.dart';
import 'package:emusic/app/modules/register/controllers/register_controller.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:emusic/app/widgets/customdrawer.dart';
import 'package:emusic/app/widgets/floatingmusicwidget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../controllers/home_controller.dart';

// Main home page
class HomeView extends GetView<HomeController> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance.collection('music').snapshots();
  Stream<QuerySnapshot> topAlbum =
      FirebaseFirestore.instance.collection('album').snapshots();
  Future<DocumentSnapshot<Map<String, dynamic>>> documentStream =
      FirebaseFirestore.instance.collection('music').doc().get();

  @override
  HomeController controller = Get.put(HomeController());
  RegisterController regcontroller = Get.put(RegisterController());

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
                onTap: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
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
            buildArtistsListview(),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Recommended for you'),
            buildAlbumsListview(),
            // buildAlbumsListview(),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Top Artists'),
            buildArtistsListview(),
            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Top Albums'),
            buildTopAlbumsListview(),

            SizedBox(
              height: 25.sp,
            ),
            buildHomeTiles('Top Genres'),
            buildTopGenres(),
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
      toolbarHeight: 60,
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
      title:
          // Obx(
          //   () =>
          Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.now.hour >= 4 && controller.now.hour <= 12
                ? 'Good Morning'
                : controller.now.hour >= 13 && controller.now.hour <= 17
                    ? 'Good Afternoon'
                    : controller.now.hour >= 18 && controller.now.hour <= 20
                        ? 'Good Evening'
                        : controller.now.hour >= 21 && controller.now.hour <= 3
                            ? 'Good Night'
                            : 'Hello',
            style: titleStyle.copyWith(color: Colors.black, fontSize: 20.sp),
          ),
          Text(
            // ignore: prefer_if_null_operators
            // auth.currentUser!.displayName.toString().isNotEmpty

            //     ? auth.currentUser!.displayName.toString()
            // ignore: prefer_if_null_operators
            // : regcontroller.data.read('username') != null
            //     ? regcontroller.data.read('username')
            // :
            auth.currentUser!.email.toString().split("@").first,
            // : auth.currentUser!.displayName.toString(),
            style: subtitleStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 15.sp),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      // ),
      actions: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(
            auth.currentUser!.photoURL == null
                ? 'https://firebasestorage.googleapis.com/v0/b/e-music-8e0b7.appspot.com/o/appFiles%2Fpath2203.png?alt=media&token=a55ed317-df45-404f-bf8a-9d4ce81ec59f'
                : auth.currentUser!.photoURL.toString(),
          ),
          // child: Image.network(auth.currentUser!.photoURL.toString())

          // Image.asset(
          //   AppImages.developer,
          //   height: 100,
          //   fit: BoxFit.contain,
          // ),
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
              // Text('See All',
              //     style: subtitleStyle.copyWith(
              //         fontWeight: FontWeight.w700,
              //         color: Colors.black,
              //         fontSize: 10.sp)),
            ],
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
      ],
    );
  }

  buildArtistsListview() {
    return StreamBuilder(
      stream: collectionStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryClr),
            ),
          );
        }
        if (snapshot.data == null) {
          return Center(child: Text('No Data'));
        }

        return Container(
          height: 130.sp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.docs.length,
            itemExtent: 110.0,
            itemBuilder: (BuildContext context, int index) {
              var result = snapshot.data?.docs[index];
              return buildImageTextCard(result!['artist'], result['band_img'],
                  () {
                Get.to(ArtistView(result));
              });

              // result!['artist'], result!['band_img'], 'album');
            },
          ),
        );
      },
    );
  }

  buildAlbumsListview() {
    return StreamBuilder<QuerySnapshot>(
      stream: collectionStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryClr),
            ),
          );
        }
        if (snapshot.data == null) {
          return Center(child: Text('No Data'));
        }

        return Container(
          height: 130.sp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data?.docs.first['album'].length,
            itemExtent: 110.0,
            itemBuilder: (BuildContext context, int index) {
              var result = snapshot.data?.docs.first;
              return buildImageTextCard(result!['album'][index]['album_name'],
                  result['album'][index]['album_art'], () {
                Get.to(AlbumView(
                  data: result,
                  albumindex: index,
                ));
              });

              // result!['artist'], result!['band_img'], 'album');
            },
          ),
        );
      },
    );
  }

  buildTopAlbumsListview() {
    return StreamBuilder<QuerySnapshot>(
      stream: collectionStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryClr),
            ),
          );
        }
        if (snapshot.data == null) {
          return Center(child: Text('No Data'));
        }

        return Container(
          height: 130.sp,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs[4]['album'].length,
            itemExtent: 110.0,
            itemBuilder: (BuildContext context, int index) {
              var result = snapshot.data?.docs[4];
              return buildImageTextCard(result!['album'][index]['album_name'],
                  result['album'][index]['album_art'], () {
                Get.to(AlbumView(
                  data: result,
                  albumindex: index,
                ));
              });

              // result!['artist'], result!['band_img'], 'album');
            },
          ),
        );
      },
    );
  }

  buildImageTextCard(String artistname, String bandimg, ontap) {
    return Column(
      children: [
        GestureDetector(
          onTap: ontap,
          child: CircleAvatar(
              radius: 50, backgroundImage: CachedNetworkImageProvider(bandimg)
              // NetworkImage(bandimg),
              ),
        ),
        SizedBox(
          height: 10.sp,
        ),
        Center(
          child: Text(artistname,
              style: subtitleStyle.copyWith(
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: 10.sp)),
        )
      ],
    );
  }

  buildTopGenres() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            buildGenreCard(Colors.red, 'Alternative'),
            SizedBox(
              height: 20,
            ),
            buildGenreCard(Colors.grey.shade700, 'Rock'),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            buildGenreCard(Colors.purple, 'Metal'),
            SizedBox(
              height: 20,
            ),
            buildGenreCard(Colors.blue, 'Prog Rock'),
          ],
        )
      ],
    );
  }

  buildGenreCard(Color color, String genre) {
    return Container(
      height: 90,
      width: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(24, 59, 58, 58),
                blurRadius: 10,
                offset: Offset(2, 2))
          ],
          color: color),
      child: Center(
        child: Text(
          genre,
          style: titleStyle,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Ma ra malai',
    'Cobweb',
    'Albatross',
    'Adhar',
    'Jindabaad',
    'Hatkela',
    'Putali',
    'Underside',
    'Alice in Chains',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('music').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final results =
            snapshot.data?.docs.where((a) => a[0]['artist'].contains(query));
        // return ListView.builder(
        //     itemBuilder: (context, index) => ListTile(
        //           title: Text(results!.toList().toString()),
        //         ));

        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return ListTile(
              onTap: () {
                Get.back();
              },
              title: Text(result),
            );
          },
        );
      },
    );
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
