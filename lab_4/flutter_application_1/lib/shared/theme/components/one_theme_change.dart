import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme/bloc/theme_cubit.dart';
import 'package:flutter_application_1/shared/theme/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneThemeChange extends StatelessWidget {
  const OneThemeChange({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return DayNightSwitcherIcon(
          dayBackgroundColor: theme.colorScheme.primary,
          nightBackgroundColor: theme.colorScheme.primary,
          isDarkModeEnabled: state.themeMode == ThemeMode.dark,
          onStateChanged: (value) {
            BlocProvider.of<ThemeCubit>(context).changeTheme(value ? ThemeMode.dark : ThemeMode.light);
          },
        );
      },
    );
  }
}
