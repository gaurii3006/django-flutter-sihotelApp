part of 'register_user_bloc.dart';

@immutable
abstract class RegisterUserState {}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {}

class RegisterUserSuccess extends RegisterUserState {
  final RegisterUserResponse registerUserResponse;
  RegisterUserSuccess({required this.registerUserResponse});
}

class RegisterUserError extends RegisterUserState {
  final String message;
  RegisterUserError({required this.message});
}
