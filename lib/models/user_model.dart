// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  String id;
  String name;
  String username;
  String email;
  bool? isEmailVerified;
  String password;
  String gender;
  String? country;
  DateTime? dob;
  String? bio;
  String? profileImageUrl;
  String? coverImageUrl;
  DateTime creationDate;
  List<String>? followers;
  List<String>? following;
  List<String>? posts;
  bool isPrivate;

  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    this.isEmailVerified,
    required this.password,
    required this.gender,
    this.country,
    this.dob,
    this.bio,
    this.profileImageUrl,
    this.coverImageUrl,
    required this.creationDate,
    this.followers,
    this.following,
    this.posts,
    required this.isPrivate,
  });

  static UserModel dummyUser = UserModel(
    id: "1",
    name: "Vatsal Adhiya",
    username: "theVatsal3802",
    email: "vatsaladhiya248@gmail.com",
    password: "1234567890",
    gender: "Male",
    creationDate: DateTime.now(),
    bio: "Adventurer, traveler, dreamer",
    country: "India",
    followers: [],
    following: [],
    dob: DateTime(2002, 8, 3),
    posts: [],
    isEmailVerified: true,
    profileImageUrl:
        "https://avatars.githubusercontent.com/u/77258481?s=400&u=2e42808a9123a50db0ebd5f9a8bfa5cb8756087c&v=4",
    coverImageUrl:
        "https://images.pexels.com/photos/3782463/pexels-photo-3782463.jpeg?auto=compress&cs=tinysrgb&w=1600",
    isPrivate: false,
  );

  static UserModel newUser = UserModel(
    id: "",
    name: "",
    username: "",
    email: "",
    password: "",
    gender: "",
    creationDate: DateTime.now(),
    bio: "",
    country: "",
    followers: [],
    following: [],
    dob: null,
    posts: [],
    isEmailVerified: false,
    profileImageUrl: "",
    coverImageUrl: "",
    isPrivate: false,
  );

  UserModel copyWith({
    String? id,
    String? name,
    String? username,
    String? email,
    bool? isEmailVerified,
    String? password,
    String? gender,
    String? country,
    DateTime? dob,
    String? bio,
    String? profileImageUrl,
    String? coverImageUrl,
    DateTime? creationDate,
    List<String>? followers,
    List<String>? following,
    List<String>? posts,
    bool? isPrivate,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      password: password ?? this.password,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      dob: dob ?? this.dob,
      bio: bio ?? this.bio,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      creationDate: creationDate ?? this.creationDate,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      posts: posts ?? this.posts,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'password': password,
      'gender': gender,
      'country': country,
      'dob': dob?.millisecondsSinceEpoch,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
      'coverImageUrl': coverImageUrl,
      'creationDate': creationDate.millisecondsSinceEpoch,
      'followers': followers,
      'following': following,
      'posts': posts,
      'isPrivate': isPrivate,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      isEmailVerified: map['isEmailVerified'] != null
          ? map['isEmailVerified'] as bool
          : null,
      password: map['password'] as String,
      gender: map['gender'] as String,
      country: map['country'] != null ? map['country'] as String : null,
      dob: map['dob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dob'] as int)
          : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      profileImageUrl: map['profileImageUrl'] != null
          ? map['profileImageUrl'] as String
          : null,
      coverImageUrl:
          map['coverImageUrl'] != null ? map['coverImageUrl'] as String : null,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
      followers: map['followers'] != null
          ? List<String>.from(
              (map['followers'] as List<String>),
            )
          : null,
      following: map['following'] != null
          ? List<String>.from(
              (map['following'] as List<String>),
            )
          : null,
      posts: map['posts'] != null
          ? List<String>.from(
              (map['posts'] as List<String>),
            )
          : null,
      isPrivate: map['isPrivate'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, username: $username, email: $email, isEmailVerified: $isEmailVerified, password: $password, gender: $gender, country: $country, dob: $dob, bio: $bio, profileImageUrl: $profileImageUrl, coverImageUrl: $coverImageUrl, creationDate: $creationDate, followers: $followers, following: $following, posts: $posts, isPrivate: $isPrivate)';
  }
}
