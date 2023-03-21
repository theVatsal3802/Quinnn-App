class UserModel {
  final String name;
  final String username;
  final String email;
  bool? isEmailVerified;
  final String password;
  final String gender;
  final String? country;
  final DateTime? dob;
  final String? bio;
  final String? profileImageUrl;
  final String? coverImageUrl;
  final DateTime creationDate;
  final List<String>? followers;
  final List<String>? following;
  final List<String>? posts;
  final bool isPrivate;

  UserModel({
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
    isPrivate: false,
  );
}

enum Gender {
  lesbian,
  gay,
  transgender,
  bisexual,
  queer,
}
