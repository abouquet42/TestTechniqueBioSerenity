part of 'get_car_speed_bloc.dart';

@immutable
abstract class GetCarSpeedEvent {}

class GetCarSpeed extends GetCarSpeedEvent {
  final String carName;

  GetCarSpeed({
    required this.carName,
  });

  @override
  String toString() {
    return 'GetCarSpeed : { carName : $carName}';
  }
}

class StopStream extends GetCarSpeedEvent {
  @override
  String toString() {
    return 'StopStream';
  }
}