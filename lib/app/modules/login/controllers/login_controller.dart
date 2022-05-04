import 'package:emusic/app/modules/home/views/home_view.dart';
import 'package:emusic/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  var data = GetStorage();
  var isChecked = false.obs;
  final count = 0.obs;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    // emailController.text = 'admin@gmail.com';
    // passwordController.text = 'admin123';
    rememberMe();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future rememberMe() async {
    emailController.text = await data.read('email') ?? '';
    passwordController.text = await data.read('password') ?? "";
    return;
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}

class Google {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future handleLogIn() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
      Fluttertoast.showToast(msg: 'Google sign-in');
      Get.to(() => HomeView());
    } on Exception catch (e) {
      CustomSnackbar(
        title: 'Google Sign in error',
        message: e.toString(),
      );
      print(e.toString());
    }
  }

  Future handleLogOut() async {
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
