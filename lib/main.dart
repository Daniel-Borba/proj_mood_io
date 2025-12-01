import 'package:flutter/material.dart';
import 'telas/login.dart';
import 'theme_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MoodIoApp());
}

class MoodIoApp extends StatelessWidget {
  const MoodIoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.instance.isDark,
      builder: (context, isDark, child) {
        return MaterialApp(
          title: 'Mood.io',
          debugShowCheckedModeBanner: false,
          
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7E57C2),
              brightness: Brightness.light,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF7E57C2),
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
          ),

          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          
          home: const TelaLogin(),
        );
      },
    );
  }
}