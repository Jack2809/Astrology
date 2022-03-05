import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget{

  List<Horoscope> _list = [
    Horoscope(title: 'Lá số hôm nay',content:'dòng người vội vàng bước qua ,chợt như chiếc hôn thế thôi nà',date:'1-1-2000',zodiacType:'Aries',horoscopeType:true),
    Horoscope(title: 'Lá số tuần này',content:'dòng người vội vàng bước qua ,chợt như chiếc hôn thế thôi nà',date:'1-1-2000',zodiacType:'Aries',horoscopeType: false)
  ];

  List<HoroscopeFilter> _list1 = [
    HoroscopeFilter(name: 'Aries', status: false),
    HoroscopeFilter(name: 'Taurus', status: false),
    HoroscopeFilter(name: 'Germini', status: false),
    HoroscopeFilter(name: 'Cancer', status: false),
    HoroscopeFilter(name: 'Leo', status: false),
    HoroscopeFilter(name: 'Virgo', status: false),
    HoroscopeFilter(name: 'Libra', status: false),
    HoroscopeFilter(name: 'Scorpio', status: false),
    HoroscopeFilter(name: 'Sagittarius', status: false),
    HoroscopeFilter(name: 'Capricorn', status: false),
    HoroscopeFilter(name: 'Aquarius', status: false),
    HoroscopeFilter(name: 'Pisces', status: false),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.fromLTRB(size.width * 0.03 ,size.height * 0.02,size.width * 0.03,size.height*0.03),
        decoration: BoxDecoration(
          image: DecorationImage(
            image:AssetImage('assets/background/background2.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Row(
                children: <Widget>[
                  Text(
                    'Tin tức',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Color.fromRGBO(255,86,184,1),
                    radius: size.height * 0.025,

                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: size.height * 0.04,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:size.height *0.02,),

            Container(
              child: CarouselSlider(
                items: [
                  MyHoroscope(item: _list[0],),
                  MyHoroscope(item: _list[1]),
                ],
                options: CarouselOptions(
                  height: size.height  * 0.3,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 5),
                ),


                ),
            ),

            SizedBox(height: size.height * 0.03,),

            GestureDetector(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      backgroundColor:  Color.fromRGBO(43,37,60,1),
                        shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      title: Center(child: Text('Chọn cung hoàng đạo',style: TextStyle(color: Colors.white,fontSize:20,fontWeight: FontWeight.bold),)),
                      content: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.8,
                        child: Column(
                          children:<Widget>[
                            HoroscopeBar(s1: _list1[0], s2: _list1[1], s3: _list1[2]),
                            SizedBox(height:size.height *0.01),
                            HoroscopeBar(s1: _list1[3], s2: _list1[4], s3: _list1[5]),
                            SizedBox(height:size.height *0.01),
                            HoroscopeBar(s1: _list1[6], s2: _list1[7], s3: _list1[8]),
                            SizedBox(height:size.height *0.01),
                            HoroscopeBar(s1: _list1[9], s2: _list1[10], s3: _list1[11]),
                          ],
                        ),
                      ),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height:size.height * 0.05,
                              width: size.width * 0.4,
                              decoration:BoxDecoration(
                        // border: Border.all(color: Colors.white70),
                    ),
                              child: TextButton(
                                child:Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Container(
                              height:size.height * 0.05,
                              width: size.width * 0.4,
                              decoration:BoxDecoration(
                                // border: Border.all(color: Colors.white70),
                              ),
                              child: TextButton(
                                child:Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                );
              },
              child: Container(
                padding:EdgeInsets.all(10),
                height: size.height *0.06,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(53,25,58,1),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.document_scanner,color: Colors.white,),
                    SizedBox(width:size.width* 0.03,),
                    Text(
                      'Chọn doanh mục',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white,),
                  ],
                ),
              ),
            ),

            SizedBox(height:size.height* 0.02,),
            NewPost(),
            SizedBox(height:size.height* 0.02,),
            NewPost(),
            SizedBox(height:size.height* 0.02,),
            NewPost(),
            SizedBox(height:size.height* 0.02,),
            NewPost(),


          ],
        ),
      ),
    );


  }

}

class HoroscopeFilter {
  String name;
  bool status;

  HoroscopeFilter({required this.name,required this.status});
}

class HoroscopeBar extends StatefulWidget{
  HoroscopeFilter s1,s2,s3;
  HoroscopeBar({required this.s1,required this.s2,required this.s3});

  @override
  State<HoroscopeBar> createState() => _HoroscopeBarState();
}

class _HoroscopeBarState extends State<HoroscopeBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: (){
              setState(() {
                widget.s1.status =  !widget.s1.status;
              });
            },
            child:Text(
              widget.s1.name,
              style:TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
                backgroundColor: widget.s1.status?MaterialStateProperty.all(Color.fromRGBO(116,55,245,1)):MaterialStateProperty.all(Color.fromRGBO(41,43,61,1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color:Colors.white70),
                    )
                )
            )
        ),
        SizedBox(width:size.width *0.02),
        ElevatedButton(
            onPressed: (){
              setState(() {
                widget.s2.status =  !widget.s2.status;
              });
            },
            child:Text(
              widget.s2.name,
              style:TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
                backgroundColor: widget.s2.status?MaterialStateProperty.all(Color.fromRGBO(116,55,245,1)):MaterialStateProperty.all(Color.fromRGBO(41,43,61,1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color:Colors.white70),
                    )
                )
            )
        ),
        SizedBox(width:size.width *0.02),
        ElevatedButton(
            onPressed: (){
              setState(() {
                widget.s3.status =  !widget.s3.status;
              });
            },
            child:Text(
              widget.s3.name,
              style:TextStyle(
                color: Colors.white,
              ),
            ),
            style: ButtonStyle(
                backgroundColor: widget.s3.status?MaterialStateProperty.all(Color.fromRGBO(116,55,245,1)):MaterialStateProperty.all(Color.fromRGBO(41,43,61,1)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color:Colors.white70),
                    )
                )
            )
        ),
      ],
    );
  }
}


class MyHoroscope extends StatelessWidget{
  Horoscope item;
  MyHoroscope({required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHoroscopeDetail(item: item,)),);
      },
      child: Container(
        padding:EdgeInsets.all(size.height * 0.02),
        height: size.height * 0.4,
        width: size.width * 0.8,
        decoration: BoxDecoration(
          gradient: item.horoscopeType?LinearGradient(
            colors: [
              Color.fromRGBO(31,85,102,1),
              Color.fromRGBO(43,31,133,1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.8,
            ],

          ):LinearGradient(
            colors: [
              Color.fromRGBO(153,40,133,1),
              Color.fromRGBO(42,24,131,1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [
              0.1,
              0.8,
            ],

          ),
          // color: Color.fromRGBO(38, 56, 119, 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                ImageIcon(
                  item.horoscopeType?AssetImage('assets/news/magic_cards1.png'):AssetImage('assets/news/magic_cards2.png'),
                  color: Colors.white,
                ),
                SizedBox(width:size.width * 0.01,),
                Text(
                  item.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.05,
                  ),
                ),
              ],
            ),
            SizedBox(height:size.height *0.065),
            Text(
              item.content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize:size.height * 0.02,
                color:Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: (){},
                    child:Text(
                      item.zodiacType,
                      style:TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(116,55,245,1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: BorderSide(color:Color.fromRGBO(116,55,245,1)),
                            )
                        )
                    )
                ),

                ElevatedButton(
                    onPressed: (){},
                    child:Text(
                      item.date,
                      style:TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(85,81,154,1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color:Color.fromRGBO(85,81,154,1)),
                            )
                        )
                    )
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}

class Horoscope {
  String title;
  String content;
  String zodiacType;
  bool horoscopeType;
  String date;
  Horoscope({required this.title,required this.content,required this.zodiacType,required this.horoscopeType,required this.date});
}

class MyHoroscopeDetail extends StatelessWidget{

  Horoscope item;
  MyHoroscopeDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(109,112,122,1),
      extendBodyBehindAppBar: true,
      appBar:AppBar(
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
        // height: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.30,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/news/horoscope_detail.png'),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    // width: double.minPositive,
                    height: size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft:Radius.circular(20),topRight:Radius.circular(20)),
                        color: Color.fromRGBO(27,18,53,1)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          child: Text(
                            item.content,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize:size.width * 0.05,
                            ),
                          ),
                        ),
                        Container(
                          child: ButtonBar(
                            alignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                  onPressed: (){},
                                  child:Text(
                                    item.zodiacType,
                                    style:TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(116,55,245,1)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color:Color.fromRGBO(116,55,245,1)),
                                          )
                                      )
                                  )
                              ),

                              ElevatedButton(
                                  onPressed: (){},
                                  child:Text(
                                    item.date,
                                    style:TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(85,81,154,1)),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18.0),
                                            side: BorderSide(color:Color.fromRGBO(85,81,154,1)),
                                          )
                                      )
                                  )
                              ),
                            ],
                          ),
                        ),
                        Text(
                          item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content+item.content,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize:size.width * 0.04,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),



          ],
        ),
      ),
        );

  }

}

class NewPost extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Row(
        children:<Widget>[
          Container(
            height: size.height * 0.15,
            width: size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(
              //   image: AssetImage(''),
              // ),
            ),
          ),
          SizedBox(width: size.width * 0.02,),
          Container(
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Tiêu đề tin tức mới hôm nay là blablabla',
                      maxLines: 3,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      ElevatedButton(
                          onPressed: (){},
                          child:Text(
                            'zodiac type',
                            style:TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(116,55,245,1)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color:Color.fromRGBO(116,55,245,1)),
                                  )
                              )
                          )
                      ),

                      ElevatedButton(
                          onPressed: (){},
                          child:Text(
                            'date',
                            style:TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color.fromRGBO(85,81,154,1)),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color:Color.fromRGBO(85,81,154,1)),
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

