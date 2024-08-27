import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:coding_test/features/Feeds/presentation/widgets/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedItem extends ConsumerWidget {
  String? picture;
  final String name, time, topicName, content, profilepic;

  FeedItem(
      {super.key,
      required this.content,
      required this.name,
      this.picture,
      required this.time,
      required this.profilepic,
      required this.topicName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
          color: lightBlue, borderRadius: BorderRadius.circular(14.r)),
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                Container(
                  height: 36.w,
                  width: 36.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/$profilepic.png'), // Path to your image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "$name",
                          style: myStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 13.sp),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        SvgPicture.asset("assets/svg/verify.svg"),
                        Text(
                          " . $time",
                          style: myStyle.copyWith(
                              fontWeight: FontWeight.w600, fontSize: 13.sp),
                        ),
                      ],
                    ),
                    //  Icon(Icon)
                    Text(
                      "$topicName",
                      style: myStyle2.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 10.sp),
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      openSheet(context);
                    },
                    child: SvgPicture.asset("assets/svg/3dot.svg")),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              "$content",
              style: myStyle2.copyWith(
                  fontWeight: FontWeight.w500, fontSize: 10.sp),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          if (picture != null)
            Image.asset(
              "assets/images/$picture.png",
              fit: BoxFit.fitWidth,
            ),
          SizedBox(
            height: 12.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/love.svg"),
                SizedBox(
                  width: 16.h,
                ),
                SvgPicture.asset("assets/svg/comment.svg"),
                SizedBox(
                  width: 16.h,
                ),
                SvgPicture.asset("assets/svg/isend.svg"),
                Spacer(),
                if (picture != null) SvgPicture.asset("assets/svg/book.svg"),
              ],
            ),
          ),

          //
        ],
      ),
    );
  }
}
