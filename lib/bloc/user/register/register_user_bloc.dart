import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project_sihotel/repo/auth_repository.dart';
import 'package:project_sihotel/response/register_user_response.dart';
import 'package:meta/meta.dart';

import '../../../params/register_user_param.dart';

part 'register_user_event.dart';
part 'register_user_state.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  final authRepository = AuthRepository();
  RegisterUserBloc() : super(RegisterUserInitial()) {
    on<CreateAuthorsEvent>(_register);
  }

  Future<void> _register(
      CreateAuthorsEvent event, Emitter<RegisterUserState> emit) async {
    final params = RegisterUserParam(
        event.username,
        event.email,
        event.isActive,
        event.isAdmin,
        event.firstName,
        event.lastName,
        event.password1,
        event.password2);
    emit(RegisterUserLoading());
    try {
      RegisterUserResponse response =
          await authRepository.registerUserVisitors(params);
      emit(RegisterUserSuccess(registerUserResponse: response));
    } catch (e) {
      emit(RegisterUserError(message: e.toString()));
    }
  }
}
