import 'package:flutter/material.dart';

class DefultElevatedButton extends StatelessWidget {
   DefultElevatedButton({required this.label,required this.onPressed});

  String label;
  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style:ElevatedButton.styleFrom(
      fixedSize: Size(
        MediaQuery.sizeOf(context).width
        ,52)
    ),

     child: Text(label));
  }
}