import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/post_model.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/widgets/post_card_widget_with_images.dart';
import 'package:lgbtq_social_media/widgets/post_card_widget_without_images.dart';

class MyPosts extends StatefulWidget {
  final UserModel user;
  const MyPosts({required this.user, super.key});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  final posts = PostModel.dummyPosts;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        if (posts[index].image != null) {
          return PostCardWidgetWithImages(
            post: posts[index],
            user: widget.user,
          );
        } else {
          return PostCardWidgetWithoutImages(
            post: posts[index],
            user: widget.user,
          );
        }
      },
      itemCount: posts.length,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
    );
  }
}
