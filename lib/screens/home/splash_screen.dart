import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/home/dashboard_screen.dart';
import 'package:valorant_guide_app/screens/home/home_screen.dart';

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
        MaterialPageRoute(builder: (_) => DashBoardScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      body: Center(
        child: Container(
          child: Image.asset(
            "assets/logo/valorant_logo.png",
            fit: BoxFit.cover,
            height: 150,
            width: 150,
          ),
        ),
      ),
    );
  }
}
