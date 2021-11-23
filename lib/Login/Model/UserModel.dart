class userModel {
  String? name;
  String? lastname;
  String? email;
  String? password;

  userModel({
    this.name,
    this.lastname,
    this.email,
    this.password,
  });

  factory userModel.fromMap(map) {
    return userModel(
        name: map['name'],
        lastname: map['lastname'],
        email: map['email'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password
    };
  }
}
