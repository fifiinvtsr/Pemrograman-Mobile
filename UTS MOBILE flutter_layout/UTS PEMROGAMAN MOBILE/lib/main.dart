import 'package:flutter/material.dart';

import 'landing_page.dart'; // Import halaman landing

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTS Mobile App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 0, 141, 115)),
        useMaterial3: true,
      ),
      home: const LandingPage(), // Halaman pertama adalah LandingPage
    );
  }
}
