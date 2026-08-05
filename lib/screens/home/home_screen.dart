import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFFF4654),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 12,
                    ),
                    child: Image.asset(
                      "assets/logo/valorant_logo.png",
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "VALORANT",
                  style: TextStyle(
                    fontFamily: 'Valorant',
                    fontSize: 30,
                    color: Color(0xFFFF4654),
                  ),
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Color(0xFFFF4654),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 8,
                    ),
                    child: Image.asset(
                      "assets/logo/user.png",
                      fit: BoxFit.contain,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 50),

            Text(
              "Learn Your\nFaVorite agents",
              style: TextStyle(
                fontFamily: 'Valorant',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
