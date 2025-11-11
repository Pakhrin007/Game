import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/colors.dart';

class OptionButton extends StatelessWidget {
  final int number;
  final VoidCallback onPressed;

  const OptionButton({super.key, required this.number, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return number.toString()
        .text
        .xl
        .bold
        .color(AppColors.primaryColor)
        .makeCentered()
        .box
        .rounded
        .border(color:Colors.black)
        .p12
        .margin(const EdgeInsets.symmetric(vertical: 5))
        .make()
        .onTap(onPressed);
  }
}
