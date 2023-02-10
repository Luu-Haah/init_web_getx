import 'controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:init_web_getx/core/app_export.dart';

class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: size.width,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Login Screen'),
                    SizedBox(height: 30,),
                    Text('${'lbl_hello'.tr}'),
                    SizedBox(height: 30,),
                    ElevatedButton(
                        onPressed: (){
                          Get.rootDelegate.toNamed(Routes.home);
                        },
                        child: Text('Go to Home')
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}
