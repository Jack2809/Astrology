

import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../models/house_model.dart';
import 'package:http/http.dart' as http;

List<HouseModel> parseGeneralHouseData(List responseBody){
  return responseBody.map<HouseModel>((json) => HouseModel.fromGeneralJson(json)).toList();
}

Future<List<HouseModel>> fetchGeneralHouseData(http.Client client) async{
  var response = await client.get(Uri.parse('https://stg-api.tranastro.com/api/v1/houses'));
  Map map = jsonDecode(response.body);
  return parseGeneralHouseData(map['payload']);

}

HouseModel parseHouseDetailModels(String responseBody){
  final parsed = jsonDecode(responseBody);
  return HouseModel.fromJson(parsed);
}

Future<HouseModel> fetchHouseDetailData(int id) async {
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/houses/'+id.toString()));
  if (response.statusCode == 200) {

    return compute(parseHouseDetailModels,response.body);
  } else {

    throw Exception('Failed to load planet');
  }
}