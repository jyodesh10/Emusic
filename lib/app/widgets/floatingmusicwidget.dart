import 'package:cached_network_image/cached_network_image.dart';
import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/modules/nowplaying/controllers/nowplaying_controller.dart';
import 'package:emusic/app/modules/nowplaying/views/nowplaying_view.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:emusic/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FloatingMusicWidget extends StatelessWidget {
  FloatingMusicWidget({Key? key, this.artist, this.song_name, this.album_art})
      : super(key: key);
  final String? artist;
  final String? song_name;
  final String? album_art;

  NowplayingController nowplayingController = Get.put(NowplayingController());

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          // artist != null
          //     ?
          Get.to(() => NowplayingView(
                album: nowplayingController.data.read('album'),
                album_art: nowplayingController.data.read('album_art'),
                artist: nowplayingController.data.read('artist'),
                song: nowplayingController.data.read('song'),
                song_url: nowplayingController.data.read('url'),
              ));
          // : buildSnackbar(
          //     'No data', 'play a song', Colors.white, Colors.red);
        },
        backgroundColor: Colors.transparent,
        hoverElevation: 0,
        elevation: 0,
        enableFeedback: false,
        highlightElevation: 0,
        label: Container(
          height: 100.sp,
          // color: Colors.black.withOpacity(0.3),
          margin: EdgeInsets.only(bottom: 40.sp),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Obx(
                (() => Container(
                      height: 80.sp,
                      width: 320.sp,
                      decoration: BoxDecoration(
                          color: AppColors.primaryClr,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Center(
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.only(left: 110.sp, right: 26.sp),
                          title: Text(
                            nowplayingController.data.read('song') ?? 'no data',
                            style: subtitleStyle.copyWith(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            nowplayingController.data.read('artist') ??
                                'no data',
                            style: subtitleStyle.copyWith(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                          trailing: GestureDetector(
                            // onTap: nowplayingController.playingStatus(),
                            onTap: () {
                              nowplayingController.isPlaying.value
                                  ? nowplayingController.pause()
                                  : nowplayingController.play(
                                      nowplayingController.data
                                          .read('url')
                                          .toString());
                            },
                            child: Image.asset(
                              nowplayingController.isPlaying.value
                                  ? 'assets/icons/Pause.png'
                                  : AppIcons.play,
                              color: Colors.white,
                              height: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    )),
              ),
              Positioned(
                right: 196.8.sp,
                child: CircleAvatar(
                  radius: 75.sp,
                  backgroundImage: AssetImage(AppImages.vinyl2),
                  backgroundColor: Colors.transparent,
                  child: CircleAvatar(
                      radius: 27.sp,
                      backgroundImage: CachedNetworkImageProvider(
                        nowplayingController.data.read('album_art') ??
                            'https://firebasestorage.googleapis.com/v0/b/e-music-8e0b7.appspot.com/o/appFiles%2Fpath2203.png?alt=media&token=a55ed317-df45-404f-bf8a-9d4ce81ec59f',
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
