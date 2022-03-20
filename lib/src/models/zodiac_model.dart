
import 'dart:developer';

import 'package:flutter/cupertino.dart';

class ZodiacModel {
   final int id;
   final String name;
   final int zodiacDayStart;
   final int zodiacMonthStart;
   final int zodiacDayEnd;
   final int zodiacMonthEnd;
   final String icon;
   final String descreiption;
   final String mainContent;

   ZodiacModel({required this.id,required this.name,required this.zodiacDayStart,
  required this.zodiacMonthStart,required this.zodiacDayEnd,required this.zodiacMonthEnd,
  required this.icon,required this.descreiption,required this.mainContent});

  factory ZodiacModel.fromJson(Map<String,dynamic> json){
    return ZodiacModel(
      id: json['id'] as int,
      name: json['name'] as String,
      zodiacDayStart: json['zodiacDayStart'] as int,
      zodiacMonthStart: json['zodiacMonthStart'] as int,
      zodiacDayEnd: json['zodiacDayEnd'] as int,
      zodiacMonthEnd: json['zodiacMonthEnd'] as int,
      icon: json['icon'] as String,
      descreiption: json['descreiption'] as String,
      mainContent: json['mainContent'] as String,
    );

  }

   ZodiacModel.general({required this.id,required this.name,required this.zodiacDayStart,
     required this.zodiacMonthStart,required this.zodiacDayEnd,required this.zodiacMonthEnd,
     required this.icon}):descreiption='',mainContent='';

   factory ZodiacModel.fromGeneralJson(Map<String,dynamic> json){
     return ZodiacModel.general(
         id: json['id'] as int,
         name: json['name'] as String,
         zodiacDayStart: json['zodiacDayStart'] as int,
         zodiacMonthStart: json['zodiacMonthStart'] as int,
         zodiacDayEnd: json['zodiacDayEnd'] as int,
         zodiacMonthEnd: json['zodiacMonthEnd'] as int,
         icon: json['icon'] as String,
     );

   }

}
