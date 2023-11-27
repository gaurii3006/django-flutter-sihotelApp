class LoginModel {
  int? id;
  String? token;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  bool? isActive;
  bool? isAdmin;
  String? userAvatar;

  LoginModel(this.id, this.token, this.username, this.firstName, this.lastName,
      this.email, this.isActive, this.isAdmin, this.userAvatar);

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    isActive = json['is_active'];
    isAdmin = json['is_admin'];
    userAvatar = json['avatar'];
  }
}
