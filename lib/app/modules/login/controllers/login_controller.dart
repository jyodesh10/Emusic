import 'package:emusic/app/modules/home/views/home_view.dart';
import 'package:emusic/app/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  @override
  void onInit() {
    emailController.text = 'admin@gmail.com';
    passwordController.text = 'admin123';
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
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

  // Future<UserCredential?> handleLogIn() async {
  //   final _googleSignIn = GoogleSignIn();
  //   await _googleSignIn.disconnect().catchError((e, stack) {
  //     print(e);
  //   });

  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  //   // handling the exception when cancel sign in
  //   if (googleUser == null) return null;

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  Future handleLogOut() async {
    try {
      await googleSignIn.disconnect();
      FirebaseAuth.instance.signOut();
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
