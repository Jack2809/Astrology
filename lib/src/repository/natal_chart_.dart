

import 'dart:convert';
import 'dart:developer';

import 'package:astrology/src/models/natal_chart_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'google_sign_in.dart';

NatalChartModel parseNatalChart(String responseBody){
  final parsed = jsonDecode(responseBody);
  return NatalChartModel.fromJson(parsed);
}

Future<NatalChartModel> fetchNatalChartImageData(int id) async{
  var headerResponse = await GoogleSignInProvider().postRequest();
  String header = headerResponse.body;
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/profiles/'+id.toString()+'/chart'),
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer '+header,
  });
  log(response.body);
  // Map map = jsonDecode(response.body);
  // Map map1 = map['items'];
  // List<PlanetInformation> list = [];
  // map1.forEach((key, value) {
  //   var x =PlanetInformation.fromJson(value);
  //   list.add(x);
  // });
  // log(list.length.toString());
  return compute(parseNatalChart,response.body);
}


Future<List<PlanetInformation>> fetchNatalChartData(int id) async{
  var headerResponse = await GoogleSignInProvider().postRequest();
  String header = headerResponse.body;
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/profiles/'+id.toString()+'/chart'),
  headers: {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer '+header,
  });
  log(response.body);
  Map map = jsonDecode(response.body);
  Map map1 = map['items'];
  List<PlanetInformation> list = [];
  map1.forEach((key, value) {
    var x = PlanetInformation.fromJson(value);
    list.add(x);
  });
  log(list.length.toString());
  return list;
}