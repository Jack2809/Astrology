

import 'dart:convert';

import 'package:astrology/src/models/new_user_model.dart';
import 'package:astrology/src/models/user.dart';
import 'package:astrology/src/repository/google_sign_in.dart';

import 'package:http/http.dart' as http;


UserModel parseUserModel(String responseBody){
  final parsed = jsonDecode(responseBody);
  return UserModel.fromJson(parsed);
}

List<Profile> parseListProfile(List responseBody){
  return responseBody.map<Profile>((json) => new Profile.fromJson(json)).toList();
}

Future<List<Profile>> fetchListProfile()async{
  final headerResponse = await GoogleSignInProvider().postRequest();
  String header = headerResponse.body;
  var response = await http.get(Uri.parse('https://stg-api.tranastro.com/api/v1/users/current/profiles'),
  headers:{
    'Authorization': 'Bearer ' + header,
  }
  );
  final list = jsonDecode(response.body);
  return parseListProfile(list);
}


NewUserModel parseNewUserModel(String responseBody){
  final parsed = jsonDecode(responseBody);
  return NewUserModel.fromJson(parsed);
}


