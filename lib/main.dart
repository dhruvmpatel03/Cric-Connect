import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/app_theme.dart';
import 'viewmodels/auth_view_model.dart';
import 'viewmodels/match_history_view_model.dart';
import 'viewmodels/tab_navigation.dart';
import 'viewmodels/theme_view_model.dart';
import 'viewmodels/tournament_view_model.dart';
import 'views/main_shell.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeViewModel()),
        ChangeNotifierProvider(create: (_) => TabNavigation()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => TournamentViewModel()),
        ChangeNotifierProvider(create: (_) => MatchHistoryViewModel()),
      ],
      child: const CricConnectApp(),
    ),
  );
}

class CricConnectApp extends StatelessWidget {
  const CricConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeViewModel>().mode;

    return MaterialApp(
      title: 'Cric-Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const MainShell(),
    );
  }
}