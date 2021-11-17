import 'package:flutter/material.dart';

import '../app_theme.dart';

class Utils {

  static showSnackBarError(BuildContext context, String text) {
    return SnackBar(
      content: Text(
        text,
        style: AppTheme.of(context)!.textStyles.displayWhite,
      ),
      backgroundColor: Colors.red,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      behavior: SnackBarBehavior.floating,
    );
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}