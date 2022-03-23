import 'dart:developer';
import 'dart:io';

import 'package:astrology/src/repository/google_sign_in.dart';
import 'package:http/http.dart' as http;

// Future<String> uploadImage(String fileName)async{
//   final headerResponse = await GoogleSignInProvider().postRequest();
//   String header = headerResponse.body;
//   // var response = http.post(Uri.parse('https://stg-api.tranastro.com/api/v1/users/image'),
//   // headers: {
//   //   'Content-Type': 'multipart/form-data',
//   //   'Authorization': 'Bearer ' + header,
//   // },
//   // body:
//   // );
//   var request = http.MultipartRequest('POST',Uri.parse('https://stg-api.tranastro.com/api/v1/users/image'));
//   request.files.add(
//     new http.MultipartFile('file',fileName.),
//   );
//   var response = await request.send();
//   return response.;
// }

Future<String> uploadImage(filepath) async {
  var request = http.MultipartRequest('POST', Uri.parse('https://stg-api.tranastro.com/api/v1/users/image'));
  request.files.add(
      http.MultipartFile.fromBytes(
          'file',
          File(filepath).readAsBytesSync(),
          filename: filepath.split("/").last
      )
  );
  var res = await request.send();
  var responseStr = await res.stream.bytesToString();
  log(responseStr);
  return responseStr;
}