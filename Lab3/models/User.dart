class User {
  String name;
  String email;

  User(this.name, this.email);

  // Create User object from JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['name'],
      json['email'],
    );
  }

  @override
  String toString() {
    return 'User{name: $name, email: $email}';
  }
}