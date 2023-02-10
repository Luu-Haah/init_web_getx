import '../../core/app_export.dart';
import 'controller/unknown_screen_controller.dart';
import 'package:flutter/material.dart';

class UnknownScreen extends GetWidget<UnknownController> {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                ImageConstant.brokenLink,
                fit: BoxFit.contain,
              )
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                  'Trang này không khả dụng',
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Liên kết bạn truy cập có thể bị hỏng hoặc trang có thể đã bị gỡ. Hãy kiểm tra \nxem liên kết mà bạn đang cố mở có chính xác không',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
