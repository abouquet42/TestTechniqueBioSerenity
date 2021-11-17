import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:test_bio_serenity/core/models/car.dart';
import 'package:test_bio_serenity/core/models/navigation/arguments/car_details_arguments.dart';

import '../app_theme.dart';
import 'car_details.dart';

class CardCar extends StatelessWidget {
  final Car car;

  const CardCar({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: () {
        Navigator.of(context).pushNamed(
          CarDetails.routeName,
          arguments: CarDetailsArguments(car),
        );
      },
      duration: const Duration(milliseconds: 100),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: AppTheme.of(context)!.colors.backgroundCard,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 1), // changes position of shadow
              ),
            ],
          ),
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                    'assets/images/${car.brand.toLowerCase().replaceAll(' ', '')}.png',
                    height: 120,
                    fit: BoxFit.fitHeight, errorBuilder: (BuildContext context,
                        Object exception, StackTrace? stackTrace) {
                  return Image.asset(
                    AppTheme.of(context)!.assets.carDefault,
                    height: 120,
                    fit: BoxFit.fitHeight,
                  );
                }),
                const SizedBox(
                  width: 50,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        car.brand,
                        maxLines: 1,
                        minFontSize: 15,
                        style: AppTheme.of(context)!.textStyles.brand,
                      ),
                      AutoSizeText(
                        car.name,
                        maxLines: 1,
                        minFontSize: 12,
                        style: AppTheme.of(context)!.textStyles.subtitle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
