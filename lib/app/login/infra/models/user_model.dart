class User {
  final String user;
  final String password;

  User({required this.user, required this.password});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      user: map['user'],
      password: map['password'],
    );
  }
}
