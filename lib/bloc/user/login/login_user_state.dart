part of 'login_user_bloc.dart';



@immutable
abstract class LoginUserState {}

class LoginUserInitial extends LoginUserState {}

class LoginUserLoading extends LoginUserState {}

class LoginUserSuccess extends LoginUserState {
  final LoginUserResponse loginUserResponse;
  LoginUserSuccess({required this.loginUserResponse});
}

class LoginUserError extends LoginUserState {
  final String message;
  LoginUserError({required this.message});
}
