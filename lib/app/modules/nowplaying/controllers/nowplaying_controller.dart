import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:audiotagger/audiotagger.dart';
import 'package:audiotagger/models/tag.dart';
import 'package:emusic/app/model/music_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:id3/id3.dart';

class NowplayingController extends GetxController {
  //TODO: Implement NowplayingController

  final count = 0.obs;
  var isPlaying = false.obs;
  var isOnRepeat = false.obs;
  String url =
      'https://firebasestorage.googleapis.com/v0/b/e-music-8e0b7.appspot.com/o/Music%2FAlbatross%2FMa%20ra%20malai%2Falbatross%20-%20Intro%20-%20Ma%20Ra%20Malai.mp3?alt=media&token=015f9729-6b56-4ae7-b21f-973ee492bf49';

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

  play() async {
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

  void smartPlay() async {
    if (playerState.value == PlayerState.PLAYING) {
      pause();
    } else {
      play();
    }
  }

  set setPositionValue(double value) =>
      audioPlayer.seek(Duration(seconds: value.toInt()));

  @override
  void onClose() {}
  void increment() => count.value++;
}
