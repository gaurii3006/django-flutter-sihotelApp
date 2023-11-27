import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../core/api_client.dart';
import '../params/login_user_param.dart';
import '../params/register_user_param.dart';
import '../response/login_user_response.dart';
import '../response/register_user_response.dart';

class AuthRepository extends ApiClient {
  Future<RegisterUserResponse> registerUserVisitors(
      RegisterUserParam params) async {
    try {
      final response = await dio.post('v1/register', data: params.toJson());
      debugPrint('Register Visitors: ${response.data}');
      // return RegisterUserResponse(
      //     userModel: response.data['data'], message: response.data['message']);
      return RegisterUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<LoginUserResponse> loginUserVisitors(
      LoginUserParam params) async {
    try {
      final response = await dio.post('v1/login', data: params.toJson());
      debugPrint('Login Visitors: ${response.data}');
      return LoginUserResponse.fromJson(response.data);
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
