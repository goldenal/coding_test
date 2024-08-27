import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/features/Feeds/application/feeds_provider.dart';
import 'package:coding_test/features/Feeds/presentation/widgets/bottomsheet_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

openSheet(BuildContext context) {
  showModalBottomSheet<void>(
      backgroundColor: whiteColor,
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            snap: true,
            builder: (_, controller) {
              return Bottomsheet(
                controller: controller,
              );
            });
      });
}

class Bottomsheet extends ConsumerWidget {
  final ScrollController controller;
  const Bottomsheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(feedsProvider);
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 11.h),
            width: 72.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: const Color(0xff3F3F3F),
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
          SizedBox(
            height: 37.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    model.updateTopic("Topic 1");
                  },
                  child: BottomsheetItems(
                      isSelected: model.selectedTopic == "Topic 1",
                      text: "Topic 1"),
                ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                    onTap: () {
                      model.updateTopic("Topic 2");
                    },
                    child: BottomsheetItems(
                        isSelected: model.selectedTopic == "Topic 2",
                        text: "Topic 2")),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                    onTap: () {
                      model.updateTopic("Topic 3");
                    },
                    child: BottomsheetItems(
                        isSelected: model.selectedTopic == "Topic 3",
                        text: "Topic 3")),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                    onTap: () {
                      model.updateTopic("Topic 4");
                    },
                    child: BottomsheetItems(
                        isSelected: model.selectedTopic == "Topic 4",
                        text: "Topic 4")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
