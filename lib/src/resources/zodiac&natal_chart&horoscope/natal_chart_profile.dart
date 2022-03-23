import 'package:astrology/src/models/natal_chart_model.dart';
import 'package:astrology/src/models/user.dart';
import 'package:astrology/src/repository/natal_chart_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';

class NatalChartProfilePage extends StatelessWidget{

  Profile item;
  NatalChartProfilePage({required this.item});



  String getDate(String date){
    String formatDate = DateFormat.yMd().format(DateTime.parse(date));
    return formatDate;
  }

  String getTime(String date){
    String formatTime = DateFormat.Hm().format(DateTime.parse(date));
    return formatTime;
  }


  List<ZodiacInformation> _list1 = [
    ZodiacInformation(name: 'CUNG MỌC', image:'assets/home/Libra.png', zodiac:'Thiên Bình'),
    ZodiacInformation(name: 'CUNG MẶT TRỜI', image:'assets/home/Libra.png', zodiac:'Thiên Bình'),
    ZodiacInformation(name: 'CUNG MẶT TRĂNG', image:'assets/home/Libra.png', zodiac:'Thiên Bình'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          width: double.infinity,
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
                  height: size.height * 0.15,
                  width: size.width * 0.30,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromRGBO(116,55,245,1)),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: Container(
                          height: size.height * 0.13,
                          width: size.width * 0.25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              image:DecorationImage(
                                image: NetworkImage(item.profilePhoto),
                              )
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          child: Icon(!item.gender?Icons.male:Icons.female),
                          radius: size.height * 0.015,
                          backgroundColor: !item.gender?Color.fromRGBO(25,88,255,0.8):Color.fromRGBO(255,74,183,0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:size.height * 0.02),
              Text(
                item.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height:size.height * 0.02),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InformationColumn(icon:Icons.cake,title:'Ngày Sinh',content:getDate(item.birthDate),),
                    InformationColumn(icon:Icons.watch_later,title:'Giờ Sinh',content:getTime(item.birthDate),),
                    InformationColumn(icon:Icons.circle,title:'Vĩ Độ',content:item.latitude.toString()),
                    InformationColumn(icon:Icons.radar,title:'Kinh Độ',content:item.longitude.toString(),),
                    // InformationColumn(item: _list[0]),
                    // InformationColumn(item: _list[1]),
                    // InformationColumn(item: _list[2]),
                    // InformationColumn(item: _list[3]),
                  ],
                ),
              ),
              SizedBox(height:size.height * 0.02),

              SizedBox(height:size.height * 0.01),

              Text(
                'Bảng đồ sao',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02,),

              FutureBuilder<NatalChartModel>(
                future: fetchNatalChartImageData(item.id),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text('Something went wrong!!'),);
                  }else if(snapshot.hasData){
                    return Container(
                      width: double.infinity,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(190.0),
                          image: DecorationImage(
                              image: NetworkImage('${snapshot.data!.imageLink}'),
                              fit: BoxFit.fitWidth
                          )
                      ),
                    );
                  }else{
                    return Container(height:size.height,child: Center(child: CircularProgressIndicator(),));
                  }
                },
              ),
              // Container(
              //   width: double.infinity,
              //   height: size.height * 0.5,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/home/natal_chart1.png'),
              //       fit: BoxFit.fitWidth
              //     )
              //   ),
              // ),
              SizedBox(height: size.height * 0.01,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ZodiacColumn(item: _list1[0]),
                    ZodiacColumn(item: _list1[1]),
                    ZodiacColumn(item: _list1[2]),
                  ],
                ),
              ),
              SizedBox(height: size.height*0.03),
              Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Ngôi sao',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: size.width * 0.12,),
                    Text(
                      'Nhà',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: size.width * 0.2,),
                    Text(
                      'Cung',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(
                color: Colors.white70,
              ),

              // Star(),

              FutureBuilder<List<PlanetInformation>>(
                future: fetchNatalChartData(item.id),
                builder: (context,snapshot){
                  if(snapshot.hasError){
                    return Center(child: Text('Something went wrong!!'),);
                  }else if(snapshot.hasData){
                    return PlanetInformationList(planetInformationModels:snapshot.data!);
                  }else{
                    return Container(height:size.height,child: Center(child: CircularProgressIndicator(),));
                  }
                },
              ),



            ],
          ),
        ),
      ),

    );
  }

}

class PlanetInformationList extends StatelessWidget{
  const PlanetInformationList({Key? key,required this.planetInformationModels}) : super(key:key);

  final List<PlanetInformation> planetInformationModels;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: planetInformationModels.length,
      itemBuilder: (BuildContext context, int index) {
        return Star(item: planetInformationModels[index],) ;
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

}



class ZodiacInformation {
  String name;
  String image;
  String zodiac;

  ZodiacInformation({required this.name,required this.image,required this.zodiac});

}

class ZodiacColumn extends StatelessWidget{
  ZodiacInformation item;
  ZodiacColumn({required this.item});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5.0),
      height: size.height * 0.15,
      width: size.width * 0.31,
      decoration: BoxDecoration(
        color: Color.fromRGBO(69,46,93,1),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Text(
            item.name,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          RotationTransition(
            turns: AlwaysStoppedAnimation(60/360),
            child: ImageIcon(
              AssetImage('assets/home/Libra.png'),
              color: Colors.white,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            item.zodiac,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

}

class InformationColumn extends StatefulWidget{
  IconData icon;
  String title;
  String content;

  InformationColumn({required this.icon,required this.title,required this.content});

  @override
  State<InformationColumn> createState() => _InformationColumnState();
}

class _InformationColumnState extends State<InformationColumn> {

  LinearGradient getColor(){
    LinearGradient _color;
    if(widget.title.toLowerCase()=='ngày sinh'){
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(85,43,242,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }else if(widget.title.toLowerCase()=='giờ sinh'){
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(172,29,255,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }else if(widget.title.toLowerCase()=='vĩ độ'){
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(18,79,255,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }else{
      _color = LinearGradient(
          colors: [
            Colors.white70,
            Color.fromRGBO(221,47,188,1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.0,
            0.9
          ]
      );
    }
    return _color;
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          height: size.height * 0.05,
          width: size.width * 0.1,
          decoration: BoxDecoration(
            gradient: getColor(),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Icon(
            widget.icon,
            color: Colors.white,
          ),
        ),
        SizedBox(height:size.height * 0.01),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 15.0,
          ),
        ),
        SizedBox(height:size.height * 0.01),
        Text(
          widget.content,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),

      ],
    );
  }
}

class Star extends StatelessWidget{
  PlanetInformation item;
  Star({required this.item});

  String formatHouseName(String name){
    String formatName = '';
    if(name.toLowerCase() == 'nhà 1'){
      formatName = 'I';
    }else if(name.toLowerCase() == 'nhà 2'){
      formatName = 'II';
    }else if(name.toLowerCase() == 'nhà 3'){
      formatName = 'III';
    }else if(name.toLowerCase() == 'nhà 4'){
      formatName = 'IV';
    }else if(name.toLowerCase() == 'nhà 5'){
      formatName = 'V';
    }else if(name.toLowerCase() == 'nhà 6'){
      formatName = 'VI';
    }else if(name.toLowerCase() == 'nhà 7'){
      formatName = 'VII';
    }else if(name.toLowerCase() == 'nhà 8'){
      formatName = 'VIII';
    }else if(name.toLowerCase() == 'nhà 9'){
      formatName = 'IX';
    }else if(name.toLowerCase() == 'nhà 10'){
      formatName = 'X';
    }else if(name.toLowerCase() == 'nhà 11'){
      formatName = 'XI';
    }else{
      formatName = 'XII';
    }
    return formatName;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      ImageIcon(
                        NetworkImage(item.planetIcon),
                        color: Color.fromRGBO(183,88,167,1),
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        item.planetName,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(69,47,94,1),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: Colors.white70),
                  ),
                  child: Center(
                    child: Text(
                      formatHouseName(item.houseName),
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ImageIcon(
                        NetworkImage(item.zodiacIcon),
                        color: Colors.white,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        item.zodiacName,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),

          Container(
            padding: EdgeInsets.all(10.0),
            width: double.infinity,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              color: Color.fromRGBO(46,36,76,1),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Html(
              data: item.content,
              style: {
                "strong":Style(
                  color: Colors.white,
                  fontSize:FontSize.larger,
                ),
                "p":Style(
                  color: Colors.white,
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