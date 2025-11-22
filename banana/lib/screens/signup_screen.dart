import 'package:banana/core/colors.dart';
import 'package:banana/core/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(
  TextEditingController password,
  TextEditingController email,
  TextEditingController name,
) async {
  if (!_formKey.currentState!.validate()) return;

  setState(() => _isLoading = true);

  try {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    final User? user = userCredential.user;

    if (user != null) {
      // SAVE USER DATA TO FIRESTORE
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user.uid)
          .set({
        "uid": user.uid,
        "email": email.text.trim(),
        "name": name.text.trim(),
        "createdAt": Timestamp.now(),
        "points":0,
      });

      Get.snackbar(
        "Success",
        "Account created! Welcome, ${name.text.trim()}!",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // Navigate after success (adjust route as needed)
      Get.offAllNamed(AppRoutes.home);  // Or wherever you want to go
    }
  } on FirebaseAuthException catch (e) {
    String errorMsg = "Signup failed";
    switch (e.code) {
      case 'weak-password':
        errorMsg = 'Password is too weak. Use at least 6 characters.';
        break;
      case 'email-already-in-use':
        errorMsg = 'Email is already registered. Try logging in.';
        break;
      default:
        errorMsg = e.message ?? errorMsg;
    }
    Get.snackbar("Error", errorMsg, backgroundColor: Colors.red, colorText: Colors.white);
  } finally {
    setState(() => _isLoading = false);
  }
}

// Add this new method
void _handleSignup() {
  signUp(_passwordController, _emailController, _nameController);
}

// In dispose(), update to dispose the new controller
@override
void dispose() {
  _emailController.dispose();
  _nameController.dispose();  // Replace _phoneController.dispose()
  _passwordController.dispose();
  _confirmPasswordController.dispose();
  super.dispose();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              40.heightBox,
              Image.asset('assets/images/image2.jpg', height: 250, width: 400),
              20.heightBox,
              "Sign Up to Play !!"
                  .text
                  .color(AppColors.primaryColor)
                  .textStyle(const TextStyle(fontFamily: 'libertin', fontSize: 24))
                  .make(),
              30.heightBox,
              _buildTextField(
                controller: _emailController,
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
                controller: _phoneController,
                icon: Icons.people_alt,
                label: 'UserName',
                validator: (v) =>
                    v == null || v.isEmpty ? 'Enter your Username' : null,
              ),
              15.heightBox,
              _buildTextField(
                controller: _passwordController,
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
              15.heightBox,
              _buildTextField(
                controller: _confirmPasswordController,
                icon: Icons.lock_outline,
                label: 'Confirm Password',
                obscureText: _obscureConfirmPassword,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Confirm your password';
                  if (v != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(_obscureConfirmPassword
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () => setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword),
                ),
              ),
              25.heightBox,
              _buildButton(
                text: "Sign Up",
                onTap: _isLoading ? null : _handleSignup,
                isLoading: _isLoading,
              ),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Already Have Account?".text.make(),
                  "Login"
                      .text
                      .color(Colors.blue)
                      .make()
                      .px(5)
                      .onInkTap(() => Get.offNamed(AppRoutes.login)),
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
