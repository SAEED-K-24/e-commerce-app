class User {
  int? id;
  String? email, username;

  User.fromJson(Map<dynamic, dynamic> map) {
    id = map['id'];
    email = map['email'];
    username = map['username'];

  }
}
