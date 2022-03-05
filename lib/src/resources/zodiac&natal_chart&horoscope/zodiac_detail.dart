import 'package:flutter/material.dart';

import 'zodiac.dart';

class HoroscopeDetail extends StatelessWidget{
  Zodiac item;
  HoroscopeDetail({required this.item});
  String content = 'Dòng người vội vàng bước qua, chợt như chiếc hôn thế thôi';
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size:15.0,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor:Colors.transparent,
        bottomOpacity: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15.0,size.height * 0.1,15.0,20.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background.png'),
            fit: BoxFit.fill
          )
        ),
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height:size.height * 0.25,
                width: size.width * 0.45,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.imageLink),
                      fit: BoxFit.fill,
                    )
                ),
              ),
              Text(
                item.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize:25.0,
                ),
              ),
              Text(
                item.startTime+ ' - '+item.endTime,
                style: TextStyle(
                  fontSize:15.0,
                  color: Colors.white70,
                  wordSpacing:5.0,
                ),
              ),
              SizedBox(height: 15.0,),
              Container(
                padding: EdgeInsets.fromLTRB(15.0,0,15.0,0),
                child: Text(
                  content,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

}