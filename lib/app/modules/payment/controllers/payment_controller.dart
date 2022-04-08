import 'package:esewa_pnp/esewa.dart';
import 'package:get/get.dart';
import 'package:esewa_pnp/esewa_pnp.dart';

class PaymentController extends GetxController {
  //TODO: Implement PaymentController

  final count = 0.obs;

  @override
  void onInit() {
    esewa();

    super.onInit();
  }

  void esewa() {
    ESewaConfiguration _configuration = ESewaConfiguration(
        clientID: "JB0BBQ4aD0UqIThFJwAKBgAXEUkEGQUBBAwdOgABHD4DChwUAB0R",
        secretKey: "BhwIWQQADhIYSxILExMcAgFXFhcOBwAKBgAXEQ==",
        environment: ESewaConfiguration.ENVIRONMENT_TEST //ENVIRONMENT_LIVE
        );
    ESewaPnp eSewaPnp = ESewaPnp(configuration: _configuration);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
