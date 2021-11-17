import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class _Colors {
  Color get primary => const Color(0xff027174);

  Color get secondary => const Color(0xff15D3B4);

  Color get backgroundCard => const Color(0xffE5E5E5);
}

class _Values {
  BorderRadius get defaultBorderRadius => BorderRadius.circular(5.0);
}

/// Assets
class _ImageAssets {
  String get icLittleLogoSwood => 'assets/images/ic_little_logo_swood.png';

  String get icLogoSwood => 'assets/images/ic_logo_swood.png';

  String get ferrari => 'assets/images/ferrari.png';
  String get astonmartin => 'assets/images/astonmartin.png';
  String get bmw => 'assets/images/bmw.png';
  String get audi => 'assets/images/audi.png';
  String get jaguar => 'assets/images/jaguar.png';
  String get peugeot => 'assets/images/peugeot.png';
  String get porsche => 'assets/images/porsche.png';
  String get carDefault => 'assets/images/car_default.png';
}

class _Icons {}

class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  TextStyle get title => const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Volte Rounded',
        letterSpacing: 0.0,
      );

  TextStyle get brand => const TextStyle(
        color: Colors.black87,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        fontFamily: 'Volte Rounded',
        letterSpacing: 0.0,
      );

  TextStyle get subtitle => const TextStyle(
        color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        fontFamily: 'Volte Rounded',
        letterSpacing: 0.0,
      );

  TextStyle get display => const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Volte Rounded',
        letterSpacing: 0.0,
      );

  TextStyle get displayWhite => const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        fontFamily: 'Volte Rounded',
        letterSpacing: 0.0,
      );

  TextStyle get error => const TextStyle(
        color: Colors.red,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: 'Volte Rounded',
        letterSpacing: 0.0,
      );
}

// ignore: must_be_immutable
class AppTheme extends InheritedWidget {
  final _Colors colors = _Colors();

  final _Values values = _Values();

  final _Icons icons = _Icons();

  final _ImageAssets assets = _ImageAssets();

  late _TextStyles textStyles;

  AppTheme({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>();
  }
}
