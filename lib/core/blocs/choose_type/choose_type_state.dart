part of 'choose_type_bloc.dart';

@immutable
abstract class ChooseTypeState {}

class ChooseTypeInitial extends ChooseTypeState {}


class ChooseTypeLoading extends ChooseTypeState {
  @override
  String toString() {
    return 'ChooseTypeLoading';
  }
}

class ChooseTypeSuccess extends ChooseTypeState {
  final int type;

  ChooseTypeSuccess({
    this.type = 0,
  });

  @override
  String toString() {
    return 'ChooseTypeSuccess { type: $type }';
  }
}

class ChooseTypeError extends ChooseTypeState {
  final Exception exception;

  ChooseTypeError(this.exception);

  @override
  String toString() {
    return 'ChooseTypeError { exception: $exception }';
  }
}

class RefreshTypeSuccess extends ChooseTypeState {
  final int type;

  RefreshTypeSuccess({
    required this.type,
  });

  @override
  String toString() {
    return 'RefreshTypeSuccess';
  }
}