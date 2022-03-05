import 'package:emusic/app/modules/login/views/login_view.dart';
import 'package:emusic/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  static SplashScreenController instance = Get.find();
  final count = 0.obs;
  @override
  void onInit() {
    delay();
    super.onInit();
  }

  delay() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Get.off(LoginView());
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
