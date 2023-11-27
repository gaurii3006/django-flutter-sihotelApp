import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:project_sihotel/response/sihotel_index_response.dart';
import 'package:meta/meta.dart';
import '../../models/table_hotel_model.dart';
import '../../repo/sihotel_repository.dart';

part 'sihotel_event.dart';
part 'sihotel_state.dart';

class SihotelBloc extends Bloc<SihotelEvent, SihotelState> {
  final sihotelRepository = SihotelRepository();

  SihotelBloc() : super(SihotelInitial()) {
    on<SihotelEvent>((event, emit) async {
      emit(SihotelLoading());

      try {
        SihotelIndexResponse response = await sihotelRepository.getAllSihotel();
        emit(SihotelLoaded(
          listSihotelModel: response.listSihotelModel,
        ));
      } catch (e) {
        emit(SihotelError(message: e.toString()));
      }
    });
  }
}
