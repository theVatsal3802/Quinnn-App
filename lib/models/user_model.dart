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
}
