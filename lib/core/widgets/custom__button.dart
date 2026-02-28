import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key, required this.text, required this.onPressed, required this.color});

  final String text;
  final void Function()? onPressed;
  final Color color ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width/2,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(color),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ), // ButtonStyle
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.black),
            textAlign: TextAlign.center,
          ), // Text
        ), // TextButton
      ), // SizedBox
    ); // Center
  }
}