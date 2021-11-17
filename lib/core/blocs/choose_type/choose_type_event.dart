part of 'choose_type_bloc.dart';

@immutable
abstract class ChooseTypeEvent {}

/// Notifies bloc to change type state.
class ChangeType extends ChooseTypeEvent {
  @override
  String toString() {
    return 'ChangeType';
  }
}

class RefreshType extends ChooseTypeEvent {
  @override
  String toString() {
    return 'RefreshType';
  }
}
