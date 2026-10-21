import 'package:flutter/material.dart';

class AppTheme {
  // ---------- Colours sampled from the Cric-Connect logo ----------
  static const Color logoTeal = Color(0xFF08D8C8); // the logo's teal C
  static const Color logoCream = Color(0xFFF8E4C8); // the logo's cream C
  static const Color navy = Color(0xFF0A0E17); // the logo's background

  // ---------- Light mode: tints and shades of the logo teal ----------
  static const Color tealDark = Color(0xFF0A7F7A); // darker logo teal: headers, buttons
  static const Color tealDeep = Color(0xFF003D3A); // text on light teal
  static const Color tealLight = Color(0xFFB5ECE7); // run buttons, chips
  static const Color tealSoft = Color(0xFFD2F5F2); // cards
  static const Color tealPale = Color(0xFFE6FAF8); // page background
  static const Color ink = Color(0xFF0A1F24); // normal text (navy-based)

  // ---------- Dark mode ----------
  static const Color navySurface = Color(0xFF111A22);
  static const Color navyCard = Color(0xFF162730);
  static const Color navyRaised = Color(0xFF1D3540);
  static const Color tealBright = logoTeal;
  static const Color tealOnBright = navy;
  static const Color mist = Color(0xFFE6FAF8); // text in dark mode

  // Kept so older code that uses pitchGreen still works
  static const Color pitchGreen = tealDark;

  // ---------- Colours that adapt to light/dark ----------
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  static Color highlight(BuildContext context) =>
      isDark(context) ? const Color(0xFF4A3F12) : Colors.amber.shade100;

  static Color success(BuildContext context) =>
      isDark(context) ? const Color(0xFF1B3A2A) : Colors.green.shade50;

  static Color info(BuildContext context) =>
      isDark(context) ? const Color(0xFF16304A) : Colors.blue.shade50;

  // ---------- Shared bottom navigation style ----------
  static NavigationBarThemeData _navTheme({
    required Color background,
    required Color indicator,
    required Color selectedIcon,
    required Color icon,
    required Color label,
  }) {
    return NavigationBarThemeData(
      backgroundColor: background,
      indicatorColor: indicator,
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected) ? selectedIcon : icon,
        ),
      ),
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => TextStyle(
          color: label,
          fontWeight: states.contains(WidgetState.selected)
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    );
  }

  // ---------- Light theme ----------
  static final ColorScheme _lightScheme =
      ColorScheme.fromSeed(seedColor: logoTeal).copyWith(
    primary: tealDark,
    onPrimary: Colors.white,
    primaryContainer: tealLight,
    onPrimaryContainer: tealDeep,
    secondaryContainer: tealLight,
    onSecondaryContainer: tealDeep,
    surface: tealPale,
    onSurface: ink,
    surfaceContainerLowest: Colors.white,
    surfaceContainerLow: tealSoft,
    surfaceContainer: tealLight,
    surfaceContainerHigh: tealSoft,
    surfaceContainerHighest: tealLight,
  );

  static final ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: _lightScheme,
    scaffoldBackgroundColor: tealPale,
    appBarTheme: const AppBarTheme(
      backgroundColor: logoTeal,
      foregroundColor: navy,
    ),
    cardTheme: const CardThemeData(color: tealSoft),
    drawerTheme: const DrawerThemeData(backgroundColor: tealPale),
    navigationBarTheme: _navTheme(
      background: logoTeal,
      indicator: tealDark,
      selectedIcon: Colors.white,
      icon: navy,
      label: navy,
    ),
  );

  // ---------- Dark theme ----------
  static final ColorScheme _darkScheme = ColorScheme.fromSeed(
    seedColor: logoTeal,
    brightness: Brightness.dark,
  ).copyWith(
    primary: tealBright,
    onPrimary: tealOnBright,
    primaryContainer: const Color(0xFF0B5551),
    onPrimaryContainer: tealLight,
    secondaryContainer: const Color(0xFF0F4A47),
    onSecondaryContainer: tealLight,
    surface: navy,
    onSurface: mist,
    surfaceContainerLowest: const Color(0xFF070A11),
    surfaceContainerLow: navyCard,
    surfaceContainer: navySurface,
    surfaceContainerHigh: navyRaised,
    surfaceContainerHighest: navyRaised,
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: _darkScheme,
    scaffoldBackgroundColor: navy,
    appBarTheme: const AppBarTheme(
      backgroundColor: navySurface,
      foregroundColor: mist,
    ),
    cardTheme: const CardThemeData(color: navyCard),
    drawerTheme: const DrawerThemeData(backgroundColor: navySurface),
    navigationBarTheme: _navTheme(
      background: navySurface,
      indicator: tealBright,
      selectedIcon: tealOnBright,
      icon: tealLight,
      label: tealLight,
    ),
  );
}