// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  CommentModel copyWith({
    String? id,
    String? comment,
    String? userId,
    String? postId,
    List<UserModel>? likes,
    List<UserModel>? dislikes,
    DateTime? creationDate,
  }) {
    return CommentModel(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      postId: postId ?? this.postId,
      likes: likes ?? this.likes,
      dislikes: dislikes ?? this.dislikes,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'comment': comment,
      'userId': userId,
      'postId': postId,
      'likes': likes != null ? likes!.map((x) => x.toMap()).toList() : [],
      'dislikes':
          dislikes != null ? dislikes!.map((x) => x.toMap()).toList() : [],
      'creationDate': creationDate.millisecondsSinceEpoch,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as String,
      comment: map['comment'] as String,
      userId: map['userId'] as String,
      postId: map['postId'] as String,
      likes: map['likes'] != null
          ? List<UserModel>.from(
              (map['likes'] as List<int>).map<UserModel?>(
                (x) => UserModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      dislikes: map['dislikes'] != null
          ? List<UserModel>.from(
              (map['dislikes'] as List<int>).map<UserModel?>(
                (x) => UserModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentModel(id: $id, comment: $comment, userId: $userId, postId: $postId, likes: $likes, dislikes: $dislikes, creationDate: $creationDate)';
  }
}
