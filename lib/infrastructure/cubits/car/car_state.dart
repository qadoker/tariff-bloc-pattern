part of 'car_cubit.dart';

@immutable
abstract class CarState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CarInitial extends CarState {}

class CarLoading extends CarState {}

class CarLoaded extends CarState {
  final List<CarModel> cars;
  CarLoaded({required this.cars});
  @override
  List<Object?> get props => [cars];
}

class CarAlert extends CarState {
  final String message;
  CarAlert({required this.message});
  @override
  List<Object?> get props => [message];
}
