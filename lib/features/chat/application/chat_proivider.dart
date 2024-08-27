import 'package:coding_test/features/chat/domain/chat_list_model.dart';
import 'package:coding_test/features/chat/domain/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatProvider = ChangeNotifierProvider((ref) => ChatProvider());

class ChatProvider extends ChangeNotifier {
  List<ChatListModel> sampleChat = [
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
    ChatListModel(
        comment: "5",
        content: "Hello, I really like your post about...",
        name: "Bruno Pham",
        pic: "Photo",
        time: "2 mins ago"),
  ];
//
// 2024-08-26 21:02:12
//
// 2024-08-26 12:30:59
// 2024-08-25 00:11:30
  List<ChatModel> chats = [
    ChatModel(
        isSender: false,
        message:
            "Lorem ipsum dolor sit amet consectetur. Libero cursus justo proin neque massa quis tempus duis. Ipsum lobortis aliquam urna egestas at. Sed iaculis quisque faucibus feugiat libero integer in. At eleifend consequat.",
        profilePic: "Photo",
        timestamp: "2024-08-26 14:08:15"),
    ChatModel(
        isSender: false,
        message:
            "Lorem ipsum dolor sit amet consectetur. Libero cursus justo proin neque massa quis tempus duis. Ipsum lobortis aliquam urna egestas at. Sed iaculis quisque faucibus feugiat libero integer in. At eleifend consequat.",
        profilePic: "Photo",
        timestamp: "2024-08-27 06:56:23"),
    ChatModel(
        isSender: false,
        photo: "Photo",
        profilePic: "Photo",
        timestamp: "2024-08-27 06:56:23"),
    ChatModel(
        isSender: true,
        message:
            "Lorem ipsum dolor sit amet consectetur. Libero cursus justo proin neque massa quis tempus duis. Ipsum lobortis aliquam urna egestas at. Sed iaculis quisque faucibus feugiat libero integer in. At eleifend consequat.",
        profilePic: "Photo",
        timestamp: "2024-08-27 06:56:23"),
    ChatModel(
        isSender: true,
        message:
            "Lorem ipsum dolor sit amet consectetur. Libero cursus justo proin neque massa quis tempus duis. Ipsum lobortis aliquam urna egestas at. Sed iaculis quisque faucibus feugiat libero integer in. At eleifend consequat.",
        profilePic: "Photo",
        timestamp: "2024-08-27 06:56:23"),
  ];

  bool showtimestamp(int index) {
    final ChatModel currentChat = chats[index];
    final DateTime currentTimestamp = DateTime.parse(currentChat.timestamp);

    // Determine if we need to show a date header
    bool showDateHeader = false;
    if (index == 0) {
      showDateHeader = true;
    } else {
      final DateTime previousTimestamp =
          DateTime.parse(chats[index - 1].timestamp);
      if (!_isSameDay(currentTimestamp, previousTimestamp)) {
        showDateHeader = true;
      }
    }
    return showDateHeader;
  }

  String formatDate(DateTime date) {
    final DateTime now = DateTime.now();
    final bool isToday = _isSameDay(now, date);
    final bool isYesterday = _isSameDay(now.subtract(Duration(days: 1)), date);

    if (isToday) {
      return "Today";
    } else if (isYesterday) {
      return "Yesterday";
    } else {
      return "${date.day}/${date.month}/${date.year}";
    }
  }

  String formatTime(DateTime date) {
    return "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
