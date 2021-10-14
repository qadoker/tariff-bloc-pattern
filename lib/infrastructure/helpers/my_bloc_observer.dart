import 'package:bloc/bloc.dart';

import './my_logger.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    logger.d('bloc created: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logger.d('bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d(
        '${bloc.runtimeType}: { currentState: ${change.currentState.runtimeType}, nextState: ${change.nextState.runtimeType} }');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logger.d(
        '${bloc.runtimeType}: { currentState: ${transition.currentState.runtimeType}, nextState: ${transition.nextState.runtimeType} }');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.d('${bloc.runtimeType}: error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    logger.d('bloc closed: ${bloc.runtimeType}');
  }
}
