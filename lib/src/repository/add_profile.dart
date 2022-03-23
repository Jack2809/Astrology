import 'dart:convert';
import 'dart:developer';
import 'package:astrology/src/repository/google_sign_in.dart';
import 'package:http/http.dart' as http;

Future<void> addProfile(String name,String date,String place,double latitude,double longitude,bool gender,String profilePhoto,int userId)async{
  log(userId.toString());
  final headerResponse = await GoogleSignInProvider().postRequest();
  String header = headerResponse.body;
  String url = 'https://stg-api.tranastro.com/api/v1/users/current/profiles';
  var response = http.post(Uri.parse(url),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer ' + header,
    },
    body:jsonEncode(<String,dynamic>{
      'name':name,
      'birthDate':date,
      'birthPlace':place,
      'latitude':latitude,
      'longtitude':longitude,
      'gender':gender,
      'profilePhoto':profilePhoto,
      'userId':userId,
    })
  );
  final a = await response;
  log(a.statusCode.toString());
}

Future<void> updateProfile(int profileId,String name,String date,String place,double latitude,double longitude,bool gender,String profilePhoto)async{
  final headerResponse = await GoogleSignInProvider().postRequest();
  String header = headerResponse.body;
  String url = 'https://stg-api.tranastro.com/api/v1/users/current/profiles/';
  var response = http.put(Uri.parse(url+profileId.toString()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + header,
      },
      body:jsonEncode(<String,dynamic>{
        'name':name,
        'birthDate':date,
        'birthPlace':place,
        'latitude':latitude,
        'longtitude':longitude,
        'gender':gender,
        'profilePhoto':profilePhoto,
      })
  );
  final a = await response;
  log(a.statusCode.toString());
}