import 'package:flutter/material.dart';

class ThemeController {
  static final ThemeController instance = ThemeController._();
  ThemeController._();

  final isDark = ValueNotifier<bool>(false);

  void toggle() {
    isDark.value = !isDark.value;
  }
}