import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/colors.dart';
import '../core/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VStack(
        [
          "Banana Puzzle Game"
              .text
              .xl3
              .bold
              .color(AppColors.primaryColor).
              textStyle(TextStyle(fontFamily: 
              'libertin',fontSize: 24))
              .makeCentered(),

          20.heightBox,
          Center(child: Image.asset('assets/images/image2.jpg',height: 250,),),
              20.heightBox,

          "Start Puzzle"
              .text
              .white
              .xl2
              .textStyle((TextStyle(fontFamily: 
              'libertin',fontSize: 24,letterSpacing: 2)))
              .makeCentered()
              .box
              .color(AppColors.primaryColor)
              .roundedLg
              .p12
              .make()
              .onInkTap(() {
                Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.puzzle
                );
              }),
        ],
        alignment: MainAxisAlignment.center,
      ).p20(),
    );
  }
}
