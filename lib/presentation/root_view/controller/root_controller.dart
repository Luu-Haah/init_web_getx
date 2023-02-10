import '../models/root_model.dart';
import '/core/app_export.dart';


class RootController extends GetxController {
  Rx<RootModel> rootModelObj = RootModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
