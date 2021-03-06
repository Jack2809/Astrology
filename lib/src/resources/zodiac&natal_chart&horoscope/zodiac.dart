import 'package:astrology/src/models/zodiac_model.dart';
import 'package:astrology/src/repository/zodiac_.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'zodiac_detail.dart';

class ZodiacPage extends StatefulWidget{
  @override
  State<ZodiacPage> createState() => _ZodiacPageState();
}

class _ZodiacPageState extends State<ZodiacPage> {
  late Future<List<ZodiacModel>> zodiacList;

  @override
  void initState() {
    super.initState();
    zodiacList = fetchGeneralZodiacData(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          'Cung hoàng đạo',
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
              fit: BoxFit.fill,
            )
        ),
        child: FutureBuilder<List<ZodiacModel>>(
          future: zodiacList,
          builder: (context,snapshot){
            if(snapshot.hasError){
              return Center(child: Text('Something went wrong!!'),);
            }else if (snapshot.hasData){
              return ZodiacList(zodiacModels: snapshot.data!);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}

class ZodiacList extends StatelessWidget{
  const ZodiacList({Key? key,required this.zodiacModels}) : super(key:key);

  final List<ZodiacModel> zodiacModels;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          // mainAxisSpacing:10.0,
          // crossAxisSpacing:5.0,
          childAspectRatio: 0.9,
        ),
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ZodiacDetail(id:zodiacModels[index].id,)),);
              },
              child: ZodiacItem(item:zodiacModels[index],)
          );
        }
    );
  }

}

class ZodiacItem extends StatelessWidget{
  ZodiacModel item;
  ZodiacItem({required this.item});



  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;


    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height:size.height * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(item.icon),
              )
            ),
          ),
          Text(
            item.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize:20.0,
            ),
          ),
          Text(
            item.zodiacDayStart.toString()+ '/' +item.zodiacMonthStart.toString()+ '-' +item.zodiacDayEnd.toString()+ '/' +item.zodiacMonthEnd.toString(),
            style: TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

}

class Zodiac{
  String imageLink;
  String name;
  String startTime;
  String endTime;

  Zodiac({required this.imageLink,required this.name,required this.startTime,required this.endTime});

}



