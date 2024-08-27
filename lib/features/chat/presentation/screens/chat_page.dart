import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:coding_test/features/chat/application/chat_proivider.dart';
import 'package:coding_test/features/chat/domain/chat_model.dart';
import 'package:coding_test/features/chat/presentation/widgets/chart_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(chatProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        forceMaterialTransparency: false,
        backgroundColor: whiteColor,
        centerTitle: true,
        title: Text(
          "Bruno Pham",
          style: myStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            color: blackColor,
          ),
        ),
        actions: [
          const Icon(Icons.settings),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom + 10.h),
                  shrinkWrap: true,
                  itemCount: model.chats.length,
                  itemBuilder: (context, index) {
                    ChatModel cht = model.chats[index];
                    return ChartBubble(
                      day: model.formatDate(DateTime.parse(cht.timestamp)),
                      isSender: cht.isSender,
                      message: cht.message,
                      time: model.formatTime(DateTime.parse(cht.timestamp)),
                      profilePic: cht.profilePic,
                      showDay: model.showtimestamp(index),
                      photo: cht.photo,
                    );
                  }),
            ),
            Row(
              children: [
                SvgPicture.asset("assets/svg/gallery2.svg"),
                SizedBox(
                  width: 14.w,
                ),
                SizedBox(
                  width: 267.w,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type Something",
                        hintStyle: myStyle.copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const Icon(
                  Icons.send,
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
