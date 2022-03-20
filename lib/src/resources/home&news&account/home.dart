import 'dart:developer';

import 'package:astrology/src/repository/current_user_shared_preferences.dart';
import 'package:astrology/src/resources/zodiac&natal_chart&horoscope/horoscope_daily.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../zodiac&natal_chart&horoscope/house.dart';
import '../zodiac&natal_chart&horoscope/natal_chart.dart';
import '../zodiac&natal_chart&horoscope/zodiac.dart';
import 'package:intl/intl.dart';
import 'package:astrology/src/resources/zodiac&natal_chart&horoscope/planet.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  String _imageLink = CurrentUser.getAvatarLink() ?? "";
  var date = DateTime.now();

  String name = CurrentUser.getCurrentUserName() ?? "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      primary: false,
      child: Container(
        padding: EdgeInsets.fromLTRB(15.0,0,15.0,20.0),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background1.png'),
              fit: BoxFit.fill,
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(0,20.0,0,20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          Text(
                            'Hello '+name,
                            style: TextStyle(
                              color:Colors.white70
                            ),
                          ),

                          Text(
                            'Spirit Astro',
                            style: TextStyle(
                                color:Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundImage: NetworkImage(_imageLink),
                      radius:size.height * 0.03,
                    ),
                  ],
                ),
              ),

            ),

            // Container(
            //   child: CarouselSlider(
            //     items: [
            //       MyHoroscopeDaily(date:date.subtract(Duration(days: 2)),changedColor:true,),
            //       MyHoroscopeDaily(date:date.subtract(Duration(days: 1)),changedColor:false,),
            //       MyHoroscopeDaily(date:date,changedColor:true,),
            //       MyHoroscopeDaily(date:date.add(Duration(days: 1)),changedColor:false,),
            //       MyHoroscopeDaily(date:date.add(Duration(days: 2)),changedColor:true,),
            //     ],
            //     options: CarouselOptions(
            //       // reverse: true,
            //       height: size.height  * 0.3,
            //       aspectRatio: 2.0,
            //       enlargeCenterPage: true,
            //       enableInfiniteScroll: false,
            //       initialPage: 2,
            //       autoPlay: true,
            //       autoPlayAnimationDuration: Duration(seconds: 5),
            //     ),
            //
            //
            //   ),
            // ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HoroscopeDaily()),);
              },
              child: Container(
                height: size.height * 0.4,
                padding: EdgeInsets.fromLTRB(0,20.0,0,20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(80, 27,101, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/home/horoscope_daily.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0,0,20.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Lá số hằng ngày',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'bạn có thể tìm hiểu tất tần tật về \nlá số của bạn',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height:size.height * 0.02,),



            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ZodiacPage()),);
              },
              child: Container(
                height: size.height * 0.4,
                padding: EdgeInsets.fromLTRB(0,20.0,0,20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(80, 27,101, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/home/zodiac.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0,0,20.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cung hoàng đạo',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'bạn có thể tìm hiểu tất tần tật về \n12 cung hoàng đạo',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height:size.height * 0.02,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => NatalChartPage()),);
              },
              child: Container(
                height: size.height * 0.4,
                padding: EdgeInsets.fromLTRB(0,20.0,0,20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(35,66,112, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/home/natal_chart.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top:0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0,0,20.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bản đồ sao',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'bạn muốn hiểu rõ về con người \ncủa bạn? bạn đã đến đúng nơi rồi đó',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12.5
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height * 0.02,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PlanetPage()),);
              },
              child: Container(
                height: size.height * 0.4,
                padding: EdgeInsets.fromLTRB(0,20.0,0,20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(80, 27,101, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/home/planet.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0,0,20.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hành Tinh',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'bạn có thể tìm hiểu tất tần tật về \nhành tinh của bạn',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height * 0.02,),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HousePage()),);
              },
              child: Container(
                height: size.height * 0.4,
                padding: EdgeInsets.fromLTRB(0,20.0,0,20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Color.fromRGBO(35,66,112, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/home/house.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top:0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(20.0,0,20.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nhà',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'bạn có thể tìm hiểu về nhà trong thiên\nvăn học của bạn',
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12.5
                                  ),
                                ),
                              ],
                            ),
                          ),

                          CircleAvatar(
                            child: Icon(Icons.arrow_forward_ios,color: Colors.black,),
                            backgroundColor: Colors.white,
                            radius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),

      ),
    );
  }
}

// class MyHoroscopeDaily extends StatelessWidget{
//
//   DateTime date;
//   bool changedColor;
//   MyHoroscopeDaily({required this.date,required this.changedColor});
//
//   String getCurrentDay(DateTime date){
//     String day = '';
//     DateTime currentDay = DateTime.now();
//     if(date.weekday == currentDay.weekday){
//       day = 'Hôm Nay';
//     }
//     else if(date.weekday == 1){
//       day = 'Thứ Hai';
//     } else if(date.weekday == 2){
//       day = 'Thứ Ba';
//     }else if(date.weekday == 3){
//       day = 'Thứ Tư';
//     }else if(date.weekday == 4){
//       day = 'Thứ Năm';
//     }else if(date.weekday == 5){
//       day = 'Thứ Sáu';
//     }else if(date.weekday == 6){
//       day = 'Thứ Bảy';
//     }else{
//       day = 'Chủ Nhật';
//     }
//     return day;
//   }
//
//   String formatDate(DateTime date){
//     String dateStr = DateFormat('dd/MM/yyyy').format(date);
//     return dateStr;
//
// }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context) => HoroscopeDailyDetail(currentDay: getCurrentDay(date), curentDate: formatDate(date))),);
//       },
//       child: Container(
//         padding:EdgeInsets.all(size.height * 0.02),
//         height: size.height * 0.4,
//         width: size.width * 0.8,
//         decoration: BoxDecoration(
//           gradient: changedColor?LinearGradient(
//             colors: [
//               Color.fromRGBO(31,85,102,1),
//               Color.fromRGBO(43,31,133,1),
//             ],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             stops: [
//               0.1,
//               0.8,
//             ],
//
//           ):LinearGradient(
//             colors: [
//               Color.fromRGBO(153,40,133,1),
//               Color.fromRGBO(42,24,131,1),
//             ],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//             stops: [
//               0.1,
//               0.8,
//             ],
//
//           ),
//           // color: Color.fromRGBO(38, 56, 119, 1),
//           borderRadius: BorderRadius.circular(30.0),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'Lá số '+getCurrentDay(date)+' của bạn',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize:20.0,
//               ),
//             ),
//             SizedBox(height: size.height * 0.03,),
//
//             Text(
//               formatDate(date),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize:size.width * 0.1,
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }

