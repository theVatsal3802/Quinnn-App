import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/user_functions.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/screens/new_post/new_post_screen.dart';
import 'package:lgbtq_social_media/screens/profile/profile_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';
import 'package:lgbtq_social_media/widgets/my_posts.dart';
import 'package:lgbtq_social_media/widgets/post_end_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UserModel> user;

  @override
  void initState() {
    super.initState();
    user = UserFunctions.fetchUserData(
      token:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0MjE3NTFmN2E1MWUyZTczYTFkZjFiNSIsImlhdCI6MTY3OTkxNjQzOCwiZXhwIjoxNjgyNTA4NDM4fQ.jAZ1Wo2b-ySP2CRo39OfVIZ6t0RKy6rkX-jpVbTUMRs",
    );
  }

  @override
  Widget build(BuildContext context) {
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
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProfileScreen.routeName);
              },
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        body: FutureBuilder(
          future: user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyPosts(
                      user: snapshot.data!,
                    ),
                    const PostEndWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
