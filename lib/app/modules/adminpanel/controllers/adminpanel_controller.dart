import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

class AdminpanelController extends GetxController {
  //TODO: Implement AdminpanelController

  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
      // uploadImage(File(selectedImagePath.value));

    } else {
      Fluttertoast.showToast(msg: 'no image selected');
    }
  }

  Future uploadImage(File file) async {
    try {
      final ref = FirebaseStorage.instance.ref().child(selectedImagePath.value);
      await ref.putFile(file);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
