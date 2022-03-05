import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HoroscopeDaily extends StatefulWidget{
  @override
  State<HoroscopeDaily> createState() => _HoroscopeDailyState();
}

class _HoroscopeDailyState extends State<HoroscopeDaily>{

  var date = DateTime.now();

  int currentPage = 3;

  var _controller = PageController(initialPage: 2);

  bool _isSelected0 = false;
  bool _isSelected1 = false;
  bool _isSelected2 = true;
  bool _isSelected3 = false;
  bool _isSelected4 = false;

  void _onTappedBar0() {
    setState(() {
      currentPage = 0;
      _isSelected0 = true;
      _isSelected1 = false;
      _isSelected2 = false;
      _isSelected3 = false;
      _isSelected4 = false;

    });
    // _controller.jumpToPage(currentPage);
    _controller.animateToPage(currentPage, duration:Duration(seconds:1), curve:Curves.linear);
  }

  void _onTappedBar1() {
    setState(() {
      currentPage = 1;
      _isSelected0 = false;
      _isSelected1 = true;
      _isSelected2 = false;
      _isSelected3 = false;
      _isSelected4 = false;
    });
    // _controller.jumpToPage(currentPage);
    _controller.animateToPage(currentPage, duration:Duration(seconds:1), curve:Curves.linear);
  }
  void _onTappedBar2() {
    setState(() {
      currentPage = 2;
      _isSelected0 = false;
      _isSelected1 = false;
      _isSelected2 = true;
      _isSelected3 = false;
      _isSelected4 = false;
    });
    // _controller.jumpToPage(currentPage);
    _controller.animateToPage(currentPage, duration:Duration(seconds:1), curve:Curves.linear);
  }
  void _onTappedBar3() {
    setState(() {
      currentPage = 3;
      _isSelected0 = false;
      _isSelected1 = false;
      _isSelected2 = false;
      _isSelected3 = true;
      _isSelected4 = false;
    });
    // _controller.jumpToPage(currentPage);
    _controller.animateToPage(currentPage, duration:Duration(seconds:1), curve:Curves.linear);
  }
  void _onTappedBar4() {
    setState(() {
      currentPage = 4;
      _isSelected0 = false;
      _isSelected1 = false;
      _isSelected2 = false;
      _isSelected3 = false;
      _isSelected4 = true;
    });
    // _controller.jumpToPage(currentPage);
    _controller.animateToPage(currentPage, duration:Duration(seconds:1), curve:Curves.linear);
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size:15.0,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor:Colors.transparent,
        bottomOpacity: 0.0,
        title: Text(
          'Lá số hôm nay',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background/background1.png'),
                fit: BoxFit.fill
            )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   GestureDetector(
                     onTap: _onTappedBar0,
                       child: MyDate(item: date.subtract(Duration(days: 2)),isSelected:_isSelected0,)
                   ),
                   GestureDetector(
                     onTap: _onTappedBar1,
                       child: MyDate(item: date.subtract(Duration(days: 1)),isSelected:_isSelected1)
                   ),
                   GestureDetector(
                     onTap: _onTappedBar2,
                       child: MyDate(item: date,isSelected:_isSelected2)
                   ),
                   GestureDetector(
                     onTap: _onTappedBar3,
                       child: MyDate(item: date.add(Duration(days: 1)),isSelected:_isSelected3)
                   ),
                   GestureDetector(
                     onTap: _onTappedBar4,
                       child: MyDate(item: date.add(Duration(days: 2)),isSelected:_isSelected4)
                   ),
                 ],
               ),
              ),

              Expanded(
                child: Container(
                  // height: size.height * 0.1,
                  // width: double.infinity,
                  child: PageView(
                    controller: _controller,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Text('Page 1',style:TextStyle(color: Colors.white),),
                      Text('Page 2',style:TextStyle(color: Colors.white),),
                      Text('Page 3',style:TextStyle(color: Colors.white),),
                      Text('Page 4',style:TextStyle(color: Colors.white),),
                      Text('Page 5',style:TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      ),

    );
  }
}

class MyDate extends StatelessWidget{
  DateTime item;
  bool isSelected;
  MyDate({required this.item,required this.isSelected});



  String getCurrentDay(DateTime date){
    String day = '';
    DateTime currentDay = DateTime.now();
    if(date.weekday == currentDay.weekday){
      day = 'Today';
    }
    else if(date.weekday == 1){
      day = 'Mon';
    } else if(date.weekday == 2){
      day = 'Tues';
    }else if(date.weekday == 3){
      day = 'Wed';
    }else if(date.weekday == 4){
      day = 'Thus';
    }else if(date.weekday == 5){
      day = 'Fri';
    }else if(date.weekday == 6){
      day = 'Sat';
    }else{
      day = 'Sun';
    }
    return day;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.15,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Text(
            getCurrentDay(item),
            style: TextStyle(
              color: Colors.white70,
              fontSize:size.height * 0.02,
            ),
          ),
      SizedBox(height: size.height * 0.01),
      Container(
        child: (isSelected)?CircleAvatar(
          backgroundColor: Color.fromRGBO(255,86,184,1),
          child: Text(
            item.day.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize:size.height * 0.02,
            ),
              ),
        ):Text(
          item.day.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize:size.height * 0.02,
          ),
        ),
      ),
        ],
      ),
    );
  }

}