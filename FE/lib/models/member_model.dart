class MemberModel {
  int id;
  String username;
  String password;
  String email;

  MemberModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
    };
  }

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      id: map['id'],
      username: map['username'],
      password: map['password'],
      email: map['email'],
    );
  }
}
