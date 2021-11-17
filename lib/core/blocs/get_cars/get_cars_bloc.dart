import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:test_bio_serenity/core/constants/constants.dart';
import 'package:test_bio_serenity/core/models/car.dart';
import 'package:test_bio_serenity/core/models/message.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'get_cars_event.dart';
part 'get_cars_state.dart';

class GetCarsBloc extends Bloc<GetCarsEvent, GetCarsState> {

  GetCarsBloc() : super(GetCarsInitial()) {
    final channel = WebSocketChannel.connect(Uri.parse(Constants.API_URL));

    on<GetAllCars>((event, emit) async {
      Message newMessage = Message(Constants.INFOS, 42);
      channel.sink.add(newMessage.toJson().toString());

      try {
        emit(GetAllCarsLoading());
        await emit.onEach(
          channel.stream,
          onData: (message) {
            Map<String, dynamic> responseJson = jsonDecode(message.toString());
            try {
              Message messageRes = Message.fromJsonGetCars(responseJson);
              emit(GetAllCarsSuccess(allCars: messageRes.payload));
            } catch (error) {
              if (error is Error) {
                emit(GetAllCarsError(error: error));
              }
            }
          },
        ).catchError((onError) {
          emit(GetAllCarsError(error: onError));
        });
      } catch (error) {
        if (error is Error) {
          emit(GetAllCarsError(error: error));
        }
      }
    });
  }
}
