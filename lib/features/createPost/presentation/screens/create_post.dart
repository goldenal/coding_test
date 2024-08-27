import 'dart:io';

import 'package:coding_test/core/constants/app_colors.dart';
import 'package:coding_test/core/constants/app_styles.dart';
import 'package:coding_test/features/createPost/application/create_post_provider.dart';
import 'package:coding_test/features/createPost/presentation/widget/chips.dart';
import 'package:coding_test/features/createPost/presentation/widget/selected_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends ConsumerStatefulWidget {
  const CreatePost({super.key});

  @override
  ConsumerState<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends ConsumerState<CreatePost> {
  final FocusNode _focusNode = FocusNode();
  bool isKeyboardOpen = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isKeyboardOpen = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.watch(createPostProvider);
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: blackColor,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "Create Post",
                    style: myStyle.copyWith(
                        fontWeight: FontWeight.w700, fontSize: 16.sp),
                  ),
                  const Spacer(),
                  Chips(
                    isSelected: true,
                    radius: 5.r,
                    text: "Post",
                    padding: 20.w,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 19.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      model.changeCategory("Public");
                    },
                    child: Chips(
                      isSelected: model.selectedCategory == "Public",
                      radius: 100.r,
                      text: "Public",
                      padding: 53.w,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        model.changeCategory("Business");
                      },
                      child: Chips(
                        isSelected: model.selectedCategory == "Business",
                        radius: 100.r,
                        text: "Business",
                        padding: 53.w,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TextFormField(
                focusNode: _focusNode,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: "Type something",
                    hintStyle: myStyle.copyWith(),
                    border: InputBorder.none),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "Topic",
                style: myStyle.copyWith(
                    fontWeight: FontWeight.w400, fontSize: 14.sp),
              ),
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              height: 30.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 16.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      model.changeTopic("climate change & sustainability");
                    },
                    child: Chips(
                      isSelected: model.selectedtopic ==
                          "climate change & sustainability",
                      radius: 100.r,
                      text: "climate change & sustainability",
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        model.changeTopic("Conscious Art");
                      },
                      child: Chips(
                        isSelected: model.selectedtopic == "Conscious Art",
                        radius: 100.r,
                        text: "Conscious Art",
                      )),
                  SizedBox(
                    width: 8.w,
                  ),
                  GestureDetector(
                      onTap: () {
                        model.changeTopic("Conscious");
                      },
                      child: Chips(
                        isSelected: model.selectedtopic == "Conscious",
                        radius: 100.r,
                        text: "Conscious",
                      )),
                  SizedBox(
                    width: 8.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 23.h,
            ),
            model.image == null
                ? Row(
                    children: [
                      SizedBox(
                        width: 16.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            model.selectImage(ImageSource.camera);
                          },
                          child: SvgPicture.asset("assets/svg/camera.svg")),
                      SizedBox(
                        width: 16.w,
                      ),
                      GestureDetector(
                          onTap: () {
                            model.selectImage(ImageSource.gallery);
                          },
                          child: SvgPicture.asset("assets/svg/gallery.svg"))
                    ],
                  )
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: SelectedPicture(
                        image: File(model.image!.path),
                        tap: () {
                          model.removeImage();
                        },
                      ),
                    ),
                  ),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
