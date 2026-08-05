import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/home/home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    Center(child: Text("Controller")),
    Center(child: Text("Duelist")),
    HomeScreen(),
    Center(child: Text("Initiator")),
    Center(child: Text("Sentinel")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFFF4654),
        // showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF1C252E),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },

        selectedLabelStyle: const TextStyle(
          fontFamily: 'Valorant',
          fontSize: 11,
          letterSpacing: 1.0,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'Valorant',
          fontSize: 11,
        ),

        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/controller_logo.png"),
              size: 25,
            ),
            label: "Controller",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/duelist_logo.png"),
              size: 25,
            ),
            label: "Duelist",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/valorant_logo.png"),
              size: 25,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/initiator_logo.png"),
              size: 25,
            ),
            label: "Initiator",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/logo/sentinel_logo.png"),
              size: 25,
            ),
            label: "Sentinel",
          ),
        ],
      ),
    );
  }
}
