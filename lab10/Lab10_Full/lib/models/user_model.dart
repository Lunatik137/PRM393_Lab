class UserModel {
  final String id;
  final String username;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? image;
  final String? token;
  final bool isFirebase;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    this.firstName,
    this.lastName,
    this.image,
    this.token,
    this.isFirebase = false,
  });

  factory UserModel.fromDummyJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      image: json['image'],
      token: json['token'],
      isFirebase: false,
    );
  }

  factory UserModel.fromFirebase(dynamic user) {
    return UserModel(
      id: user.uid,
      username: user.displayName ?? user.email ?? 'firebase_user',
      email: user.email ?? '',
      firstName: user.displayName,
      image: user.photoURL,
      isFirebase: true,
    );
  }
}
