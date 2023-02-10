import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:init_web_getx/core/utils/color_schemes.g.dart';
import 'package:init_web_getx/presentation/unknown_screen/binding/unknown_screen_binding.dart';
import 'package:init_web_getx/presentation/unknown_screen/unknown_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/app_export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      defaultTransition: Transition.noTransition,
      builder: (context, child) => ResponsiveWrapper.builder(child,
        minWidth: 375,
        breakpoints: [
          const ResponsiveBreakpoint.resize(360, name: MOBILE),
          const ResponsiveBreakpoint.resize(920, name: TABLET),
          const ResponsiveBreakpoint.resize(1366, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.black),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white),
      ),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('vi', 'VN'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
        Locale('en', 'US')
      ],
      title: 'Web GetX',
      initialBinding: InitialBindings(),
      getPages: AppRoutes.pages,
      unknownRoute: GetPage(
        name: Routes.unknown,
        page: () => const UnknownScreen(),
        bindings: [
          UnknownBinding(),
        ],
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 350),
      ),
    );
  }
}
