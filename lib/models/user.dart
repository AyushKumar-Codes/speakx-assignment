// models/user.dart
class User {
  final int id;
  final String title;

  User({required this.id, required this.title});

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      title: map['title'],
    );
  }
}
