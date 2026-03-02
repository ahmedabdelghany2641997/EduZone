import 'package:flutter/material.dart';

import '../../../../../core/theme/text_style.dart';

class CustomText extends StatelessWidget {
  final String text;

  const CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppTextStyle.s20bold(context),);


  }
}
