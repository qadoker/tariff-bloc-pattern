import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utilities/constants/theme_globals.dart';
import '../locator.dart';

class AppAlerter {
  static void showSnackBar({
    required String message,
    required bool positive,
  }) async {
    showFlash(
      context: appContext!,
      duration: const Duration(seconds: 3),
      builder: (context, controller) {
        return Flash.bar(
          controller: controller,
          backgroundColor: positive ? redColor : greenColor,
          position: FlashPosition.top,
          enableVerticalDrag: true,
          horizontalDismissDirection: HorizontalDismissDirection.startToEnd,
          child: FlashBar(
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: size18weight700,
            ),
          ),
        );
      },
    );
  }
}
