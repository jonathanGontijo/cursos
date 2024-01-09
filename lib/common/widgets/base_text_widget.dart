import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    double fontSize = 16,
    FontWeight = FontWeight.bold}) {
  return Container(
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight,
        fontSize: fontSize.sp,
      ),
    ),
  );
}
