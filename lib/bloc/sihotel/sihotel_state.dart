part of 'sihotel_bloc.dart';


@immutable
abstract class SihotelState{}

class SihotelInitial extends SihotelState {}

class SihotelLoading extends SihotelState {}

class SihotelLoaded extends SihotelState {
  final List<SihotelModel> listSihotelModel;
  SihotelLoaded({required this.listSihotelModel});
}
class SihotelError extends SihotelState {
  final String message;
  SihotelError({required this.message});
}