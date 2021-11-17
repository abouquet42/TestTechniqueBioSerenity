part of 'get_cars_bloc.dart';

@immutable
abstract class GetCarsState {}

class GetCarsInitial extends GetCarsState {}

class GetAllCarsSuccess extends GetCarsState {
  final List<Car> allCars;

  GetAllCarsSuccess({
    this.allCars = const [],
  });

  @override
  String toString() {
    return 'GetAllCarsSuccess { cars: $allCars }';
  }
}

class GetAllCarsLoading extends GetCarsState {
  @override
  String toString() {
    return 'GetAllCarsLoading';
  }
}

class GetAllCarsError extends GetCarsState {
  final Error error;

  GetAllCarsError({
    required this.error,
  });

  @override
  String toString() {
    return 'GetAllCarsError { error: $error }';
  }
}
