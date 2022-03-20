import 'dart:convert';
import 'dart:developer';
import 'package:astrology/src/models/zodiac_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


// get general zodiac list
List<ZodiacModel> parseGeneralZodiacModels(List responseBody){
  return responseBody.map<ZodiacModel>((json) => new ZodiacModel.fromGeneralJson(json)).toList();
}


Future<List<ZodiacModel>> fetchGeneralZodiacData(http.Client client) async {
  var response = await client.get(Uri.parse('https://stg-api.tranastro.com/api/v1/zodiacs'));
  Map map = jsonDecode(response.body);
  return parseGeneralZodiacModels(map['payload']);
}

// get zodiac detail
ZodiacModel parseZodiacDetailModels(String responseBody){
  final parsed = jsonDecode(responseBody);
  return ZodiacModel.fromJson(parsed);
}

Future<ZodiacModel> fetchZodiacDetailData(int id) async {
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/zodiacs/'+id.toString()));
  if (response.statusCode == 200) {
    return compute(parseZodiacDetailModels,response.body);
  } else {

    throw Exception('Failed to load zodiac');
  }
}