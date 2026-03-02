

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController? controller;

  CustomTextfield({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

/*
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.controller, this.validator, this.hintText});

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ), // InputDecoration
    ); // TextFormField
  }
}
*/