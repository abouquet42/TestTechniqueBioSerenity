import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bio_serenity/app_theme.dart';
import 'package:test_bio_serenity/core/blocs/get_cars/get_cars_bloc.dart';
import 'package:test_bio_serenity/core/models/car.dart';
import 'package:test_bio_serenity/core/translations/i18n.dart';
import 'package:test_bio_serenity/ui/utils.dart';

import 'card_car.dart';

class Home extends StatelessWidget {
  static const String routeName = '/Home';

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          width: Utils.isLargeScreen(context) ? MediaQuery.of(context).size.width / 2 : null,
          child: BlocBuilder<GetCarsBloc, GetCarsState>(
            builder: (BuildContext context, GetCarsState state) {
              if (state is GetAllCarsSuccess) {
                List<Car> allCars = state.allCars;
                return ListView.builder(
                  itemCount: allCars.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CardCar(car: allCars[index]);
                  },
                );
              } else if (state is GetAllCarsLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetAllCarsError) {
                return Center(
                  child: Text(
                    I18n.errorGetDataLabel,
                    textAlign: TextAlign.center,
                    style: AppTheme.of(context)!.textStyles.error,
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
