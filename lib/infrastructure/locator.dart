import 'package:flutter/cupertino.dart';

import 'package:get_it/get_it.dart';
import 'package:tarrif/infrastructure/repositories/car_repo.dart';

final locator = GetIt.instance;
final navigatorKey = GlobalKey<NavigatorState>();
final appContext = navigatorKey.currentContext;

void setupLocator() {
  locator.registerLazySingleton(() => CarRepository());
}
