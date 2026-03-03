import 'package:bloc/bloc.dart';
import 'package:eduzone/features/auth/persentation/screen/signup_screen.dart';
import 'package:eduzone/features/layout/presentaion/cubit/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';

import '../../../../home/persentation/screens/home_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitState());



   List<Widget> screens = [
     HomeScreen(),
    SignupScreen(),
     SignupScreen(),
  ];



   int currentIndex = 0;
  void changeIndex(int val) {
    currentIndex = val;
    emit(changeBottomNavIndexState());
  }
}
