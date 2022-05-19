import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutController extends GetxController {
  //TODO: Implement AboutController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
// launch any url 
  launchurl(url) async {
    if (await launch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
