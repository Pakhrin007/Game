import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';
import '../screens/puzzle_screen.dart';

class AppRoutes {
  static const login = "/login";
  static const signup = "/signup";
  static const home = "/home";
  static const puzzle = "/puzzle";

  static Map<String, WidgetBuilder> routes = {
    login: (_) => const LoginScreen(),
    signup: (_) => const SignupScreen(),
    home: (_) => const HomeScreen(),
    puzzle: (_) => const PuzzleScreen(),
  };
}
