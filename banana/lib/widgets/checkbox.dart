import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key});

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
    bool _isChecked=false;

  @override
  Widget build(BuildContext context) {
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                    Row(
                      children: [
                        Checkbox(value:_isChecked, tristate: true, onChanged: (bool?newValue){
                          setState((){
                            _isChecked=newValue??false;
                          });
                        }),
                        "Remember me".text.textStyle(TextStyle(fontFamily: 'libertin',fontSize: 16,fontWeight: FontWeight.w400)).make()
                      ],
                    ),
                    
                    
                  ],
                );
  }
}