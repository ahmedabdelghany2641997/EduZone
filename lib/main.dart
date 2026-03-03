import 'package:eduzone/core/networking/supabase_services.dart';
import 'package:flutter/material.dart';
import 'features/layout/presentaion/screens/layout_bottom_nav_bar_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await SupabaseServices.init();
  } catch (e) {
    debugPrint("Supabase Initialization Error: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutBottomNavBarScreen(),
    );
  }
}
