import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppTextStyle{

  static TextStyle s10Reglur(BuildContext context)=> TextStyle(
    fontSize: 16,
    fontWeight: .w400,
    fontStyle: .normal,
    color: AppColors.secondaryColor,
  );

  static TextStyle s20w600(BuildContext context)=>TextStyle(
    fontWeight: .w600,
    fontSize: 20,
    fontStyle: .normal,
    color: AppColors.amberColor,

  );

  static TextStyle s20bold (BuildContext context)=>TextStyle(
    fontSize: 20,
    fontWeight: .bold,
    color: Colors.black,
    fontStyle: .normal

  );
  static TextStyle s18colorWhite (BuildContext context)=>TextStyle(
      fontSize: 13,
      fontWeight: .w400,
      color: Colors.white,
      fontStyle: .normal

  );
}