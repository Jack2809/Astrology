
import 'dart:convert';
import 'dart:developer';
import 'package:astrology/src/models/horoscope_model.dart';
import 'package:astrology/src/repository/google_sign_in.dart';
import 'package:http/http.dart' as http ;

HoroscopeModel parseHoroscope(String responseBody){
  var parsed = jsonDecode(responseBody);
  return HoroscopeModel.fromJson(parsed);
}

Future<HoroscopeModel> fetchHoroscopeData(int id, String date) async {
  var headerResponse = await GoogleSignInProvider().postRequest();
  String header = headerResponse.body;
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/users/current/profiles/'+id.toString()+'/horoscope?date='+date),
  headers:{
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer '+header,
  }
  );

  return parseHoroscope(response.body);
}