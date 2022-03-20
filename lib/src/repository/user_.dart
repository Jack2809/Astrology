

import 'dart:convert';

import 'package:astrology/src/models/user.dart';


UserModel parseUserModel(String responseBody){
  final parsed = jsonDecode(responseBody);
  return UserModel.fromJson(parsed);
}
