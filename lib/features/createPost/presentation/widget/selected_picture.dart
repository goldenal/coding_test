import 'dart:io';

import 'package:coding_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectedPicture extends StatelessWidget {
  final File image;
  final Function tap;
  const SelectedPicture({
    super.key,
    required this.image,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 114.h,
      width: 123.w,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: FileImage(image), // Path to your image
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12.r)),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                tap();
              },
              child: const Icon(
                Icons.cancel,
                color: blackColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
