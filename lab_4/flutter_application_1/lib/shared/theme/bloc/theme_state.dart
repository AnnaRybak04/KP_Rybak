import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  const ThemeState({required this.themeMode});

  factory ThemeState.initial() {
    return const ThemeState(themeMode: ThemeMode.light);
  }

  final ThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];

  ThemeState copyWith({
    ThemeMode? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
