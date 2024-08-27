import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartBubble extends StatelessWidget {
  final String profilePic, day, time;
  final String? message;
  final bool showDay, isSender;
  String? photo;
  ChartBubble(
      {super.key,
      this.message,
      required this.showDay,
      required this.isSender,
      this.photo,
      required this.profilePic,
      required this.day,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showDay)
          Container(
            margin: EdgeInsets.only(top: 5.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Text(
              day,
              style: myStyle.copyWith(
                  color: whiteColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isSender)
              Container(
                height: 40.w,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/$profilePic.png'), // Path to your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (!isSender)
              SizedBox(
                width: 10.w,
              ),
            photo != null
                ? SmallCont(
                    profilePic: profilePic,
                    time: time,
                    message: message,
                    photo: photo,
                  )
                : Expanded(
                    child: SmallCont(
                    profilePic: profilePic,
                    time: time,
                    message: message,
                    photo: photo,
                  )),
            if (isSender)
              SizedBox(
                width: 10.w,
              ),
            if (isSender)
              Container(
                height: 40.w,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/$profilePic.png'), // Path to your image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(
          height: 6.h,
        )
      ],
    );
  }
}

class SmallCont extends StatelessWidget {
  final String profilePic, time;
  final String? message;
  String? photo;
  SmallCont(
      {super.key,
      this.message,
      this.photo,
      required this.profilePic,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: lightBlue, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          photo != null
              ? Image.asset(
                  "assets/images/$photo.png",
                  height: 164.h,
                  width: 198.w,
                  fit: BoxFit.fill,
                )
              : Text(
                  message ?? "",
                  style: myStyle.copyWith(
                      color: blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                time,
                style: myStyle.copyWith(
                    color: blackColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}
