import 'package:lgbtq_social_media/models/user_model.dart';

class CommentModel {
  final String id;
  final String comment;
  final UserModel user;
  final List<UserModel>? likes;
  final List<UserModel>? dislikes;
  final DateTime creationDate;

  CommentModel({
    required this.id,
    required this.comment,
    required this.user,
    this.likes,
    this.dislikes,
    required this.creationDate,
  });

  static CommentModel dummyComments = CommentModel(
    id: "1",
    comment: "If you truly love nature, you will find beauty everywhere.",
    user: UserModel.dummyUser,
    creationDate: DateTime.now(),
  );
}
