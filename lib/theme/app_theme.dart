import "package:flutter/material.dart";

class AppColors {
  static const primary = Color(0xFFA62B2B);
  static const primaryDark = Color(0xFF8B1538);
  static const accentGold = Color(0xFFFFD700);
}

ThemeData buildAppTheme() {
  final base = ThemeData(
    useMaterial3: true,
    fontFamily: "Inter",
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary, brightness: Brightness.light),
  );
  return base.copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
