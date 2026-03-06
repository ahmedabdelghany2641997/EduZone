import 'package:eduzone/core/routing/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../theme/text_style.dart';
import 'custom_text_form_field.dart';

class AppbarHomescreen extends StatelessWidget {
  const AppbarHomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.layoutBottomNavBarScreen);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          AppStrings.subscribed,
          style: AppTextStyle.screenTitle,
        ),
        centerTitle: true,
      ),
    );
  }
}
