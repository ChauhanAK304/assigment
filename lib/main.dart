import 'package:flutter/material.dart';
import 'skills_screen.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const SportsApp());
}

class SportsApp extends StatelessWidget {
  const SportsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sports Tech App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SkillsScreen(),
    );
  }
}