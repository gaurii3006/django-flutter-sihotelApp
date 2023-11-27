part of 'app_setting_bloc.dart';

@immutable
abstract class AppSettingState {}

class AppSettingLoading extends AppSettingState {}
class AppSettingAuthenticate extends AppSettingState {}
class AppSettingUnAuthenticate extends AppSettingState {}
