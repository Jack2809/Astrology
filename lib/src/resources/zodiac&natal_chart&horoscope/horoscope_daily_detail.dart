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
                return HoroscopeItemListView(item: list[index]);
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

class HoroscopeItemListView extends StatelessWidget{
  HoroscopeItem item;
  HoroscopeItemListView({required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HoroscopeItemDetailView(item: item)));
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: size.height * 0.1,
                  width:  size .width * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Colors.white70,
                      image: DecorationImage(
                          image: NetworkImage(item.detail.planetBaseIcon),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(width: size.width * 0.1,),
                Container(
                  height: size.height * 0.1,
                  width:  size .width * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(50.0),
                      image: DecorationImage(
                          image: NetworkImage(item.detail.planetCompareIcon),
                          fit: BoxFit.fill
                      )
                  ),
                ),
                SizedBox(width: size.width * 0.1,),
                Text(
                  item.detail.angleName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              item.detail.description,
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
      ),
    );
  }

}

class HoroscopeItemDetailView extends StatelessWidget{
  HoroscopeItem item;
  HoroscopeItemDetailView({required this.item});
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
          item.detail.planetBaseName+','+item.detail.planetCompareName+","+item.detail.angleName,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
          minWidth: size.width,
          minHeight: size.height
        ),
        padding:EdgeInsets.fromLTRB(10,0,0,10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/background1.png'),
              fit: BoxFit.fill,
            )
        ),
        child: SafeArea(
          child:SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Text(
                  item.detail.description,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  item.detail.mainContent,
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}