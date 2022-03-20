
import 'dart:convert';

import '../models/news_model.dart';
import 'package:http/http.dart' as http;

List<NewsModel> parseNewsData(List responseBody){
  return responseBody.map<NewsModel>((json) => NewsModel.fromJson(json)).toList();
}

Future<List<NewsModel>> fetchNewsData(http.Client client)async{
  var response = await client.get(Uri.parse('https://stg-api.tranastro.com/api/v1/news'));
  Map map = jsonDecode(response.body);
  return parseNewsData(map['payload']);
}