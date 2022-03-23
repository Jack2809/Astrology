import 'package:astrology/src/models/horoscope_model.dart';
import 'package:astrology/src/repository/current_user_shared_preferences.dart';
import 'package:astrology/src/repository/horoscope_.dart';
import 'package:astrology/src/resources/zodiac&natal_chart&horoscope/horoscope_daily_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HoroscopeDaily extends StatefulWidget{


  @override
  State<HoroscopeDaily> createState() => _HoroscopeDailyState();
}

class _HoroscopeDailyState extends State<HoroscopeDaily>{

  bool d1 = false ;
  bool d2 = false ;
  bool d3 = true ;
  bool d4 = false ;
  bool d5 = false ;
  
  void onClicked(){
    setState(() {
      d1 = true;
      d2 = false;
      d3 = false;
      d4 = false;
      d5 = false;
      _selectedIndex = 0 ;
      // _selectedDate= DateTime.now().subtract(Duration(days: 2));
    });
    _controller.jumpToPage(_selectedIndex);
  }

  void onClicked1(){
    setState(() {
      d1 = false;
      d2 = true;
      d3 = false;
      d4 = false;
      d5 = false;
      _selectedIndex = 1 ;
      // _selectedDate= DateTime.now().subtract(Duration(days: 1));
    });
    _controller.jumpToPage(_selectedIndex);

  }

  void onClicked2(){
    setState(() {
      d1 = false;
      d2 = false;
      d3 = true;
      d4 = false;
      d5 = false;
      _selectedIndex = 2 ;
      // _selectedDate= DateTime.now();
    });
    _controller.jumpToPage(_selectedIndex);
  }
  void onClicked3(){
    setState(() {
      d1 = false;
      d2 = false;
      d3 = false;
      d4 = true;
      d5 = false;
      _selectedIndex = 3 ;
      // _selectedDate= DateTime.now().add(Duration(days: 1));
    });
    _controller.jumpToPage(_selectedIndex);
  }
  void onClicked4(){
    setState(() {
      d1 = false;
      d2 = false;
      d3 = false;
      d4 = false;
      d5 = true;
      _selectedIndex = 4 ;
      // _selectedDate= DateTime.now().add(Duration(days: 2));
    });
    _controller.jumpToPage(_selectedIndex);

  }

   // DateTime _selectedDate = DateTime.now();
  DateTime date = DateTime.now();

  late PageController _controller ;

  int _selectedIndex = 2;

  int id = CurrentUser.getId()?? 0;

  String formatDate(DateTime time){
    var format = DateFormat('yyyy-MM-dd');
    String dateFormat = format.format(time);
    return dateFormat;
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage:_selectedIndex);
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
          'Lá số hằng ngày',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:Container(
        padding:EdgeInsets.fromLTRB(10,0,0,10),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/background1.png'),
            fit: BoxFit.fill,
          )
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
          Container(
          height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(onTap:(){onClicked();},child: DateItem(time: date.subtract(Duration(days: 2)),isSelected: d1)),
                GestureDetector(onTap:(){onClicked1();},child: DateItem(time: date.subtract(Duration(days: 1)),isSelected: d2)),
                GestureDetector(onTap:(){onClicked2();},child: DateItem(time: date,isSelected: d3)),
                GestureDetector(onTap:(){onClicked3();},child: DateItem(time: date.add(Duration(days: 1)),isSelected: d4)),
                GestureDetector(onTap:(){onClicked4();},child: DateItem(time: date.add(Duration(days: 2)),isSelected: d5)),
              ],
            ),
          ),

          Expanded(
            child: PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                FutureBuilder<HoroscopeModel>(
                  future: fetchHoroscopeData(id,formatDate(date.subtract(Duration(days: 2)))),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Something went wrong!!'),);
                    }else if (snapshot.hasData){
                      return HoroscopeView(item: snapshot.data!);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
                FutureBuilder<HoroscopeModel>(
                  future: fetchHoroscopeData(id,formatDate(date.subtract(Duration(days: 1)))),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Something went wrong!!'),);
                    }else if (snapshot.hasData){
                      return HoroscopeView(item: snapshot.data!);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
                FutureBuilder<HoroscopeModel>(
                  future: fetchHoroscopeData(id,formatDate(date)),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Something went wrong!!'),);
                    }else if (snapshot.hasData){
                      return HoroscopeView(item: snapshot.data!);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
                FutureBuilder<HoroscopeModel>(
                  future: fetchHoroscopeData(id,formatDate(date.add(Duration(days: 1)))),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Something went wrong!!'),);
                    }else if (snapshot.hasData){
                      return HoroscopeView(item: snapshot.data!);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
                FutureBuilder<HoroscopeModel>(
                  future: fetchHoroscopeData(id,formatDate(date.add(Duration(days: 2)))),
                  builder: (context,snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text('Something went wrong!!'),);
                    }else if (snapshot.hasData){
                      return HoroscopeView(item: snapshot.data!);
                    }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),

              ],
            ),
          ),
            ],
          ),
        ),
      ),


    );
  }
}


class DateItem extends StatefulWidget{
  DateTime time;
  bool isSelected;
  DateItem({required this.time,required this.isSelected});

  @override
  State<DateItem> createState() => _DateItemState();
}

class _DateItemState extends State<DateItem> {
  String getDay(DateTime time){
   String day = DateFormat.E().format(time);
   return day;
  }

  String getTheDay(DateTime time){
    String day = DateFormat.d().format(time);
    return day;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // height: size.height * 0.05,
      width: size .width * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color:Colors.white70),
      ),
      child: Column(
        children: <Widget>[
          Text(
            getDay(widget.time),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          SizedBox(height:size.height * 0.01,),
          widget.isSelected?CircleAvatar(
            backgroundColor: Colors.pink,
            child: Text(
              getTheDay(widget.time),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ):Text(
            getTheDay(widget.time),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class HoroscopeView extends StatelessWidget{
  HoroscopeModel item;
  HoroscopeView({required this.item});
  @override
  Widget build(BuildContext context) {
    List<HoroscopeItem> list = [
      item.routine[0],
      item.thinking[0],
      item.creativity[0],
      item.spirituality[0],
      item.socialLife[0],
      item.sexAndLove[0],
      item.self[0],
    ];
    List<List<HoroscopeItem>> list1 =[
      item.routine,
      item.thinking,
      item.creativity,
      item.spirituality,
      item.socialLife,
      item.sexAndLove,
      item.self
    ];
    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
          return HoroscopeItemView(item: list[index],list:list1[index],);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1,color: Colors.white),
    );
  }

}

class HoroscopeItemView extends StatelessWidget{
  HoroscopeItem item;
  List<HoroscopeItem> list;
  HoroscopeItemView({required this.item,required this.list});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context) => HoroscopeViewDetail(list: list)));
      },
      child: Container(
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
                  'xem chi tiết',
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

