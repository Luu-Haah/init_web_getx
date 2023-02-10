import '../controller/unknown_screen_controller.dart';
import 'package:get/get.dart';

class UnknownBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UnknownController());
  }
}
