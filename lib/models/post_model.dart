// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  PostModel copyWith({
    String? id,
    String? caption,
    String? image,
    List<String>? likes,
    List<CommentModel>? comments,
    DateTime? creationDate,
    String? userId,
  }) {
    return PostModel(
      id: id ?? this.id,
      caption: caption ?? this.caption,
      image: image ?? this.image,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      creationDate: creationDate ?? this.creationDate,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'caption': caption,
      'image': image,
      'likes': likes,
      'comments': comments.map((x) => x.toMap()).toList(),
      'creationDate': creationDate.millisecondsSinceEpoch,
      'userId': userId,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      id: map['id'] as String,
      caption: map['caption'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      likes: List<String>.from(
        (map['likes'] as List<String>),
      ),
      comments: List<CommentModel>.from(
        (map['comments'] as List<int>).map<CommentModel>(
          (x) => CommentModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(id: $id, caption: $caption, image: $image, likes: $likes, comments: $comments, creationDate: $creationDate, userId: $userId)';
  }
}
