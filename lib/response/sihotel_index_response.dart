import '../models/table_hotel_model.dart';

class SihotelIndexResponse{
  List<SihotelModel> listSihotelModel = [];

  SihotelIndexResponse.fromJson(json) {
    for (int i = 0; i < json.length; i++) {
      SihotelModel sihotelModel =
      SihotelModel.fromJson(json[i]);
      listSihotelModel.add(sihotelModel);
    }
  }
}
