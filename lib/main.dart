import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:valorant_guide_app/screens/home/splash_screen.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';
import 'package:valorant_guide_app/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Valo Guide',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: AppColors.scaffold(Brightness.light),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.accent,
              brightness: Brightness.light,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: AppColors.scaffold(Brightness.dark),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.accent,
              brightness: Brightness.dark,
            ),
          ),
          home: const SplashScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
