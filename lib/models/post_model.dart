import 'package:lgbtq_social_media/models/comment_model.dart';

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
      caption: "If you truly love nature, you will find beauty everywhere.",
      creationDate: DateTime.now(),
      image:
          "https://images.pexels.com/photos/3244513/pexels-photo-3244513.jpeg?auto=compress&cs=tinysrgb&w=1600",
      likes: [],
      comments: [],
      userId: "1",
    ),
    PostModel(
      id: "5",
      caption: "If you truly love nature, you will find beauty everywhere.",
      creationDate: DateTime.now(),
      likes: [],
      comments: [],
      userId: "1",
    ),
  ];
}
