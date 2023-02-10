
import 'package:init_web_getx/presentation/home_screen/home_screen.dart';
import 'package:init_web_getx/presentation/home_screen/binding/home_binding.dart';
import 'package:get/get.dart';
import 'package:init_web_getx/presentation/login_screen/binding/login_binding.dart';
import 'package:init_web_getx/presentation/login_screen/login_screen.dart';

import '../data/services/auth_service.dart';
import '../presentation/root_view/binding/root_binding.dart';
import '../presentation/root_view/root_screen.dart';
import '../presentation/unknown_screen/binding/unknown_screen_binding.dart';
import '../presentation/unknown_screen/unknown_screen.dart';

part 'routes.dart';

class AppRoutes {
  static String loginScreen = '/login_screen';

  static String homeScreen = '/home_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
        name: '/',
        page: () => const RootScreen(),
        bindings: [
          RootBinding(),
        ],
        participatesInRootNavigator: true,
        preventDuplicates: true,
        children: [
          GetPage(
            middlewares: [EnsureNotAuthMiddleware()],
            name: _Paths.login,
            page: () => LoginScreen(),
            bindings: [
              LoginBinding(),
            ],
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 350),
          ),
          GetPage(
            //middlewares: [EnsureNotAuthMiddleware()],
            name: _Paths.unknown,
            page: () => const UnknownScreen(),
            bindings: [
              UnknownBinding(),
            ],
            transition: Transition.fade,
            transitionDuration: const Duration(milliseconds: 350),
          ),
          GetPage(
              middlewares: [EnsureAuthMiddleware()],
              preventDuplicates: true,
              name: _Paths.home,
              page: () => HomeScreen(),
              bindings: [
                HomeBinding(),
              ],
              transition: Transition.fade,
              transitionDuration: const Duration(milliseconds: 350),
              children: []
          ),
        ]),
  ];
}
