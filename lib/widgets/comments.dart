import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/post_model.dart';
import 'package:lgbtq_social_media/models/user_model.dart';

class Comment extends StatelessWidget {
  final UserModel user;
  final PostModel post;
  final int index;

  const Comment({
    super.key,
    required this.user,
    required this.post,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "${user.username}: ${post.comments[index].comment}",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text(
              post.comments[index].likes!.length.toString(),
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            icon: const Icon(Icons.favorite_outline),
          ),
          TextButton.icon(
            onPressed: () {},
            label: Text(
              post.comments[index].dislikes!.length.toString(),
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            icon: const Icon(Icons.heart_broken_outlined),
          ),
        ],
      ),
    );
  }
}
