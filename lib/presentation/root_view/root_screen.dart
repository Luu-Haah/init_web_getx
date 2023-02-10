import '../../core/app_export.dart';
import 'controller/root_controller.dart';
import 'package:flutter/material.dart';

class RootScreen extends GetWidget<RootController> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
        builder: (context, delegate, currentRoute) {
          return Scaffold(
            body: GetRouterOutlet(
              initialRoute: Routes.login,
            ),
          );
        },
    );
  }
}
