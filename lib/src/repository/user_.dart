

import 'dart:convert';

import 'package:astrology/src/models/new_user_model.dart';
import 'package:astrology/src/models/user.dart';


UserModel parseUserModel(String responseBody){
  final parsed = jsonDecode(responseBody);
  return UserModel.fromJson(parsed);
}
NewUserModel parseNewUserModel(String responseBody){
  final parsed = jsonDecode(responseBody);
  return NewUserModel.fromJson(parsed);
}


