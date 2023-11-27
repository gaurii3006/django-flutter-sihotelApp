import '../models/login_user_model.dart';

class LoginUserResponse {
  final LoginModel? loginModel;
  final String message;

  LoginUserResponse({required this.loginModel, required this.message});
  factory LoginUserResponse.fromJson(Map<String, dynamic> json) {
    LoginModel? loginModel;
    return LoginUserResponse(
        loginModel: json['data'] != null
            ? LoginModel.fromJson(json['data'])
            : loginModel,
        message: json['message']);
  }
}
