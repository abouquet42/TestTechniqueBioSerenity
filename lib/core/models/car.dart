class Car {
  final String brand;
  final String name;
  final int speedMax;
  final int cv;
  final double currentSpeed;

  Car(
    this.brand,
    this.name,
    this.speedMax,
    this.cv,
    this.currentSpeed,
  );

  Car.fromJson(Map<String, dynamic> json)
      : brand = json['brand'],
        name = json['name'],
        speedMax = int.parse(json['speedMax'].toString()),
        cv = int.parse(json['cv'].toString()),
        currentSpeed = double.parse(json['currentSpeed'].toString());
}
