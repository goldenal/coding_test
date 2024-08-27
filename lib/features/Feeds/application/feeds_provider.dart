import 'package:coding_test/features/Feeds/domain/feeds_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final feedsProvider = ChangeNotifierProvider((ref) => FeedsProvider());

class FeedsProvider extends ChangeNotifier {
  String selectedTopic = "";
  List<FeedsDataModel> sample = [
    FeedsDataModel(
        content:
            "Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.",
        name: "James",
        time: "1 hour ago",
        topic: "Topic name",
        profilePic: "Photo"),
    FeedsDataModel(
        content:
            "Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.",
        name: "James",
        pic: "Photo",
        time: "1 hour ago",
        topic: "Topic name",
        profilePic: "Photo"),
    FeedsDataModel(
        content:
            "Lorem ipsum dolor sit amet consectetur. Sagittis diam auctor convallis justo pellentesque in eu amet sapien. Arcu pellentesque.",
        name: "James",
        pic: "Photo",
        time: "1 hour ago",
        topic: "Topic name",
        profilePic: "Photo"),
  ];

  updateTopic(val) {
    selectedTopic = val;
    notifyListeners();
  }
}
