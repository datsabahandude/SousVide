import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sous_v/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF800000)),
        useMaterial3: true,
        fontFamily: GoogleFonts.manrope().fontFamily,
      ),
      home: const HomePage(),
    );
  }
}
