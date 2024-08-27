import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatListWidget extends StatelessWidget {
  final String pic, name, time, comment, content;
  const ChatListWidget(
      {super.key,
      required this.pic,
      required this.comment,
      required this.content,
      required this.name,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: lightBlue, borderRadius: BorderRadius.circular(10.r)),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40.w,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image:
                    AssetImage('assets/images/$pic.png'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
          ),
        
          SizedBox(
            width: 14.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: myStyle.copyWith(
                    fontWeight: FontWeight.w700, fontSize: 16.sp),
              ),
              Text(
                content,
                style: myStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: 253.w,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: myStyle.copyWith(
                          fontWeight: FontWeight.w400, fontSize: 12.sp),
                    ),
                    // SizedBox(
                    //   width: 150.w,
                    // ),
                    Spacer(),
                    Text(
                      comment,
                      style: myStyle.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SvgPicture.asset("assets/svg/cht.svg"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
