import 'package:astrology/src/repository/google_sign_in.dart';
import 'package:astrology/src/resources/home&news&account/account.dart';
import 'package:astrology/src/resources/home&news&account/home.dart';
import 'package:astrology/src/resources/home&news&account/news.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget{

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {


   int _selectedIndex = 0;

  Widget pageCaller(index) {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return NewsPage();
      case 2:
        return AccountPage();

      default:
        return HomePage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: pageCaller(_selectedIndex),
      ),


      bottomNavigationBar:BottomNavigationBar(
        elevation: 1000.0,
        backgroundColor: Color.fromRGBO(10, 10, 47, 1.0),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromRGBO(255, 46, 171, 1.0) ,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/convex_icon/home.png')),label:'Home',backgroundColor: Color.fromRGBO(10, 10, 47, 1.0)),
          BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/convex_icon/news.png')),label:'Tin tức',backgroundColor: Color.fromRGBO(10, 10, 47, 1.0)),
          BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/convex_icon/account.png')),label:'Hồ sơ',backgroundColor: Color.fromRGBO(10, 10, 47, 1.0)),
        ],
      ),
    );
  }
}