import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_sihotel/repo/auth_repository.dart';

import '../../../core/session_manager.dart';
import '../../../params/login_user_param.dart';
import '../../../response/login_user_response.dart';

part 'login_user_event.dart';
part 'login_user_state.dart';

class LoginUserBloc extends Bloc<LoginUserEvent, LoginUserState> {
  final authRepository = AuthRepository();
  final sessionManager = SessionManager();
  LoginUserBloc() : super(LoginUserInitial()) {
    on<LoginVisitorsEvent>(_login);
  }
  Future<void> _login(
      LoginVisitorsEvent event, Emitter<LoginUserState> emit) async {
    final params = LoginUserParam(event.username, event.password);

    emit(LoginUserLoading());
    try {
      LoginUserResponse response = await authRepository.loginUserVisitors(params);
      sessionManager.setSession(
          response.loginModel!.id!,
          response.loginModel!.token!,
          response.loginModel!.email!,
          response.loginModel!.firstName!,
          response.loginModel!.lastName!,
          response.loginModel!.userAvatar!);
      emit(LoginUserSuccess(loginUserResponse: response));
    } catch (e) {
      emit(LoginUserError(message: e.toString()));
    }
  }
}

