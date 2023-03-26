import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/post_model.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';
import 'package:lgbtq_social_media/widgets/comments.dart';
import 'package:lgbtq_social_media/widgets/top_list_tile.dart';

class PostScreen extends StatelessWidget {
  static const routeName = "/posts";
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final PostModel post = data[1];
    final UserModel user = data[0];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Post",
          textScaleFactor: 1,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopListTile(user: user),
            if (post.image != null && post.image!.isNotEmpty)
              Image.network(
                post.image!,
                height: 250,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            if (post.image == null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  post.caption,
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            if (post.image != null && post.image!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "${user.username}: ${post.caption}",
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "${post.likes.length} Likes",
                      textScaleFactor: 1,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${post.comments.length} Comments",
                      textScaleFactor: 1,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        "Like now",
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        ParseFunctions.addComment(context);
                      },
                      child: const Text(
                        "Add Comment",
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(),
            ListView.builder(
              itemBuilder: (context, index) {
                return Comment(
                  user: user,
                  post: post,
                  index: index,
                );
              },
              itemCount: post.comments.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
