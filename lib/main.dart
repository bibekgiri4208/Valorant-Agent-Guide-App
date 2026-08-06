import 'package:flutter/material.dart';
import 'package:valorant_guide_app/screens/agents/agents_detail_screen.dart';
import 'package:valorant_guide_app/screens/home/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Valorant Agent Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AgentsDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
