part of 'login_user_bloc.dart';

@immutable
abstract class LoginUserEvent {}

class LoginVisitorsEvent extends LoginUserEvent {
  final String? username;
  final String? password;

  LoginVisitorsEvent({required this.username, required this.password});
}
