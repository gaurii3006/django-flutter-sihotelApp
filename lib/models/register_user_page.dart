class UserModel {
  int? id;
  String? username;
  String? email;
  bool? isActive;
  bool? isAdmin;
  String? firstName;
  String? lastName;
  String? password1;
  String? password2;

  UserModel(this.id, this.username, this.email, this.isActive, this.isAdmin,
      this.firstName, this.lastName, this.password1, this.password2);

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json ['id'];
    username = json['username'];
    email = json['email'];
    isActive = json['is_active'];
    isAdmin = json['is_admin'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    password1 = json['password1'];
    password2 = json['password2'];
  }
}
