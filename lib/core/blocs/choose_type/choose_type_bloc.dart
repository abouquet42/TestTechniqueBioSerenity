import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choose_type_event.dart';
part 'choose_type_state.dart';

class ChooseTypeBloc extends Bloc<ChooseTypeEvent, ChooseTypeState> {
  int _typeNormal = 0;

  ChooseTypeBloc() : super(ChooseTypeInitial()) {
    on<ChangeType>((event, emit) {
      emit(ChooseTypeSuccess(type: _typeNormal == 0 ? 1 : 0));
      _typeNormal = _typeNormal == 0 ? 1 : 0;
    });

    on<RefreshType>((event, emit) {
      emit(RefreshTypeSuccess(type: _typeNormal));
    });
  }

  int get type => _typeNormal;
}
