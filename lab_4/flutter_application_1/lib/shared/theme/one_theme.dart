import 'package:flutter/material.dart';
import 'package:flutter_application_1/shared/theme/color_schemes.g.dart';
import 'package:google_fonts/google_fonts.dart';

class OneTheme {
  static ThemeData lightThemeData = themeData(lightColorScheme);
  static ThemeData darkThemeData = themeData(darkColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    final TextStyle textStyle = GoogleFonts.oswald();
    return ThemeData(
      useMaterial3: true,

      //TextTheme fonts based on the design. Use textTheme or primaryTextTheme depending on the font size which you need
      //600 - semibold, 300-light, 500-medium, 400-regular
      textTheme: TextTheme(
        displayLarge: textStyle.copyWith(fontSize: 64, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        displayMedium: textStyle.copyWith(fontSize: 40, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        displaySmall: textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        //
        headlineLarge: textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w300, color: colorScheme.onSurface),
        headlineMedium: textStyle.copyWith(fontSize: 26, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
        headlineSmall: textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        //
        titleLarge: textStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w300, color: colorScheme.onSurface),
        titleMedium: textStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        titleSmall: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
        //
        bodyLarge: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
        bodyMedium: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w300, color: colorScheme.onSurface),
        bodySmall: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        //
        labelLarge: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
        labelMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w300, color: colorScheme.onSurface),
        labelSmall: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      ),
      primaryTextTheme: TextTheme(
        bodyLarge: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
        bodyMedium: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w300, color: colorScheme.onSurface),
        bodySmall: textStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        //
        labelLarge: textStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w300, color: colorScheme.onSurface),
        labelMedium: textStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
        labelSmall: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        //
        headlineLarge: textStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
        //
        titleLarge: textStyle.copyWith(fontSize: 10, fontWeight: FontWeight.w500, color: colorScheme.onSurface),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.primary,
        surfaceTintColor: colorScheme.primary,
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),

      colorScheme: colorScheme,
    );
  }
}
