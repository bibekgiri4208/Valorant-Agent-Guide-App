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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 12,
                    ),
                    child: Image.asset(
                      "assets/logo/valorant_logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                CircleAvatar(radius: 20),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Learn Your\nFavorite Agents",
              style: GoogleFonts.orbitron(fontSize: 30, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
