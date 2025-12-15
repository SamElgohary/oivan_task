import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      // Primary colors
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,

      // Color scheme (important for Material 3)
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        background: AppColors.background,
        surface: AppColors.white,
        onPrimary: Colors.white,
        onBackground: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
      ),

      // AppBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),

      // Text theme
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 12,
        ),
      ),

      // Divider
      dividerColor: AppColors.divider,

      // Progress indicator
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
      ),

      // ListTile
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.primary,
        textColor: AppColors.textPrimary,
      ),
    );
  }
}
