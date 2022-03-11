import 'package:get/get.dart';

import '../controllers/merchstore_controller.dart';

class MerchstoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MerchstoreController>(
      () => MerchstoreController(),
    );
  }
}
