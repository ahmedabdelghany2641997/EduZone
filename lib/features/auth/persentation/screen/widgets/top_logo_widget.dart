import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/theme/text_style.dart';

class TopLogoWidget extends StatelessWidget {
  final String text;

  const TopLogoWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(80)),
      ),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text("EduZone", style: AppTextStyle.s20w600(context)),
          SizedBox(height: 25),
          Text(text, style: AppTextStyle.s10Reglur(context)),
        ],
      ),
    );
  }
}
