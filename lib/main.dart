import 'package:flutter/material.dart';
import 'telas/login.dart';

void main() {
  runApp(const MoodioApp());
}

class MoodioApp extends StatelessWidget {
  const MoodioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood.io',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Cor principal do Mood.io
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepPurpleAccent,
        ),
        useMaterial3: true,
      ),
      home: const TelaLogin()
    );
  }
}