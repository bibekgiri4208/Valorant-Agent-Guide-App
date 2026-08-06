import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C252E),
      appBar: AppBar(
        backgroundColor: Color(0xFF1C252E),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Valorant",
          style: TextStyle(
            color: Color(0xFFFF4654),
            fontSize: 30,
            fontFamily: 'Valorant',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Learn Your\nFaVorite agents",
                style: TextStyle(
                  fontFamily: 'Valorant',
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 30),
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.white, width: 0.5),
                  image: DecorationImage(
                    image: const AssetImage('assets/roles/jett_dark.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withValues(alpha: 0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Duelists',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Valorant",
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.white, width: 0.5),
                  image: DecorationImage(
                    image: const AssetImage('assets/roles/omen_dark.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withValues(alpha: 0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Controllers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Valorant",
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.white, width: 0.5),
                  image: DecorationImage(
                    image: const AssetImage('assets/roles/gekko_dark.png'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withValues(alpha: 0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Initiators',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Valorant",
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Container(
                height: 150,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  border: Border.all(color: Colors.white, width: 0.5),
                  image: DecorationImage(
                    image: const AssetImage('assets/roles/killjoy_dark.jpg'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withValues(alpha: 0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Sentinels',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Valorant",
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
