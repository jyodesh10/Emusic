import 'dart:convert';

import 'package:get/get.dart';

import '../constants/keys.dart';

Favourites annotationsFromJson(String str) =>
    Favourites.fromJson(json.decode(str));

String annotationsToJson(Favourites data) => json.encode(data.toJson());

class Favourites {
  Favourites({
    this.favourites,
  });

  RxList<Rx<Favourite>>? favourites;

  factory Favourites.fromJson(Map<String, dynamic> json) => Favourites(
        favourites: RxList<Rx<Favourite>>.from(
            json[FAVOURITES].map((x) => Favourite.fromJson(x).obs)),
      );

  Map<String, dynamic> toJson() => {
        FAVOURITES: RxList<dynamic>.from(favourites!.map((x) => x.toJson())),
      };
}

class Favourite {
  final String? song;
  final String? artist;
  Favourite({
    this.song,
    this.artist,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
        song: json["song"],
        artist: json["artist"],
      );

  Map<String, dynamic> toJson() {
    return {
      'song': song,
      'artist': artist,
    };
  }
}
