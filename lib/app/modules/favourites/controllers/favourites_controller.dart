// ignore_for_file: unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emusic/app/constants/keys.dart';
import 'package:emusic/app/model/favourites_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavouritesController extends GetxController {
  //TODO: Implement PlaylistController

  final count = 0.obs;
  var data = GetStorage();
  var fav = false.obs;
  final song = ''.obs;
  final artist = ''.obs;

  Rx<Favourites> favourites = Favourites().obs;

  RxList<Rx<Favourite>> a = RxList<Rx<Favourite>>();

  addFavourite() async {
    if (this.song.value == '' || this.artist.value == '') {
    } else {
      a.add(Favourite(artist: 'hello', song: 'helo').obs);
      fav(true);
    }

    await this.data.write(FAVOURITES, this.favourites);
    // this.song.value == '';
    // this.artist.value == '';
    print(data.read(FAVOURITES[0]));
  }

  RxList<Rx<Favourite>> annList(res) =>
      RxList<Rx<Favourite>>.from(res.map((x) => Favourite.fromJson(x).obs));
  getFavourite() {
    Map ans = this.data.read(FAVOURITES);
    if (ans == null) {
      this.favourites.value.favourites = RxList<Rx<Favourite>>();
    } else {
      this.favourites.value.favourites = annList(ans[FAVOURITES]);
    }
  }

  Future<void> deleteAll() async {
    final collection =
        await FirebaseFirestore.instance.collection("favourites").get();

    final batch = FirebaseFirestore.instance.batch();

    for (final doc in collection.docs) {
      batch.delete(doc.reference);
    }

    return batch.commit();
  }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> initStorage() async {
    await GetStorage.init();
  }

  Future<void> addToPlaylist(Favourite model) async {
    var result = await data.write('playlist', model.toJson());
    print(data.read('playlist')['name']);
    // data = result as GetStorage;

    fav(true);
    Fluttertoast.showToast(
      backgroundColor: Colors.black.withOpacity(0.4),
      msg: "Added to Favourites",
    );
  }

  Favourite readModel() {
    final map = data.read('playlist') ?? {};
    return Favourite.fromJson(map);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
