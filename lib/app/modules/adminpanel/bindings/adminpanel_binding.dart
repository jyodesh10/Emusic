import 'package:get/get.dart';

import '../controllers/adminpanel_controller.dart';

class AdminpanelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminpanelController>(
      () => AdminpanelController(),
    );
  }
}
