import 'package:cloud_firestore/cloud_firestore.dart';

class MusicModel {
  String? documentId;
  late String album;
  late String albumArt;
  late String artist;
  late String genre;
  late String title;
  late String url;

  MusicModel({
    required this.album,
    required this.albumArt,
    required this.artist,
    required this.genre,
    required this.title,
    required this.url,
  });

  MusicModel.fromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    documentId = documentSnapshot.id;
    album = documentSnapshot["content"];
    albumArt = documentSnapshot["createdOn"];
    artist = documentSnapshot["isDone"];
    genre = documentSnapshot["content"];
    title = documentSnapshot["createdOn"];
    url = documentSnapshot["isDone"];
  }
}
