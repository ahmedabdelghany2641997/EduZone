

import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  TextEditingController? controller;
 Widget? prefixIcon;
 String? hintText;
  String? Function(String?)? validator;
  CustomTextfield({super.key,this.validator, this.controller,  this.prefixIcon,  this.hintText, });
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator:validator ,
      controller: controller,
      decoration: InputDecoration(
        fillColor:Colors.white,
        label: Text("what are you looking for?"),
        filled: true,
        prefixIcon:prefixIcon ,
        hintText:hintText ,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
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