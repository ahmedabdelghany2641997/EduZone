import 'package:flutter/material.dart';

import 'features/auth/persentation/screen/login_screen.dart';
import 'features/auth/persentation/screen/signup_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}


