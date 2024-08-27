import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:coding_test/features/chat/application/chat_proivider.dart';
import 'package:coding_test/features/chat/domain/chat_list_model.dart';
import 'package:coding_test/features/chat/presentation/screens/chat_page.dart';
import 'package:coding_test/features/chat/presentation/widgets/chat_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatList extends ConsumerWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.watch(chatProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        title: Text(
          "Message",
          style: myStyle.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            color: blackColor,
          ),
        ),
        actions: [
          const Icon(
            Icons.add_circle_outline,
            color: blackColor,
          ),
          SizedBox(
            width: 16.w,
          )
        ],
      ),
      body: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 33.h),
          child: 
          ListView.builder(
              shrinkWrap: true,
              itemCount: model.sampleChat.length,
              itemBuilder: (context, index) {
                ChatListModel cht = model.sampleChat[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatPage()));
                  },
                  child: ChatListWidget(
                    comment: cht.comment,
                    content: cht.content,
                    name: cht.name,
                    time: cht.time,
                    pic: "Photo",
                  ),
                );
              })
              ),
   
    );
  }
}
