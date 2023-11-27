class RegisterUserParam {
  final String? username;
  final String? email;
  final bool? isActive;
  final bool? isAdmin;
  final String? firstName;
  final String? lastName;
  final String? password1;
  final String? password2;

  RegisterUserParam(this.username, this.email, this.isActive, this.isAdmin,
      this.firstName, this.lastName, this.password1, this.password2);

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'is_active': isActive,
      'is_admin': isAdmin,
      'first_name': firstName,
      'last_name': lastName,
      'password1': password1,
      'password2': password2
    };
  }
}
