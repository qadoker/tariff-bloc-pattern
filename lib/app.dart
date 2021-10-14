import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:tarrif/presentation/screens/home_screen.dart';

import './infrastructure/locator.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      home: const HomeScreen(),
      navigatorKey: navigatorKey,
    );
  }
}
