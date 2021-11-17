part of 'get_cars_bloc.dart';

@immutable
abstract class GetCarsEvent {}

class GetAllCars extends GetCarsEvent {
  @override
  String toString() {
    return 'GetAllCars';
  }
}
