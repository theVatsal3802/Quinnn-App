import 'package:lgbtq_social_media/models/comment_model.dart';
import 'package:lgbtq_social_media/models/user_model.dart';

class PostModel {
  final String id;
  final String caption;
  final String? image;
  final List<String> likes;
  final List<CommentModel> comments;
  final DateTime creationDate;
  final String userId;

  PostModel({
    required this.id,
    required this.caption,
    this.image,
    required this.comments,
    required this.likes,
    required this.creationDate,
    required this.userId,
  });

  static List<PostModel> dummyPosts = [
    PostModel(
      id: "1",
      caption:
          "Quinnn is a platform designed to connect and empower individuals in the LGBTQ+ community. Our app features a dashboard where users can post their thoughts, ideas, and experiences. Additionally, we have a profile page for users to create and personalize their profiles, and a blog section for users to share and read articles on various topics related to the LGBTQ+ community (In next version). \n\nFurthermore, we included a resource section where users can find information on local support groups, advocacy organizations, and other helpful resources. We have also featured an events section where users can discover and participate in LGBTQ+ events in their area or virtually.",
      creationDate: DateTime.now(),
      image:
          "https://firebasestorage.googleapis.com/v0/b/lgbtq-social-media.appspot.com/o/images%2Flfvj69lekgxpz0?alt=media&token=600a89af-0075-48b2-a211-70392d9b4210",
      likes: [
        "1",
        "2",
        "3",
        "4",
      ],
      comments: [
        CommentModel(
          id: "1",
          comment: "Great",
          userId: "1",
          postId: "1",
          likes: [],
          dislikes: [],
          creationDate: DateTime.now(),
        ),
        CommentModel(
          id: "1",
          comment: "I have always wanted to go to such a beautiful place",
          userId: "1",
          likes: [
            UserModel.dummyUser,
            UserModel.dummyUser,
          ],
          dislikes: [UserModel.newUser],
          postId: "1",
          creationDate: DateTime.now(),
        ),
      ],
      userId: "1",
    ),
    PostModel(
      id: "1",
      caption: "If you truly love nature, you will find beauty everywhere.",
      creationDate: DateTime.now(),
      image:
          "https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&w=1600",
      likes: [
        "1",
        "2",
        "3",
        "4",
      ],
      comments: [
        CommentModel(
          id: "1",
          comment: "Great",
          userId: "1",
          postId: "1",
          likes: [],
          dislikes: [],
          creationDate: DateTime.now(),
        ),
        CommentModel(
          id: "1",
          comment: "I have always wanted to go to such a beautiful place",
          userId: "1",
          likes: [
            UserModel.dummyUser,
            UserModel.dummyUser,
          ],
          dislikes: [UserModel.newUser],
          postId: "1",
          creationDate: DateTime.now(),
        ),
      ],
      userId: "1",
    ),
    PostModel(
      id: "5",
      caption: "If you truly love nature, you will find beauty everywhere.",
      creationDate: DateTime.now(),
      likes: [
        "1",
        "2",
        "3",
      ],
      comments: [
        CommentModel(
          id: "2",
          comment: "Wowwww",
          userId: "1",
          postId: "1",
          creationDate: DateTime.now(),
          dislikes: [],
          likes: [],
        ),
      ],
      userId: "1",
    ),
  ];
}
