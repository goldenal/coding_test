import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:coding_test/features/Feeds/presentation/screens/business_feed.dart';
import 'package:coding_test/features/Feeds/presentation/screens/public_feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: whiteColor,
              title: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/svg/bell.svg",
                  ),
                  SizedBox(
                    width: 16.w,
                  )
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20.h),
                child: TabBar(
                  indicatorColor: primaryColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  tabs: [
                    Text(
                      "Public Feed",
                      style: myStyle.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "Business Feed",
                      style: myStyle.copyWith(
                          fontSize: 12.sp, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              //   flexibleSpace: Column(
              //    children: [

              // SizedBox(
              //   height: 14.h,
              // ),
              //   ],
              //  ),
            ),
            backgroundColor: whiteColor,
            body: const TabBarView(
              children: [PublicFeed(), BusinessFeed()],
            )),
      ),
    );
  }
}
