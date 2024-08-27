import 'package:coding_test/features/Feeds/presentation/screens/home.dart';
import 'package:coding_test/features/chat/presentation/screens/chat_list.dart';
import 'package:coding_test/features/createPost/presentation/screens/create_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavProvider =
    ChangeNotifierProvider.autoDispose((ref) => BottomNavProvider());

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> body = const [Home(), Home(), Home(), ChatList(), Home()];
  // late ChangeNotifierProviderRef<dynamic> ref;

  // BottomNavProvider(reff) {
  //   ref = reff;
  // }

  setIndex(int value, context) {
    if (value == 2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const CreatePost()));
    } else {
      currentIndex = value;
      notifyListeners();
    }
  }
}
