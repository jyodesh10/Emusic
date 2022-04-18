import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

class NowplayingController extends GetxController {
  //TODO: Implement NowplayingController

  final count = 0.obs;
  var isPlaying = false.obs;
  var isOnRepeat = false.obs;
  var isNext = false.obs;

  var data = ''.obs;

  Rx<Duration> position = Duration().obs;
  Rx<Duration> duration = Duration().obs;
  final Rx<PlayerState> playerState = PlayerState.STOPPED.obs;

  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void onInit() {
    audioPlayer.onDurationChanged.listen((Duration d) {
      print('Max duration: $d');
      duration.value = d;
      // setState(() => duration = d);
    });

    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      print('Current position: $p');
      position.value = p;
    });

    audioPlayer.onPlayerCompletion.listen((event) {
      position.value = Duration(seconds: 0);
      if (isOnRepeat == true) {
        isPlaying.value = true;
      } else {
        isPlaying.value = false;
        isOnRepeat.value = false;
      }
    });
    // update();
    audioPlayer.onPlayerStateChanged
        .listen((PlayerState state) => playerState.value = state);
    audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  playingStatus() {
    isPlaying.value = !isPlaying.value;
  }

  play(url) async {
    if (isPlaying == false) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        // success
      }
    }
  }

  pause() async {
    if (isPlaying == true) {
      int result = await audioPlayer.pause();
      if (result == 1) {
        // success
      }
    }
  }

  next() async {
    if (isNext == true) {}
  }

  repeat() async {
    isOnRepeat.value = !isOnRepeat.value;
    // isOnRepeat(true);
    if (isOnRepeat == true) {
      audioPlayer.setReleaseMode(ReleaseMode.LOOP);
      print('Repeat is on');
      Fluttertoast.showToast(
        backgroundColor: Colors.black.withOpacity(0.4),
        msg: "Repeat is on",
      );
      // isOnRepeat(false);
    } else if (isOnRepeat == false) {
      audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
      Fluttertoast.showToast(
        backgroundColor: Colors.black.withOpacity(0.4),
        msg: "Repeat is off",
      );
    }
  }

  void smartPlay(url) async {
    if (playerState.value == PlayerState.PLAYING) {
      pause();
    } else {
      play(url);
    }
  }

  set setPositionValue(double value) =>
      audioPlayer.seek(Duration(seconds: value.toInt()));

  Future<void> share(link, text) async {
    var img = await getImage(link);
    // print(img);
    // await Share.share(text, subject: 'listen to this song');
    await Share.shareFiles(
      [img],
      sharePositionOrigin:
          Rect.fromCenter(center: Offset(2, 2), width: 100, height: 100),
      text: text,
    );
  }

  getImage(String link) async {
    final urlImage = link;
    final url = Uri.parse(urlImage);
    final response = await http.get(url);
    final bytes = response.bodyBytes;
    if (kDebugMode) {
      print(response.bodyBytes);
    }
    final temp = await getTemporaryDirectory();
    final path = '${temp.path}/image.jpg';
    File(path).writeAsBytesSync(bytes);
    return path;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
