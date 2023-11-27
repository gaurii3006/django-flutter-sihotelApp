import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_sihotel/core/api_client.dart';
import 'package:project_sihotel/response/sihotel_index_response.dart';



class SihotelRepository extends ApiClient{

  Future<SihotelIndexResponse> getAllSihotel() async{
    try{
      final response = await dio.get('hotels');
      debugPrint('Hasil Response : ${response.data['data']}');
      return SihotelIndexResponse.fromJson(response.data['data']);
    } on DioError catch(e) {
      throw e.toString();
    }
  }

}