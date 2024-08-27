import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

final createPostProvider =
    ChangeNotifierProvider.autoDispose((ref) => CreatePostProvider());

class CreatePostProvider extends ChangeNotifier {
  String selectedCategory = "Public";
  String selectedtopic = "conscious Art";
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  final FocusNode focusNode = FocusNode();
  bool isKeyboardVisible = false;

  CreatePostProvider() {
    focusNode.addListener(() {
      isKeyboardVisible = focusNode.hasFocus;
      log("$isKeyboardVisible");
      notifyListeners();
    });
  }

  Future<void> selectImage(ImageSource source) async {
    log("hello");
    if (await Permission.camera.request().isGranted) {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        image = pickedFile;
        notifyListeners();
      }
    } else {
      log("no");
      // Permissions denied, handle the case accordingly
    }
  }

  removeImage() {
    image = null;
    notifyListeners();
  }

  changeCategory(val) {
    selectedCategory = val;
    notifyListeners();
  }

  changeTopic(val) {
    selectedtopic = val;
    notifyListeners();
  }
}
