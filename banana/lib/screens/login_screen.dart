import 'package:banana/widgets/checkbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/colors.dart';
import '../core/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);
    try {
      await _auth.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      if (mounted) {
        Get.snackbar(
          "Success",
          "Logged in successfully!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      }

    } on FirebaseAuthException catch (e) {
      String message = 'Login failed. Please try again.';
      switch (e.code) {
        case 'user-not-found':
          message = 'No account found for that email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        case 'invalid-email':
          message = 'Invalid email format.';
          break;
      }
      if (mounted) {
        Get.snackbar("Error", message,
            backgroundColor: Colors.red, colorText: Colors.white);
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              40.heightBox,
              Image.asset('assets/images/image2.jpg', height: 250, width: 400),
              20.heightBox,
              "Welcome Back !!"
                  .text
                  .color(AppColors.primaryColor)
                  .textStyle(const TextStyle(fontFamily: 'libertin', fontSize: 24))
                  .make(),
              30.heightBox,
              _buildTextField(
                controller: _email,
                icon: Icons.email,
                label: 'Email',
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter your email';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
              ),
              15.heightBox,
              _buildTextField(
                controller: _password,
                icon: Icons.lock,
                label: 'Password',
                obscureText: _obscurePassword,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter your password';
                  if (v.length < 6) return 'Minimum 6 characters';
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
              const CheckBoxWidget(),
              25.heightBox,
              _buildButton(
                text: "Login",
                onTap: _isLoading ? null : signIn,
                isLoading: _isLoading,
              ),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Don't Have Account?".text.make(),
                  "Sign Up"
                      .text
                      .color(Colors.blue)
                      .make()
                      .px(5)
                      .onInkTap(() => Get.offNamed(AppRoutes.signup)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String label,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback? onTap,
    required bool isLoading,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : text.text.white.bold.make(),
          ),
        ),
      ),
    );
  }
}
