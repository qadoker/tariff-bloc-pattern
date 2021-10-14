import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import './locator.dart';
import './helpers/my_bloc_observer.dart';

class MainConfigs {
  static Future<void> cofigure() async {
    WidgetsFlutterBinding.ensureInitialized();
    setupLocator();

    Bloc.observer = MyBlocObserver();
  }
}
