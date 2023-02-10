part of 'app_routes.dart';

abstract class Routes {
  Routes._();
  static const login = _Paths.login;
  static String loginThen(String afterSuccessFullLogin) => '$login?then=${Uri.encodeQueryComponent(afterSuccessFullLogin)}';
  static const unknown = _Paths.unknown;
  static const home = _Paths.home;

}

abstract class _Paths {
  static const home = '/home';
  static const login = '/login';
  static const unknown = '/unknown';
}
