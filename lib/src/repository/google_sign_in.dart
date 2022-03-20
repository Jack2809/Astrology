import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:astrology/src/models/user.dart';
import 'package:astrology/src/repository/user_.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;


class GoogleSignInProvider extends ChangeNotifier {

  final googleSignIn = GoogleSignIn(
    scopes: [
      'email'
    ],
  );

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future<String> getIDToken() async {
    String token = await FirebaseAuth.instance.currentUser!.getIdToken(false);
    return token;
  }

  Future<http.Response> postRequest() async {
    // print('--------------------------Run--------------------------------');
    String idToken = await getIDToken();
    // log(idToken);
    var response = await http.Client().post(
      Uri.parse('https://stg-api.tranastro.com/api/v1/login/firebase'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'token': idToken,
      }),
    );
    // print('--------------------------------------------------------------');
    if (response.statusCode == 200) {
      log('id token successful');
    } else {
      log('id token failed');
    }
    return response;
  }

  Future<UserModel> getCurrentUser() async {
    final headerResponse = await postRequest();
    String header = headerResponse.body;
    log(header);
    var response = await http.get(
        Uri.parse('https://stg-api.tranastro.com/api/v1/users/current'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + header,
        }
    );
    return parseUserModel(response.body);
  }

  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      return;
    }
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);


    // final response = await getCurrentUser();

    notifyListeners(); //update UI

  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}