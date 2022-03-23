
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

import 'package:intl/intl.dart';

class CurrentUser {

   static late  SharedPreferences _prefs;

  static Future init() async => _prefs = await SharedPreferences.getInstance();

   static Future<void> saveCurrentUser(Future<UserModel> user) async {
     UserModel userTemp = await user;
     await _prefs.setInt('userId',userTemp.id);
     await _prefs.setInt('id',userTemp.profileList[0].id);
     await _prefs.setString('place',userTemp.profileList[0].birthPlace);
     await _prefs.setString('userName',userTemp.profileList[0].name);
     await _prefs.setString('email',userTemp.email);
     await _prefs.setString('phoneNumber',userTemp.phoneNumber);
     await _prefs.setString('avatarLink',userTemp.profileList[0].profilePhoto);
     await _prefs.setBool('gender', userTemp.profileList[0].gender);
     String date = DateFormat.yMd().format(DateTime.parse(userTemp.profileList[0].birthDate));
     String time = DateFormat.Hm().format(DateTime.parse(userTemp.profileList[0].birthDate));
     await _prefs.setString('date', date);
     await _prefs.setString('time', time);
     await _prefs.setDouble('longitude', userTemp.profileList[0].longitude);
     await _prefs.setDouble('latitude', userTemp.profileList[0].latitude);

   }

   static Future<void> updateCurrentUser(String name,String date,String place,double latitude,double longitude,bool gender,String image) async {
     await _prefs.setString('userName',name);
     await _prefs.setString('date', date);
     await _prefs.setString('place',place);
     await _prefs.setDouble('longitude', longitude);
     await _prefs.setDouble('latitude', latitude);
     await _prefs.setBool('gender', gender);
     await _prefs.setString('avatarLink',image);

   }


   static int? getUserId(){
     return _prefs.getInt('userId');
   }

   static int? getId(){
     return _prefs.getInt('id');
   }

   static String? getPlace() {
     return _prefs.getString('place');
   }

   static String? getDate() {
     return _prefs.getString('date');
   }

   static String? getTime() {
     return _prefs.getString('time');
   }

   static double? getLongitude() {
     return _prefs.getDouble('longitude');
   }

   static double? getLatitude() {
     return _prefs.getDouble('latitude');
   }

   static String? getCurrentUserName() {
     return _prefs.getString('userName');
   }

   static bool? getGender() {
     return _prefs.getBool('gender');
   }

   static String? getAvatarLink(){
     return _prefs.getString('avatarLink');
   }

   static String? getPhoneNumber(){
     return _prefs.getString('phoneNumber');
   }



}