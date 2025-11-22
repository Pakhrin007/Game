import 'dart:math';
// import 'package:banana/core/routes.dart';
import 'package:banana/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/puzzle_model.dart';
import '../services/puzzle_service.dart';
import '../widgets/option_button.dart';
import '../widgets/puzzle_image.dart';
import '../core/colors.dart';

// NEW: Add these imports for Firebase
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PuzzleScreen extends StatefulWidget {
  const PuzzleScreen({super.key});

  @override
  State<PuzzleScreen> createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  PuzzleModel? puzzle;
  int score = 0;
  String message = "";
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadPuzzle();
  }

  void loadPuzzle() async {
    setState(() {
      loading = true;
      message = "";
    });

    puzzle = await PuzzleService.fetchPuzzle();
    setState(() {
      loading = false;
    });
  }

  List<int> generateOptions(int correct) {
    final rnd = Random();
    final set = {correct};

    while (set.length < 4) {
      set.add(rnd.nextInt(10));
    }

    return set.toList()..shuffle();
  }

  // NEW: Paste the updateScore function here (as a class method)
  Future<void> updateScore(int newScore) async {
    // Optional: Add null check for unauthenticated users
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle unauthenticated state (e.g., redirect to login)
      print("User not authenticated – skipping score update");
      return;
    }

    final uid = user.uid;

    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .update({"points": newScore});
      print("Score updated to $newScore in Firestore");  // Debug log
    } catch (e) {
      print("Error updating score: $e");  // Handle errors (e.g., doc doesn't exist yet)
      // Optional: Use .set() instead of .update() for first-time writes
      // await FirebaseFirestore.instance.collection("users").doc(uid).set({"points": newScore}, SetOptions(merge: true));
    }
  }

  void checkAnswer(int choice) {
    if (choice == puzzle!.answer) {
      setState(() {
        score += 10;
        message = "Correct!";
      });

      // NEW: Call updateScore right after local state update
      updateScore(score);  // Sync total score to Firestore
    } else {
      setState(() {
        message = "Incorrect!";
      });
    }

    Future.delayed(const Duration(seconds: 1), () => loadPuzzle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: "Banana Puzzle".text.textStyle(TextStyle(color: AppColors.primaryColor,fontFamily: 
              'libertin',fontSize: 24)).make(),
              backgroundColor: Colors.yellow[50],
      ),
      drawer: const AppDrawer(),
      
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : VStack(
              [
                PuzzleImage(url: puzzle!.image),
                10.heightBox,

                "Score: $score".text.xl2.bold.color(Colors.black).make(),

                10.heightBox,
                message.text.xl.bold
                    .color(message == "Correct!" ? Colors.green : Colors.red)
                    .make(),

                10.heightBox,

                ...generateOptions(puzzle!.answer)
                    .map((e) => OptionButton(number: e, onPressed: () => checkAnswer(e)))
                    ,
              ],
              alignment: MainAxisAlignment.center,
              crossAlignment: CrossAxisAlignment.center,
            ).scrollVertical().p20(),
    );
  }
}