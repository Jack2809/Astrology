import 'dart:developer';

import 'package:astrology/src/repository/zodiac_.dart';
import 'package:flutter/material.dart';
import '../../models/zodiac_model.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;



class ZodiacDetail extends StatefulWidget{
  int id;
  ZodiacDetail({required this.id});

  @override
  State<ZodiacDetail> createState() => _ZodiacDetailState();
}

class _ZodiacDetailState extends State<ZodiacDetail> {
  late Future<ZodiacModel> zodiac;
  @override
  void initState() {
    super.initState();
    zodiac = fetchZodiacDetailData(widget.id);
  }
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0,size.height * 0.1,15.0,20.0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/background.png'),
                  fit: BoxFit.fill,
              )
          ),
          child: FutureBuilder<ZodiacModel>(
            future: zodiac,
            builder: (context,snapshot){
              if(snapshot.hasError){
                return Center(child:Text('something went wrong!!',style: TextStyle(color: Colors.white)),);
              }else if(snapshot.hasData){
                return ShowDetail(item:snapshot.data!);
              }else {
                return Container(height:size.height,child: Center(child: CircularProgressIndicator(),));
              }
            },
          ),
        ),
      ),

    );
  }
}



class ShowDetail extends StatelessWidget{
  ZodiacModel item;
  ShowDetail({required this.item});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height:size.height * 0.25,
            width: size.width * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(item.icon),
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
            item.zodiacDayStart.toString()+ '/' +item.zodiacMonthStart.toString()+ '-' +item.zodiacDayEnd.toString()+ '/' +item.zodiacMonthEnd.toString(),
            style: TextStyle(
              fontSize:15.0,
              color: Colors.white70,
              wordSpacing:5.0,
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
            'Mô tả về '+item.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0,),
          Html(
            data: item.descreiption,
            style: {
              "strong":Style(
                color: Colors.white,
                fontSize:FontSize.larger,
              ),
              "p":Style(
                color: Colors.white70,
                fontSize:FontSize.large,
              ),
            },
          ),
          SizedBox(height: 15.0,),
          Container(
            padding: EdgeInsets.fromLTRB(15.0,0,15.0,0),
            child: Html(
              data: item.mainContent,
              style: {
                "strong":Style(
                  color: Colors.white,
                  fontSize:FontSize.larger,
                ),
                "p":Style(
                  color: Colors.white70,
                  fontSize:FontSize.large,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }

}