import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/screens/new_post/new_post_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';
import 'package:lgbtq_social_media/widgets/my_posts.dart';
import 'package:lgbtq_social_media/widgets/post_end_widget.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel.dummyUser;
    return SafeArea(
      child: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: ColorManager.baseWhiteShadeColor,
          title: const Text(
            AssetManager.appName,
            textScaleFactor: 1,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(NewPostScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyPosts(
                  user: user,
                ),
                const PostEndWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
