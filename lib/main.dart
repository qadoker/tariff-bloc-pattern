import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';

import './infrastructure/main_configs.dart';
import './app.dart';

void main() {
  MainConfigs.cofigure();
  runApp(
    DevicePreview(builder: (context) => const App()),
  );
}
