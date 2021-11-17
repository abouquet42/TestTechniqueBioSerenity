import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bio_serenity/core/blocs/choose_type/choose_type_bloc.dart';
import 'package:test_bio_serenity/core/translations/i18n.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../app_theme.dart';

class ToggleSwitchCustom extends StatelessWidget {
  final int initialIndex;

  const ToggleSwitchCustom({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 120.0,
      minHeight: 26,
      cornerRadius: 30.0,
      activeFgColor: Colors.white,
      inactiveBgColor: AppTheme.of(context)!.colors.backgroundCard,
      inactiveFgColor: Colors.black,
      initialLabelIndex: initialIndex,
      totalSwitches: 2,
      customTextStyles: [AppTheme.of(context)!.textStyles.display, AppTheme.of(context)!.textStyles.display],
      labels: [
        I18n.chartButton,
        I18n.counterButton
      ],
      radiusStyle: true,
      onToggle: (index) {
        if (BlocProvider.of<ChooseTypeBloc>(context).type != index) {
          context.read<ChooseTypeBloc>().add(ChangeType());
        }
      },
    );
  }
}
