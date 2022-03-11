import 'package:get/get.dart';

import '../controllers/nowplaying_controller.dart';

class NowplayingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NowplayingController>(
      () => NowplayingController(),
    );
  }
}
