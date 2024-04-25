import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme(ThemeMode themeMode) async {
    emit(state.copyWith(themeMode: themeMode));
  }
}
