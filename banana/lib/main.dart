import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Banana Puzzle",
      theme: AppTheme.lightTheme,
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
      debugShowCheckedModeBanner: false,
    );
  }
}
