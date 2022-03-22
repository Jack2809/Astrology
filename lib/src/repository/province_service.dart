import 'package:astrology/models/province.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProvinceService{
  Future<List<Province>> getAllProvince() async{
    // var url='https://provinces.open-api.vn/api/';
    // var response =await http.get(Uri.parse(url));
    // var json=convert.jsonDecode(response.body);
    // var jsonResults = json.cast<Map<String, dynamic>>();
    final String response = await rootBundle.loadString('assets/provinces.json');
    final data = convert.json.decode(response) as List;
    return data.map<Province>((place) => Province.formJson(place)).toList();
  }
}