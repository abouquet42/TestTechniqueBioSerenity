import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:test_bio_serenity/core/constants/constants.dart';
import 'package:test_bio_serenity/core/models/message.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

part 'get_car_speed_event.dart';
part 'get_car_speed_state.dart';

class GetCarSpeedBloc extends Bloc<GetCarSpeedEvent, GetCarSpeedState> {

  GetCarSpeedBloc() : super(GetCarSpeedInitial()) {
    final channel = WebSocketChannel.connect(Uri.parse(Constants.API_URL));

    on<GetCarSpeed>((event, emit) async {

      try {
        /// Send "start" to the WebSocket Server to get the speed of a car
        String nameCar = jsonEncode({"name": "${event.carName}"});
        Message startCar = Message(Constants.START, 42, payloadSpeed: nameCar);
        channel.sink.add(startCar.toJsonGetSpeed().toString());

        emit(GetCarSpeedLoading());
        await emit.onEach(
          channel.stream,
          onData: (message) {
            Map<String, dynamic> responseJson = jsonDecode(message.toString());
            Message messageRes = Message.fromJson(responseJson);
            final int speed = messageRes.payloadAnswer != null
                ? messageRes.payloadAnswer!.currentSpeed.round().abs() /// Take the absolute value because a speed cannot be negative
                : 0;
            emit(GetCarSpeedSuccess(speed: speed));
          },
        ).catchError((onError) {
          emit(GetCarSpeedError(error: onError));
        });

      } catch (error) {
        if (error is Error) {
          emit(GetCarSpeedError(error: error));
        }
      }
    });

    on<StopStream>((event, emit) async {
      /// Send "stop" to the WebSocket Server and close the stream
      Message stopCar = Message(Constants.STOP, 42);
      channel.sink.add(stopCar.toJsonGetSpeed().toString());
      channel.sink.close(status.normalClosure);
    });
  }
}
