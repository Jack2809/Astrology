import 'dart:developer';
import 'package:astrology/src/resources/zodiac&natal_chart&horoscope/horoscope_daily.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../zodiac&natal_chart&horoscope/natal_chart.dart';
import '../zodiac&natal_chart&horoscope/zodiac.dart';

class HomePage extends StatefulWidget{

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _imageLink = 'https://scontent.fsgn2-4.fna.fbcdn.net/v/t31.18172-8/16423117_671178093084590_8683797133784660545_o.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=_oOW4y6GZ0sAX8pL2BX&tn=8dDZ6yBmARp1i9Mt&_nc_ht=scontent.fsgn2-4.fna&oh=00_AT_HiU2oIuAwvz28e-oZiTwWp3I_VP-g32NHc9R8yrYY3Q&oe=622799C2';

  Future<String> getIDToken()async{
    String token = await FirebaseAuth.instance.currentUser!.getIdToken(false);
    log(token);
    return token;
  }


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
                            'Hello Hiếu Nguyễn',
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
                                  'Lá số hôm nay',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'bạn có thể tìm hiểu về lá số hôm\nnay của bạn',
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

          ],
        ),

      ),
    );
  }
}