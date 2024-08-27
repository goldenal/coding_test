import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomsheetItems extends ConsumerWidget {
  final bool isSelected;
  final String text;
  const BottomsheetItems(
      {super.key, required this.isSelected, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected ? primaryColor : whiteColor),
      child: Row(
        children: [
          SvgPicture.asset("assets/svg/td.svg",
              color: isSelected ? whiteColor : secondaryColor),
          SizedBox(
            width: 15.w,
          ),
          Text(
            "$text",
            style: myStyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: isSelected ? whiteColor : secondaryColor),
          )
        ],
      ),
    );
  }
}
