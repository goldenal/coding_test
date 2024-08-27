import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Chips extends StatelessWidget {
  final double? radius, padding;
  final String text;
  final bool isSelected;
  const Chips(
      {super.key,
      required this.radius,
       this.padding,
      required this.text,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? primaryColor : whiteColor,
          borderRadius: BorderRadius.circular(radius!.r),
          border: Border.all(
              color: isSelected ? Colors.transparent : secondaryColor)),
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: padding??12.w),
      //  width: width,
      child: Center(
        child: Text(
          text,
          style: myStyle.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: isSelected ? whiteColor : secondaryColor),
        ),
      ),
    );
  }
}
