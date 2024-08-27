import 'package:coding_test/core/constants/app_styles.dart';
import 'package:coding_test/features/Feeds/application/feeds_provider.dart';
import 'package:coding_test/features/Feeds/domain/feeds_data_model.dart';
import 'package:coding_test/features/Feeds/presentation/widgets/feed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BusinessFeed extends ConsumerWidget {
  const BusinessFeed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(feedsProvider);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Text(
                  "Feeds",
                  style: myStyle.copyWith(
                      fontSize: 20.sp, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/svg/fil.svg",
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: model.sample.length,
                itemBuilder: (context, index) {
                  FeedsDataModel feeds = model.sample[index];
                  return FeedItem(
                    content: feeds.content,
                    name: feeds.name,
                    time: feeds.time,
                    topicName: feeds.topic,
                    profilepic: feeds.profilePic,
                    picture: feeds.pic,
                  );
                }),
          ],
        ),
      ),
    );
 
  }
}
