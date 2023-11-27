class LoginUserParam {
  final String? username;
  final String? password;

  LoginUserParam(this.username, this.password);

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
