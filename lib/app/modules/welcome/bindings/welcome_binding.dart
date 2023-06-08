import 'package:get/get.dart';
import 'package:quiz_application/app/modules/welcome/controllers/welcome_controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController());
  }
}
