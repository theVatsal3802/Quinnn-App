import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/functions/common_functions.dart';
import 'package:lgbtq_social_media/models/post_model.dart';
import 'package:lgbtq_social_media/models/user_model.dart';
import 'package:lgbtq_social_media/screens/dashboard/post_screen.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';
import 'package:lgbtq_social_media/widgets/action_button.dart';
import 'package:lgbtq_social_media/widgets/top_list_tile.dart';

class PostCardWidgetWithImages extends StatefulWidget {
  final PostModel post;
  final UserModel user;
  const PostCardWidgetWithImages({
    required this.post,
    required this.user,
    super.key,
  });

  @override
  State<PostCardWidgetWithImages> createState() =>
      _PostCardWidgetWithImagesState();
}

class _PostCardWidgetWithImagesState extends State<PostCardWidgetWithImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      color: ColorManager.baseWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopListTile(
            user: widget.user,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                PostScreen.routeName,
                arguments: [
                  widget.user,
                  widget.post,
                ],
              );
            },
            child: Image.network(
              widget.post.image!,
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ActionButton(
                onPressed: () {},
                iconData: Icons.thumb_up_alt_outlined,
                text: widget.post.likes.length.toString(),
              ),
              ActionButton(
                onPressed: () {
                  ParseFunctions.addComment(context);
                },
                iconData: Icons.comment,
                text: widget.post.comments.length.toString(),
              ),
              IconButton(
                onPressed: () {
                  CommonFunctions.sharePost(
                    title: "New post from ${widget.user.name}",
                    text: widget.post.caption,
                    chooserTitle:
                        "Select and app to share ${widget.user.name}'s new post",
                  );
                },
                icon: const Icon(Icons.share),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              "${widget.user.username}: ${widget.post.caption}",
              textScaleFactor: 1,
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Text(
              ParseFunctions.getDateFromDateTime(
                date: widget.post.creationDate,
                isTimeNeeded: true,
              ),
              textScaleFactor: 1,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorManager.baseDarkGreyColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
