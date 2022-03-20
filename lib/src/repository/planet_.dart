import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/planet_model.dart';


 List<PlanetModel> parseGeneralPlanetModels(List responseBody){
   // final parsed = jsonDecode(responseBody).cast<Map<String,dynamic>>();
   return responseBody.map<PlanetModel>((json) =>PlanetModel.fromGeneralJson(json)).toList();
  
}

Future<List<PlanetModel>> fetchGeneralPlanetData(http.Client client) async{
   var response = await client.get(Uri.parse('https://stg-api.tranastro.com/api/v1/planets'));
   Map map = jsonDecode(response.body);
   return parseGeneralPlanetModels(map['payload']);
   
}

PlanetModel parsePlanetDetailModels(String responseBody){
  final parsed = jsonDecode(responseBody);
  return PlanetModel.fromJson(parsed);
}

Future<PlanetModel> fetchPlanetDetailData(int id) async {
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/planets/'+id.toString()));
  if (response.statusCode == 200) {

    return compute(parsePlanetDetailModels,response.body);
  } else {

    throw Exception('Failed to load planet');
  }
}