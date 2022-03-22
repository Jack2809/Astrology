import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import '../models/province.dart';

class ProvinceService{
  Future<List<Province>> getAllProvince() async{
    final String response = await rootBundle.loadString('assets/provinces.json');
    final data = convert.json.decode(response) as List;
    return data.map<Province>((place) => Province.formJson(place)).toList();
  }
}