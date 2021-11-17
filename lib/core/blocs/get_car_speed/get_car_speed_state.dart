part of 'get_car_speed_bloc.dart';

@immutable
abstract class GetCarSpeedState {}

class GetCarSpeedInitial extends GetCarSpeedState {}

class GetCarSpeedSuccess extends GetCarSpeedState {
  final int speed;

  GetCarSpeedSuccess({
    required this.speed,
  });

  @override
  String toString() {
    return 'GetCarSpeedSuccess { speed: $speed }';
  }
}

class GetCarSpeedLoading extends GetCarSpeedState {
  @override
  String toString() {
    return 'GetCarSpeedLoading';
  }
}

class GetCarSpeedError extends GetCarSpeedState {
  final Error error;

  GetCarSpeedError({
    required this.error,
  });

  @override
  String toString() {
    return 'GetCarSpeedError { error: $error }';
  }
}