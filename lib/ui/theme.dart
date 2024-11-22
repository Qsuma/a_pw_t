import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  scrollbarTheme: const ScrollbarThemeData(
    trackVisibility: WidgetStatePropertyAll(true),
    interactive: true,
    thickness: WidgetStatePropertyAll(8),
    thumbVisibility: WidgetStatePropertyAll(true),
  ),

  primaryColor: Colors.blue, // Color azul
  secondaryHeaderColor: Colors.red, // Color rojo

  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  useMaterial3: true,
);
