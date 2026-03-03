import 'package:eduzone/core/constants/app_colors.dart';
import 'package:eduzone/features/layout/presentaion/cubit/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/layout_cubit/layout_cubit.dart';

class LayoutBottomNavBarScreen extends StatelessWidget {
  const LayoutBottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: context
                .read<LayoutCubit>()
                .screens[context.read<LayoutCubit>().currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: BorderRadiusGeometry.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              child: BottomNavigationBar(
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color.fromARGB(255, 202, 199, 199),
                selectedIconTheme: IconThemeData(size: 28),
                unselectedIconTheme: IconThemeData(size: 24),
                selectedLabelStyle: TextStyle(fontWeight: .w600, fontSize: 20),
                unselectedLabelStyle: TextStyle(fontWeight: .w500, fontSize: 15),
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primaryColor,
                currentIndex: context.read<LayoutCubit>().currentIndex,
              
                onTap: (int index) {
                  context.read<LayoutCubit>().changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_outlined),
                    label: "myCourses",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "profile",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
