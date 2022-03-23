import 'package:astrology/src/repository/current_user_shared_preferences.dart';
import 'package:astrology/src/repository/google_sign_in.dart';
import 'package:astrology/src/repository/user_.dart';
import 'package:astrology/src/resources/home&news&account/account.dart';
import 'package:astrology/src/resources/home&news&account/home.dart';
import 'package:astrology/src/resources/home&news&account/news.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

import '../../models/user.dart';

class MyMainPage extends StatefulWidget{

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {

  late PageController _pageController ;

   int _selectedIndex = 0;

   late Future<UserModel> currentUser;



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(index, duration:Duration(milliseconds:500), curve: Curves.easeIn);
  }


  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
    currentUser = GoogleSignInProvider().getCurrentUser();
    CurrentUser.saveCurrentUser(currentUser);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel>(
        future: currentUser,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Something went wrong!!'),);
          }else if (snapshot.hasData){
            return PageView(
              controller: _pageController,
              onPageChanged: (newPage){
                setState(() {
                  _selectedIndex = newPage;
                });
              },
              children: [
                // HomePage(),
                HomePage(),
                NewsPage(),
                AccountPage(),
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
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