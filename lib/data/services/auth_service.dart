import '../../core/app_export.dart';

class EnsureAuthMiddleware extends GetMiddleware{
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    return await super.redirectDelegate(route);
  }
}

class EnsureNotAuthMiddleware extends GetMiddleware{
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    return await super.redirectDelegate(route);
  }
}

