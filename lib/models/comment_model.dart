import 'package:lgbtq_social_media/models/user_model.dart';

class CommentModel {
  final String id;
  final String comment;
  final String userId;
  final String postId;
  final List<UserModel>? likes;
  final List<UserModel>? dislikes;
  final DateTime creationDate;

  CommentModel({
    required this.id,
    required this.comment,
    required this.userId,
    required this.postId,
    this.likes,
    this.dislikes,
    required this.creationDate,
  });

  static CommentModel dummyComments = CommentModel(
    id: "1",
    comment: "If you truly love nature, you will find beauty everywhere.",
    userId: "1",
    postId: "1",
    creationDate: DateTime.now(),
    likes: [],
    dislikes: [],
  );
}
