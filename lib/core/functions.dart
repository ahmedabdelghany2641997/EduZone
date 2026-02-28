import 'package:flutter/material.dart';
void snackBarMessage({required context ,required String text}){
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

}