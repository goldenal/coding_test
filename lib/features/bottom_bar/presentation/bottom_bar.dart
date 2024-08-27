import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/features/bottom_bar/application/bottm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(bottomNavProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          onTap: (val) {
            model.setIndex(val, context);
          },
          backgroundColor: whiteColor,
          currentIndex: model.currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 12.sp, color: primaryColor),
          unselectedLabelStyle:
              TextStyle(fontSize: 12.sp, color: secondaryColor),
          unselectedItemColor: secondaryColor,
          selectedItemColor: primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/svg/home.svg",
                color: model.currentIndex == 0 ? primaryColor : secondaryColor,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/search.svg",
                    color: model.currentIndex == 1
                        ? primaryColor
                        : secondaryColor),
                label: 'Search'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/svg/create.svg",
                  color:
                      model.currentIndex == 2 ? primaryColor : secondaryColor),
              label: 'Create',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/chat.svg",
                    color: model.currentIndex == 3
                        ? primaryColor
                        : secondaryColor),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/svg/profile.svg",
                    color: model.currentIndex == 4
                        ? primaryColor
                        : secondaryColor),
                label: 'Profile'),
          ]),
      body: model.body[model.currentIndex],
    );
  }
}
