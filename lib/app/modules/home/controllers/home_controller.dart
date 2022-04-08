import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  DateTime now = DateTime.now();
  String formattedDate =
      DateFormat('kk:mm:ss \n EEE d MMM').format(DateTime.now());

  var morning = false.obs;
  var afternoon = false.obs;

  var evening = false.obs;
  var night = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  time() {
    var hour = now.hour;
    // if(hour)
    if (hour >= 3 && hour < 12) {
      morning(true);
    } else if (hour >= 12 && hour < 17) {
      afternoon(true);
    } else if (hour >= 17 && hour < 21) {
      evening(true);
    } else if (hour >= 21 && hour < 24) {
      night(true);
    } else {
      morning(false);
      afternoon(false);
      evening(false);
      night(false);
    }
    print(hour);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
