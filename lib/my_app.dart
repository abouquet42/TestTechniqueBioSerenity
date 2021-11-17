import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_bio_serenity/ui/router.dart' as router;
import 'package:test_bio_serenity/ui/home.dart';

import 'app_theme.dart';
import 'core/blocs/get_cars/get_cars_bloc.dart';
import 'core/translations/i18n.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return BlocProvider(
      create: (BuildContext context) => GetCarsBloc()..add(GetAllCars()),
      child: AppTheme(
        child: MaterialApp(
          title: 'Test BioSerenity',
          theme: ThemeData(
            primaryColor: Colors.grey,
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
          ),
          localizationsDelegates: const [
            I18nDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: I18nDelegate.supportedLocals,
          onGenerateRoute: router.Router.generateRoute,
          home: Home(),
        ),
      ),
    );
  }
}