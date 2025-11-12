import 'package:banana/wrapper_screen.dart';
import 'package:flutter/material.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';  // Now exports unique SignupScreen
import '../screens/home_screen.dart';
import '../screens/puzzle_screen.dart';

class AppRoutes {
  static const login = "/login";
  static const signup = "/signup";
  static const home = "/home";
  static const puzzle = "/puzzle";
  static const wrapper = "/wrapper";  // Add for auto-routing

  static Map<String, WidgetBuilder> routes = {
    wrapper: (context) => const WrapperScreen(),  // Root: Handles auth state
    login: (context) => const LoginScreen(),
    signup: (context) => const SignupScreen(),  // Now unique—no conflict
    home: (context) => const HomeScreen(),
    puzzle: (context) => const PuzzleScreen(),
  };
}