import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadsController extends GetxController {
  //TODO: Implement DownloadsController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  // delete from donwloads
  Future<void> deleteAll() async {
    final collection =
        await FirebaseFirestore.instance.collection("downloads").get();

    final batch = FirebaseFirestore.instance.batch();

    for (final doc in collection.docs) {
      batch.delete(doc.reference);
    }

    return batch.commit();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
