import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/home/dashboard_screen.dart';
import 'package:valorant_guide_app/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const DashBoardScreen(playEntryAnimation: true)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/valorant_logo.png",
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
            SizedBox(height: 15),
            Text(
              "Valo Guide",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 40,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
