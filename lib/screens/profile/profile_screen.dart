import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/common_functions.dart';
import 'package:lgbtq_social_media/models/post_model.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/screens/auth/profile_setup_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/widgets/post_card_widget_with_images.dart';
import 'package:lgbtq_social_media/widgets/post_card_widget_without_images.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = UserModel.dummyUser;
    final List<PostModel> posts = PostModel.dummyPosts;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.username,
          textScaleFactor: 1,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfileSetupScreen(
                      isUpdate: true,
                    );
                  },
                ),
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              CommonFunctions.shareProfile(
                title: user.username,
                text:
                    "Check out ${user.name}'s profile on ${AssetManager.appName}",
                chooserTitle:
                    "Select and app to share ${user.name}'s ${AssetManager.appName} profile",
              );
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                      user.coverImageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 100,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(user.profileImageUrl!),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                top: 10,
              ),
              child: Text(
                user.username,
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                user.name,
                textScaleFactor: 1,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorManager.baseDarkGreyColor,
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            if (user.bio != null)
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  user.bio ?? "",
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.bodyMedium,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            if (user.bio != null)
              const SizedBox(
                height: 10,
              ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Follow",
                  textScaleFactor: 1,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildColumn(
                      context: context,
                      title: "Posts",
                      number: user.posts!.length.toString(),
                      onTap: () {},
                    ),
                    const VerticalDivider(
                      width: 2,
                      color: ColorManager.baseBlackColor,
                    ),
                    buildColumn(
                      context: context,
                      title: "Followers",
                      number: user.followers!.length.toString(),
                      onTap: () {},
                    ),
                    const VerticalDivider(
                      width: 2,
                      color: ColorManager.baseBlackColor,
                    ),
                    buildColumn(
                      context: context,
                      title: "Following",
                      number: user.following!.length.toString(),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            if (posts.isNotEmpty)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (posts[index].image != null) {
                    return PostCardWidgetWithImages(
                      post: posts[index],
                      user: user,
                    );
                  } else {
                    return PostCardWidgetWithoutImages(
                      post: posts[index],
                      user: user,
                    );
                  }
                },
                itemCount: posts.isNotEmpty ? posts.length : 0,
                shrinkWrap: true,
              ),
            if (posts.isEmpty)
              Center(
                child: Text(
                  "No Posts Yet",
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

Widget buildColumn({
  required BuildContext context,
  required String title,
  required String number,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          number,
          textScaleFactor: 1,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          title,
          textScaleFactor: 1,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ),
  );
}
