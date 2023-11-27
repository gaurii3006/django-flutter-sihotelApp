import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:project_sihotel/core/session_manager.dart';
import 'package:meta/meta.dart';

part 'app_setting_event.dart';
part 'app_setting_state.dart';

class AppSettingBloc extends Bloc<AppSettingEvent, AppSettingState> {
  final sessionManager = SessionManager();
  AppSettingBloc() : super(AppSettingLoading()) {
    on<AppSettingEvent>((event, emit) {
      final activeSession = sessionManager.anyActiveSession();
      if (activeSession){
        emit(AppSettingAuthenticate());
      } else {
        emit(AppSettingUnAuthenticate());
      }
    });
  }
}
