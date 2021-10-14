import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tarrif/infrastructure/helpers/my_logger.dart';
import 'package:tarrif/infrastructure/locator.dart';
import 'package:tarrif/infrastructure/repositories/car_repo.dart';
import 'package:tarrif/models/car_model.dart';

part 'car_state.dart';

class CarCubit extends Cubit<CarState> {
  CarCubit() : super(CarLoading());

  CarRepository get _carRepo => locator<CarRepository>();
  List<CarModel> _cars = [];

  final _carIndexController = BehaviorSubject<int>.seeded(0);

  Stream<int> get index$ => _carIndexController.stream;

  int get carIndex => _carIndexController.value;

  void updateIndex(int index) => _carIndexController.add(index);

  Future<void> getCars() async {
    try {
      emit(CarLoading());
      logger.d('Getting cars from Api');
      _cars = await _carRepo.getCars();
      emit(CarLoaded(cars: _cars));
    } catch (e, s) {
      logger.d(e);
      logger.d(s);
      emit(CarAlert(message: "Была проблема"));
    }
  }
}
