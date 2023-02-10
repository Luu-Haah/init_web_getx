import 'package:get/get.dart';
import 'package:init_web_getx/localization/vi_vn/vi_vn_translations.dart';
import 'en_us/en_us_translations.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {'vi_VN': viVn, 'en_US': enUs};
}
