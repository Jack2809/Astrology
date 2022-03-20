import 'package:astrology/src/models/horoscope_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoroscopeViewDetail extends StatelessWidget{
  List<HoroscopeItem> list;
  HoroscopeViewDetail({required this.list});

  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
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
          list[0].lifeAttributeName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: size.height ,
        padding:EdgeInsets.fromLTRB(10,0,0,10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background1.png'),
              fit: BoxFit.fill,
            )
        ),
        child: SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              if(index != 0){
                return HoroscopeItemDetailView(item: list[index]);
              }else{
                return SizedBox();
              }
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,color: Colors.white),
          ),
        ),
      ),
    );
  }

}

class HoroscopeItemDetailView extends StatelessWidget{
  HoroscopeItem item;
  HoroscopeItemDetailView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.lifeAttributeName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item.content,
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                'Xem chi tiết',
                style: TextStyle(
                    color: Colors.pink,
                    fontSize:20
                ),
              ),
              SizedBox(width:10.0),
              Icon(Icons.arrow_forward,color: Colors.pink,size:15),
            ],
          )

        ],
      ),
    );
  }

}