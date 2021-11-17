import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:test_bio_serenity/core/blocs/get_car_speed/get_car_speed_bloc.dart';
import 'package:test_bio_serenity/core/models/car.dart';
import 'package:test_bio_serenity/core/translations/i18n.dart';
import 'package:test_bio_serenity/ui/utils.dart';

import '../app_theme.dart';

class CarDetails extends StatefulWidget {
  static const String routeName = '/CarDetails';

  final Car car;

  const CarDetails({
    Key? key,
    required this.car,
  }) : super(key: key);

  @override
  State<CarDetails> createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  late GetCarSpeedBloc _getCarSpeedBloc;
  double height = 50.0;
  int speedValue = 0;

  @override
  void initState() {
    super.initState();
    _getCarSpeedBloc = GetCarSpeedBloc();
    _getCarSpeedBloc.add(GetCarSpeed(carName: widget.car.name));

    Timer(
      Duration(milliseconds: 100), () {
        setState(() {
          height = 200;
        });
      },
    );
  }

  @override
  void dispose() {
    _getCarSpeedBloc.add(StopStream());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: Utils.isLargeScreen(context) ? MediaQuery.of(context).size.width / 2 : null,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: AnimatedContainer(
                      curve: Curves.easeInCubic,
                      duration: const Duration(milliseconds: 400),
                      height: height,
                      child: Image.asset(
                          'assets/images/${widget.car.brand.toLowerCase().replaceAll(' ', '')}.png',
                          errorBuilder: (BuildContext context,
                              Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          AppTheme.of(context)!.assets.carDefault,
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 32,),
                  Column(
                    children: [
                      const SizedBox(height: 232,),
                      Container(
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
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  AutoSizeText(
                                    widget.car.brand,
                                    style: AppTheme.of(context)!.textStyles.brand,
                                  ),
                                  AutoSizeText(
                                    widget.car.name,
                                    style: AppTheme.of(context)!.textStyles.subtitle,
                                  ),
                                ],
                              ),
                              // Spacer(),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    AutoSizeText(
                                      '${I18n.cvLabel} : ${widget.car.cv.toString()}',
                                      // overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      style: AppTheme.of(context)!.textStyles.subtitle,
                                    ),
                                    AutoSizeText(
                                      '${I18n.speedMaxLabel} : ${widget.car.speedMax.toString()}',
                                      // overflow: TextOverflow.fade,
                                      maxLines: 1,
                                      minFontSize: 8,
                                      style: AppTheme.of(context)!.textStyles.subtitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32,),
                      SizedBox(
                        height: 300,
                        child: BlocListener(
                          bloc: _getCarSpeedBloc,
                          listener: (context, state) {
                            if (state is GetCarSpeedSuccess) {
                              setState(() {
                                speedValue = state.speed;
                              });
                            } else if (state is GetCarSpeedError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                Utils.showSnackBarError(
                                  context,
                                  I18n.errorGetSpeedLabel,
                                ),
                              );
                            }
                          },
                          child: SfRadialGauge(
                            enableLoadingAnimation: true,
                            animationDuration: 3500,
                            axes: <RadialAxis>[
                              RadialAxis(
                                minimum: 0,
                                maximum: widget.car.speedMax.toDouble(),
                                ranges: <GaugeRange>[
                                  GaugeRange(startValue: 0, endValue: widget.car.speedMax/3, color:Colors.green),
                                  GaugeRange(startValue: widget.car.speedMax/3, endValue: widget.car.speedMax - widget.car.speedMax/4, color: Colors.orange),
                                  GaugeRange(startValue: widget.car.speedMax - widget.car.speedMax/4, endValue: widget.car.speedMax.toDouble(), color: Colors.red),
                                ],
                                pointers: <GaugePointer>[NeedlePointer(value: speedValue.toDouble())],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                    widget: Container(
                                      child: Text(
                                        speedValue.toString(),
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    angle: 90,
                                    positionFactor: 0.5,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
