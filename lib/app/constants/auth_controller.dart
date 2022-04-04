import 'dart:ui';

import 'package:emusic/app/constants/constants.dart';
import 'package:emusic/app/constants/firebase_auth_constants.dart';
import 'package:emusic/app/modules/home/views/home_view.dart';
import 'package:emusic/app/modules/login/views/login_view.dart';
import 'package:emusic/app/modules/register/controllers/register_controller.dart';
import 'package:emusic/app/modules/register/views/register_view.dart';
import 'package:emusic/app/modules/splash_screen/views/splash_screen_view.dart';
import 'package:emusic/app/widgets/snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();

  RegisterController registercontroller = Get.put(RegisterController());
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();

    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      // if the user is not found then the user is navigated to the Register Screen

      Get.offAll(() => HomeView());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      // Get.snackbar("Succefully", "Registered");
      Get.offAll(() => LoginView());
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      buildSnackbar("Error Login", e.message.toString(), Colors.white,
          Color.fromARGB(188, 219, 5, 5));
      registercontroller.loading(false);
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      buildSnackbar("Error Login", e.message.toString(), Colors.white,
          Color.fromARGB(188, 219, 5, 5));
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() async {
    await auth.signOut();
  }
}
