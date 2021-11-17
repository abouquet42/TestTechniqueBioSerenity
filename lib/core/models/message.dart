import 'car.dart';

class Message {
  final String type;
  final int userToken;
  List<Car> payload;
  Car? payloadAnswer;
  String payloadSpeed;

  Message(
    this.type,
    this.userToken,
    {
      this.payload = const [],
      this.payloadAnswer = null,
      this.payloadSpeed = ''
    }
  );

  Message.fromJson(Map<String, dynamic> json, {this.payloadSpeed = '', this.payload = const []})
      : type = json['type'],
        userToken = int.parse(json['userToken'].toString()),
        payloadAnswer = Car.fromJson(json['payload'] as Map<String, dynamic>);

  Message.fromJsonGetCars(Map<String, dynamic> json, {this.payloadSpeed = ''})
      : type = json['type'],
        userToken = int.parse(json['userToken'].toString()),
        payload = json['payload'] != null
          ? (json['payload'] as List).map((car) {
            return Car.fromJson(car as Map<String, dynamic>);
          }).toList()
              : [];

  Map<String, dynamic> toJson() => {
        '"type"': '"$type"',
        '"userToken"': userToken.toInt(),
      };

  Map<String, dynamic> toJsonGetSpeed() => {
        '"type"': '"$type"',
        '"userToken"': userToken.toInt(),
        '"payload"': '$payloadSpeed',
      };
}
